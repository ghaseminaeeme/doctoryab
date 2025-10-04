using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DalWebSite;
using SubSonic;
using System.Data;
using website;
using System.Globalization;

namespace DoctorYab
{
    public partial class reserve1 : System.Web.UI.Page
    {
        ClassControl cc = new ClassControl();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //  string dateStr =cc.PersianDate_10(Request.QueryString["date"]);
                string dateStr = Request.QueryString["date"];
                string timeStr = Request.QueryString["time"];

                if (DateTime.TryParse(dateStr, out DateTime gregorianDate))
                {
                    PersianCalendar pc = new PersianCalendar();
                    string persianDate = string.Format("{0:0000}/{1:00}/{2:00}",
                                                       pc.GetYear(gregorianDate),
                                                       pc.GetMonth(gregorianDate),
                                                       pc.GetDayOfMonth(gregorianDate));

                    lbDate.Text = persianDate;
                }
                else
                {
                    lbDate.Text = dateStr; // fallback
                }

                lbTime.Text = timeStr;
                //lbDate.Text = dateStr;
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            error.Text = "متاسفانه خطایی رخ داد. لطفا مجددا سعی نمایید";
            success.Text = "";
            success.Visible = false;
            error.Visible = false;
            try
            {
                if (TxtName.Text.Trim() == "" || TxtTel.Text.Trim() == "")
                {
                    error.Text = "وارد کردن نام کامل و شماره تماس الزامی است.";
                    error.Visible = true;
                }
                else
                {
                    int Id = cc.New("TblReserve");
                    int doctorId = Convert.ToInt32(Request.QueryString["did"]);
                    //  DateTime selectedTime = Convert.ToDateTime(Request.QueryString["time"]);

                    string dateStr = Request.QueryString["date"];   // from URL
                    string timeStr = Request.QueryString["time"];   // from URL

                    DateTime selectedDate = Convert.ToDateTime(dateStr);
                    TimeSpan selectedTime = TimeSpan.Parse(timeStr);

                    DateTime selectedDateTime = selectedDate.Date + selectedTime;

                    /// آیا این نوبت برای فرد دیگری رزرو شده است یا نه
                    int count = new Select("COUNT(*)")
                                   .From(TblReserve.Schema)
                                   .Where(TblReserve.Columns.RDoctorId).IsEqualTo(doctorId)
                                   .And(TblReserve.Columns.RDatetime).IsEqualTo(selectedDateTime)  // compare full datetime
                                   .ExecuteScalar<int>();

                    if (count > 0)
                    {
                        error.Text = "متاسفانه این نوبت قبلا رزرو شده است. زمان دیگری را انتخاب کنید.";
                        error.Visible = true;
                    }
                    else
                    {
                        string trackingCode = Id.ToString() + doctorId.ToString() + cc.RandomNumber(4).ToString();
                        TblReserve _TblReserve = new TblReserve();
                        _TblReserve.RDatetime = selectedDateTime;
                        _TblReserve.RDoctorId = doctorId;
                        _TblReserve.RName = TxtName.Text;
                        _TblReserve.RPhonenumber = TxtTel.Text;
                        _TblReserve.RSaveDate = DateTime.Now;
                        _TblReserve.RTime = timeStr;
                        _TblReserve.RDate = dateStr;
                        _TblReserve.RTrackingCode = trackingCode;
                        _TblReserve.RStatus = 0;
                        _TblReserve.Save();
                        success.Text = "نوبت شما با موفقیت رزرو شد. کد پیگیری: " + trackingCode;
                        success.Visible = true;
                        TxtName.Text = "";
                        TxtTel.Text = "";
                    }
                }
            }
            catch (Exception ex)
            {
                string errorMsg = ex.Message;
                error.Text = "متاسفانه خطایی پیش آمد، لطفا دوباره سعی کنید.";
                error.Visible = true;

                string input = "name: " + TxtName.Text + ", tel: " + TxtTel.Text;
                TblAppointmentLog _log = new TblAppointmentLog();
                _log.SaveDate = DateTime.Now;
                _log.DoctorId = Convert.ToInt32(Request.QueryString["did"]);
                _log.ErrMsg = errorMsg;
                _log.AppointmentDate = Convert.ToDateTime(Request.QueryString["time"]);
                _log.Inputs = input;
                _log.Save();

            }
        }

    }
}