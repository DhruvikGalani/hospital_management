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
        string strcon = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

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
            TextBox txtdateOfBirth = (TextBox)gvPatients.Rows[e.RowIndex].FindControl("txtdateOfBirth");
            TextBox txtContact = (TextBox)gvPatients.Rows[e.RowIndex].FindControl("txtContact");
            TextBox txtEmail = (TextBox)gvPatients.Rows[e.RowIndex].FindControl("txtEmail");
            TextBox txtPassword = (TextBox)gvPatients.Rows[e.RowIndex].FindControl("txtPassword");
            TextBox txtAddress = (TextBox)gvPatients.Rows[e.RowIndex].FindControl("txtAddress");
            TextBox txtEmergency = (TextBox)gvPatients.Rows[e.RowIndex].FindControl("txtEmergency");
            TextBox txtBloodGroup = (TextBox)gvPatients.Rows[e.RowIndex].FindControl("txtBloodGroup");
            TextBox txtAllergies = (TextBox)gvPatients.Rows[e.RowIndex].FindControl("txtAllergies");
            TextBox txtMedicines = (TextBox)gvPatients.Rows[e.RowIndex].FindControl("txtMedicines");
            DropDownList ddlInsurance = (DropDownList)gvPatients.Rows[e.RowIndex].FindControl("ddlInsurance");

            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE tbl_Patients SET name=@name, age=@age, gender=@gender, dateOfBirth=@dateOfBirth, contactNumber=@contactNumber, email=@email, password=@password, address=@address, emergencyContact=@emergencyContact, bloodGroup=@bloodGroup, allergies=@allergies, runningMedicines=@runningMedicines, insurance=@insurance WHERE patientID=@patientID", con);
                cmd.Parameters.AddWithValue("@name", txtName.Text);
                cmd.Parameters.AddWithValue("@age", txtAge.Text);
                cmd.Parameters.AddWithValue("@gender", ddlGender.SelectedValue);  
                cmd.Parameters.AddWithValue("@dateOfBirth", DateTime.Parse(txtdateOfBirth.Text));  
                cmd.Parameters.AddWithValue("@contactNumber", txtContact.Text);
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@password", txtPassword.Text);
                cmd.Parameters.AddWithValue("@address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@emergencyContact", txtEmergency.Text);
                cmd.Parameters.AddWithValue("@bloodGroup", txtBloodGroup.Text);
                cmd.Parameters.AddWithValue("@allergies", txtAllergies.Text);
                cmd.Parameters.AddWithValue("@runningMedicines", txtMedicines.Text);
                cmd.Parameters.AddWithValue("@insurance", ddlInsurance.SelectedValue);  
                cmd.Parameters.AddWithValue("@patientID", patientID);
                cmd.ExecuteNonQuery();
            }
            gvPatients.EditIndex = -1;
            BindGridView();
        }

        protected void gvPatients_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvPatients.EditIndex = -1;
            BindGridView();
        }

        protected void BindGridView()
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_Patients", con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    Response.Write("Records Found: " + dt.Rows.Count); // Debugging ke liye

                    if (dt.Rows.Count > 0)
                    {
                        gvPatients.DataSource = dt;
                        gvPatients.DataBind();
                    }
                    else
                    {
                        Response.Write("No Records Found");
                        gvPatients.DataSource = null;
                        gvPatients.DataBind();
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.Message);
                }
            }
        }


    }

}
