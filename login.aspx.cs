using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DalWebSite;
using website;

namespace DoctorYab
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            error.Visible = false;
            err.Visible = false;
            try
            {
                if (CheekTxt(TxtUser.Text) && CheekTxt(TxtPass.Text))
                {
                    TblDoctor _TblDoctor = new TblDoctor(TblDoctor.Columns.DUsername, TxtUser.Text);
                    if (_TblDoctor.IsLoaded)
                    {
                        if (_TblDoctor.DPassword == ClassControl.encryptString(TxtPass.Text))
                        {
                            Response.Redirect("/");
                        }
                        else
                            error.Visible = true;
                    }
                    else
                        error.Visible = true;
                }
                else
                {
                    err.Text = "کاراکتر غیر مجاز !!!!!!!!!!!!!";
                    err.Visible = true;
                }
            }
            catch
            {
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

    }
}