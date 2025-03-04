using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace hospital_management.Nurse_dashboard
{
    public partial class login : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Page Load
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtpassword.Text;

            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();
                string query = @"SELECT nurseID, name, email, contactNumber, profile FROM tbl_Nurse 
                                 WHERE email = @email AND password = @password";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@password", password);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    Session["nurseID"] = dr["nurseID"].ToString();
                    Session["name"] = dr["name"].ToString();
                    Session["email"] = dr["email"].ToString();
                    Session["contactNumber"] = dr["contactNumber"].ToString();
                    Session["profile"] = dr["profile"].ToString();

                    Response.Redirect("Nurse_homepage.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Email or Password');</script>");
                }
            }
        }
    }
}
