using System;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;

namespace hospital_management.Doctor_dashboard
{
    public partial class doctor_profile : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["DoctorID"] != null)
            {
                if(!IsPostBack)
                {
                    LoadDoctorProfile();
                }
            }
            else
            {
                Response.Redirect("~/pages/LoginPage.aspx");
            }
        }

        private void LoadDoctorProfile()
        {
            try
            {
                txtName.Text = Session["DoctorName"]?.ToString() ?? "";
                txtAge.Text = Session["DoctorAge"]?.ToString() ?? "";
                ddlGender.SelectedValue = Session["DoctorGender"]?.ToString() ?? "";
                txtAddress.Text = Session["DoctorAddress"]?.ToString() ?? "";
                txtEmail.Text = Session["DoctorEmail"]?.ToString() ?? "";
                txtContact.Text = Session["DoctorContact"]?.ToString() ?? "";
                txtSpecialization.Text = Session["DoctorSpecialization"]?.ToString() ?? "";
                txtExperience.Text = Session["DoctorExperience"]?.ToString() ?? "";
                txtLicense.Text = Session["DoctorLicense"]?.ToString() ?? "";
                txtFee.Text = Session["DoctorFee"]?.ToString() ?? "";

                imgProfile.ImageUrl = Session["DoctorProfilePicture"]?.ToString() ?? "~/Images/default.png";
            }
            catch(Exception ex)
            {
                lblMessage.Text = "⚠ Error loading profile: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                string doctorId = Session["DoctorID"].ToString();
                string name = txtName.Text.Trim();
                int age = int.Parse(txtAge.Text.Trim());
                string gender = ddlGender.SelectedValue; // Updated to use DropDownList
                string address = txtAddress.Text.Trim();
                string email = txtEmail.Text.Trim();
                string contact = txtContact.Text.Trim();
                string specialization = txtSpecialization.Text.Trim();
                int experience = int.Parse(txtExperience.Text.Trim());
                string license = txtLicense.Text.Trim();
                decimal fee = decimal.Parse(txtFee.Text.Trim());

                string profilePicture = imgProfile.ImageUrl;

                if(fileUpload.HasFile)
                {
                    string fileExtension = Path.GetExtension(fileUpload.FileName).ToLower();
                    string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".svg" };

                    if(Array.Exists(allowedExtensions, ext => ext == fileExtension))
                    {
                        string fileName = Path.GetFileName(fileUpload.PostedFile.FileName);
                        string filePath = Server.MapPath("~/Images/") + fileName;
                        fileUpload.SaveAs(filePath);
                        profilePicture = "~/Images/" + fileName;
                    }
                    else
                    {
                        lblMessage.Text = "❌ Only JPG, JPEG, PNG, and SVG files are allowed.";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        return;
                    }
                }

                bool success = UpdateDoctorProfile(doctorId, name, age, gender, address, email, contact, specialization, experience, license, fee, profilePicture);

                if(success)
                {
                    Session["DoctorName"] = name;
                    Session["DoctorAge"] = age.ToString();
                    Session["DoctorGender"] = gender;
                    Session["DoctorAddress"] = address;
                    Session["DoctorEmail"] = email;
                    Session["DoctorContact"] = contact;
                    Session["DoctorSpecialization"] = specialization;
                    Session["DoctorExperience"] = experience.ToString();
                    Session["DoctorLicense"] = license;
                    Session["DoctorFee"] = fee.ToString();
                    Session["DoctorProfilePicture"] = profilePicture;

                    imgProfile.ImageUrl = profilePicture;

                    lblMessage.Text = "✅ Profile updated successfully!";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblMessage.Text = "⚠ Update failed. Please try again.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch(Exception ex)
            {
                lblMessage.Text = "❌ Error updating profile: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        private bool UpdateDoctorProfile(string doctorId, string name, int age, string gender, string address, string email, string contact, string specialization, int experience, string license, decimal fee, string profilePicture)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            int rowsAffected = 0;

            using(SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"UPDATE tbl_Doctors 
                                 SET name = @Name, age = @Age, gender = @Gender, address = @Address, email = @Email, 
                                     contactNumber = @Contact, specialization = @Specialization, experienceYears = @Experience, 
                                     licenseNumber = @License, consultationFee = @Fee, profile = @Profile
                                 WHERE doctorID = @DoctorID";

                using(SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@DoctorID", doctorId);
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Age", age);
                    cmd.Parameters.AddWithValue("@Gender", gender);
                    cmd.Parameters.AddWithValue("@Address", address);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Contact", contact);
                    cmd.Parameters.AddWithValue("@Specialization", specialization);
                    cmd.Parameters.AddWithValue("@Experience", experience);
                    cmd.Parameters.AddWithValue("@License", license);
                    cmd.Parameters.AddWithValue("@Fee", fee);
                    cmd.Parameters.AddWithValue("@Profile", profilePicture);

                    con.Open();
                    rowsAffected = cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            return rowsAffected > 0;
        }
    }
}
