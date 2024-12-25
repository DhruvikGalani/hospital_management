using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hospital_management.Patient
{
    public partial class Appointments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            lblDetails.Text = "";
            try
            {
                string Pnm = txtPatientname.Text;
                string Dnm = txtDoctorname.Text;
                string Dateandtime = txtDateandtime.Text;
                string Reasonforvisit = txtReason.Text;
                string location = ddlCliniclocation.SelectedValue;
                string status = rblStatus.SelectedValue;


                lblDetails.Text = "</br> Patient Name : " + Pnm +
                                  "</br> Doctor Name : " + Dnm +
                                  "</br> Appoitment Date&time : " + Dateandtime +
                                  "</br> Reason for visit : " + Reasonforvisit +
                                  "</br> Clinic Location : " + location +
                                  "</br> Appoitment Status : " + status;

            }
            catch (Exception saveError)
            {
                Response.Write(saveError.ToString());
                throw;
            }


        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtPatientname.Text="";
            txtDoctorname.Text = "";
            txtDateandtime.Text = "";
            txtReason.Text = "";
            ddlCliniclocation.ClearSelection();
            rblStatus.ClearSelection();
        }
    }
}