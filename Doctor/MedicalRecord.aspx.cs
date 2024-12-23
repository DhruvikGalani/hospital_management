using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hospital_management.Doctor
{
    public partial class MedicalRecord : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            lblDetails.Text = "";
            try
            {
                string pname = txtPatientName.Text;
                string bloodgroup = rblBlood.SelectedValue;
                string dname = txtDoctorName.Text;
                string visitDate = txtVisitDate.Text;
                string Diagnosis = txtDiagnosis.Text;
                string PrescribedMedications = txtPrescribedMedications.Text;
                string TreatmentNotes = txtTreatmentNote.Text;
                string TreatmentStatus = ddlTreatmentStatus.SelectedValue;

                lblDetails.Text = "</br> Patient Name : " + pname +
                    "</br> Blood Group" + bloodgroup +
                    "</br> Doctor Name : " + dname +
                    "</br> visit Date : " + visitDate +
                    "</br> Diagnosis : " + Diagnosis +
                    "</br> PrescribedMedications" + PrescribedMedications +
                    "</br> TreatmentNotes : " + TreatmentNotes +
                    "</br> TreatmentStatus : " + TreatmentStatus;
            }
            catch (Exception SavaError)
            {
                Response.Write(SavaError.ToString());
                throw;
            }
        }

        protected void btnreset_Click(object sender, EventArgs e)
        {
            txtPatientName.Text = "";
            rblBlood.ClearSelection();
            txtDoctorName.Text = "";
            txtVisitDate.Text = "";
            txtDiagnosis.Text = "";
            txtPrescribedMedications.Text = "";
            txtTreatmentNote.Text = "";
            ddlTreatmentStatus.ClearSelection();
            lblDetails.Text = "";
        }
    }
}