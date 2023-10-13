using DalWebSite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using website;

namespace DoctorYab
{
    public partial class Default : System.Web.UI.Page
    {
        ClassControl cc = new ClassControl();
        protected void Page_Load(object sender, EventArgs e)
        {
            TblPage _TblPage = new TblPage(1);
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
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Cookies["name"].Value = TxtName.Text;
            string url = "Doctors.aspx?city=" + DrdCity.SelectedValue + "&branch=" + DrdBranch.SelectedValue ;
            Response.Redirect(url);
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            error.Visible = false;
            success.Visible = false;
            try
            {
                TblMessage _TblMessage = new TblMessage();
                _TblMessage.MDes = "جهت درخواست ثبت آگهی - از صفحه اول ";
                _TblMessage.MName = TxtContactName.Text;
                _TblMessage.MSaveDate = cc.PersianDate_10("");
                _TblMessage.MStatus = false;
                _TblMessage.MTel = TxtContactTel.Text;
                _TblMessage.Save();
                success.Visible = true;

                TxtContactTel.Text = "";
                TxtContactName.Text = "";
            }
            catch
            {
                error.Visible = true;
            }
        }

        protected void DrdLng_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DrdLng.SelectedValue == "ar")
                Response.Redirect("/Ar");
            else if (DrdLng.SelectedValue == "en")
                Response.Redirect("/En");
            else
                Response.Redirect("/");
        }
    }
}