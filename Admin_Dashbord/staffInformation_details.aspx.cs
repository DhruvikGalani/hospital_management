using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace hospital_management.Admin_Dashbord
{
    public partial class staffInformation_details : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        // ✅ ADD NEW STAFF
        protected void btnAddStaff_Click(object sender, EventArgs e)
        {
            byte[] profilePic = fileProfile.FileBytes;

            con.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO tbl_StaffInformation(fullName, role, contactNumber, email, password, shiftTiming, joiningDate, salaryDetails, profile) VALUES (@name, @role, @contact, @email, @password, @shift, @date, @salary, @profile)", con);
            cmd.Parameters.AddWithValue("@name", txtName.Text);
            cmd.Parameters.AddWithValue("@role", txtRole.Text);
            cmd.Parameters.AddWithValue("@contact", txtContact.Text);
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@password", txtPassword.Text);
            cmd.Parameters.AddWithValue("@shift", txtShift.Text);
            cmd.Parameters.AddWithValue("@date", txtJoining.Text);
            cmd.Parameters.AddWithValue("@salary", txtSalary.Text);
            cmd.Parameters.AddWithValue("@profile", profilePic);

            cmd.ExecuteNonQuery();
            con.Close();
            BindGrid();
        }

        // ✅ BIND DATA TO GRID
        void BindGrid()
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("SELECT staffID, fullName, role, contactNumber, email, shiftTiming,joiningDate, salaryDetails FROM tbl_StaffInformation", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            GridViewStaff.DataSource = dt;
            GridViewStaff.DataBind();
        }

        // ✅ EDIT STAFF (Enable Edit Mode)
        protected void GridViewStaff_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewStaff.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        // ✅ CANCEL EDIT MODE
        protected void GridViewStaff_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewStaff.EditIndex = -1;
            BindGrid();
        }

        // ✅ UPDATE STAFF DETAILS
        protected void GridViewStaff_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int staffID = Convert.ToInt32(GridViewStaff.DataKeys[e.RowIndex].Value);
            string fullName = ((TextBox)GridViewStaff.Rows[e.RowIndex].FindControl("txtEditName")).Text;
            string role = ((TextBox)GridViewStaff.Rows[e.RowIndex].FindControl("txtEditRole")).Text;
            string contact = ((TextBox)GridViewStaff.Rows[e.RowIndex].FindControl("txtEditContact")).Text;
            string email = ((TextBox)GridViewStaff.Rows[e.RowIndex].FindControl("txtEditEmail")).Text;
            string shift = ((TextBox)GridViewStaff.Rows[e.RowIndex].FindControl("txtEditShift")).Text;
            string joiningDate= ((TextBox)GridViewStaff.Rows[e.RowIndex].FindControl("txtEditjoiningDate")).Text;
            string salary = ((TextBox)GridViewStaff.Rows[e.RowIndex].FindControl("txtEditSalary")).Text;

            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE tbl_StaffInformation SET fullName=@name, role=@role, contactNumber=@contact, email=@email, shiftTiming=@shift,joiningDate=@joiningDate, salaryDetails=@salary WHERE staffID=@id", con);
            cmd.Parameters.AddWithValue("@id", staffID);
            cmd.Parameters.AddWithValue("@name", fullName);
            cmd.Parameters.AddWithValue("@role", role);
            cmd.Parameters.AddWithValue("@contact", contact);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@shift", shift);
            cmd.Parameters.AddWithValue("@joiningDate",joiningDate);
            cmd.Parameters.AddWithValue("@salary", salary);

            cmd.ExecuteNonQuery();
            con.Close();

            GridViewStaff.EditIndex = -1;
            BindGrid();
        }

        // ✅ DELETE STAFF
        protected void GridViewStaff_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int staffID = Convert.ToInt32(GridViewStaff.DataKeys[e.RowIndex].Value);

            con.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM tbl_StaffInformation WHERE staffID=@id", con);
            cmd.Parameters.AddWithValue("@id", staffID);
            cmd.ExecuteNonQuery();
            con.Close();
            BindGrid();
        }
    }
}
