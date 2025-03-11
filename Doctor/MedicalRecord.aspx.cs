using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Globalization;


namespace hospital_management.Doctor
{
    public partial class MedicalRecord : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
                PopulatePatientDropdown();
                PopulateDoctorDropdown();
            }

        }

        //void BindPatient()
        //{
        //    SqlDataAdapter da = new SqlDataAdapter("SELECT patientID, name AS patientName FROM tbl_Patients", con);
        //    DataTable dt = new DataTable();
        //    da.Fill(dt);
        //    ddlPatient.DataSource = dt;
        //    ddlPatient.DataTextField = "patientName";
        //    ddlPatient.DataValueField = "patientID";
        //    ddlPatient.DataBind();
        //    ddlPatient.Items.Insert(0, new ListItem("--Select Patient--", "0"));
        //}

        //void BindDoctor()
        //{
        //    SqlDataAdapter da = new SqlDataAdapter("SELECT doctorID, name AS doctorName FROM tbl_Doctors", con);
        //    DataTable dt = new DataTable();
        //    da.Fill(dt);
        //    ddlDoctor.DataSource = dt;
        //    ddlDoctor.DataTextField = "doctorName";
        //    ddlDoctor.DataValueField = "doctorID";
        //    ddlDoctor.DataBind();
        //    ddlDoctor.Items.Insert(0, new ListItem("--Select Doctor--", "0"));
        //}

        //private void BindPatient(DropDownList ddlPatients)
        //{
        //    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString))
        //    {
        //        using (SqlCommand cmd = new SqlCommand("SELECT patientID, name FROM tbl_Patients", con))
        //        {
        //            con.Open();
        //            SqlDataAdapter da = new SqlDataAdapter(cmd);
        //            DataTable dt = new DataTable();
        //            da.Fill(dt);
        //            con.Close();

        //            ddlPatients.DataSource = dt;
        //            ddlPatients.DataTextField = "name";
        //            ddlPatients.DataValueField = "patientID";
        //            ddlPatients.DataBind();
        //        }
        //    }
        //}

        //// Method to populate the doctor dropdown
        //private void BindDoctor(DropDownList ddlDoctors)
        //{
        //    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString))
        //    {
        //        using (SqlCommand cmd = new SqlCommand("SELECT doctorID, name FROM tbl_Doctors", con))
        //        {
        //            con.Open();
        //            SqlDataAdapter da = new SqlDataAdapter(cmd);
        //            DataTable dt = new DataTable();
        //            da.Fill(dt);
        //            con.Close();

        //            ddlDoctors.DataSource = dt;
        //            ddlDoctors.DataTextField = "name";
        //            ddlDoctors.DataValueField = "doctorID";
        //            ddlDoctors.DataBind();
        //        }
        //    }
        //}

        // Default patient dropdown population method (for the main form)
        private void PopulatePatientDropdown()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT patientID, name AS patientName FROM tbl_Patients", con))
                {
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    con.Close();

                    ddlPatient.DataSource = dt;
                    ddlPatient.DataTextField = "patientName";
                    ddlPatient.DataValueField = "patientID";
                    ddlPatient.DataBind();
                    ddlPatient.Items.Insert(0, new ListItem("--Select Doctor--", "0"));

                }
            }
        }



        // Default doctor dropdown population method (for the main form)
        private void PopulateDoctorDropdown()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT doctorID, name AS doctorName FROM tbl_Doctors", con))
                {
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    con.Close();

                    ddlDoctor.DataSource = dt;
                    ddlDoctor.DataTextField = "doctorName";
                    ddlDoctor.DataValueField = "doctorID";
                    ddlDoctor.DataBind();
                    ddlDoctor.Items.Insert(0, new ListItem("--Select Doctor--", "0"));

                }
            }
        }

        // Overloaded method for populating doctor dropdown in edit mode
        private void PopulatePatientDropdown(DropDownList ddlPatients)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT patientID, name FROM tbl_Patients", con))
                {
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    con.Close();

                    ddlPatients.DataSource = dt;
                    ddlPatients.DataTextField = "name";
                    ddlPatients.DataValueField = "patientID";
                    ddlPatients.DataBind();
                }
            }
        }

        // Method to populate the doctor dropdown
        private void PopulateDoctorDropdown(DropDownList ddlDoctors)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT doctorID, name FROM tbl_Doctors", con))
                {
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    con.Close();

                    ddlDoctors.DataSource = dt;
                    ddlDoctors.DataTextField = "name";
                    ddlDoctors.DataValueField = "doctorID";
                    ddlDoctors.DataBind();
                }
            }
        }

        protected void btnAddMedicalRecord_Click(object sender, EventArgs e)
        {
            try
            {
                // Format date correctly from the TextMode="Date" control
                DateTime visitDate;

                // Handle HTML5 date input which returns yyyy-MM-dd format
                if (DateTime.TryParse(txtVisitDate.Text, out visitDate))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(@"INSERT INTO tbl_MedicalRecords 
                        (patientID, doctorID, visitDate, diagnosis, prescribedMedications, treatmentNotes, treatmentStatus) 
                        VALUES (@patientID, @doctorID, @visitDate, @diagnosis, @medications, @notes, @status)", con);

                    cmd.Parameters.AddWithValue("@patientID", Convert.ToInt32(ddlPatient.SelectedValue));
                    cmd.Parameters.AddWithValue("@doctorID", Convert.ToInt32(ddlDoctor.SelectedValue));
                    cmd.Parameters.AddWithValue("@visitDate", visitDate);
                    cmd.Parameters.AddWithValue("@diagnosis", txtDiagnosis.Text.Trim());
                    cmd.Parameters.AddWithValue("@medications", txtMedications.Text.Trim());
                    cmd.Parameters.AddWithValue("@notes", txtNotes.Text.Trim());
                    cmd.Parameters.AddWithValue("@status", ddlStatus.SelectedValue);

                    cmd.ExecuteNonQuery();

                    lblMessage.Text = "✅ Medical Record Added Successfully!";
                    lblMessage.CssClass = "text-success";

                    BindGridView();
                    ClearFields();
                }
                else
                {
                    lblMessage.Text = "⚠ Error: Invalid date format.";
                    lblMessage.CssClass = "text-danger";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "⚠ Error: " + ex.Message;
                lblMessage.CssClass = "text-danger";
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                    con.Close();
            }
        }

        protected void gvMedicalRecords_RowEditing(object sender, GridViewEditEventArgs e)
        {

            // Set the edit index
            // Set the edit index
            gvMedicalRecords.EditIndex = e.NewEditIndex;

            // Bind the GridView again to refresh it
            BindGridView();

            // After binding, populate the dropdown lists in the edit row
            GridViewRow row = gvMedicalRecords.Rows[e.NewEditIndex];

            if (row != null)
            {
                // Get the dropdown controls
                DropDownList ddlPatientEdit = (DropDownList)row.FindControl("ddlPatientEdit");
                DropDownList ddlDoctorEdit = (DropDownList)row.FindControl("ddlDoctorEdit");

                // Populate the dropdowns
                if (ddlPatientEdit != null)
                {
                    PopulatePatientDropdown(ddlPatientEdit);
                }

                if (ddlDoctorEdit != null)
                {
                    PopulateDoctorDropdown(ddlDoctorEdit);
                }

                // Get the current values from hidden fields
                HiddenField hdnPatientID = (HiddenField)row.FindControl("hdnPatientID");
                HiddenField hdnDoctorID = (HiddenField)row.FindControl("hdnDoctorID");

                // Set the selected values in the dropdowns
                if (hdnPatientID != null && ddlPatientEdit != null)
                {
                    ddlPatientEdit.SelectedValue = hdnPatientID.Value;
                }

                if (hdnDoctorID != null && ddlDoctorEdit != null)
                {
                    ddlDoctorEdit.SelectedValue = hdnDoctorID.Value;
                }
            }
        }

        protected void gvMedicalRecords_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvMedicalRecords.EditIndex = -1;

            // Rebind the GridView
            BindGridView();
        }

        protected void gvMedicalRecords_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                // Get recordID from DataKeys collection
                int recordID = Convert.ToInt32(gvMedicalRecords.DataKeys[e.RowIndex].Value);

                // Get values from EditItemTemplate controls in the GridView
                GridViewRow row = gvMedicalRecords.Rows[e.RowIndex];

                // Get edited values from the GridView controls
                DropDownList ddlEditPatient = (DropDownList)row.FindControl("ddlEditPatient");
                DropDownList ddlEditDoctor = (DropDownList)row.FindControl("ddlEditDoctor");
                TextBox txtEditVisitDate = (TextBox)row.FindControl("txtEditVisitDate");
                TextBox txtEditDiagnosis = (TextBox)row.FindControl("txtEditDiagnosis");
                TextBox txtEditMedications = (TextBox)row.FindControl("txtEditMedications");
                TextBox txtEditNotes = (TextBox)row.FindControl("txtEditNotes");
                DropDownList ddlEditStatus = (DropDownList)row.FindControl("ddlEditStatus");

                using (SqlCommand cmd = new SqlCommand(@"UPDATE tbl_MedicalRecords 
    SET 
        patientID = @patientID, 
        doctorID = @doctorID, 
        visitDate = @visitDate, 
        diagnosis = @diagnosis, 
        prescribedMedications = @medications, 
        treatmentNotes = @notes, 
        treatmentStatus = @treatmentStatus
    WHERE recordID = @recordID", con))
                {
                    // Safely get values from the grid controls
                    int patientID = ddlEditPatient != null ? Convert.ToInt32(ddlEditPatient.SelectedValue) : 0;
                    int doctorID = ddlEditDoctor != null ? Convert.ToInt32(ddlEditDoctor.SelectedValue) : 0;

                    cmd.Parameters.AddWithValue("@recordID", recordID);
                    cmd.Parameters.AddWithValue("@patientID", patientID);
                    cmd.Parameters.AddWithValue("@doctorID", doctorID);

                    // Add the missing visitDate parameter
                    cmd.Parameters.AddWithValue("@visitDate", txtEditVisitDate != null ?
                        Convert.ToDateTime(txtEditVisitDate.Text) : DateTime.Now);

                    cmd.Parameters.AddWithValue("@diagnosis", txtEditDiagnosis != null ? txtEditDiagnosis.Text.Trim() : "");
                    cmd.Parameters.AddWithValue("@medications", txtEditMedications != null ? txtEditMedications.Text.Trim() : "");
                    cmd.Parameters.AddWithValue("@notes", txtEditNotes != null ? txtEditNotes.Text.Trim() : "");
                    cmd.Parameters.AddWithValue("@treatmentStatus", ddlEditStatus != null ? ddlEditStatus.SelectedValue : "Not Started");

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    // Exit edit mode
                    gvMedicalRecords.EditIndex = -1;
                    lblMessage.Text = "✅ Medical Record Updated Successfully!";
                    lblMessage.CssClass = "text-success";
                    BindGridView();
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "⚠ Error: " + ex.Message;
                lblMessage.CssClass = "text-danger";
            }
        }
        protected void gvMedicalRecords_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int recordID = Convert.ToInt32(gvMedicalRecords.DataKeys[e.RowIndex].Value);
            con.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM tbl_MedicalRecords WHERE recordID=@recordID", con);
            cmd.Parameters.AddWithValue("@recordID", recordID);
            cmd.ExecuteNonQuery();
            con.Close();
            BindGridView();
            lblMessage.Text = "❌ Medical Record Deleted Successfully!";
            lblMessage.CssClass = "text-danger";
        }

        void BindGridView()
        {
            SqlDataAdapter da = new SqlDataAdapter(@"SELECT m.recordID, p.name AS PatientName, d.name AS DoctorName, m.visitDate, m.diagnosis, m.prescribedMedications, m.treatmentNotes, m.treatmentStatus 
                                                    FROM tbl_MedicalRecords m
                                                    INNER JOIN tbl_Patients p ON m.patientID = p.patientID
                                                    INNER JOIN tbl_Doctors d ON m.doctorID = d.doctorID", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvMedicalRecords.DataSource = dt;
            gvMedicalRecords.DataBind();
        }

        void ClearFields()
        {
            ddlPatient.SelectedIndex = 0;
            ddlDoctor.SelectedIndex = 0;
            txtVisitDate.Text = "";
            txtDiagnosis.Text = "";
            txtMedications.Text = "";
            txtNotes.Text = "";
            ddlStatus.SelectedIndex = 0;
        }
        protected void gvMedicalRecords_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Assuming visitDate is in the 4th column (index 3)
                if (e.Row.Cells[3].Text != "&nbsp;" && e.Row.Cells[3].Text != "")
                {
                    DateTime date;
                    if (DateTime.TryParse(e.Row.Cells[3].Text, out date))
                    {
                        e.Row.Cells[3].Text = date.ToString("dd-MM-yyyy");
                    }
                }
            }
        }
        protected void gvMedicalRecords_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvMedicalRecords_DataBound(object sender, EventArgs e)
        {

        }

       
    }
}