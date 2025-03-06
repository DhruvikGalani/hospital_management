using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
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
            if (!IsPostBack)
            {
                LoadPatients();
                LoadDoctors();
            }
        }

        private void LoadPatients()
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT patientID, name FROM tbl_Patients", conn); // Use 'name' instead of 'firstName' & 'lastName'
                SqlDataReader reader = cmd.ExecuteReader();
                ddlPatient.DataSource = reader;
                ddlPatient.DataTextField = "name";  // Use 'name'
                ddlPatient.DataValueField = "patientID";
                ddlPatient.DataBind();
            }
        }

        private void LoadDoctors()
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT doctorID, name FROM tbl_Doctors", conn); // Use 'name' instead of 'firstName' & 'lastName'
                SqlDataReader reader = cmd.ExecuteReader();
                ddlDoctor.DataSource = reader;
                ddlDoctor.DataTextField = "name";  // Use 'name'
                ddlDoctor.DataValueField = "doctorID";
                ddlDoctor.DataBind();
            }
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "INSERT INTO tbl_Appointments (patientID, doctorID, appointmentDateTime, reasonForVisit, clinicLocation, status) " +
                               "VALUES (@patientID, @doctorID, @appointmentDateTime, @reasonForVisit, @clinicLocation, @status)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@patientID", ddlPatient.SelectedValue);
                cmd.Parameters.AddWithValue("@doctorID", ddlDoctor.SelectedValue);
                cmd.Parameters.AddWithValue("@appointmentDateTime", txtDateTime.Text);
                cmd.Parameters.AddWithValue("@reasonForVisit", txtReason.Text);
                cmd.Parameters.AddWithValue("@clinicLocation", txtClinic.Text);
                cmd.Parameters.AddWithValue("@status", ddlStatus.SelectedValue);

                cmd.ExecuteNonQuery();
            }

            // Redirect to appointment list or show success message
            Response.Redirect("AppointmentList.aspx");
        }
    }
}

   