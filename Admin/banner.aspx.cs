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

namespace _DoctorYab.Admin
{
    public partial class banner : System.Web.UI.Page
    {
        ClassControl _ClassControl = new ClassControl();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            suc.Visible = false;
            err.Visible = false;
            int Id = _ClassControl.New("TblBanner");
            try
            {
                if (btnSave.Text == "ذخـــیره")
                {
                    TblBanner _TblBanner = new TblBanner();
                    _TblBanner.BSubTitle = TxtSub2.Text;
                    _TblBanner.BSubject = TxtSub.Text;
                    _TblBanner.BLink = TxtLink.Text;
                    _TblBanner.BText1 = Txt1.Text;
                    _TblBanner.BLanguage = Byte.Parse(DrdLng.SelectedItem.Value);
                    if (TxtPri.Text != "") _TblBanner.BPriority = int.Parse(TxtPri.Text); else _TblBanner.BPriority = 0;
                    _TblBanner.BStatus = Convert.ToBoolean(int.Parse(DrdActive.SelectedValue));
                    _TblBanner.BStateFk = int.Parse(DrdState.SelectedValue);
                    if (Fu1.FileName != "")
                    {
                        _TblBanner.BImage = UploadFiles("825", "500", "../Upload/Banner/b-" + Id.ToString() + ".jpg", 0);
                    }

                    _TblBanner.Save();
                    GV.DataBind();
                    suc.Visible = true;

                }
                else
                {
                    TblBanner _TblBanner = new TblBanner(Request.Cookies["Editid"].Value);
                    _TblBanner.BSubTitle = TxtSub2.Text;
                    _TblBanner.BSubject = TxtSub.Text;
                    _TblBanner.BLink = TxtLink.Text;
                    _TblBanner.BText1 = Txt1.Text;
                    _TblBanner.BLanguage = Byte.Parse(DrdLng.SelectedItem.Value);
                    if (TxtPri.Text != "") _TblBanner.BPriority = int.Parse(TxtPri.Text); else _TblBanner.BPriority = 0;
                    _TblBanner.BStatus = Convert.ToBoolean(int.Parse(DrdActive.SelectedValue));
                    _TblBanner.BStateFk = int.Parse(DrdState.SelectedValue);
                    if (Fu1.FileName != "")
                    {
                        _TblBanner.BImage = UploadFiles("825", "500", "../Upload/Banner/b-" + Request.Cookies["Editid"].Value + ".jpg", 0);
                    }

                    _TblBanner.Save();
                    GV.DataBind();
                    suc.Visible = true;
                    btnSave.Text = "ذخـــیره";

                }
               
                TxtSub2.Text = "";
                TxtSub.Text = "";
                TxtLink.Text = "";
                TxtPri.Text = "";
                Txt1.Text = "";
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
            TblBanner _TblBanner = new TblBanner(GV.SelectedDataKey.Value.ToString());
            TxtSub.Text = _TblBanner.BSubject;
            TxtSub2.Text = _TblBanner.BSubTitle;
            TxtPri.Text = _TblBanner.BPriority.ToString();
            TxtLink.Text = _TblBanner.BLink;
            Txt1.Text = _TblBanner.BText1;
            DrdActive.SelectedValue = _TblBanner.BStatus.ToString();
            DrdState.SelectedValue = _TblBanner.BStateFk.ToString();
            Image1.ImageUrl = _TblBanner.BImage;
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
                    string SQL = "delete from TblBanner where id=" + GV.DataKeys[item.RowIndex].Value.ToString();
                    horror.ExecuteScalar<string>(SQL);
                }
            }
            else
                foreach (GridViewRow item in GV.Rows)
                    if ((item.FindControl("chkDelete") as CheckBox).Checked)
                    {
                        CodingHorror horror = new CodingHorror();
                        string SQL = "delete from TblBanner where id=" + GV.DataKeys[item.RowIndex].Value.ToString();
                        horror.ExecuteScalar<string>(SQL);
                    }
            GV.DataBind();
        }
    }
}