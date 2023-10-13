using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using website;

namespace _DoctorYab.Admin
{
    public partial class datepicker : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ClassControl cc = new ClassControl();
            Label1.Text = cc.convertPersianDateToGregorian(PDatePicker1.Text).ToString();

          //  string date = PDatePicker1.Text;
          //  // string date2 = Regex.Replace(date, "[۰-۹]", x => ((char)(x.Value[0] - '۰' + '0')).ToString());
          //  DateTime dt = DateTime.ParseExact(date, "yyyy/M/d", System.Globalization.CultureInfo.InvariantCulture);

            ////  DateTime dt = DateTime.ParseExact(date, "yyyy/mm/dd", CultureInfo.InvariantCulture);
            //  PersianCalendar pc = new PersianCalendar();
            //  DateTime dt2 = pc.ToDateTime(dt.Year, dt.Month, dt.Day, dt.Hour, dt.Minute, dt.Second, dt.Millisecond);
            //  Label1.Text = dt2.ToString();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //string GregorianDate = "7/30/2020";
            string GregorianDate = Label1.Text;
            DateTime d = DateTime.Parse(GregorianDate);
            PersianCalendar pc = new PersianCalendar();
            Label2.Text = string.Format("{0}/{1}/{2}", pc.GetYear(d), pc.GetMonth(d), pc.GetDayOfMonth(d));
        }
    }
}