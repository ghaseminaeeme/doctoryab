using DalWebSite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace DoctorYab
{
    public partial class Doctors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TblPage _TblPage = new TblPage(4);
            HtmlMeta metaKey = new HtmlMeta();
            metaKey.Name = "keywords";
            metaKey.Content = _TblPage.PKeyword;
            Page.Header.Controls.Add(metaKey);

            HtmlHead head = Page.Header;
            HtmlTitle title = new HtmlTitle();
            title.Text = _TblPage.PTitle;
            head.Controls.Add(title);

            HtmlMeta metaKey2 = new HtmlMeta();
            metaKey2.Name = "description";
            metaKey2.Content = _TblPage.PDes;
            Page.Header.Controls.Add(metaKey2);

            if (Request.Cookies["name"] != null)
            {
                Response.Cookies["name"].Expires = DateTime.Now.AddDays(-1);
            }
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Cookies["name"].Value = TxtName.Text;
            Response.Redirect("Doctors.aspx?city=" + DrdCity.SelectedValue + "&branch=" + DrdBranch.SelectedValue);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           // Response.Redirect("Doctors.aspx?city=" + DrdCity.SelectedValue + "&branch=" + DrdBranch.SelectedValue + "" + TxtName.Text);
            Response.Redirect("Default.aspx");

        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Doctors.aspx?city=0&branch=0");

        }
    }
}