using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DalWebSite;
using website;
using ImageResizer.Configuration;
using System.IO;
using ImageResizer;

namespace _DoctorYab.Admin
{
    
    public partial class about : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TblAbout _TblAbout = new TblAbout(1);
                TxtDes.Text = _TblAbout.ADescription;
                TxtAparat.Text = _TblAbout.AAparat;
                TxtEmail.Text = _TblAbout.AEmail;
                TxtIns.Text = _TblAbout.AInstagram;
                TxtMob.Text = _TblAbout.AMobile;
                TxtTel.Text = _TblAbout.ATel;
                TxtTlg.Text = _TblAbout.ATelegram;
                TxtWts.Text = _TblAbout.AWhatsapp;
                Image1.ImageUrl = _TblAbout.AImg1;
                TxtFooter.Text = _TblAbout.AFooterText;
                TxtAdrs.Text = _TblAbout.AAddress;

                TxtArDes.Text = _TblAbout.AArDescription;
                TxtArFooter.Text = _TblAbout.AArFooterText;
                TxtArAdrs.Text = _TblAbout.AArAddress;

                TxtEnDes.Text = _TblAbout.AEnDescription;
                TxtEnFooter.Text = _TblAbout.AEnFooterText;
                TxtEnAdrs.Text = _TblAbout.AEnAddress;
            }
            
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            suc.Visible = false;
            err.Visible = false;
            try
            {
                TblAbout _TblAbout = new TblAbout(1);
                _TblAbout.ADescription = TxtDes.Text;
                _TblAbout.AAparat = TxtAparat.Text;
                _TblAbout.AEmail = TxtEmail.Text;
                _TblAbout.AInstagram = TxtIns.Text;
                _TblAbout.AMobile = TxtMob.Text;
                _TblAbout.ATel = TxtTel.Text;
                _TblAbout.ATelegram = TxtTlg.Text;
                _TblAbout.AWhatsapp = TxtWts.Text;
                _TblAbout.AFooterText = TxtFooter.Text;
                _TblAbout.AAddress = TxtAdrs.Text;

                _TblAbout.AArDescription = TxtArDes.Text;
                _TblAbout.AArFooterText = TxtArFooter.Text;
                _TblAbout.AArAddress = TxtArAdrs.Text;

                _TblAbout.AEnDescription = TxtEnDes.Text;
                _TblAbout.AEnFooterText = TxtEnFooter.Text;
                _TblAbout.AEnAddress = TxtEnAdrs.Text;

                if (Fu1.FileName != "")
                {
                    _TblAbout.AImg1 = UploadFiles("540", "360", "../Upload/about/abt1.jpg", 0);
                }
                _TblAbout.Save();
                suc.Visible = true;
            }
            catch (Exception)
            {
                err.Visible = true;
            }
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