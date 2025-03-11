
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using hospital_management.Patient;
using System.Xml.Linq;

namespace hospital_management.Admin_Dashboard
{
    public partial class manage_patients : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadPatients();
            }
        }
        protected void btnAddPatient_Click(object sender, EventArgs e)
        {
            if(string.IsNullOrWhiteSpace(txtName.Text) || string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                Response.Write("<script>alert('Please Fill All Fields');</script>");
                return;
            }

            string profilePath = "~/userImage/default.png"; // Default profile image

            if(FileUploadProfile.HasFile)
            {
                string directoryPath = Server.MapPath("~/userImage/");
                if(!Directory.Exists(directoryPath))
                {
                    Directory.CreateDirectory(directoryPath);
                }

                string fileName = Guid.NewGuid().ToString() + Path.GetExtension(FileUploadProfile.FileName);
                profilePath = "~/userImage/" + fileName;

                FileUploadProfile.SaveAs(Server.MapPath(profilePath));
            }

            using(SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString))
            {
                string query = "INSERT INTO tbl_Patients (name, age, gender, dateOfBirth, contactNumber, email, password, address, emergencyContact, bloodGroup, allergies, runningMedicines, insurance, profile) " +
                               "VALUES (@Name, @Age, @Gender, @DOB, @Contact, @Email, @Password, @Address, @EmergencyContact, @BloodGroup, @Allergies, @RunningMedicines, @Insurance, @Profile)";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@Age", txtAge.Text.Trim());
                cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
                cmd.Parameters.AddWithValue("@DOB", txtDOB.Text.Trim());
                cmd.Parameters.AddWithValue("@Contact", txtContact.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@EmergencyContact", txtEmergencyContact.Text.Trim());
                cmd.Parameters.AddWithValue("@BloodGroup", ddlBloodGroup.SelectedValue);
                cmd.Parameters.AddWithValue("@Allergies", txtAllergies.Text.Trim());
                cmd.Parameters.AddWithValue("@RunningMedicines", txtRunningMedicines.Text.Trim());
                cmd.Parameters.AddWithValue("@Insurance", ddlInsurance.SelectedValue);
                cmd.Parameters.AddWithValue("@Profile", profilePath);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Patient Added Successfully');</script>");
                ClearFields();
                LoadPatients();
            }
        }
        protected void LoadPatients()
        {
            using(SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString))
            {
                string query = "SELECT patientID, name, age, gender, dateOfBirth, contactNumber, email, address, emergencyContact, bloodGroup, allergies, runningMedicines, insurance, profile FROM tbl_Patients";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvPatients.DataSource = dt;
                gvPatients.DataBind();
            }
        }

        protected void gvPatients_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvPatients.EditIndex = e.NewEditIndex;
            LoadPatients();
        }

        protected void gvPatients_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvPatients.EditIndex = -1;
            LoadPatients();
        }

        protected void gvPatients_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int patientID = Convert.ToInt32(gvPatients.DataKeys[e.RowIndex].Value);
            GridViewRow row = gvPatients.Rows[e.RowIndex];

            string name = ((TextBox)row.FindControl("txtNameEdit")).Text;
            string age = ((TextBox)row.FindControl("txtAgeEdit")).Text;
            string gender = ((DropDownList)row.FindControl("ddlGenderEdit")).SelectedValue;
            string dob = ((TextBox)row.FindControl("txtDOBEdit")).Text;
            string contact = ((TextBox)row.FindControl("txtContactEdit")).Text;
            string address = ((TextBox)row.FindControl("txtAddressEdit")).Text;
            string emergencyContact = ((TextBox)row.FindControl("txtEmergencyContactEdit")).Text;
            string bloodGroup = ((DropDownList)row.FindControl("ddlBloodGroupEdit")).SelectedValue;
            string allergies = ((TextBox)row.FindControl("txtAllergiesEdit")).Text;
            string runningMedicines = ((TextBox)row.FindControl("txtRunningMedicinesEdit")).Text;
            string insurance = ((DropDownList)row.FindControl("ddlInsuranceEdit")).SelectedValue;

            using(SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString))
            {
                string query = "UPDATE tbl_Patients SET name=@Name, age=@Age, gender=@Gender, dateOfBirth=@DOB, contactNumber=@Contact, address=@Address, emergencyContact=@EmergencyContact, bloodGroup=@BloodGroup, allergies=@Allergies, runningMedicines=@RunningMedicines, insurance=@Insurance WHERE patientID=@PatientID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Age", age);
                cmd.Parameters.AddWithValue("@Gender", gender);
                cmd.Parameters.AddWithValue("@DOB", dob);
                cmd.Parameters.AddWithValue("@Contact", contact);
                cmd.Parameters.AddWithValue("@Address", address);
                cmd.Parameters.AddWithValue("@EmergencyContact", emergencyContact);
                cmd.Parameters.AddWithValue("@BloodGroup", bloodGroup);
                cmd.Parameters.AddWithValue("@Allergies", allergies);
                cmd.Parameters.AddWithValue("@RunningMedicines", runningMedicines);
                cmd.Parameters.AddWithValue("@Insurance", insurance);
                cmd.Parameters.AddWithValue("@PatientID", patientID);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            gvPatients.EditIndex = -1;
            LoadPatients();
        }

        protected void gvPatients_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int patientID = Convert.ToInt32(gvPatients.DataKeys[e.RowIndex].Value);

            using(SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString))
            {
                string query = "DELETE FROM tbl_Patients WHERE patientID=@PatientID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@PatientID", patientID);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            Response.Write("<script>alert('Patient Deleted Successfully');</script>");
            LoadPatients();

        }
        private void ClearFields()
        {
            txtName.Text = "";
            txtAge.Text = "";
            txtDOB.Text = "";
            txtAddress.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            txtContact.Text = "";
            txtEmergencyContact.Text = "";
            txtAllergies.Text = "";
            txtRunningMedicines.Text = "";
            ddlGender.SelectedIndex = 0;
            ddlBloodGroup.SelectedIndex = 0;
            ddlInsurance.SelectedIndex = 0;
        }
    }
}
