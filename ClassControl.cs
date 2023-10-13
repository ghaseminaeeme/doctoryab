using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using System.Drawing;
using System.IO;
using SubSonic;
using System.Configuration;
using System.Web.UI;
using ImageResizer.Configuration;
using ImageResizer;
using System.Text.RegularExpressions;
using System.Globalization;

namespace website
{
    public class ClassControl : System.Web.UI.Page
    {
        public static String OK = "OK";
        public static String ERROR = "ERROR";

        public static string DelHtmlTag(string str)
        {
            const string HTML_TAG_PATTERN = "<.*?>";
            return Regex.Replace(str, HTML_TAG_PATTERN, string.Empty);
        }
        public void EmptyControl(string form)
        {
            Control myForm = Page.FindControl(form);
            foreach (Control ctrl in myForm.Controls)
            {
                //Clears TextBox
                if (ctrl is System.Web.UI.WebControls.TextBox)
                {
                    (ctrl as TextBox).Text = "";
                }
                //Clears DropDown Selection
                if (ctrl is System.Web.UI.WebControls.DropDownList)
                {
                    (ctrl as DropDownList).ClearSelection();
                }
                //Clears ListBox Selection
                if (ctrl is System.Web.UI.WebControls.ListBox)
                {
                    (ctrl as ListBox).ClearSelection();
                }
                //Clears CheckBox Selection
                if (ctrl is System.Web.UI.WebControls.CheckBox)
                {
                    (ctrl as CheckBox).Checked = false;
                }
                //Clears RadioButton Selection
                if (ctrl is System.Web.UI.WebControls.RadioButtonList)
                {
                    (ctrl as RadioButtonList).ClearSelection();
                }
                //Clears CheckBox Selection
                if (ctrl is System.Web.UI.WebControls.CheckBoxList)
                {
                    (ctrl as CheckBoxList).ClearSelection();
                }
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

        public string RandomNumber(int size)
        {
            StringBuilder builder = new StringBuilder();
            Random random = new Random();
            char ch;
            for (int i = 0; i < size; i++)
            {
                ch = char.Parse(random.Next(0, 9).ToString());
                builder.Append(ch);
            }

            return builder.ToString();
        }
        
        public string _Encoding(string toecrypt)
        {
            byte[] inputBuffer = Encoding.UTF8.GetBytes(toecrypt);
            byte[] buffer = new MD5CryptoServiceProvider().ComputeHash(Encoding.UTF8.GetBytes("Spad key."));
            using (TripleDESCryptoServiceProvider provider2 = new TripleDESCryptoServiceProvider())
            {
                provider2.Key = buffer;
                provider2.Mode = CipherMode.ECB;
                provider2.Padding = PaddingMode.PKCS7;
                byte[] bytes = provider2.CreateEncryptor().TransformFinalBlock(inputBuffer, 0, inputBuffer.Length);
                return Convert.ToBase64String(bytes);
            }
        }

        public string _Decoding(string toDecrypt)
        {
            byte[] inputBuffer = Convert.FromBase64String(toDecrypt);
            byte[] buffer = new MD5CryptoServiceProvider().ComputeHash(Encoding.UTF8.GetBytes("Spad key."));
            using (TripleDESCryptoServiceProvider provider2 = new TripleDESCryptoServiceProvider())
            {
                provider2.Key = buffer;
                provider2.Mode = CipherMode.ECB;
                provider2.Padding = PaddingMode.PKCS7;
                byte[] bytes = provider2.CreateDecryptor().TransformFinalBlock(inputBuffer, 0, inputBuffer.Length);
                return Encoding.UTF8.GetString(bytes);
            }

        }

        static public string encryptString(string Password)
        {

            UTF8Encoding ue = new UTF8Encoding();
            byte[] bytes = ue.GetBytes(Password);

            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            byte[] hashBytes = md5.ComputeHash(bytes);

            // Bytes to string
            return BitConverter.ToString(hashBytes);
        }

        public static void tumbanil(string ImageFullurl, string DesTumburl, Int16 with, Int16 height)
        {
            System.Drawing.Image pic = System.Drawing.Image.FromFile(@ImageFullurl);

            System.Drawing.Image tumb = pic.GetThumbnailImage(with, height, null, IntPtr.Zero);
            tumb.Save(@DesTumburl);
        }
        //تقویم فارسی
        public string PersianDate(string test)
        {
            System.Globalization.PersianCalendar oPersianC = new System.Globalization.PersianCalendar();
            string DayWeek, Day, Month, Year, Date = "";

            if (string.IsNullOrEmpty(test))
            {
                Year = oPersianC.GetYear(System.DateTime.Now).ToString();
                Month = oPersianC.GetMonth(System.DateTime.Now).ToString();
                Day = oPersianC.GetDayOfMonth(System.DateTime.Now).ToString();
                DayWeek = oPersianC.GetDayOfWeek(System.DateTime.Now).ToString();
                switch (DayWeek)
                {
                    case "Saturday": DayWeek = "شنبه";
                        break;
                    case "Sunday": DayWeek = "یکشنبه";
                        break;
                    case "Monday": DayWeek = "دوشنبه";
                        break;
                    case "Tuesday": DayWeek = "سه شنبه";
                        break;
                    case "Wednesday": DayWeek = "چهارشنبه";
                        break;
                    case "Thursday": DayWeek = "پنج شنبه";
                        break;
                    case "Friday": DayWeek = "جمعه";
                        break;
                }
                switch (Month)
                {
                    case "1": Month = "فروردین";
                        break;
                    case "2": Month = "اردیبهشت";
                        break;
                    case "3": Month = "خرداد";
                        break;
                    case "4": Month = "تیر";
                        break;
                    case "5": Month = "مرداد";
                        break;
                    case "6": Month = "شهریور";
                        break;
                    case "7": Month = "مهر";
                        break;
                    case "8": Month = "آبان";
                        break;
                    case "9": Month = "آذر";
                        break;
                    case "10": Month = "دی";
                        break;
                    case "11": Month = "بهمن";
                        break;
                    case "12": Month = "اسفند";
                        break;
                    default:
                        break;
                }
                Date = DayWeek + " " + Day + " " + Month + " " + Year;
            }
            else
            {
            }
            return Date;
        }

        public string PersianDate_10(string test)
        {
            System.Globalization.PersianCalendar oPersianC = new System.Globalization.PersianCalendar();
            string Day, Month, Year, Date = "";

            if (string.IsNullOrEmpty(test))
            {
                Year = oPersianC.GetYear(System.DateTime.Now).ToString();
                Month = oPersianC.GetMonth(System.DateTime.Now).ToString();
                Day = oPersianC.GetDayOfMonth(System.DateTime.Now).ToString();
                Date = Year + "/" + Month + "/" + Day;
            }
            else
            {
            }
            return Date;
        }

        public string PersianDate_10(byte AddYear,byte AddMonth,byte AddDay )
        {
            System.Globalization.PersianCalendar oPersianC = new System.Globalization.PersianCalendar();
            string Day, Month, Year, Date = "";

            if (string.IsNullOrEmpty(""))
            {
                string Month0 = oPersianC.GetMonth(System.DateTime.Now).ToString();
                string Day0 = oPersianC.GetDayOfMonth(System.DateTime.Now).ToString();
                
                Year = oPersianC.GetYear(System.DateTime.Now.AddYears(AddYear)).ToString();
                Month = oPersianC.GetMonth(System.DateTime.Now.AddMonths(AddMonth)).ToString();
                Day = oPersianC.GetDayOfMonth(System.DateTime.Now.AddDays(AddDay)).ToString();
                if (byte.Parse(Day)<byte.Parse(Day0) )
                {
                    Month = (byte.Parse(Month) + 1).ToString();
                }
                if (byte.Parse(Month) < byte.Parse(Month0))
                {
                    Year = (byte.Parse(Year) + 1).ToString();
                }
                Date = Year + "/" + Month + "/" + Day;
            }
            else
            {
            }
            return Date;
        }
        public string PersianDate_AddDate(int AddYear, int AddMonth, int AddDay)
        {
            System.Globalization.PersianCalendar oPersianC = new System.Globalization.PersianCalendar();
            string Day, Month, Year, Date = "";

            if (string.IsNullOrEmpty(""))
            {
                string Month0 = oPersianC.GetMonth(System.DateTime.Now).ToString();
                string Day0 = oPersianC.GetDayOfMonth(System.DateTime.Now).ToString();

                Year = oPersianC.GetYear(System.DateTime.Now.AddYears(AddYear)).ToString();
                Month = oPersianC.GetMonth(System.DateTime.Now.AddMonths(AddMonth)).ToString();
                Day = oPersianC.GetDayOfMonth(System.DateTime.Now.AddDays(AddDay)).ToString();
                if (int.Parse(Day) < int.Parse(Day0))
                {
                    Month = (int.Parse(Month) + 1).ToString();
                }
                if (int.Parse(Month) < int.Parse(Month0))
                {
                    Year = (int.Parse(Year) + 1).ToString();
                }
                Date = Year + "/" + Month + "/" + Day;
            }
            else
            {
            }
            return Date;
        }

        public string PersianDate3(string test)
        {
            System.Globalization.PersianCalendar oPersianC = new System.Globalization.PersianCalendar();
            string Day, Month, Date = "";

            if (string.IsNullOrEmpty(test))
            {
                Month = oPersianC.GetMonth(System.DateTime.Now).ToString();
                Day = oPersianC.GetDayOfMonth(System.DateTime.Now).ToString();

                switch (Day)
                {
                    case "1": Day = "01";
                        break;
                    case "2": Day = "02";
                        break;
                    case "3": Day = "03";
                        break;
                    case "4": Day = "04";
                        break;
                    case "5": Day = "05";
                        break;
                    case "6": Day = "06";
                        break;
                    case "7": Day = "07";
                        break;
                    case "8": Day = "08";
                        break;
                    case "9": Day = "09";
                        break;
                    default:
                        break;
                }
                switch (Month)
                {
                    case "1": Month = "01";
                        break;
                    case "2": Month = "02";
                        break;
                    case "3": Month = "03";
                        break;
                    case "4": Month = "04";
                        break;
                    case "5": Month = "05";
                        break;
                    case "6": Month = "06";
                        break;
                    case "7": Month = "07";
                        break;
                    case "8": Month = "08";
                        break;
                    case "9": Month = "09";
                        break;
                    default:
                        break;
                }

                Date = "InThisDay.aspx?day=" + Day + "&mah=" + Month;
            }
            else
            {
            }
            return Date;
        }

        public string PersianDateFull(string test)
        {
            System.Globalization.PersianCalendar oPersianC = new System.Globalization.PersianCalendar();
            string Day, Month,Year, Date = "";

            if (string.IsNullOrEmpty(test))
            {
                Month = oPersianC.GetMonth(System.DateTime.Now).ToString();
                Day = oPersianC.GetDayOfMonth(System.DateTime.Now).ToString();
                Year = oPersianC.GetYear(System.DateTime.Now).ToString();
                switch (Day)
                {
                    case "1": Day = "01";
                        break;
                    case "2": Day = "02";
                        break;
                    case "3": Day = "03";
                        break;
                    case "4": Day = "04";
                        break;
                    case "5": Day = "05";
                        break;
                    case "6": Day = "06";
                        break;
                    case "7": Day = "07";
                        break;
                    case "8": Day = "08";
                        break;
                    case "9": Day = "09";
                        break;
                    default:
                        break;
                }
                switch (Month)
                {
                    case "1": Month = "01";
                        break;
                    case "2": Month = "02";
                        break;
                    case "3": Month = "03";
                        break;
                    case "4": Month = "04";
                        break;
                    case "5": Month = "05";
                        break;
                    case "6": Month = "06";
                        break;
                    case "7": Month = "07";
                        break;
                    case "8": Month = "08";
                        break;
                    case "9": Month = "09";
                        break;
                    default:
                        break;
                }

                Date =Year + "/" +  Month +  "/" + Day;
            }
            else
            {
            }
            return Date;
        }

        static public Boolean checkChar(string txt)
        {

            if (txt.Contains("%")
                || txt.Contains("'")
                || txt.Contains("script")
                || txt.Contains("Script")
                )
            {
                return false;
            }
            return true;
        }

        public Int16 New(string tbl)
        {
            Int16 x;
            CodingHorror horror = new CodingHorror();
            string SQL = "SELECT IDENT_CURRENT(@" + tbl + ")";
            x = horror.ExecuteScalar<Int16>(SQL, tbl);
            return ++x;
        }

        public string UploadFile(ref FileUpload Fu, string SavePath,string filename, string UrlDefult)
        {
            if (Fu.PostedFile.ContentLength != 0)
            {  
                HttpPostedFile Pic = Fu.PostedFile;
                byte[] data = new Byte[Pic.ContentLength];
                string[] type = Fu.FileName.Split('.');
                Pic.InputStream.Read(data, 0, Pic.ContentLength);
                FileStream newPic = new FileStream(Server.MapPath(@SavePath +"/"+ filename+"." + type[1]), FileMode.Create);
                newPic.Write(data, 0, Pic.ContentLength);
                newPic.Close();
                return SavePath + "/" + filename + "." + type[1];
            }
            else
            {
                return UrlDefult;
            }
        }

        public string TxtMultiLine(string txt)
        {
            if (txt=="")
            {
                return "";
            }
            string[] lst = txt.Split(new Char[] { '\n', '\r' }, StringSplitOptions.RemoveEmptyEntries);
            string txt2 = "";
            for (int i = 0; i < lst.Length; i++)
            {
                txt2 += lst[i] + "</br>";
            }
            return txt2.Remove(txt2.Length - 5, 5);
        }

        public void delRowGV(byte IdSub, byte CellDel, GridViewRowEventArgs e)
        {

            if (e.Row.RowState != DataControlRowState.Edit) // check for RowState
            {
                if (e.Row.RowType == DataControlRowType.DataRow) //check for RowType
                {
                    string id = e.Row.Cells[IdSub].Text; // Get the id to be deleted
                    LinkButton lb = (LinkButton)e.Row.Cells[CellDel].Controls[0]; //cast the ShowDeleteButton link to linkbutton
                    if (lb != null)
                    {

                        lb.Attributes.Add("onclick", "return ConfirmOnDelete('" + id + "');"); //attach the JavaScript function with the ID as the paramter
                    }
                   
                }
            }
            
            

        }

        public string RandomString(int size, bool lowerCase)
        {
            StringBuilder builder = new StringBuilder();
            Random random = new Random();
            char ch;

            for (int i = 1; i < size + 1; i++)
            {
                ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));
                builder.Append(ch);
            }

            if (lowerCase)
                return builder.ToString().ToLower();
            else
                return builder.ToString();
        }


        //public void downloadFile(string url)
        //{
        //    Response.Clear(); 

        //    Response.ContentType = "application/x-png";

        //    Response.AppendHeader("Content-Disposition", "attachment; filename=file.png");

        //    Response.TransmitFile(url);

        //    Response.End();
        //}

        public DateTime convertPersianDateToGregorian (string dateVal)
        {
            string date2 = Regex.Replace(dateVal, "[۰-۹]", x => ((char)(x.Value[0] - '۰' + '0')).ToString());
            DateTime dt = DateTime.ParseExact(dateVal, "yyyy/M/d", System.Globalization.CultureInfo.InvariantCulture);
            PersianCalendar pc = new PersianCalendar();
            DateTime dt2 = pc.ToDateTime(dt.Year, dt.Month, dt.Day, dt.Hour, dt.Minute, dt.Second, dt.Millisecond);
            return dt2;
        }

        public string convertGregorianDateToPersian (string dateVal)
        {
            string GregorianDate = dateVal;
            DateTime d = DateTime.Parse(GregorianDate);
            PersianCalendar pc = new PersianCalendar();
            return (string.Format("{0}/{1}/{2}", pc.GetYear(d), pc.GetMonth(d), pc.GetDayOfMonth(d)));
        }
    }
}
