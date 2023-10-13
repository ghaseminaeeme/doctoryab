using DalWebSite;
using SubSonic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoctorYab.Admin
{
    public partial class video : System.Web.UI.Page
    {

        protected void btnSave_Click(object sender, EventArgs e)
        {
            suc.Visible = false;
            err.Visible = false;
            try
            {
                if (btnSave.Text == "ذخـــیره")
                {
                    TblVideo _TblVideo = new TblVideo();
                    _TblVideo.VSrc = TxtVideo.Text;
                    _TblVideo.VSubject = TxtSub.Text;
                    _TblVideo.VStateFk = int.Parse(DrdState.SelectedValue);
                    _TblVideo.VStatus=byte.Parse(DrdActive.SelectedValue);
                    _TblVideo.VLanguage = byte.Parse(DrdLng.SelectedValue);
                    _TblVideo.Save();
                    GV.DataBind();
                    suc.Visible = true;

                }
                else
                {
                    TblVideo _TblVideo = new TblVideo(Request.Cookies["Editid"].Value);
                    _TblVideo.VSrc = TxtVideo.Text;
                    _TblVideo.VSubject = TxtSub.Text;
                    _TblVideo.VStateFk = int.Parse(DrdState.SelectedValue);
                    _TblVideo.VStatus = byte.Parse(DrdActive.SelectedValue);
                    _TblVideo.VLanguage = byte.Parse(DrdLng.SelectedValue);

                    _TblVideo.Save();
                    GV.DataBind();
                    suc.Visible = true;
                    btnSave.Text = "ذخـــیره";

                }
                TxtVideo.Text = "";
                TxtSub.Text = "";
                videobox.InnerHtml = "";
                DrdActive.ClearSelection();
            }
            catch (Exception)
            {
                err.Visible = true;
            }

        }

        protected void GV_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Cookies["Editid"].Value = GV.SelectedDataKey.Value.ToString();
            TblVideo _TblVideo = new TblVideo(GV.SelectedDataKey.Value.ToString());
            TxtVideo.Text = _TblVideo.VSrc;
            TxtSub.Text = _TblVideo.VSubject;
            DrdActive.SelectedValue = _TblVideo.VStatus.ToString();
            DrdState.SelectedValue = _TblVideo.VStateFk.ToString();
            DrdLng.SelectedValue = _TblVideo.VLanguage.ToString();
            videobox.InnerHtml = _TblVideo.VSrc;
            btnSave.Text = "ویرایش";
            suc.Visible = false;
            err.Visible = false;
        }

        protected void ChkDelAll_CheckedChanged(object sender, EventArgs e)
        {
            chkDeleteAll(ref GV);
        }

        public void chkDeleteAll(ref GridView GV)
        {
            if ((GV.HeaderRow.FindControl("ChkDelAll") as CheckBox).Checked)
                foreach (GridViewRow item in GV.Rows)
                    (item.FindControl("chkDelete") as CheckBox).Checked = true;
            else
                foreach (GridViewRow item in GV.Rows)
                    (item.FindControl("chkDelete") as CheckBox).Checked = false;
        }

        protected void BtnDel_Click(object sender, EventArgs e)
        {
            if ((GV.HeaderRow.FindControl("ChkDelAll") as CheckBox).Checked)
            {
                foreach (GridViewRow item in GV.Rows)
                {
                    CodingHorror horror = new CodingHorror();
                    string SQL = "delete from TblVideo where id=" + GV.DataKeys[item.RowIndex].Value.ToString();
                    horror.ExecuteScalar<string>(SQL);
                }
            }
            else
                foreach (GridViewRow item in GV.Rows)
                    if ((item.FindControl("chkDelete") as CheckBox).Checked)
                    {
                        CodingHorror horror = new CodingHorror();
                        string SQL = "delete from TblVideo where id=" + GV.DataKeys[item.RowIndex].Value.ToString();
                        horror.ExecuteScalar<string>(SQL);
                    }
            GV.DataBind();
        }
    }
}