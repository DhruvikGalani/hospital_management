using System;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace hospital_management.Nurse_dashboard
{
    public partial class profile : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["NurseID"] != null)
            {
                if (!IsPostBack)
                {
                    // Load nurse profile from session
                    txtName.Text = Session["NurseName"].ToString();
                    txtEmail.Text = Session["NurseEmail"].ToString();
                    txtContact.Text = Session["NurseContact"].ToString();
                    imgProfile.ImageUrl = Session["ProfilePicture"].ToString();
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string email = txtEmail.Text;
            string contact = txtContact.Text;
            string profilePicture = imgProfile.ImageUrl;

            // Check if a new profile picture is uploaded
            if (fileUpload.HasFile)
            {
                string fileName = Path.GetFileName(fileUpload.PostedFile.FileName);
                string filePath = Server.MapPath("~/Images/") + fileName;
                fileUpload.SaveAs(filePath);
                profilePicture = "~/Images/" + fileName;
            }

            // Update nurse profile in the database
            UpdateNurseProfile(Session["NurseID"].ToString(), name, email, contact, profilePicture);

            // Update session with new profile details
            Session["NurseName"] = name;
            Session["NurseEmail"] = email;
            Session["NurseContact"] = contact;
            Session["ProfilePicture"] = profilePicture;

            lblMessage.Text = "Profile updated successfully";
        }

        // Method to update nurse profile in the database
        private void UpdateNurseProfile(string nurseId, string name, string email, string contact, string profilePicture)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "UPDATE Nurses SET Name = @Name, Email = @Email, ContactNumber = @Contact, ProfilePicture = @ProfilePicture WHERE NurseID = @NurseID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@NurseID", nurseId);
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Contact", contact);
                    cmd.Parameters.AddWithValue("@ProfilePicture", profilePicture);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
    }
}
