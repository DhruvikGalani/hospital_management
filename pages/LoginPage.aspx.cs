using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;

namespace hospital_management.pages
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtEmail.Text;
            string password = txtPassword.Text;

            // Check Nurse Login
            if(ValidateLogin("tbl_Nurse", username, password))
            {
                FetchNurseDetails(username);
                Response.Redirect("~/Nurse_dashboard/Nurse_homepage.aspx");
            }
            else
            {
                Response.Write("<script>alert('Invalid username or password');</script>");
            }
        }

        private bool ValidateLogin(string tableName, string username, string password)
        {
            bool isValid = false;
            string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

            using(SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = $"SELECT COUNT(1) FROM {tableName} WHERE email = @username AND password = @password";
                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", password);

                connection.Open();
                int count = Convert.ToInt32(cmd.ExecuteScalar());
                isValid = (count > 0);
            }

            return isValid;
        }

        private void FetchNurseDetails(string username)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            using(SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT NurseID, Name, Age, Gender, Address, Email, ContactNumber, Profile FROM tbl_Nurse WHERE Email = @Email";
                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@Email", username);

                connection.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if(reader.Read())
                {
                    Session["NurseID"] = reader["NurseID"].ToString();
                    Session["NurseName"] = reader["Name"].ToString();
                    Session["NurseAge"] = reader["Age"].ToString();
                    Session["NurseGender"] = reader["Gender"].ToString();
                    Session["NurseAddress"] = reader["Address"].ToString();
                    Session["NurseEmail"] = reader["Email"].ToString();
                    Session["NurseContact"] = reader["ContactNumber"].ToString();
                    Session["ProfilePicture"] = reader["Profile"].ToString();
                }
            }
        }

    }
}
