using DalWebSite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using website;

namespace DoctorYab.Admin
{
    public partial class advantage : System.Web.UI.Page
    {
        ClassControl _ClassControl = new ClassControl();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            suc.Visible = false;
            err.Visible = false;
            try
            {
                TblAdvantage _TblAdvantage = new TblAdvantage(Request.Cookies["Editid"].Value);
                _TblAdvantage.SSubject = TxtSub.Text;
               // _TblAdvantage.SLanguage = int.Parse(DrdLng.SelectedValue);
                _TblAdvantage.SDes = TxtDes.Text;
                _TblAdvantage.Save();
                GV.DataBind();
                suc.Visible = true;
                btnSave.Enabled = false;

                TxtSub.Text = "";
                TxtDes.Text = "";
                //DrdLng.ClearSelection();
            }
            catch (Exception)
            {
                err.Visible = true;
            }

        }

        protected void GV_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Cookies["Editid"].Value = GV.SelectedDataKey.Value.ToString();
            TblAdvantage _TblAdvantage = new TblAdvantage(GV.SelectedDataKey.Value.ToString());
            TxtSub.Text = _TblAdvantage.SSubject;
            TxtDes.Text = _TblAdvantage.SDes;
          //  DrdLng.SelectedValue = _TblAdvantage.SLanguage.ToString();

            btnSave.Enabled = true;
            suc.Visible = false;
            err.Visible = false;
        }


    }
}