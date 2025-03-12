using System;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;

namespace hospital_management.Admin_dashboard
{
    public partial class admin_profile : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["AdminID"] != null)
            {
                if(!IsPostBack)
                {
                    LoadAdminProfile();
                }
            }
            else
            {
                Response.Redirect("~/pages/LoginPage.aspx");
            }
        }

        private void LoadAdminProfile()
        {
            try
            {
                txtName.Text = Session["AdminName"]?.ToString() ?? "";
                txtEmail.Text = Session["AdminEmail"]?.ToString() ?? "";

                imgProfile.ImageUrl = Session["AdminProfilePicture"]?.ToString() ?? "~/Images/default.png";
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
                string adminId = Session["AdminID"].ToString();
                string name = txtName.Text.Trim();
                string profilePicture = imgProfile.ImageUrl;

                if(fileUpload.HasFile)
                {
                    string fileExtension = Path.GetExtension(fileUpload.FileName).ToLower();
                    string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".svg" };

                    if(Array.Exists(allowedExtensions, ext => ext == fileExtension))
                    {
                        string fileName = Path.GetFileName(fileUpload.PostedFile.FileName);
                        string filePath = Server.MapPath("~/Images/") + fileName;

                        if(!string.IsNullOrEmpty(profilePicture) && !profilePicture.Contains("default.png"))
                        {
                            string oldFilePath = Server.MapPath(profilePicture);
                            if(File.Exists(oldFilePath))
                            {
                                File.Delete(oldFilePath);
                            }
                        }

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

                bool success = UpdateAdminProfile(adminId, name, profilePicture);

                if(success)
                {
                    Session["AdminName"] = name;
                    Session["AdminProfilePicture"] = profilePicture;

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

        private bool UpdateAdminProfile(string adminId, string name, string profilePicture)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            int rowsAffected = 0;

            using(SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"UPDATE tbl_Admin 
                                 SET name = @Name, profile = @Profile
                                 WHERE adminID = @AdminID";

                using(SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@AdminID", adminId);
                    cmd.Parameters.AddWithValue("@Name", name);
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
