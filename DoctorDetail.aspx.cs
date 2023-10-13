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
    public partial class DoctorDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TblDoctor _TblDoctor = new TblDoctor(Convert.ToInt32(Request.QueryString["did"]));
            HtmlMeta metaKey = new HtmlMeta();
            metaKey.Name = "keywords";
            metaKey.Content = _TblDoctor.DKeyword;
            Page.Header.Controls.Add(metaKey);

            HtmlHead head = Page.Header;
            HtmlTitle title = new HtmlTitle();
            title.Text = "دکتریاب ایران | " + _TblDoctor.DName;
            head.Controls.Add(title);

            HtmlMeta metaKey2 = new HtmlMeta();
            metaKey2.Name = "description";
            metaKey2.Content = "دکتریاب ایران، " + _TblDoctor.DName;
            Page.Header.Controls.Add(metaKey2);

        }
    }
}