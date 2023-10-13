using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DalWebSite;
using SubSonic;
using website;


namespace _DoctorYab.Admin
{
    public partial class city : System.Web.UI.Page
    {
        ClassControl _ClassControl = new ClassControl();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack && Request.QueryString["sid"].ToString() != "")
            //{
            //    DrdFilter.SelectedValue = Request.QueryString["sid"].ToString();
            //}
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            suc.Visible = false;
            err.Visible = false;
            try
            {
                if (btnSave.Text == "ذخـــیره")
                {
                    TblCity _TblCity = new TblCity();
                    _TblCity.CName = TxtName.Text;
                    _TblCity.CArName = TxtAr.Text;
                    _TblCity.CEnName = TxtEn.Text;
                    _TblCity.CIsDeleted = false;
                    //_TblCity.CStateFk = int.Parse(DrdState.SelectedValue);
                    _TblCity.Save();

                    //StoredProcedure sp = SPs.InsertCity(TxtName.Text);
                    //sp.Execute();
                    GV.DataBind();
                    suc.Visible = true;

                }
                else
                {
                    TblCity _TblCity = new TblCity(Request.Cookies["Editid"].Value);
                    //StoredProcedure sp = SPs.UpdateCity(int.Parse(Request.Cookies["Editid"].Value),TxtName.Text);
                    //sp.Execute();
                    _TblCity.CName = TxtName.Text;
                    _TblCity.CArName = TxtAr.Text;
                    _TblCity.CEnName = TxtEn.Text;
                    //_TblCity.CStateFk = int.Parse(DrdState.SelectedValue);
                    _TblCity.Save();
                    GV.DataBind();
                    suc.Visible = true;
                    btnSave.Text = "ذخـــیره";

                }
                TxtName.Text = "";
            }
            catch (Exception)
            {
                err.Visible = true;
            }

        }

        protected void GV_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Cookies["Editid"].Value = GV.SelectedDataKey.Value.ToString();
            TblCity _TblCity = new TblCity(GV.SelectedDataKey.Value.ToString());
            // DrdState.SelectedValue = _TblCity.CStateFk.ToString();
            TxtName.Text = _TblCity.CName;
            TxtAr.Text = _TblCity.CArName;
            TxtEn.Text = _TblCity.CEnName;
            btnSave.Text = "ویرایش";
            suc.Visible = false;
            err.Visible = false;
        }

        //protected void GV_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    suc.Visible = false;
        //    err.Visible = false;
        //    _ClassControl.delRowGV(1, 2, e);
        //}

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
                    string SQL = "update TblCity set cIsDeleted = 1 where id=" + GV.DataKeys[item.RowIndex].Value.ToString();
                    horror.ExecuteScalar<string>(SQL);
                }
            }
            else
                foreach (GridViewRow item in GV.Rows)
                    if ((item.FindControl("chkDelete") as CheckBox).Checked)
                    {
                        CodingHorror horror = new CodingHorror();
                        string SQL = "update TblCity set cIsDeleted = 1 where id=" + GV.DataKeys[item.RowIndex].Value.ToString();
                        horror.ExecuteScalar<string>(SQL);
                    }
            GV.DataBind();
        }

    }
}