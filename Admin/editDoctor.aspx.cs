using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DalWebSite;
using ImageResizer;
using ImageResizer.Configuration;
using System.IO;
using website;


namespace _DoctorYab.Admin
{
    public partial class editDoctor : System.Web.UI.Page
    {
        ClassControl _ClassControl = new ClassControl();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TblDoctor _TblDoctor = new TblDoctor(Convert.ToInt32(Request.QueryString["did"]));
                TblCity _TblCity = new TblCity(_TblDoctor.DCityFk);
                lbSubject.Text = TxtName.Text = _TblDoctor.DName;
                TxtKey.Text = _TblDoctor.DKeyword;
                DrdGrp.DataBind();
                DrdGrp.SelectedValue = _TblDoctor.DBranchFk.ToString();
                TxtTel.Text = _TblDoctor.DTel;
                TxtTlg.Text = _TblDoctor.DTelegram;
                TxtAdrs.Text = _TblDoctor.DAddress;
                DrdCity.SelectedValue = _TblDoctor.DCityFk.ToString();
                TxtDes.Text = _TblDoctor.DDes;
                //TxtDes2.Text = _TblDoctor.DDes2;
                TxtEmail.Text = _TblDoctor.DEmail;
                TxtAparat.Text = _TblDoctor.DAparat;
                TxtIns.Text = _TblDoctor.DInstagram;
                TxtDate.Text = _ClassControl.convertGregorianDateToPersian(_TblDoctor.DEndDate.ToString());
                DrdStatus.SelectedValue = _TblDoctor.DStatus.ToString();
                TxtWeb.Text = _TblDoctor.DWebsite;
                TxtNote.Text = _TblDoctor.DNote;
                TxtMobile.Text = _TblDoctor.DMobile;
                Image1.ImageUrl = _TblDoctor.DImg;
                TxtVideo.Text = _TblDoctor.DVideo;
                TxtVideo2.Text = _TblDoctor.DVideo2;
                TxtVideo3.Text = _TblDoctor.DVideo3;
                //LbVideo.Text = _TblDoctor.DVideo;
                // LbVideo.PostBackUrl = _TblDoctor.DVideo;
                TxtSpe.Text = _TblDoctor.DSpecialty;
                TxtLat.Text = _TblDoctor.DLat;
                TxtLong.Text = _TblDoctor.DLong;
                TxtTime.Text = _TblDoctor.DWorkTime;
                TxtUser.Text = _TblDoctor.DUsername;
                TxtWts.Text = _TblDoctor.DWhatsapp;
                TxtEnAdrs.Text = _TblDoctor.DEnAddress;
                TxtEnDes.Text = _TblDoctor.DEnDes;
                TxtEnName.Text = _TblDoctor.DEnName;
                TxtEnSpe.Text = _TblDoctor.DEnSpecialty;
                TxtEnTime.Text = _TblDoctor.DEnWorkTime;

