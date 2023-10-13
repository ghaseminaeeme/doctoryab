using DalWebSite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _DoctorYab.Admin
{
    public partial class keyword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            suc.Visible = false;
            err.Visible = false;
            try
            {
                TblPage _TblPage = new TblPage(Request.Cookies["Editid"].Value);
                _TblPage.PKeyword = TxtKey.Text;
                _TblPage.PDes = TxtMdes.Text;
                _TblPage.PTitle = TxtTitle.Text;
                _TblPage.Save();
                GV.DataBind();
                suc.Visible = true;

                TxtSub.Text = "";
                TxtKey.Text = "";
                TxtMdes.Text = "";
                TxtTitle.Text = "";
            }
            catch (Exception)
            {
                err.Visible = true;
            }

        }

        protected void GV_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Cookies["Editid"].Value = GV.SelectedDataKey.Value.ToString();
            TblPage _TblPage = new TblPage(GV.SelectedDataKey.Value.ToString());
            TxtSub.Text = _TblPage.PPage;
            TxtKey.Text = _TblPage.PKeyword;
            TxtMdes.Text = _TblPage.PDes;
            TxtTitle.Text = _TblPage.PTitle;
            suc.Visible = false;
            err.Visible = false;
        }

    }
}