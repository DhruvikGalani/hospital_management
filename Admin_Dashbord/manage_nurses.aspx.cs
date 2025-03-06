using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hospital_management.Admin_Dashbord
{
    public partial class manage_nurses : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadNurses();
            }
        }

        protected void LoadNurses()
        {
            using(SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString))
            {
                string query = "SELECT nurseID, name, age, gender, address, email, contactNumber, profile FROM tbl_Nurse";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvNurses.DataSource = dt;
                gvNurses.DataBind();
            }
        }

        protected void btnAddNurse_Click(object sender, EventArgs e)
        {
            if(string.IsNullOrWhiteSpace(txtName.Text) || string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                Response.Write("<script>alert('Please Fill All Fields');</script>");
                return;
            }

            string profilePath = "~/userImage/default.png"; // Default image path

            // Check if a file is uploaded
            if(FileUploadProfile.HasFile)
            {
                // Ensure the directory exists
                string directoryPath = Server.MapPath("~/userImage/");
                if(!Directory.Exists(directoryPath))
                {
                    Directory.CreateDirectory(directoryPath);
                }

                // Generate a unique file name
                string fileName = Guid.NewGuid().ToString() + Path.GetExtension(FileUploadProfile.FileName);
                profilePath = "~/userImage/" + fileName;

                // Save the uploaded file
                FileUploadProfile.SaveAs(Server.MapPath(profilePath));
            }

            using(SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString))
            {
                string query = "INSERT INTO tbl_Nurse (name, age, gender, address, email, password, contactNumber, profile) " +
                               "VALUES (@Name, @Age, @Gender, @Address, @Email, @Password, @Contact, @Profile)";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@Age", txtAge.Text.Trim());
                cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@Contact", txtContact.Text.Trim());
                cmd.Parameters.AddWithValue("@Profile", profilePath);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Nurse Added Successfully');</script>");
                ClearFields();
                LoadNurses();
            }
        }

        //protected void btnAddNurse_Click(object sender, EventArgs e)
        //{
        //    if(string.IsNullOrWhiteSpace(txtName.Text) || string.IsNullOrWhiteSpace(txtEmail.Text))
        //    {
        //        Response.Write("<script>alert('Please Fill All Fields');</script>");
        //        return;
        //    }

        //    string profilePath = "~/userImage/default.png";

        //    if(FileUploadProfile.HasFile)
        //    {
        //        string fileName = Guid.NewGuid().ToString() + System.IO.Path.GetExtension(FileUploadProfile.FileName);
        //        profilePath = "~/userImage/" + fileName;
        //        FileUploadProfile.SaveAs(Server.MapPath(profilePath));
        //    }

        //    using(SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString))
        //    {
        //        string query = "INSERT INTO tbl_Nurse (name, age, gender, address, email, password, contactNumber, profile) " +
        //        "VALUES (@Name, @Age, @Gender, @Address, @Email, @Password, @Contact, @Profile)";

        //        SqlCommand cmd = new SqlCommand(query, con);
        //        cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
        //        cmd.Parameters.AddWithValue("@Age", txtAge.Text.Trim());
        //        cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
        //        cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
        //        cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
        //        cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
        //        cmd.Parameters.AddWithValue("@Contact", txtContact.Text.Trim());
        //        cmd.Parameters.AddWithValue("@Profile", profilePath);

        //        con.Open();
        //        cmd.ExecuteNonQuery();
        //        con.Close();

        //        Response.Write("<script>alert('Nurse Added Successfully');</script>");
        //        ClearFields();
        //        LoadNurses();
        //    }
        //}
        protected void gvNurses_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvNurses.EditIndex = e.NewEditIndex;
            LoadNurses();
        }
        protected void gvNurses_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvNurses.EditIndex = -1;
            LoadNurses();
        }


        protected void gvNurses_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int nurseID = Convert.ToInt32(gvNurses.DataKeys[e.RowIndex].Value);
            GridViewRow row = gvNurses.Rows[e.RowIndex];

            string name = ((TextBox)row.FindControl("txtNameEdit")).Text;
            string age = ((TextBox)row.FindControl("txtAgeEdit")).Text;
            string address = ((TextBox)row.FindControl("txtAddressEdit")).Text;
            string contact = ((TextBox)row.FindControl("txtContactEdit")).Text;

            using(SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString))
            {
                string query = "UPDATE tbl_Nurse SET name=@Name, age=@Age, address=@Address, contactNumber=@Contact WHERE nurseID=@NurseID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Age", age);
                cmd.Parameters.AddWithValue("@Address", address);
                cmd.Parameters.AddWithValue("@Contact", contact);
                cmd.Parameters.AddWithValue("@NurseID", nurseID);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            gvNurses.EditIndex = -1;
            LoadNurses();
        }

        protected void gvNurses_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int nurseID = Convert.ToInt32(gvNurses.DataKeys[e.RowIndex].Value);

            using(SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString))
            {
                string query = "DELETE FROM tbl_Nurse WHERE nurseID=@NurseID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@NurseID", nurseID);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            Response.Write("<script>alert('Nurse Deleted Successfully');</script>");
            LoadNurses();
        }
        private void ClearFields()
        {
            txtName.Text = "";
            txtAge.Text = "";
            txtAddress.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            txtContact.Text = "";
            ddlGender.SelectedIndex = 0;
        }
    }
}
