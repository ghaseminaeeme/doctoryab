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
using System.Globalization;


namespace _DoctorYab.Admin
{
    public partial class addDoctor : System.Web.UI.Page
    {
        ClassControl _ClassControl = new ClassControl();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            suc.Visible = false;
            err.Visible = false;
            int Id = _ClassControl.New("TblDoctors");
            try
            {
                TblDoctor checkUser = new TblDoctor(TblDoctor.Columns.DUsername, TxtUser.Text);
                if (!checkUser.IsLoaded)
                {
                    TblDoctor _TblDoctor = new TblDoctor();
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
                    _TblDoctor.DIsDeleted = false;
                    _TblDoctor.DSaveDate = DateTime.Today;
                    _TblDoctor.DStatus = Byte.Parse(DrdStatus.SelectedValue);
                    _TblDoctor.DWebsite = TxtWeb.Text;
                    _TblDoctor.DNote = TxtNote.Text;
                    _TblDoctor.DMobile = TxtMobile.Text;
                    _TblDoctor.DSpecialty = TxtSpe.Text;
                    _TblDoctor.DLong = TxtLong.Text;
                    _TblDoctor.DLat = TxtLat.Text;
                    _TblDoctor.DWorkTime = TxtTime.Text;
                    _TblDoctor.DUsername = TxtUser.Text;
                    _TblDoctor.DPassword = ClassControl.encryptString(TxtPass.Text);
                    _TblDoctor.DEndDate = _ClassControl.convertPersianDateToGregorian(TxtDate.Text);
                    _TblDoctor.DVideo = TxtVideo.Text;
                    _TblDoctor.DWhatsapp = TxtWts.Text;

                    _TblDoctor.DEnAddress = TxtEnAdrs.Text;
                    _TblDoctor.DEnDes = TxtEnDes.Text;
                    _TblDoctor.DEnName = TxtEnName.Text;
                    _TblDoctor.DEnSpecialty = TxtEnSpe.Text;
                    _TblDoctor.DEnWorkTime = TxtEnTime.Text;

                    _TblDoctor.DArAddress = TxtArAdrs.Text;
                    _TblDoctor.DArDes = TxtArDes.Text;
                    _TblDoctor.DArName = TxtArName.Text;
                    _TblDoctor.DArSpecialty = TxtArSpe.Text;
                    _TblDoctor.DArWorkTime = TxtArTime.Text;

                    if (CheckBox1.Checked == true)
                        _TblDoctor.DSpecialAd = true;
                    else
                        _TblDoctor.DSpecialAd = false;

                    if (Fu1.FileName != "")
                    {
                        _TblDoctor.DImg = UploadFiles("540", "600", "../Upload/doctors/" + Id.ToString() + ".jpg", 0);
                    }
                    //if (FileUpload1.FileName != "")
                    //{
                    //    string filename = FileUpload1.FileName;
                    //    string ext = Path.GetExtension(FileUpload1.PostedFile.FileName);
                    //    FileUpload1.SaveAs(Server.MapPath("../upload/video/DrV-" + Id + ext));
                    //    _TblDoctor.DVideo = ("/upload/video/DrV-" + Id + ext);  // http://doctoryab-iran.com/
                    //}
                    _TblDoctor.Save();
                    suc.Visible = true;

                    TxtAdrs.Text = "";
                    TxtTlg.Text = "";
                    TxtTel.Text = "";
                    TxtName.Text = "";
                    TxtKey.Text = "";
                    TxtMobile.Text = "";
                    TxtNote.Text = "";
                    TxtWeb.Text = "";
                    TxtDate.Text = "";
                    TxtIns.Text = "";
                    TxtAparat.Text = "";
                    TxtEmail.Text = "";
                    TxtDes.Text = "";
                    TxtSpe.Text = "";
                    TxtLat.Text = "";
                    TxtLong.Text = "";
                    TxtPass.Text = "";
                    TxtTime.Text = "";
                    TxtUser.Text = "";
                    TxtArAdrs.Text = "";
                    TxtArDes.Text = "";
                    TxtArSpe.Text = "";
                    TxtArTime.Text = "";
                    TxtEnTime.Text = "";
                    TxtEnSpe.Text = "";
                    TxtEnName.Text = "";
                    TxtEnDes.Text = "";
                    TxtEnAdrs.Text = "";
                    TxtWts.Text = "";
                    CheckBox1.Checked = false;
                    DrdGrp.ClearSelection();
                    DrdStatus.ClearSelection();
                    DrdCity.ClearSelection();
                }
                else
                {
                    err.InnerText = "نام کاربری تکراری است";
                    err.Visible = true;
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


    }
}