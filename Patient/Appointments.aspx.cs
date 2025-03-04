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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Store the input values
            string patientName = txtPatientName.Text;
            string phoneNumber = txtPhoneNumber.Text;
            string email = txtEmail.Text;
            string symptoms = txtSymptoms.Text;
            string appointmentDate = txtDate.Text;
            string department = ddlDepartment.SelectedValue;
            string gender = ddlGender.SelectedValue;
            string appointmentTime = txtTime.Text;

            // You can save these values to a database or send them via email
            string confirmationMessage = $"Appointment booked for {patientName} on {appointmentDate} at {appointmentTime} in {department} department.";

            // Display confirmation (for now, just showing it on the page)
            Response.Write("<script>alert('" + confirmationMessage + "');</script>");
        }
    }
}