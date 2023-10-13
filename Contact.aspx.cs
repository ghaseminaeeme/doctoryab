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
    public partial class contact : System.Web.UI.Page
    {
        ClassControl cc = new ClassControl();
        protected void Page_Load(object sender, EventArgs e)
        {
            TblPage _TblPage = new TblPage(2);
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            error.Visible = false;
            success.Visible = false;
            try
            {
                TblMessage _TblMessage = new TblMessage();
                _TblMessage.MDes = TxtDes.Text;
                _TblMessage.MName = TxtName.Text;
                _TblMessage.MSaveDate = cc.PersianDate_10("");
                _TblMessage.MStatus = false;
                _TblMessage.MTel = TxtTel.Text;
                _TblMessage.Save();
                success.Visible = true;

                TxtTel.Text = "";
                TxtName.Text = "";
                TxtDes.Text = "";
            }
            catch
            {
                error.Visible = true;
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            error.Visible = false;
            success.Visible = false;
            try
            {
                TblMessage _TblMessage = new TblMessage();
                _TblMessage.MDes = TxtDes.Text;
                _TblMessage.MName = TxtName.Text;
                _TblMessage.MSaveDate = cc.PersianDate_10("");
                _TblMessage.MStatus = false;
                _TblMessage.MTel = TxtTel.Text;
                _TblMessage.Save();
                success.Visible = true;

                TxtTel.Text = "";
                TxtName.Text = "";
                TxtDes.Text = "";
            }
            catch
            {
                error.Visible = true;
            }
        }
    }
}