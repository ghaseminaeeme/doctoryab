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

namespace DoctorYab
{
	public partial class reserve1 : System.Web.UI.Page
	{
        ClassControl cc = new ClassControl();
        protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            error.Text = "متاسفانه خطایی رخ داد. لطفا مجددا سعی نمایید";
            success.Text = "";
            success.Visible = false;
            error.Visible = false;
            try
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);

                /// آیا این نوبت برای فرد دیگری رزرو شده است یا نه
                TblAppointment _TblAppointment = new TblAppointment(id);
                if (_TblAppointment.IsLoaded && _TblAppointment.AStatus == 1)
                {
                    error.Text = "متاسفانه این نوبت قبلا رزرو شده است. لطفا نوبت دیگری را انتخاب نمایید.";
                    error.Visible = true;
                    return;
                }
                else
                {
                    string code = cc.RandomString(15, true);
                    code = Request.QueryString["id"] + code;


                    TblReserve _TblReserve = new TblReserve();
                    _TblReserve.RDoctorId = Convert.ToInt32(Request.QueryString["did"]);
                    _TblReserve.RName = TxtName.Text;
                    _TblReserve.RPhonenumber = TxtTel.Text;
                    _TblReserve.RTrackingCode = code;
                    _TblReserve.RDatetime = _TblAppointment.ADateTime;
                    _TblReserve.RTime = _TblAppointment.ATime.ToString();
                    _TblReserve.Save();

                    _TblAppointment.AStatus = 1;
                    _TblAppointment.ATrackingCode = code;
                    _TblAppointment.Save();

                    success.Text = "این نوبت برای شما، با موفقیت رزرو شد. کد پیگیری شما : " + code;
                    success.Visible = true;
                    TxtName.Text = "";
                    TxtTel.Text = "";
                }
            }
            catch (Exception ex)
            {
                string err = ex.ToString();
                error.Text = "متاسفانه خطایی رخ داد. لطفا مجددا سعی نمایید";
                error.Visible = true;
            }
        }

    }
}