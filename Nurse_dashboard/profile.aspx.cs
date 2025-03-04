using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;

namespace hospital_management.Nurse_dashboard
{
    public partial class profile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["nurseID"] != null)
                {
                    txtName.Text = Session["name"].ToString();
                    txtEmail.Text = Session["email"].ToString();
                    txtContact.Text = Session["contactNumber"].ToString();

                    if (Session["profile"].ToString() != "")
                    {
                        imgProfile.ImageUrl = "~/uploads/" + Session["profile"].ToString();  // Fixed Image Path
                    }
                    else
                    {
                        imgProfile.ImageUrl = "~/images/default.png";  // Default Image Agar Image Nahi Ho
                    }
                }
                else
                {
                    Response.Redirect("login.aspx");
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string contact = txtContact.Text;
            string profile = Session["profile"].ToString();

            if (fileProfile.HasFile)
            {
                string filename = System.IO.Path.GetFileName(fileProfile.FileName);
                string filepath = "~/uploads/" + filename;
                fileProfile.SaveAs(Server.MapPath(filepath));
                profile = filename;
            }

            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();
                string query = "UPDATE tbl_Nurse SET name = @name, contactNumber = @contact, profile = @profile WHERE nurseID = @nurseID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@contact", contact);
                cmd.Parameters.AddWithValue("@profile", profile);
                cmd.Parameters.AddWithValue("@nurseID", Session["nurseID"].ToString());

                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    Session["name"] = name;
                    Session["contactNumber"] = contact;
                    Session["profile"] = profile;
                    imgProfile.ImageUrl = "~/uploads/" + profile;

                    Response.Write("<script>alert('Profile Updated Successfully');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Update Failed');</script>");
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("login.aspx");
        }
    }
}
