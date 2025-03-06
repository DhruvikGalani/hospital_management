using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hospital_management.pages
{
    public partial class RegisterPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            byte[] profilePic = null;

            if (fuProfile.HasFile)
            {
                using (BinaryReader br = new BinaryReader(fuProfile.PostedFile.InputStream))
                {
                    profilePic = br.ReadBytes(fuProfile.PostedFile.ContentLength);
                }
            }

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "INSERT INTO tbl_Patients (name, age, gender, dateOfBirth, contactNumber, email, password, address, emergencyContact, bloodGroup, allergies, runningMedicines, insurance, profile) " +
                               "VALUES (@name, @age, @gender, @dob, @contact, @email, @password, @address, @emergency, @blood, @allergies, @medicines, @insurance, @profile)";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@name", txtName.Text);
                cmd.Parameters.AddWithValue("@age", int.Parse(txtAge.Text));
                cmd.Parameters.AddWithValue("@gender", ddlGender.SelectedValue);
                cmd.Parameters.AddWithValue("@dob", txtDOB.Text);
                cmd.Parameters.AddWithValue("@contact", txtContact.Text);
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@password", txtPassword.Text);
                cmd.Parameters.AddWithValue("@address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@emergency", txtEmergencyContact.Text);
                cmd.Parameters.AddWithValue("@blood", ddlBloodGroup.SelectedValue);
                cmd.Parameters.AddWithValue("@allergies", txtAllergies.Text);
                cmd.Parameters.AddWithValue("@medicines", txtMedicines.Text);
                cmd.Parameters.AddWithValue("@insurance", ddlInsurance.SelectedValue);
                cmd.Parameters.AddWithValue("@profile", profilePic);

                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}