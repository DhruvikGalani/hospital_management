using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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

            // Check Admin Login
            if(ValidateLogin("tbl_Admin", username, password))
            {
                Session["Username"] = username;
                Session["UserRole"] = "Admin";
                Response.Redirect("~/Admin_Dashbord/Admin_DashBordPage.aspx");
            }
            // Check Doctor Login
            else if(ValidateLogin("tbl_Doctors", username, password))
            {
                Session["Username"] = username;
                Session["UserRole"] = "Doctor";
                Response.Redirect("~/Doctor/doctor_dashboard.aspx");
            }
            // Check Nurse Login
            else if(ValidateLogin("tbl_Nurse", username, password))
            {
                Session["Username"] = username;
                Session["UserRole"] = "Nurse";
                Response.Redirect("~/Nurse_dashboard/Nurse_homepage.aspx");
            }
            // Check Patient Login
            else if(ValidateLogin("tbl_Patients", username, password))
            {
                Session["Username"] = username;
                Session["UserRole"] = "Patient";
                Response.Redirect("~/Patient/patient_dashboard.aspx");
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
    }
}