using DalWebSite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using website;

namespace DoctorYab.panel
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        ClassControl _ClassControl = new ClassControl();
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //error.Text = "نام کاربری یا رمز عبور اشتباه است.";
            error.Visible = false;
            try
            {
                if (CheekTxt(TxtUser.Text) && CheekTxt(TxtPass.Text))
                {
                    TblDoctor _TblDoctor = new TblDoctor(TblDoctor.Columns.DUsername, TxtUser.Text);
                    if (_TblDoctor.IsLoaded)
                    {
                        if (_TblDoctor.DPassword == ClassControl.encryptString(TxtPass.Text))
                        {
                            Session["doctorId"] = _TblDoctor.Id;
                            Response.Redirect("reserves.aspx");
                        }
                        else
                        {
                            error.Visible = true;
                        }
                    }
                    else
                    {
                        error.Visible = true;
                    }
                }
                else
                {
                    error.Text = "کاراکتر غیر مجاز !!!!!!!!!!!!!";
                    error.Visible = true;
                }
            }
            catch (Exception ex)
            {
                error.Text = "متاسفانه خطایی رخ داد. لطفا مجددا سعی نمایید.";
                error.Visible = true;
            }
        }

        private bool CheekTxt(string txt)
        {
            if (txt != "" && ClassControl.checkChar(txt))
            {
                return true;
            }
            return false;
        }
    }
}