using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using website;
using DalWebSite;
using SubSonic;

namespace _DoctorYab.Admin
{
    public partial class mssages : System.Web.UI.Page
    {
        ClassControl _ClassControl = new ClassControl();
        protected void Page_Load(object sender, EventArgs e)
        {
            foreach (GridViewRow item in GV.Rows)
            {
                if (Boolean.Parse(GV.DataKeys[item.RowIndex][1].ToString()) == false)
                {
                    item.Style.Add(HtmlTextWriterStyle.FontWeight, "Bold");
                }
            }
        }

        protected void GV_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Cookies["Editid"].Value = GV.SelectedDataKey.Value.ToString();
            TblMessage _TblMessage = new TblMessage(GV.SelectedDataKey.Value.ToString());
            lbDate.Text = _TblMessage.MSaveDate;
            lbDes.Text = _TblMessage.MDes;
            lbName.Text = _TblMessage.MName;
            lbTel.Text = _TblMessage.MTel;
            _TblMessage.MStatus = true;
            _TblMessage.Save();
            GV.DataBind();
            Panel1.Visible = true;
            suc.Visible = false;
            err.Visible = false;
        }

        private void GridViewRowBold()
        {
            foreach (GridViewRow item in GV.Rows)
            {
                if (Boolean.Parse(GV.DataKeys[item.RowIndex][1].ToString()) == false)
                {
                    item.Style.Add(HtmlTextWriterStyle.FontWeight, "Bold");
                }
            }
        }

        protected void GV_DataBound(object sender, EventArgs e)
        {
            GridViewRowBold();
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
                    string SQL = "delete from TblMessage where id=" + GV.DataKeys[item.RowIndex].Value.ToString();
                    horror.ExecuteScalar<string>(SQL);
                }
            }
            else
                foreach (GridViewRow item in GV.Rows)
                    if ((item.FindControl("chkDelete") as CheckBox).Checked)
                    {
                        CodingHorror horror = new CodingHorror();
                        string SQL = "delete from TblMessage where id=" + GV.DataKeys[item.RowIndex].Value.ToString();
                        horror.ExecuteScalar<string>(SQL);
                    }
            GV.DataBind();
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
        }
    }
}