using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DalWebSite;
using website;

namespace _DoctorYab.Admin
{
    public partial class Default : System.Web.UI.Page
    {
        ClassControl _ClassControl = new ClassControl();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            if (CheekTxt(TxtUser.Text) && CheekTxt(TxtPass.Text))
            {
                TblUser _TblUser = new TblUser(TblUser.Columns.Username, TxtUser.Text);
                if (_TblUser.IsLoaded)
                {
                    //if (_TblUser.Password == ClassControl.encryptString(TxtPass.Text))
                    if (_TblUser.Password == TxtPass.Text)
                    {
                        Session["usr"] = _TblUser.Username.ToString();
                        Response.Redirect("home.aspx");
                    }
                    else
                    {
                        err.Visible = true;
                    }
                }
                else
                {
                    err.Visible = true;
                }
            }
            else
            {
                err.InnerText = "کاراکتر غیر مجاز !!!!!!!!!!!!!";
                err.Visible = true;
            }
        }

        private bool CheekTxt(string txt)
        {
            if (ClassControl.checkChar(txt))
            {
                return true;
            }
            return false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}