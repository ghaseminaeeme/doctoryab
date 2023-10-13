using DalWebSite;
using ImageResizer;
using ImageResizer.Configuration;
using SubSonic;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using website;

namespace DoctorYab.Admin
{
    public partial class adver : System.Web.UI.Page
    {
        ClassControl _ClassControl = new ClassControl();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            suc.Visible = false;
            err.Visible = false;
            int Id = _ClassControl.New("TblAdver");
            try
            {
                if (btnSave.Text == "ذخـــیره")
                {
                    TblAdver _TblAdver = new TblAdver();
                    _TblAdver.ASubject = TxtSub.Text;
                    _TblAdver.ALink = TxtLink.Text;
                    _TblAdver.AStatus = Convert.ToBoolean(int.Parse(DrdActive.SelectedValue));
                    _TblAdver.AStateFk = int.Parse(DrdState.SelectedValue);
                    _TblAdver.ALanguage = byte.Parse(DrdLng.SelectedValue);
                    if (Fu1.FileName != "")
                    {
                        _TblAdver.AImage = UploadFiles("450", "250", "../Upload/Ad/Ad-" + Id.ToString() + ".jpg", 0);
                    }

                    _TblAdver.Save();
                    GV.DataBind();
                    suc.Visible = true;

                }
                else
                {
                    TblAdver _TblAdver = new TblAdver(Request.Cookies["Editid"].Value);
                    _TblAdver.ASubject = TxtSub.Text;
                    _TblAdver.ALink = TxtLink.Text;
                    _TblAdver.AStatus = Convert.ToBoolean(int.Parse(DrdActive.SelectedValue));
                    _TblAdver.AStateFk = int.Parse(DrdState.SelectedValue);
                    _TblAdver.ALanguage = byte.Parse(DrdLng.SelectedValue);
                    if (Fu1.FileName != "")
                    {
                        _TblAdver.AImage = UploadFiles("450", "250", "../Upload/Ad/Ad-" + Request.Cookies["Editid"].Value + ".jpg", 0);
                    }

                    _TblAdver.Save();
                    GV.DataBind();
                    suc.Visible = true;
                    btnSave.Text = "ذخـــیره";

                }
                TxtSub.Text = "";
                TxtLink.Text = "";
                Image1.ImageUrl = "";
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
            TblAdver _TblAdver = new TblAdver(GV.SelectedDataKey.Value.ToString());
            TxtSub.Text = _TblAdver.ASubject;
            TxtLink.Text = _TblAdver.ALink;
            DrdActive.SelectedValue = _TblAdver.AStatus.ToString();
            DrdState.SelectedValue = _TblAdver.AStateFk.ToString();
            DrdLng.SelectedValue = _TblAdver.ALanguage.ToString();
            Image1.ImageUrl = _TblAdver.AImage;
            btnSave.Text = "ویرایش";
            suc.Visible = false;
            err.Visible = false;
        }

        public string UploadFiles(string width, string height, string SavePath, int fu)
        {
            string settingsForImages = "maxwidth=" + width + "&maxheight=" + height + "&format=jpg" + "&crop=auto";
            if (!IsPostBack) return "";
            Guid lastUpload = Guid.Empty;

            HttpPostedFile file = HttpContext.Current.Request.Files[fu];
            if (file.ContentLength > 0)
            {

                if (Config.Current.Pipeline.IsAcceptedImageType(file.FileName) && settingsForImages != null)
                {

                    ResizeSettings resizeCropSettings = new ResizeSettings(settingsForImages);

                    using (MemoryStream ms = new MemoryStream())
                    {
                        FileStream newPic = new FileStream(Server.MapPath(@SavePath), FileMode.Create);
                        ImageBuilder.Current.Build(file, newPic, resizeCropSettings);
                        byte[] data = new Byte[ms.Length];
                        file.InputStream.Read(data, 0, int.Parse(ms.Length.ToString()));
                        newPic.Write(data, 0, int.Parse(ms.Length.ToString()));
                        newPic.Close();
                    }
                }
            }
            return @SavePath;

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
                    string SQL = "delete from TblAdver where id=" + GV.DataKeys[item.RowIndex].Value.ToString();
                    horror.ExecuteScalar<string>(SQL);
                }
            }
            else
                foreach (GridViewRow item in GV.Rows)
                    if ((item.FindControl("chkDelete") as CheckBox).Checked)
                    {
                        CodingHorror horror = new CodingHorror();
                        string SQL = "delete from TblAdver where id=" + GV.DataKeys[item.RowIndex].Value.ToString();
                        horror.ExecuteScalar<string>(SQL);
                    }
            GV.DataBind();
        }
    }
}