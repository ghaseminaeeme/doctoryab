using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using website;
using DalWebSite;
using SubSonic;
using ImageResizer.Configuration;
using System.IO;
using ImageResizer;

namespace _DoctorYab.Admin
{
    public partial class blog : System.Web.UI.Page
    {
        ClassControl _ClassControl = new ClassControl();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Request.QueryString["gid"].ToString() != "")
            //    DrdGrp.SelectedValue = Request.QueryString["gid"];
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            suc.Visible = false;
            err.Visible = false;
            int Id = _ClassControl.New("TblBlog");
            try
            {
                if (btnSave.Text == "ذخـــیره")
                {
                    TblBlog _TblBlog = new TblBlog();
                    _TblBlog.BSubject = TxtSub.Text;
                    _TblBlog.BKeyword = TxtKey.Text;
                    //_TblBlog.BGroupFk = int.Parse(DrdGrp.SelectedValue);
                    _TblBlog.BDate = TxtDate.Text;
                    _TblBlog.BDes = TxtDes.Text;
                    _TblBlog.BSummery = TxtSum.Text;
                    _TblBlog.BWriter = TxtWrt.Text;
                    _TblBlog.BMetaDes = TxtMdes.Text;
                    _TblBlog.BTags = TxtTag.Text;
                    if (Fu1.FileName != "")
                    {
                        _TblBlog.BPic = UploadFiles("", "", "../Upload/blog/" + Id.ToString() + ".jpg", 0);
                    }
                    _TblBlog.Save();
                    GV.DataBind();
                    suc.Visible = true;

                }
                else
                {
                    TblBlog _TblBlog = new TblBlog(Request.Cookies["Editid"].Value);
                    _TblBlog.BSubject = TxtSub.Text;
                    _TblBlog.BKeyword = TxtKey.Text;
                   // _TblBlog.BGroupFk = int.Parse(DrdGrp.SelectedValue);
                    _TblBlog.BDate = TxtDate.Text;
                    _TblBlog.BDes = TxtDes.Text;
                    _TblBlog.BSummery = TxtSum.Text;
                    _TblBlog.BWriter = TxtWrt.Text;
                    _TblBlog.BMetaDes = TxtMdes.Text;
                    _TblBlog.BTags = TxtTag.Text;
                    if (Fu1.FileName != "")
                    {
                        _TblBlog.BPic = UploadFiles("", "", "../Upload/blog/" + Request.Cookies["Editid"].Value + ".jpg", 0);
                    }
                    _TblBlog.Save();
                    GV.DataBind();
                    suc.Visible = true;
                    btnSave.Text = "ذخـــیره";

                }
                TxtSub.Text = "";
                TxtKey.Text = "";
                TxtDes.Text = "";
                TxtSum.Text = "";
                TxtWrt.Text = "";
                TxtDate.Text = "";
                TxtMdes.Text = "";
                TxtTag.Text = "";
                Image1.ImageUrl = "";
              //  DrdGrp.ClearSelection();
            }
            catch (Exception)
            {
                err.Visible = true;
            }

        }

        protected void GV_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Cookies["Editid"].Value = GV.SelectedDataKey.Value.ToString();
            TblBlog _TblBlog = new TblBlog(GV.SelectedDataKey.Value.ToString());
            TxtSub.Text = _TblBlog.BSubject;
            TxtKey.Text = _TblBlog.BKeyword;
            TxtWrt.Text = _TblBlog.BWriter;
            TxtSum.Text = _TblBlog.BSummery;
            TxtDes.Text = _TblBlog.BDes;
            TxtDate.Text = _TblBlog.BDate;
            TxtMdes.Text = _TblBlog.BMetaDes;
            TxtTag.Text = _TblBlog.BTags;
            //DrdGrp.SelectedValue = _TblBlog.BGroupFk.ToString();
            Image1.ImageUrl = _TblBlog.BPic;

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
                    string SQL = "delete from TblBlog  where id=" + GV.DataKeys[item.RowIndex].Value.ToString();
                    horror.ExecuteScalar<string>(SQL);
                }
            }
            else
                foreach (GridViewRow item in GV.Rows)
                    if ((item.FindControl("chkDelete") as CheckBox).Checked)
                    {
                        CodingHorror horror = new CodingHorror();
                        string SQL = "delete from TblBlog where id=" + GV.DataKeys[item.RowIndex].Value.ToString();
                        horror.ExecuteScalar<string>(SQL);
                    }
            GV.DataBind();
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
    }
}