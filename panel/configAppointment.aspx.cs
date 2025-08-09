using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using website;
using DalWebSite;
using System.Data;
using System.Globalization;
using SubSonic;

namespace DoctorYab.panel
{
    public partial class configAppointment : System.Web.UI.Page
    {
        ClassControl cc = new ClassControl();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["doctorId"] == null || (Session["doctorId"]).ToString() == "")
            {
                Response.Redirect("Default.aspx");
            }

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            HttpContext.Current.Response.Cache.SetNoServerCaching();
            HttpContext.Current.Response.Cache.SetNoStore();
            Session.Abandon();
            Session.Clear();
            Response.Redirect("/Default.aspx");

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            error.Text = "متاسفانه خطایی رخ داد. لطفا مجددا سعی نمایید";
            success.Visible = false;
            error.Visible = false;
            try
            {
                DateTime dt = DateTime.Parse(TxtDate.Text);  /// jalali date
                DateTime selectedDate = DateTime.Parse(TxtDate.Text, new CultureInfo("fa-IR"));  /// gregorian date
                DateTime today = DateTime.Now;
                DateTime nextDays = today.AddDays(7);
                int shift = int.Parse(DrdShift.SelectedValue);
                int interval = Convert.ToInt32(TxtTime.Text.Trim());
                int count = int.Parse(TxtNum.Text);
                int doctorId = Convert.ToInt32(Session["doctorId"]);


                /// check selected date, It should be between tomorrow and three days later
                if (nextDays.Date < selectedDate.Date || selectedDate.Date <= today.Date)
                {
                    error.Text = "تاریخ تنها می تواند از فردا تا 7 روز آینده انتخاب شود.";
                    error.Visible = true;
                    return;
                }
                else
                {
                    /// برای این تاریخ و شیفت رکوردی وجود دارد یا نه
                    SubSonic.SqlQuery currentSelect = new SubSonic.Select()
                        .From(TblAppointment.Schema)
                        .Where(TblAppointment.ADateColumn).IsEqualTo(selectedDate.Date)
                        .And(TblAppointment.ADoctorIdColumn).IsEqualTo(doctorId)
                        .And(TblAppointment.AShiftColumn).IsEqualTo(shift)
                        .OrderDesc(TblAppointment.Columns.Id);
                    var result = currentSelect.ExecuteTypedList<TblAppointment>();

                    if (result.Count > 0)
                    {
                        error.Text = "برای این تاریخ و شیفت، قبلا نوبت ثبت شده است. می توانید ابتدا آن را حذف کنید و سپس نوبت جدید ثبت کنید. ثبت نوبت جدید تنها در صورت وجود شرایط مندرج در راهنما، امکان پذیر است.";
                        error.Visible = true;
                        return;
                    }
                    else
                    {
                        SubSonic.SqlQuery currentSelect2 = new SubSonic.Select().Top("1")
                        .From(TblAppointment.Schema)
                        .Where(TblAppointment.ADateColumn).IsEqualTo(selectedDate.Date)
                        .And(TblAppointment.ADoctorIdColumn).IsEqualTo(doctorId)
                        .OrderDesc(TblAppointment.Columns.Id);
                        var result2 = currentSelect2.ExecuteTypedList<TblAppointment>();

                        /// اگر برای همان تاریخ ولی در شیفت دیگر نوبت ثبت شده بود،
                        /// چک می شود که ساعت شروع نوبت دوم و ساعت پایان نوبت اول با هم تداخل نداشته باشند.
                        if (result2.Count > 0)
                        {
                            if (shift == 2)
                            {
                                DateTime shift1_lastTime = Convert.ToDateTime(result2[0].ADateTime);
                                shift1_lastTime = shift1_lastTime.AddMinutes(Convert.ToInt32(result2[0].ATime));
                                if (selectedDate <= shift1_lastTime)
                                {
                                    error.Text = "ساعت شروع نوبت های این شیفت، با شیفت قبلی تداخل دارد. ساعت را بعد از پایان شیفت قبلی انتخاب کنید.";
                                    error.Visible = true;
                                    return;
                                }
                            }
                            else
                            {
                                DateTime shift2_firstTime = Convert.ToDateTime(result2[result2.Count - 1].ADateTime);
                                shift2_firstTime = selectedDate.AddMinutes(interval * count);
                                if (selectedDate >= shift2_firstTime)
                                {
                                    error.Text = "با نوبت های شیفت 1 در این تاریخ تداخل دارد. ساعت پایان شیفت 1 باید قبل از شروع شیفت 2 باشد.";
                                    error.Visible = true;
                                    return;
                                }
                            }
                        }

                        int res = addAppointment(selectedDate, interval, count, shift, doctorId);
                        if (res == 1)
                        {
                            //Repeater1.DataBind();
                            success.Visible = true;
                        }
                        else
                        {
                            error.Text = "متاسفانه خطایی در ثبت نوبت ها، رخ داد. لطفا مجددا سعی نمایید";
                            error.Visible = true;
                            success.Visible = false;
                        }

                    }
                }

            }
            catch (Exception ex)
            {
                string err = ex.ToString();
                error.Text = "متاسفانه خطایی رخ داد. لطفا مجددا سعی نمایید";
                error.Visible = true;
            }
        }

        protected int addAppointment(DateTime date, int interval, int count, int shift, int doctorId)
        {
            try
            {
                string code = cc.RandomString(8, true);

                for (int i = 0; i < count; i++)
                {
                    TblAppointment _TblAppointment = new TblAppointment();
                    _TblAppointment.ADateTime = date;
                    _TblAppointment.ADate = date.ToShortDateString();
                    _TblAppointment.ADoctorId = doctorId;
                    _TblAppointment.AShift = shift;
                    _TblAppointment.AStatus = 0;
                    _TblAppointment.ATime = interval;
                    _TblAppointment.AGroupCode = code;
                    _TblAppointment.Save();
                    date = date.AddMinutes(interval);
                }
                return 1;
            }
            catch (Exception ex)
            {
                string err = ex.ToString();
                return 0;
            }
        }

    }
}