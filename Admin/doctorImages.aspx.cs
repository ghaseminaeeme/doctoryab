using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DalWebSite;
using ImageResizer;
using ImageResizer.Configuration;
using SubSonic;
using website;

namespace _DoctorYab.Admin
{
    public partial class doctorImages : System.Web.UI.Page
    {
        ClassControl _ClassControl = new ClassControl();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["did"].ToString() != "")
            {
                TblDoctor _TblDoctor = new TblDoctor(int.Parse(Request.QueryString["did"]));
                LbSubject.Text = _TblDoctor.DName;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            suc.Visible = false;
            err.Visible = false;
            int Id = _ClassControl.New("TblDoctorImage");
            try
            {
                if (btnSave.Text == "ذخـــیره")
                {
                    TblDoctorImage _TblDoctorImage = new TblDoctorImage();
                    if (Fu1.FileName != "")
                    {
                        _TblDoctorImage.DPicture = UploadFiles("", "", "../Upload/doctors/dr-" + Id.ToString() + ".jpg", 0);
                    }
                    _TblDoctorImage.DDoctorFk = int.Parse(Request.QueryString["did"]);
                    _TblDoctorImage.Save();
                    GV.DataBind();
                    suc.Visible = true;

                }
                else
                {
                    TblDoctorImage _TblDoctorImage = new TblDoctorImage(Request.Cookies["Editid"].Value);
                    if (Fu1.FileName != "")
                    {
                        _TblDoctorImage.DPicture = UploadFiles("", "", "../Upload/doctors/dr-" + Request.Cookies["Editid"].Value + ".jpg", 0);
                    }
                    _TblDoctorImage.DDoctorFk = int.Parse(Request.QueryString["did"]);
                    _TblDoctorImage.Save();
                    GV.DataBind();
                    suc.Visible = true;
                    btnSave.Text = "ذخـــیره";

                }

                Image1.ImageUrl = "";
            }
            catch (Exception)
            {
                err.Visible = true;
            }

        }

        protected void GV_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Cookies["Editid"].Value = GV.SelectedDataKey.Value.ToString();
            TblDoctorImage _TblDoctorImage = new TblDoctorImage(GV.SelectedDataKey.Value.ToString());
            Image1.ImageUrl = _TblDoctorImage.DPicture;
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
                    string SQL = "delete from TblDoctorImage where id=" + GV.DataKeys[item.RowIndex].Value.ToString();
                    horror.ExecuteScalar<string>(SQL);
                }
            }
            else
                foreach (GridViewRow item in GV.Rows)
                    if ((item.FindControl("chkDelete") as CheckBox).Checked)
                    {
                        CodingHorror horror = new CodingHorror();
                        string SQL = "delete from TblDoctorImage where id=" + GV.DataKeys[item.RowIndex].Value.ToString();
                        horror.ExecuteScalar<string>(SQL);
                    }
            GV.DataBind();
        }
    }
}