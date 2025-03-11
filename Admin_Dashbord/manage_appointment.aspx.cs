using hospital_management.Patient;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hospital_management.Admin_Dashbord
{
    public partial class manage_appointment : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
                BindDropDownLists();
            }
        }

        private void BindGridView()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"SELECT a.appointmentID, 
                        p.name AS patientID, 
                        d.name AS doctorID, 
                        a.appointmentDateTime, 
                        a.reasonForVisit,
                        a.appointmentDateTime,
                        a.clinicLocation, 
                        a.status 
                 FROM tbl_Appointments a 
                 INNER JOIN tbl_Patients p ON a.patientID = p.patientID 
                 INNER JOIN tbl_Doctors d ON a.doctorID = d.doctorID";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }

        private void BindDropDownLists()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("SELECT patientID, name FROM tbl_Patients", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                ddlPatient.DataSource = dt;
                ddlPatient.DataTextField = "name";
                ddlPatient.DataValueField = "patientID";
                ddlPatient.DataBind();

                da = new SqlDataAdapter("SELECT doctorID, name FROM tbl_Doctors", con);
                dt = new DataTable();
                da.Fill(dt);
                ddlDoctor.DataSource = dt;
                ddlDoctor.DataTextField = "name";
                ddlDoctor.DataValueField = "doctorID";
                ddlDoctor.DataBind();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            DateTime appointmentDateTime;

            if (DateTime.TryParseExact(txtDateTime.Text, "yyyy-MM-ddTHH:mm", CultureInfo.InvariantCulture, DateTimeStyles.None, out appointmentDateTime))

                using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "INSERT INTO tbl_Appointments (patientID, doctorID, appointmentDateTime, reasonForVisit, clinicLocation) VALUES (@patientID, @doctorID, @appointmentDateTime, @reasonForVisit, @clinicLocation)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@patientID", ddlPatient.SelectedValue);
                    cmd.Parameters.AddWithValue("@doctorID", ddlDoctor.SelectedValue);
                        cmd.Parameters.AddWithValue("@appointmentDateTime", appointmentDateTime);
                        cmd.Parameters.AddWithValue("@reasonForVisit", txtReason.Text);
                    cmd.Parameters.AddWithValue("@clinicLocation", txtLocation.Text);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    BindGridView();
                }
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];

                // ✅ Retrieve Appointment ID
                int appointmentID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

                // ✅ Find controls inside Edit Template
                TextBox txtEditDate = row.FindControl("txtEditDate") as TextBox;
                TextBox txtEditReason = row.FindControl("txtEditReason") as TextBox;
                TextBox txtEditLocation = row.FindControl("txtEditLocation") as TextBox;
                DropDownList ddlEditStatus = row.FindControl("ddlEditStatus") as DropDownList;

                // ✅ Check if controls exist
                if (txtEditDate == null || txtEditReason == null || txtEditLocation == null || ddlEditStatus == null)
                {
                    Response.Write("<script>alert('Error: Some controls are missing!');</script>");
                    return;
                }

                // ✅ Convert DateTime properly
                DateTime appointmentDateTime;
                if (!DateTime.TryParseExact(txtEditDate.Text, "yyyy-MM-ddTHH:mm", CultureInfo.InvariantCulture, DateTimeStyles.None, out appointmentDateTime))
                {
                    Response.Write("<script>alert('Error: Invalid date format!');</script>");
                    return;
                }

               
                // ✅ Update Query
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string query = @"UPDATE tbl_Appointments 
                             SET appointmentDateTime = @appointmentDateTime, 
                                 reasonForVisit = @reasonForVisit, 
                                 clinicLocation = @clinicLocation, 
                                 status = @status 
                             WHERE appointmentID = @appointmentID";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@appointmentID", appointmentID);
                        cmd.Parameters.AddWithValue("@appointmentDateTime", appointmentDateTime);
                        cmd.Parameters.AddWithValue("@reasonForVisit", txtEditReason.Text.Trim());
                        cmd.Parameters.AddWithValue("@clinicLocation", txtEditLocation.Text.Trim());
                        cmd.Parameters.AddWithValue("@status", ddlEditStatus.SelectedValue);

                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();
                        con.Close();

                        // ✅ Check if update was successful
                        if (rowsAffected > 0)
                        {
                            Response.Write("<script>alert('Update successful!');</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('No rows updated!');</script>");
                        }

                        GridView1.EditIndex = -1;
                        BindGridView();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindGridView();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values["appointmentID"]);
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "DELETE FROM tbl_Appointments WHERE appointmentID=@appointmentID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@appointmentID", id);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    BindGridView();
                }
            }

        }
    }
}



    
