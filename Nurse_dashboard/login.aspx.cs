using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hospital_management.Nurse_dashboard
{
    public partial class login : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        SqlConnection Conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fnDbConnection();
            }
        }

        //---connection code-----
        protected void fnDbConnection()
        {
            Conn = new SqlConnection(strcon);
            try
            {
                if (Conn.State != ConnectionState.Open)
                {
                    Conn.Open();
                    Response.Write("Connection successfully");
                }
                else
                {
                    Response.Write("Failed");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string userID = txtNurseID.Text;
            string password = txtpassword.Text;
            string role = "";

            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();
                string query = @"SELECT 'Nurse' AS role FROM tbl_Nurse WHERE nurseID = @userID AND password = @password 
                UNION 
                SELECT 'Doctor' AS role FROM tbl_Doctors WHERE doctorID = @userID AND password = @password 
                UNION 
                SELECT 'Patient' AS role FROM tbl_Patients WHERE patientID = @userID AND password = @password 
                UNION 
                SELECT 'Admin' AS role FROM tbl_Admin WHERE adminID = @userID AND password = @password";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@userID", userID);
                cmd.Parameters.AddWithValue("@password", password);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    role = dr["role"].ToString();
                    Session["user"] = userID;

                    switch (role)
                    {
                        case "Nurse":
                            Response.Redirect("Nurse_homepage.aspx?id=" + userID);
                            break;
                        case "Doctor":
                            Response.Redirect("Doctor_homepage.aspx?id=" + userID);
                            break;
                        case "Patient":
                            Response.Redirect("Patient_homepage.aspx?id=" + userID);
                            break;
                        case "Admin":
                            Response.Redirect("Admin_homepage.aspx?id=" + userID);
                            break;
                        default:
                            Response.Write("Invalid Role");
                            break;
                    }
                }
                else
                {
                    Response.Write("Login is not valid!");
                }
            }
        }
    }
}
