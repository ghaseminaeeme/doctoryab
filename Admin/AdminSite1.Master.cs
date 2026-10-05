using DalWebSite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _DoctorYab.Admin
{
    public partial class AdminSite1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usr"] == null || (Session["usr"]).ToString() == "")
            {
                Response.Redirect("/Admin/Default.aspx");
            }
            else
            {
                TblUser _TblUser = new TblUser(TblUser.Columns.Username, Session["usr"]);
                if (_TblUser.IsLoaded)
                {
                    LbUser.Text = _TblUser.Name;
                }
            }

        }

        protected void LbSignOut_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            HttpContext.Current.Response.Cache.SetNoServerCaching();
            HttpContext.Current.Response.Cache.SetNoStore();
            Session.Abandon();
            Session.Clear();
            Response.Redirect("/Default.aspx");

        }
    }
}