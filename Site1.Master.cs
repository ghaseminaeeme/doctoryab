using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoctorYab
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DrdLng_SelectedIndexChanged(object sender, EventArgs e)
        {
            string url = HttpContext.Current.Request.Url.PathAndQuery;

            if (DrdLng.SelectedValue == "ar")
                Response.Redirect("/Ar" + url);
           else if (DrdLng.SelectedValue == "en")
                Response.Redirect("/En" + url);
            else
                Response.Redirect(url);
        }
    }
}