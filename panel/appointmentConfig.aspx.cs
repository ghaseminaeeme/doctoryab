using DalWebSite;
using SubSonic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoctorYab.panel
{
    public partial class appointmentConfig : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            success.Visible = false;
            error.Visible = false;
            try
            {
                DateTime today = DateTime.Now;
                int shift = int.Parse(DrdShift.SelectedValue);
                int day = int.Parse(drdDays.SelectedValue);
                int interval = Convert.ToInt32(TxtGap.Text.Trim());
                int count = int.Parse(TxtNum.Text);
                int doctorId = Convert.ToInt32(Session["doctorId"]);
                string startTimeStr = TxtTime.Text.Trim(); // format: "HH:mm"

                TimeSpan newStart = TimeSpan.Parse(startTimeStr);
                TimeSpan newEnd = newStart.Add(TimeSpan.FromMinutes(interval * count));

                // Get existing configs for this doctor
                var existingConfigs = new Select()
                    .From(AppointmentConfig.Schema)
                    .Where(AppointmentConfig.Columns.DoctorId).IsEqualTo(doctorId)
                    .And(AppointmentConfig.Columns.Day).IsEqualTo(day)
                    .ExecuteTypedList<AppointmentConfig>();

                // 1. Check if doctor already has a config for this shift
                bool hasSameShift = existingConfigs.Any(c => c.Shift == shift);
                if (hasSameShift)
                {
                    error.Text = "برای این شیفت قبلاً زمان‌بندی ثبت شده است.";
                    error.Visible = true;
                    return;
                }

                // 2. Check for time conflicts
                bool hasTimeConflict = existingConfigs.Any(config =>
                {
                    try
                    {
                        if (string.IsNullOrWhiteSpace(config.StartTime))
                            return false;

                        TimeSpan existingStart = TimeSpan.Parse(config.StartTime);
                        TimeSpan existingEnd = existingStart.Add(TimeSpan.FromMinutes((double)(config.Gap * config.Number)));

                        return (newStart < existingEnd && newEnd > existingStart);
                    }
                    catch (Exception ex)
                    {
                        // Log config or ex.Message here for debugging
                        return false;
                    }
                });

                if (hasTimeConflict)
                {
                    error.Text = "بازه زمانی وارد شده با یکی از شیفت‌های قبلی تداخل دارد.";
                    error.Visible = true;
                    return;
                }

                // ✅ No conflict, save the new configuration
                AppointmentConfig newConfig = new AppointmentConfig();
                newConfig.Active = byte.Parse(DrdState.SelectedValue);
                newConfig.SaveDate = today;
                newConfig.Day = day;
                newConfig.DoctorId = doctorId;
                newConfig.Number = count;
                newConfig.Shift = shift;
                newConfig.StartTime = startTimeStr;
                newConfig.Time = interval;
                newConfig.Gap = int.Parse(TxtGap.Text);
                newConfig.Save();
                GV.DataBind();

                success.Visible = true;
                error.Visible = false;


                DrdShift.ClearSelection();
                DrdState.ClearSelection();
                drdDays.ClearSelection();
                TxtGap.Text = "";
                TxtTime.Text = "";
                TxtNum.Text = "";
            }
            catch (Exception ex)
            {               
                error.Visible = true;
            }

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
                    string SQL = "delete from AppointmentConfig where id=" + GV.DataKeys[item.RowIndex].Value.ToString();
                    horror.ExecuteScalar<string>(SQL);
                }
            }
            else
                foreach (GridViewRow item in GV.Rows)
                    if ((item.FindControl("chkDelete") as CheckBox).Checked)
                    {
                        CodingHorror horror = new CodingHorror();
                        string SQL = "delete from AppointmentConfig where id=" + GV.DataKeys[item.RowIndex].Value.ToString();
                        horror.ExecuteScalar<string>(SQL);
                    }
            GV.DataBind();
        }

    }
}