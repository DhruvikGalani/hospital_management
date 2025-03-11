//using System;
//using System.Configuration;
//using System.Data.SqlClient;
//using System.Web;
//using System.Web.UI;

//namespace hospital_management.pages
//{
//    public partial class LoginPage : System.Web.UI.Page
//    {
//        protected void Page_Load(object sender, EventArgs e)
//        {
//        }

//        protected void btnLogin_Click(object sender, EventArgs e)
//        {
//            string username = txtEmail.Text.Trim();
//            string password = txtPassword.Text.Trim();

//            // Check if Nurse
//            if(ValidateLogin("tbl_Nurse", username, password))
//            {
//                FetchNurseDetails(username);
//                Response.Redirect("~/Nurse_dashboard/Nurse_homepage.aspx");
//            }
//            // Check if Doctor
//            else if(ValidateLogin("tbl_Doctors", username, password))
//            {
//                FetchDoctorDetails(username);
//                Response.Redirect("~/Doctor/Doctorhomepage.aspx");
//            }
//            else
//            {
//                Response.Write("<script>alert('Invalid username or password');</script>");
//            }
//        }

//        private bool ValidateLogin(string tableName, string username, string password)
//        {
//            bool isValid = false;
//            string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

//            using(SqlConnection connection = new SqlConnection(connectionString))
//            {
//                string query = $"SELECT COUNT(1) FROM {tableName} WHERE email = @username AND password = @password";
//                SqlCommand cmd = new SqlCommand(query, connection);
//                cmd.Parameters.AddWithValue("@username", username);
//                cmd.Parameters.AddWithValue("@password", password);

//                connection.Open();
//                int count = Convert.ToInt32(cmd.ExecuteScalar());
//                isValid = (count > 0);
//            }

//            return isValid;
//        }

//        private void FetchNurseDetails(string username)
//        {
//            string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
//            using(SqlConnection connection = new SqlConnection(connectionString))
//            {
//                string query = "SELECT NurseID, Name, Age, Gender, Address, Email, ContactNumber, Profile FROM tbl_Nurse WHERE Email = @Email";
//                SqlCommand cmd = new SqlCommand(query, connection);
//                cmd.Parameters.AddWithValue("@Email", username);

//                connection.Open();
//                SqlDataReader reader = cmd.ExecuteReader();
//                if(reader.Read())
//                {
//                    Session["UserType"] = "Nurse";
//                    Session["NurseID"] = reader["NurseID"].ToString();
//                    Session["NurseName"] = reader["Name"].ToString();
//                    Session["NurseAge"] = reader["Age"].ToString();
//                    Session["NurseGender"] = reader["Gender"].ToString();
//                    Session["NurseAddress"] = reader["Address"].ToString();
//                    Session["NurseEmail"] = reader["Email"].ToString();
//                    Session["NurseContact"] = reader["ContactNumber"].ToString();
//                    Session["ProfilePicture"] = reader["Profile"].ToString();
//                }
//            }
//        }

//        private void FetchDoctorDetails(string username)
//        {
//            string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
//            using(SqlConnection connection = new SqlConnection(connectionString))
//            {
//                string query = "SELECT doctorID, name, age, gender, address, specialization, experienceYears, licenseNumber, consultationFee, email, contactNumber, profile FROM tbl_Doctors WHERE Email = @Email";
//                SqlCommand cmd = new SqlCommand(query, connection);
//                cmd.Parameters.AddWithValue("@Email", username);

//                connection.Open();
//                SqlDataReader reader = cmd.ExecuteReader();
//                if(reader.Read())
//                {
//                    Session["UserType"] = "Doctor";
//                    Session["DoctorID"] = reader["doctorID"].ToString();
//                    Session["DoctorName"] = reader["name"].ToString();
//                    Session["DoctorAge"] = reader["age"].ToString();
//                    Session["DoctorGender"] = reader["gender"].ToString();
//                    Session["DoctorAddress"] = reader["address"].ToString();
//                    Session["DoctorSpecialization"] = reader["specialization"].ToString();
//                    Session["DoctorExperience"] = reader["experienceYears"].ToString();
//                    Session["DoctorLicense"] = reader["licenseNumber"].ToString();
//                    Session["DoctorFee"] = reader["consultationFee"].ToString();
//                    Session["DoctorEmail"] = reader["email"].ToString();
//                    Session["DoctorContact"] = reader["contactNumber"].ToString();
//                    Session["DoctorProfilePicture"] = reader["profile"].ToString();
//                }
//            }
//        }
//    }
//}

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
            string username = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Check if Nurse
            if(ValidateLogin("tbl_Nurse", username, password))
            {
                FetchNurseDetails(username);
                Response.Redirect("~/Nurse_dashboard/Nurse_homepage.aspx");
            }
            // Check if Doctor
            else if(ValidateLogin("tbl_Doctors", username, password))
            {
                FetchDoctorDetails(username);
                Response.Redirect("~/Doctor/Doctorhomepage.aspx");
            }
            // Check if Admin
            else if(ValidateLogin("tbl_Admin", username, password))
            {
                FetchAdminDetails(username);
                Response.Redirect("~/Admin_Dashbord/Admin_DashBordPage.aspx");
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
                    Session["UserType"] = "Nurse";
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

        private void FetchDoctorDetails(string username)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            using(SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT doctorID, name, age, gender, address, specialization, experienceYears, licenseNumber, consultationFee, email, contactNumber, profile FROM tbl_Doctors WHERE Email = @Email";
                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@Email", username);

                connection.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if(reader.Read())
                {
                    Session["UserType"] = "Doctor";
                    Session["DoctorID"] = reader["doctorID"].ToString();
                    Session["DoctorName"] = reader["name"].ToString();
                    Session["DoctorAge"] = reader["age"].ToString();
                    Session["DoctorGender"] = reader["gender"].ToString();
                    Session["DoctorAddress"] = reader["address"].ToString();
                    Session["DoctorSpecialization"] = reader["specialization"].ToString();
                    Session["DoctorExperience"] = reader["experienceYears"].ToString();
                    Session["DoctorLicense"] = reader["licenseNumber"].ToString();
                    Session["DoctorFee"] = reader["consultationFee"].ToString();
                    Session["DoctorEmail"] = reader["email"].ToString();
                    Session["DoctorContact"] = reader["contactNumber"].ToString();
                    Session["DoctorProfilePicture"] = reader["profile"].ToString();
                }
            }
        }

        private void FetchAdminDetails(string username)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

            using(SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT adminID, name, email, profile FROM tbl_Admin WHERE LOWER(email) = LOWER(@Email)";
                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@Email", username);

                connection.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if(reader.Read())
                {
                    Session["UserType"] = "Admin";
                    Session["AdminID"] = reader["adminID"].ToString();
                    Session["AdminName"] = reader["name"].ToString();
                    Session["AdminEmail"] = reader["email"].ToString();
                    Session["AdminProfilePicture"] = reader["profile"] != DBNull.Value ? reader["profile"].ToString() : "~/Images/default.png"; // Handle null profile

                    Response.Write("<script>alert('Admin Loaded: " + Session["AdminName"] + "');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Admin not found!');</script>");
                }
            }
        }

    }
}