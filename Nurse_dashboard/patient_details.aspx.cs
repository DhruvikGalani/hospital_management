using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using hospital_management.Patient;
using System.Web.UI.WebControls;

namespace hospital_management.Nurse_dashboard
{
    public partial class patient_details : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        protected void gvPatients_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvPatients.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        protected void gvPatients_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int patientID = Convert.ToInt32(gvPatients.DataKeys[e.RowIndex].Value);
            TextBox txtName = (TextBox)gvPatients.Rows[e.RowIndex].FindControl("txtName");
            TextBox txtAge = (TextBox)gvPatients.Rows[e.RowIndex].FindControl("txtAge");
            DropDownList ddlGender = (DropDownList)gvPatients.Rows[e.RowIndex].FindControl("ddlGender");
            TextBox txtAddress = (TextBox)gvPatients.Rows[e.RowIndex].FindControl("txtAddress");

            using (SqlConnection con = new SqlConnection(conStr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE tbl_Patients SET name=@name, age=@age, gender=@gender, address=@address WHERE patientID=@patientID", con);
                cmd.Parameters.AddWithValue("@name", txtName.Text);
                cmd.Parameters.AddWithValue("@age", txtAge.Text);
                cmd.Parameters.AddWithValue("@gender", ddlGender.SelectedValue);
                cmd.Parameters.AddWithValue("@address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@patientID", patientID);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            gvPatients.EditIndex = -1;
            BindGridView();
        }

        protected void gvPatients_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvPatients.EditIndex = -1;
            BindGridView();
        }

        private void BindGridView()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT patientID, name, age, gender, address FROM tbl_Patients", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                gvPatients.DataSource = dt;
                gvPatients.DataBind();
            }
        }
    }
}
