using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DalWebSite;
using website;
using System.Data;
using SubSonic;

namespace DoctorYab.panel
{
    public partial class appointments : System.Web.UI.Page
    {
        ClassControl cc = new ClassControl();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ListView1_ItemCommand(object source, ListViewCommandEventArgs e)
        {
            success.Text = "عملیات با موفقیت انجام شد.";
            success.Visible = false;
            error.Visible = false;
            try
            {
                if (e.CommandName == "Delete")
                {
                    int id = Convert.ToInt32(e.CommandArgument);

                    TblAppointment _tbl = new TblAppointment(id);
                    if (_tbl.AStatus == 1)
                        error.Text = "نوبت هایی که رزرو شده اند، حذف نمی شوند.";
                    else
                    {
                        CodingHorror horror = new CodingHorror();
                        string SQL = "delete from TblAppointment where id=" + id.ToString() + " and aDoctorId = " + Session["doctorId"].ToString();
                        horror.ExecuteScalar<string>(SQL);

                        ListView1.DataBind();
                        success.Visible = true;
                    }
                }
            }
            catch (Exception ex)
            {
                string err = ex.ToString();
                error.Text = "متاسفانه خطایی رخ داد. لطفا مجددا سعی نمایید";
                error.Visible = true;
            }
        }

    }
}