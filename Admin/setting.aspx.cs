using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DalWebSite;

namespace _DoctorYab.Admin
{
    public partial class setting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TblAbout _TblAbout = new TblAbout(1);
                RadioButtonList1.SelectedValue = _TblAbout.LastDoctorType.ToString();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            suc.Visible = false;
            err.Visible = false;
            try
            {
                TblAbout _TblAbout = new TblAbout(1);
                _TblAbout.LastDoctorType = byte.Parse(RadioButtonList1.SelectedValue);
                _TblAbout.Save();
                suc.Visible = true;
            }
            catch (Exception)
            {
                err.Visible = true;
            }
        }
    }
}