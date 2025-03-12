using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace hospital_management
{
    public partial class AddAppointment : Page
    {
       
           protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Response.Write("<script>console.log('UserID Session: " + Session["UserID"] + "');</script>");
                Response.Write("<script>console.log('UserType Session: " + Session["UserType"] + "');</script>");
                LoadDoctors();
            }
        }

       

        private void LoadDoctors()
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            using(SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT doctorID, name FROM tbl_Doctors", con);
                SqlDataReader reader = cmd.ExecuteReader();

                ddlDoctor.DataSource = reader;
                ddlDoctor.DataTextField = "name";  // Using 'name' column for display
                ddlDoctor.DataValueField = "doctorID";
                ddlDoctor.DataBind();
                ddlDoctor.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Select Doctor", ""));
            }
        }

        protected void btnBookAppointment_Click(object sender, EventArgs e)
        {
            // Check if patient is logged in
            if(Session["UserID"] == null || Session["UserType"] == null || Session["UserType"].ToString() != "Patient")
            {
                lblMessage.Text = "You must be logged in as a Patient to book an appointment.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Ensure a doctor is selected
            if(ddlDoctor.SelectedValue == "")
            {
                lblMessage.Text = "Please select a doctor.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Validate and Parse Date
            DateTime appointmentDate;
            if(!DateTime.TryParse(txtAppointmentDateTime.Text, out appointmentDate))
            {
                lblMessage.Text = "Invalid date format. Please enter a valid date.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            using(SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();

                string query = @"
                    INSERT INTO tbl_Appointments 
                    (patientID, doctorID, appointmentDateTime, reasonForVisit, clinicLocation, status) 
                    VALUES (@patientID, @doctorID, @appointmentDateTime, @reasonForVisit, @clinicLocation, 'Pending')";

                using(SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@patientID", Session["UserID"]);  // Fetch from session
                    cmd.Parameters.AddWithValue("@doctorID", ddlDoctor.SelectedValue);
                    cmd.Parameters.AddWithValue("@appointmentDateTime", appointmentDate);
                    cmd.Parameters.AddWithValue("@reasonForVisit", txtReasonForVisit.Text);
                    cmd.Parameters.AddWithValue("@clinicLocation", txtClinicLocation.Text);

                    int result = cmd.ExecuteNonQuery();
                    if(result > 0)
                    {
                        lblMessage.Text = "Appointment booked successfully!";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        Response.Redirect("~/homePage.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "Error booking appointment.";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }
    }
}
