using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace hospital_management.Nurse_dashboard
{
    public partial class patient_details : System.Web.UI.Page
    {
        private string strcon = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindGridView();
            }
        }

        // Bind data to GridView
        private void BindGridView()
        {
            using(SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(@"
        SELECT 
            a.appointmentID, 
            p.patientID, 
            p.name AS patientName, 
            p.contactNumber, 
            p.email, 
            d.name AS doctorName,  -- Get doctor name instead of ID
            a.appointmentDateTime, 
            a.reasonForVisit, 
            a.clinicLocation, 
            a.status
        FROM tbl_Appointments a
        JOIN tbl_Patients p ON a.patientID = p.patientID
        JOIN tbl_Doctors d ON a.doctorID = d.doctorID", con); 

                DataTable dt = new DataTable();
                da.Fill(dt);
                gvAppointments.DataSource = dt;
                gvAppointments.DataBind();
            }
        }


        // Row Editing Event
        protected void gvAppointments_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvAppointments.EditIndex = e.NewEditIndex;
            BindGridView(); // Rebind GridView to switch to edit mode

            // Get the current row being edited
            GridViewRow row = gvAppointments.Rows[e.NewEditIndex];

            // Find the DropDownList in the edit template
            DropDownList ddlDoctor = row.FindControl("ddlDoctor") as DropDownList;
            Label lblDoctorName = row.FindControl("lblDoctorName") as Label; // Get the current doctor name

            if(ddlDoctor != null)
            {
                using(SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT doctorID, name FROM tbl_Doctors", con);
                    SqlDataReader dr = cmd.ExecuteReader();

                    ddlDoctor.DataSource = dr;
                    ddlDoctor.DataTextField = "name";   // Display doctor name
                    ddlDoctor.DataValueField = "doctorID";  // Store doctor ID
                    ddlDoctor.DataBind();
                    dr.Close();
                }

                // Ensure lblDoctorName is not null before selecting the current doctor
                if(lblDoctorName != null && !string.IsNullOrEmpty(lblDoctorName.Text))
                {
                    ListItem selectedItem = ddlDoctor.Items.FindByText(lblDoctorName.Text);
                    if(selectedItem != null)
                    {
                        selectedItem.Selected = true;
                    }
                }
            }
        }




        // Row Updating Event
        protected void gvAppointments_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvAppointments.Rows[e.RowIndex];

            int appointmentID = Convert.ToInt32(gvAppointments.DataKeys[e.RowIndex].Value);
            string doctorID = (row.FindControl("ddlDoctor") as DropDownList).SelectedValue;
            string dateTime = (row.FindControl("txtDateTime") as TextBox).Text;
            string reason = (row.FindControl("txtReason") as TextBox).Text;
            string location = (row.FindControl("txtLocation") as TextBox).Text;
            string status = (row.FindControl("ddlStatus") as DropDownList).SelectedValue;

            using(SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
        UPDATE tbl_Appointments 
        SET doctorID=@doctorID, appointmentDateTime=@dateTime, 
            reasonForVisit=@reason, clinicLocation=@location, status=@status
        WHERE appointmentID=@appointmentID", con);

                cmd.Parameters.AddWithValue("@appointmentID", appointmentID);
                cmd.Parameters.AddWithValue("@doctorID", doctorID);
                cmd.Parameters.AddWithValue("@dateTime", dateTime);
                cmd.Parameters.AddWithValue("@reason", reason);
                cmd.Parameters.AddWithValue("@location", location);
                cmd.Parameters.AddWithValue("@status", status);

                cmd.ExecuteNonQuery();
            }

            gvAppointments.EditIndex = -1;
            BindGridView();
        }

        // Cancel Editing
        protected void gvAppointments_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvAppointments.EditIndex = -1;
            BindGridView();
        }

        // Row Deleting Event
        
    }
}
