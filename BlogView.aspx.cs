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
    public partial class BlogView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TblBlog _TblBlog = new TblBlog(Convert.ToInt32(Request.QueryString["bid"]));
            HtmlMeta metaKey = new HtmlMeta();
            metaKey.Name = "keywords";
            metaKey.Content = _TblBlog.BKeyword;
            Page.Header.Controls.Add(metaKey);

            HtmlHead head = Page.Header;
            HtmlTitle title = new HtmlTitle();
            title.Text = "دکتریاب ایران | " + _TblBlog.BSubject;
            head.Controls.Add(title);

            HtmlMeta metaKey2 = new HtmlMeta();
            metaKey2.Name = "description";
            metaKey2.Content = _TblBlog.BMetaDes;
            Page.Header.Controls.Add(metaKey2);
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("/blog.aspx?tag=" + TxtSearch.Text);
        }
    }
}