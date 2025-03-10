using System;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;

namespace hospital_management.Nurse_dashboard
{
    public partial class profile : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["NurseID"] != null)
            {
                if(!IsPostBack) // Load only first time
                {
                    LoadNurseProfile();
                }
            }
            else
            {
                Response.Redirect("~/pages/LoginPage.aspx");
            }
        }

        private void LoadNurseProfile()
        {
            try
            {
                txtName.Text = Session["NurseName"].ToString();
                txtAge.Text = Session["NurseAge"].ToString();
                txtGender.Text = Session["NurseGender"].ToString();
                txtAddress.Text = Session["NurseAddress"].ToString();
                txtEmail.Text = Session["NurseEmail"].ToString();
                txtContact.Text = Session["NurseContact"].ToString();
                imgProfile.ImageUrl = Session["ProfilePicture"] != null ? Session["ProfilePicture"].ToString() : "~/Images/default.png";
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error loading profile: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                string nurseId = Session["NurseID"].ToString();
                string name = txtName.Text.Trim();
                int age = int.Parse(txtAge.Text.Trim());
                string gender = txtGender.Text.Trim();
                string address = txtAddress.Text.Trim();
                string email = txtEmail.Text.Trim();
                string contact = txtContact.Text.Trim();
                string profilePicture = imgProfile.ImageUrl; // Default to existing

                if (fileUpload.HasFile)
                {
                    string fileExtension = Path.GetExtension(fileUpload.FileName).ToLower();
                    string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".svg" };

                    if (Array.Exists(allowedExtensions, ext => ext == fileExtension))
                    {
                        string fileName = Path.GetFileName(fileUpload.PostedFile.FileName);
                        string filePath = Server.MapPath("~/Images/") + fileName;
                        fileUpload.SaveAs(filePath);
                        profilePicture = "~/Images/" + fileName;
                    }
                    else
                    {
                        lblMessage.Text = "Only JPG, JPEG, PNG, and SVG files are allowed.";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        return;
                    }
                }

                // Update database
                bool success = UpdateNurseProfile(nurseId, name, age, gender, address, email, contact, profilePicture);

                if(success)
                {
                    // Update session values
                    Session["NurseName"] = name;
                    Session["NurseAge"] = age.ToString();
                    Session["NurseGender"] = gender;
                    Session["NurseAddress"] = address;
                    Session["NurseEmail"] = email;
                    Session["NurseContact"] = contact;
                    Session["ProfilePicture"] = profilePicture;

                    imgProfile.ImageUrl = profilePicture;

                    lblMessage.Text = "Profile updated successfully!";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblMessage.Text = "Update failed. Please try again.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch(Exception ex)
            {
                lblMessage.Text = "Error updating profile: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        private bool UpdateNurseProfile(string nurseId, string name, int age, string gender, string address, string email, string contact, string profilePicture)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            int rowsAffected = 0;

            using(SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "UPDATE tbl_Nurse SET Name = @Name, Age = @Age, Gender = @Gender, Address = @Address, Email = @Email, ContactNumber = @Contact, Profile = @Profile WHERE NurseID = @NurseID";

                using(SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@NurseID", nurseId);
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Age", age);
                    cmd.Parameters.AddWithValue("@Gender", gender);
                    cmd.Parameters.AddWithValue("@Address", address);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Contact", contact);
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
