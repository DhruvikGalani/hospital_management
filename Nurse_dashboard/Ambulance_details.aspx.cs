using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace hospital_management.Nurse_dashboard
{
    public partial class Ambulance_details : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayData();
               

            }
        }

       
        protected void DisplayData()
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT vehicleNumber, driverName, contactNumber, availabilityStatus FROM tbl_Ambulances";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvAmbulance.DataSource = dt;
                gvAmbulance.DataBind();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string query = "INSERT INTO tbl_Ambulances (vehicleNumber, driverName, contactNumber, availabilityStatus) VALUES (@VehicleNumber, @DriverName, @ContactNumber, @AvailabilityStatus)";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@VehicleNumber", txtVehicleNumber.Text.Trim());
                    cmd.Parameters.AddWithValue("@DriverName", txtDriverName.Text.Trim());
                    cmd.Parameters.AddWithValue("@ContactNumber", txtContactNumber.Text.Trim());
                    cmd.Parameters.AddWithValue("@AvailabilityStatus", rblAvailability.SelectedItem.Text);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
                Response.Write("<script>alert('Ambulance Added Successfully');</script>");
                ClearFields();
                DisplayData();
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            ClearFields(); // This will clear the form fields
        }

        protected void gvAmbulance_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvAmbulance.EditIndex = e.NewEditIndex;
            DisplayData();
        }

        protected void gvAmbulance_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvAmbulance.EditIndex = -1;
            DisplayData();
        }

        protected void gvAmbulance_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvAmbulance.Rows[e.RowIndex];

            string vehicleNumber = gvAmbulance.DataKeys[e.RowIndex].Value.ToString(); // ✅ Correct Way
            string driverName = ((TextBox)row.FindControl("txtDriverNameEdit")).Text;
            string contactNumber = ((TextBox)row.FindControl("txtContactNumberEdit")).Text;
            string availability = ((DropDownList)row.FindControl("ddlAvailabilityEdit")).SelectedValue;

            try
            {
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string query = "UPDATE tbl_Ambulances SET driverName=@DriverName, contactNumber=@ContactNumber, availabilityStatus=@Availability WHERE vehicleNumber=@VehicleNumber";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@DriverName", driverName);
                    cmd.Parameters.AddWithValue("@ContactNumber", contactNumber);
                    cmd.Parameters.AddWithValue("@Availability", availability);
                    cmd.Parameters.AddWithValue("@VehicleNumber", vehicleNumber);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
                gvAmbulance.EditIndex = -1;
                DisplayData();
                Response.Write("<script>alert('Ambulance Updated Successfully');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void gvAmbulance_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string vehicleNumber = gvAmbulance.DataKeys[e.RowIndex].Value.ToString();

            try
            {
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string query = "DELETE FROM tbl_Ambulances WHERE vehicleNumber=@VehicleNumber";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@VehicleNumber", vehicleNumber);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
                DisplayData();
                Response.Write("<script>alert('Ambulance Deleted Successfully');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }

        private void ClearFields()
        {
            txtVehicleNumber.Text = "";
            txtDriverName.Text = "";
            txtContactNumber.Text = "";

            // Check if RadioButtonList is not null
            if (rblAvailability != null)
            {
                rblAvailability.ClearSelection();
            }
        }

    }
}
