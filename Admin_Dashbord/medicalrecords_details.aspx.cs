using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace hospital_management.Admin_Dashbord
{
    public partial class medicalrecords_details : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
                BindPatient();
                BindDoctor();
            }
        }

        void BindPatient()
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT patientID, name FROM tbl_Patients", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddlPatient.DataSource = dt;
            ddlPatient.DataTextField = "name";
            ddlPatient.DataValueField = "patientID";
            ddlPatient.DataBind();
            ddlPatient.Items.Insert(0, new ListItem("--Select Patient--", "0"));
        }

        void BindDoctor()
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT doctorID, name FROM tbl_Doctors", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddlDoctor.DataSource = dt;
            ddlDoctor.DataTextField = "name";
            ddlDoctor.DataValueField = "doctorID";
            ddlDoctor.DataBind();
            ddlDoctor.Items.Insert(0, new ListItem("--Select Doctor--", "0"));
        }

        protected void btnAddMedicalRecord_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO tbl_MedicalRecords(patientID, doctorID, visitDate, diagnosis, prescribedMedications, treatmentNotes, treatmentStatus) VALUES (@patientID, @doctorID, @visitDate, @diagnosis, @medications, @notes, @status)", con);
                cmd.Parameters.AddWithValue("@patientID", ddlPatient.SelectedValue);
                cmd.Parameters.AddWithValue("@doctorID", ddlDoctor.SelectedValue);
                cmd.Parameters.AddWithValue("@visitDate", txtVisitDate.Text);
                cmd.Parameters.AddWithValue("@diagnosis", txtDiagnosis.Text);
                cmd.Parameters.AddWithValue("@medications", txtMedications.Text);
                cmd.Parameters.AddWithValue("@notes", txtNotes.Text);
                cmd.Parameters.AddWithValue("@status", ddlStatus.SelectedValue);
                cmd.ExecuteNonQuery();

                lblMessage.Text = "✅ Medical Record Added Successfully!";
                lblMessage.CssClass = "text-success";
                BindGridView();
                ClearFields();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "⚠ Error: " + ex.Message;
                lblMessage.CssClass = "text-danger";
            }
            finally
            {
                con.Close();
            }
        }

        protected void gvMedicalRecords_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvMedicalRecords.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        protected void gvMedicalRecords_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvMedicalRecords.EditIndex = -1;
            BindGridView();
        }

        protected void gvMedicalRecords_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                int recordID = Convert.ToInt32(gvMedicalRecords.DataKeys[e.RowIndex].Value);
                GridViewRow row = gvMedicalRecords.Rows[e.RowIndex];

                TextBox txtVisitDate = (TextBox)row.FindControl("txtVisitDateEdit");
                TextBox txtDiagnosis = (TextBox)row.FindControl("txtDiagnosisEdit");
                TextBox txtMedications = (TextBox)row.FindControl("txtMedicationsEdit");
                TextBox txtNotes = (TextBox)row.FindControl("txtNotesEdit");
                DropDownList ddlStatus = (DropDownList)row.FindControl("ddlStatusEdit");

                con.Open();
                SqlCommand cmd = new SqlCommand(@"UPDATE tbl_MedicalRecords 
                                          SET visitDate=@visitDate, diagnosis=@diagnosis, 
                                              prescribedMedications=@medications, treatmentNotes=@notes, 
                                              treatmentStatus=@status 
                                          WHERE recordID=@recordID", con);

                cmd.Parameters.AddWithValue("@visitDate", txtVisitDate.Text);
                cmd.Parameters.AddWithValue("@diagnosis", txtDiagnosis.Text);
                cmd.Parameters.AddWithValue("@medications", txtMedications.Text);
                cmd.Parameters.AddWithValue("@notes", txtNotes.Text);
                cmd.Parameters.AddWithValue("@status", ddlStatus.SelectedValue);
                cmd.Parameters.AddWithValue("@recordID", recordID);

                cmd.ExecuteNonQuery();
                con.Close();

                gvMedicalRecords.EditIndex = -1;
                BindGridView();

                lblMessage.Text = "✅ Medical Record Updated Successfully!";
                lblMessage.CssClass = "text-success";
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
    }
}