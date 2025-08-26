using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using website;

namespace DoctorYab
{
    public partial class test : System.Web.UI.Page
    {
        ClassControl _ClassControl = new ClassControl();
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "SelectDay")
            {
                string rand = _ClassControl.RandomNumber(6).ToString();
                Label lblName = (Label)e.Item.FindControl("Label1");
                lblName.Text = rand;

            }
        }
    }
}