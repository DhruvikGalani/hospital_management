using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace hospital_management.Doctor
{
    public partial class DoctorDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);

            if (!Page.IsPostBack)
            {

            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Password match validation
            if (txtPassword.Text != txtcPassword.Text)
            {
                lblError.Text = "Passwords do not match!";
                return;
            }

            string connectionString = WebConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"INSERT INTO tbl_Doctors 
                (name, age, gender, address, password, specialization, experienceYears, contactNumber, email, licenseNumber, consultationFee, profile) 
                VALUES (@name, @age, @gender, @address, @password, @specialization, @experienceYears, @contactNumber, @email, @licenseNumber, @consultationFee, @profile)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@name", txtName.Text.Trim());
                    cmd.Parameters.AddWithValue("@age", txtAge.Text.Trim());
                    cmd.Parameters.AddWithValue("@gender", ddlGender.SelectedValue);
                    cmd.Parameters.AddWithValue("@address", txtAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim());
                    cmd.Parameters.AddWithValue("@specialization", ddlSpecialization.SelectedValue);
                    cmd.Parameters.AddWithValue("@experienceYears", txtExperience.Text.Trim());
                    cmd.Parameters.AddWithValue("@contactNumber", txtContact.Text.Trim());
                    cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@licenseNumber", txtLicense.Text.Trim());
                    cmd.Parameters.AddWithValue("@consultationFee", txtFee.Text.Trim());

                    // Handle profile image upload
                    byte[] profileImage = fileProfile.HasFile ? fileProfile.FileBytes : new byte[0];
                    cmd.Parameters.AddWithValue("@profile", profileImage);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    lblError.Text = "Doctor registered successfully!";

                    Response.Redirect("Doctorhomepage.aspx");
                }
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            // Clear all input fields
            txtName.Text = "";
            txtAge.Text = "";
            ddlGender.SelectedIndex = 0;
            txtAddress.Text = "";
            txtPassword.Text = "";
            txtcPassword.Text = "";
            ddlSpecialization.SelectedIndex = 0;
            txtExperience.Text = "";
            txtContact.Text = "";
            txtEmail.Text = "";
            txtLicense.Text = "";
            txtFee.Text = "";
            lblError.Text = "";
        }
    }
}