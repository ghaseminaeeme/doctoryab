using DalWebSite;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using website;

namespace DoctorYab
{
    public partial class DoctorDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TblDoctor _TblDoctor = new TblDoctor(Convert.ToInt32(Request.QueryString["did"]));
                HtmlMeta metaKey = new HtmlMeta();
                metaKey.Name = "keywords";
                metaKey.Content = _TblDoctor.DKeyword;
                Page.Header.Controls.Add(metaKey);

                HtmlHead head = Page.Header;
                HtmlTitle title = new HtmlTitle();
                title.Text = "دکتریاب ایران | " + _TblDoctor.DName;
                head.Controls.Add(title);

                HtmlMeta metaKey2 = new HtmlMeta();
                metaKey2.Name = "description";
                metaKey2.Content = "دکتریاب ایران، " + _TblDoctor.DName;
                Page.Header.Controls.Add(metaKey2);

                LoadDaysAndFirstTimes();

            }
        }

        private void LoadDaysAndFirstTimes()
        {
            int doctorId = int.Parse(Request.QueryString["did"]);
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DbWebSiteConnectionString"].ConnectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("dbo.selectAppointment_v1", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@doctorId", doctorId);

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    // Save appointments in ViewState
                    ViewState["Appointments"] = ds;
                    Page.ClientScript.RegisterHiddenField("hasAppointments", "true");

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        string firstDate = ds.Tables[0].Rows[0]["AppointmentDate"].ToString();
                        ViewState["SelectedDate"] = firstDate;
                        HiddenSelectedDate.Value = firstDate;

                        rptDays.DataSource = ds.Tables[0];
                        rptDays.DataBind();

                        UpdateSelectedDateHeader(firstDate);
                        BindTimesForDate(firstDate);
                    }
                    else
                    {
                        rptDays.DataSource = ds.Tables[0];
                        rptDays.DataBind();
                    }
                }
            }
        }

        protected void rptDays_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "SelectDay")
            {
                string selectedDate = e.CommandArgument.ToString();
                ViewState["SelectedDate"] = selectedDate;
                HiddenSelectedDate.Value = selectedDate;

                // update header text
                UpdateSelectedDateHeader(selectedDate);

                // bind times for that date
                BindTimesForDate(selectedDate);

                // update only the times panel
                upTimes.Update();

                // also rebind days so CSS active class updates
                if (ViewState["Appointments"] is DataSet ds)
                {
                    rptDays.DataSource = ds.Tables[0];
                    rptDays.DataBind();
                    upMain.Update();
                }
            }
        }

        private void BindTimesForDate(string selectedDate)
        {
            if (ViewState["Appointments"] == null)
            {
                LoadDaysAndFirstTimes(); // reload if ViewState lost
            }

            if (ViewState["Appointments"] is DataSet ds)
            {
                DataTable allTimes = ds.Tables[1]; // Table 1 = times
                DataView dv = new DataView(allTimes);
                dv.RowFilter = $"AppointmentDate = '{selectedDate}'";

                rptTimes.DataSource = dv;
                rptTimes.DataBind();
            }
        }

        private void UpdateSelectedDateHeader(string gregorianDate)
        {
            try
            {
                if (DateTime.TryParse(gregorianDate, out DateTime date))
                {
                    string dayName = ConvertToPersianDay(date.DayOfWeek.ToString());
                    string persianDate = ConvertToPersianDate(gregorianDate);
                    litSelectedDate.Text = dayName + " - " + persianDate;
                }
            }
            catch { }
        }

        public static string ConvertToPersianDate(string gregorianDate)
        {
            if (DateTime.TryParse(gregorianDate, out DateTime date))
            {
                PersianCalendar pc = new PersianCalendar();
                return $"{pc.GetYear(date):0000}/{pc.GetMonth(date):00}/{pc.GetDayOfMonth(date):00}";
            }
            return gregorianDate;
        }

        public static string ConvertToPersianDay(string englishDay)
        {
            switch (englishDay.ToLower())
            {
                case "saturday": return "شنبه";
                case "sunday": return "یکشنبه";
                case "monday": return "دوشنبه";
                case "tuesday": return "سه‌شنبه";
                case "wednesday": return "چهارشنبه";
                case "thursday": return "پنج‌شنبه";
                case "friday": return "جمعه";
                default: return englishDay;
            }
        }

        protected void rptDays_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var lnk = e.Item.FindControl("lnkDay") as LinkButton;
                string selectedDate = ViewState["SelectedDate"] as string;
                string currentDate = DataBinder.Eval(e.Item.DataItem, "AppointmentDate").ToString();

                if (lnk != null && !string.IsNullOrEmpty(selectedDate) && currentDate == selectedDate)
                {
                    lnk.CssClass += " active";
                }
            }
        }

        protected void rptDays_ItemCreated(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                LinkButton lnkDay = e.Item.FindControl("lnkDay") as LinkButton;
                if (lnkDay != null)
                {
                    ScriptManager.GetCurrent(Page).RegisterAsyncPostBackControl(lnkDay);
                }
            }
        }

        protected string SelectedDay
        {
            get => ViewState["SelectedDate"]?.ToString() ?? "";
            set => ViewState["SelectedDate"] = value;
        }




        /*
        private void LoadDaysAndFirstTimes()
        {
            int doctorId = int.Parse(Request.QueryString["did"]);
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DbWebSiteConnectionString"].ConnectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("dbo.selectAppointment_v1", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@doctorId", doctorId);

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    // Save all appointment data to ViewState to avoid re-query
                    ViewState["Appointments"] = ds;
                    Page.ClientScript.RegisterHiddenField("hasAppointments", "true");

                    // Bind Days (we will set selected date first to ensure active class)
                    // Bind first day's times
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        string firstDate = ds.Tables[0].Rows[0]["AppointmentDate"].ToString();
                        ViewState["SelectedDate"] = firstDate;
                        UpdateSelectedDateHeader(firstDate);
                        rptDays.DataSource = ds.Tables[0];
                        rptDays.DataBind();
                        BindTimesForDate(firstDate);
                    }
                    else
                    {
                        rptDays.DataSource = ds.Tables[0];
                        rptDays.DataBind();
                    }
                }
            }
        }

        protected void rptDays_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "SelectDay")
            {
                string selectedDate = e.CommandArgument.ToString();

                HiddenSelectedDate.Value = selectedDate;
                BindTimesForDate(selectedDate);

                //ViewState["SelectedDate"] = selectedDate; // ذخیره تاریخ انتخاب شده
                //BindTimesForDate(selectedDate);

                //// Rebind days to apply active class
                //DataSet ds = ViewState["Appointments"] as DataSet;
                //if (ds != null)
                //{
                //    rptDays.DataSource = ds.Tables[0];
                //    rptDays.DataBind();
                //}
                //UpdateSelectedDateHeader(selectedDate);
            }
        }

        private void BindTimesForDate(string selectedDate)
        {
            if (ViewState["Appointments"] == null)
            {
                LoadDaysAndFirstTimes(); // Reload everything if ViewState lost
            }

            if (ViewState["Appointments"] is DataSet ds)
            {
                DataTable allTimes = ds.Tables[1]; // Table 1 = appointment times
                DataView dv = new DataView(allTimes);
                dv.RowFilter = $"AppointmentDate = '{selectedDate}'";

                rptTimes.DataSource = dv;
                rptTimes.DataBind();
            }
        }

        private void UpdateSelectedDateHeader(string gregorianDate)
        {
            try
            {
                DateTime date;
                if (DateTime.TryParse(gregorianDate, out date))
                {
                    string dayName = ConvertToPersianDay(date.DayOfWeek.ToString());
                    string persianDate = ConvertToPersianDate(gregorianDate);
                    Control container = FindControl("upMain") ?? (Control)this;
                    var lit = container.FindControl("litSelectedDate") as Literal;
                    if (lit != null)
                    {
                        lit.Text = dayName + " - " + persianDate;
                    }
                }
            }
            catch { }
        }

        public static string ConvertToPersianDate(string gregorianDate)
        {
            if (DateTime.TryParse(gregorianDate, out DateTime date))
            {
                PersianCalendar pc = new PersianCalendar();
                return $"{pc.GetYear(date):0000}/{pc.GetMonth(date):00}/{pc.GetDayOfMonth(date):00}";
            }
            return gregorianDate;
        }

        public static string ConvertToPersianDay(string englishDay)
        {
            switch (englishDay.ToLower())
            {
                case "saturday": return "شنبه";
                case "sunday": return "یکشنبه";
                case "monday": return "دوشنبه";
                case "tuesday": return "سه‌شنبه";
                case "wednesday": return "چهارشنبه";
                case "thursday": return "پنج‌شنبه";
                case "friday": return "جمعه";
                default: return englishDay;
            }
        }

        protected void rptDays_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var lnk = e.Item.FindControl("lnkDay") as LinkButton;
                string selectedDate = ViewState["SelectedDate"] as string;

                string currentDate = DataBinder.Eval(e.Item.DataItem, "AppointmentDate").ToString();
                if (lnk != null)
                {
                    if (!string.IsNullOrEmpty(selectedDate) && currentDate == selectedDate)
                    {
                        lnk.CssClass += " active";
                    }
                }
            }
        }

        protected void rptDays_ItemCreated(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                LinkButton lnkDay = e.Item.FindControl("lnkDay") as LinkButton;
                if (lnkDay != null)
                {
                    ScriptManager.GetCurrent(Page).RegisterAsyncPostBackControl(lnkDay);
                }
            }
        }


        protected string SelectedDay
        {
            get
            {
                return ViewState["SelectedDay"]?.ToString() ?? "";
            }
            set
            {
                ViewState["SelectedDay"] = value;
            }
        }

        protected void btnReserve_Click(object sender, EventArgs e)
        {
            //err.Visible = false;
            //try
            //{
            //    string rawTime = hfSelectedTime.Value; //lbTime.Text;
            //    DateTime selectedDateTime = Convert.ToDateTime(hfSelectedTime.Value);
            //    string selectedTime = selectedDateTime.ToString("HH:mm"); // match format of RTime


            //    int count = new Select("COUNT(*)")
            //                   .From(TblReserve.Schema)
            //                   .Where(TblReserve.Columns.RTime).IsEqualTo(selectedTime)
            //                   .And(TblReserve.Columns.RDoctorId).IsEqualTo(doctorID)
            //                   .And(TblReserve.Columns.RDatetime).IsEqualTo(selectedDateTime)
            //                   .ExecuteScalar<int>();


            //    if (count > 0)
            //    {
            //        err.Text = "متاسفانه این نوبت قبلا رزرو شده است.";
            //        err.Visible = true;
            //    }
            //    else
            //    {
            //        string trackingCode = doctorID.ToString() + cc.RandomNumber(4).ToString();
            //        TblReserve _TblReserve = new TblReserve();
            //        _TblReserve.RDatetime = DateTime.Parse(hfSelectedTime.Value);
            //        _TblReserve.RDoctorId = doctorID;
            //        _TblReserve.RName = txtName.Text;
            //        _TblReserve.RPhonenumber = txtTel.Text;
            //        _TblReserve.RSaveDate = DateTime.Now;
            //        _TblReserve.RTime = selectedTime;
            //        _TblReserve.RTrackingCode = trackingCode;
            //        _TblReserve.RStatus = 0;
            //        _TblReserve.Save();
            //        Response.Cookies["trackingCode"].Value = trackingCode;

            //        // ✅ Safe redirect without thread abort
            //        Response.Redirect("/Reserve.aspx", false);
            //        Context.ApplicationInstance.CompleteRequest();
            //    }
            //}
            //catch (Exception ex)
            //{
            //    string error = ex.Message;
            //    err.Text = "متاسفانه خطایی پیش آمد، لطفا دوباره سعی کنید.";
            //    err.Visible = true;
            //}
        }

        ClassControl _ClassControl = new ClassControl();
        //protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    if (e.CommandName == "SelectDay")
        //    {
        //        string rand = _ClassControl.RandomNumber(6).ToString();
        //        Label lblName = (Label)e.Item.FindControl("Label1");
        //        lblName.Text = rand;

        //    }
        //}


        */
    }
}