                TxtArAdrs.Text = _TblDoctor.DArAddress;
                TxtArDes.Text = _TblDoctor.DArDes;
                TxtArName.Text = _TblDoctor.DArName;
                TxtArSpe.Text = _TblDoctor.DArSpecialty;
                TxtArTime.Text = _TblDoctor.DArWorkTime;
                if (_TblDoctor.DSpecialAd == true)
                    CheckBox1.Checked = true;
                else
                    CheckBox1.Checked = false;
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            suc.Visible = false;
            err.Visible = false;
            try
            {
                TblDoctor _TblDoctor = new TblDoctor(Convert.ToInt32(Request.QueryString["did"]));
                TblDoctor checkUser = new TblDoctor(TblDoctor.Columns.DUsername, TxtUser.Text);
                if (checkUser.IsLoaded && checkUser.Id != _TblDoctor.Id)
                {
                    err.InnerText = "نام کاربری تکراری است";
                    err.Visible = true;
                }
                else
                {
                    _TblDoctor.DName = TxtName.Text;
                    _TblDoctor.DKeyword = TxtKey.Text;
                    _TblDoctor.DBranchFk = int.Parse(DrdGrp.SelectedValue);
                    _TblDoctor.DTel = TxtTel.Text;
                    _TblDoctor.DTelegram = TxtTlg.Text;
                    _TblDoctor.DAddress = TxtAdrs.Text;
                    _TblDoctor.DCityFk = int.Parse(DrdCity.SelectedValue);
                    _TblDoctor.DDes = TxtDes.Text;
                    //_TblDoctor.DDes2 = TxtDes2.Text;
                    _TblDoctor.DEmail = TxtEmail.Text;
                    _TblDoctor.DAparat = TxtAparat.Text;
                    _TblDoctor.DInstagram = TxtIns.Text;
                    _TblDoctor.DEndDate = _ClassControl.convertPersianDateToGregorian(TxtDate.Text);
                    _TblDoctor.DStatus = Byte.Parse(DrdStatus.SelectedValue);
                    _TblDoctor.DWebsite = TxtWeb.Text;
                    _TblDoctor.DNote = TxtNote.Text;
                    _TblDoctor.DMobile = TxtMobile.Text;
                    _TblDoctor.DSpecialty = TxtSpe.Text;
                    _TblDoctor.DLong = TxtLong.Text;
                    _TblDoctor.DLat = TxtLat.Text;
                    _TblDoctor.DWorkTime = TxtTime.Text;
                    _TblDoctor.DUsername = TxtUser.Text;
                    _TblDoctor.DVideo = TxtVideo.Text;
                    _TblDoctor.DVideo2 = TxtVideo2.Text;
                    _TblDoctor.DVideo3 = TxtVideo3.Text;
                    _TblDoctor.DEnAddress = TxtEnAdrs.Text;
                    _TblDoctor.DEnDes = TxtEnDes.Text;
                    _TblDoctor.DEnName = TxtEnName.Text;
                    _TblDoctor.DEnSpecialty = TxtEnSpe.Text;
                    _TblDoctor.DEnWorkTime = TxtEnTime.Text;
                    _TblDoctor.DWhatsapp = TxtWts.Text;

                    _TblDoctor.DArAddress = TxtArAdrs.Text;
                    _TblDoctor.DArDes = TxtArDes.Text;
                    _TblDoctor.DArName = TxtArName.Text;
                    _TblDoctor.DArSpecialty = TxtArSpe.Text;
                    _TblDoctor.DArWorkTime = TxtArTime.Text;
                    if (CheckBox1.Checked == true)
                        _TblDoctor.DSpecialAd = true;
                    else
                        _TblDoctor.DSpecialAd = false;

                    if (TxtPass.Text != "")
                        _TblDoctor.DPassword = ClassControl.encryptString(TxtPass.Text);

                    if (Fu1.FileName != "")
                    {
                        _TblDoctor.DImg = UploadFiles("250", "150", "../Upload/doctors/" + Request.QueryString["did"] + ".jpg", 0);
                    }
                    //if (FileUpload1.FileName != "")
                    //{
                    //    string filename = FileUpload1.FileName;
                    //    string ext = Path.GetExtension(FileUpload1.PostedFile.FileName);
                    //    FileUpload1.SaveAs(Server.MapPath("../upload/video/DrV-" + Request.QueryString["did"] + ext));
                    //    _TblDoctor.DVideo = ("/upload/video/DrV-" + Request.QueryString["did"] + ext);  // http://doctoryab-iran.com/
                    //}
                    _TblDoctor.Save();
                    suc.Visible = true;
                }
            }
            catch (Exception)
            {
                err.InnerText = "متاسفانه خطایی رخ داده است! لطفا مجددا سعی نمایید.";
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

        //protected void btnDelVideo_Click(object sender, EventArgs e)
        //{
        //    suc.Visible = false;
        //    err.Visible = false;
        //    try
        //    {
        //        TblDoctor _TblDoctor = new TblDoctor(Convert.ToInt32(Request.QueryString["did"]));

        //        //var uri = new Uri(_TblDoctor.DVideo, UriKind.Absolute);
        //        //System.IO.File.Delete(uri.LocalPath);

        //        _TblDoctor.DVideo = "";
        //        _TblDoctor.Save();
        //        LbVideo.Text = "";
        //        LbVideo.PostBackUrl = "";
        //        suc.Visible = true;
        //    }
        //    catch (Exception)
        //    {
        //        err.Visible = true;
        //    }
        //}

        protected void BtnDelImg_Click(object sender, EventArgs e)
        {
            suc.Visible = false;
            err.Visible = false;
            try
            {
                TblDoctor _TblDoctor = new TblDoctor(Convert.ToInt32(Request.QueryString["did"]));

                //var uri = new Uri(_TblDoctor.DImg, UriKind.Absolute);
                //System.IO.File.Delete(uri.LocalPath);

                _TblDoctor.DImg = "";
                _TblDoctor.Save();
                Image1.ImageUrl = "";
                suc.Visible = true;
            }
            catch (Exception)
            {
                err.Visible = true;
            }
        }
    }
}