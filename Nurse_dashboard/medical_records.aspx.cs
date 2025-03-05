using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace hospital_management.Nurse_dashboard
{
    public partial class medical_records : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMedicalRecords();
            }
        }

        private void LoadMedicalRecords()
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                string query = @"SELECT M.recordID, P.name AS PatientName, D.name AS DoctorName, 
                                M.visitDate, M.diagnosis, M.prescribedMedications, M.treatmentNotes, M.treatmentStatus
                                FROM tbl_MedicalRecords M 
                                INNER JOIN tbl_Patients P ON M.patientID = P.patientID 
                                INNER JOIN tbl_Doctors D ON M.doctorID = D.doctorID";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvMedicalRecords.DataSource = dt;
                gvMedicalRecords.DataBind();
            }
        }

        protected void gvMedicalRecords_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            gvMedicalRecords.EditIndex = e.NewEditIndex;
            LoadMedicalRecords();
        }

        protected void gvMedicalRecords_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            gvMedicalRecords.EditIndex = -1;
            LoadMedicalRecords();
        }

        protected void gvMedicalRecords_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                int recordID = Convert.ToInt32(gvMedicalRecords.DataKeys[e.RowIndex].Value);

                TextBox txtDiagnosis = (TextBox)gvMedicalRecords.Rows[e.RowIndex].Cells[4].Controls[0];
                TextBox txtMedications = (TextBox)gvMedicalRecords.Rows[e.RowIndex].Cells[5].Controls[0];
                TextBox txtNotes = (TextBox)gvMedicalRecords.Rows[e.RowIndex].Cells[6].Controls[0];
                TextBox txtVisitDate = (TextBox)gvMedicalRecords.Rows[e.RowIndex].FindControl("txtVisitDate");
                DropDownList ddlStatus = (DropDownList)gvMedicalRecords.Rows[e.RowIndex].FindControl("ddlStatus");

                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    string query = @"UPDATE tbl_MedicalRecords SET 
                             diagnosis = @diagnosis, 
                             prescribedMedications = @medications, 
                             treatmentNotes = @notes, 
                             treatmentStatus = @status, 
                             visitDate = @visitDate 
                             WHERE recordID = @recordID";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@diagnosis", txtDiagnosis.Text);
                    cmd.Parameters.AddWithValue("@medications", txtMedications.Text);
                    cmd.Parameters.AddWithValue("@notes", txtNotes.Text);
                    cmd.Parameters.AddWithValue("@status", ddlStatus.SelectedValue);
                    cmd.Parameters.AddWithValue("@visitDate", DateTime.Parse(txtVisitDate.Text));
                    cmd.Parameters.AddWithValue("@recordID", recordID);
                    cmd.ExecuteNonQuery();
                }

                gvMedicalRecords.EditIndex = -1;
                LoadMedicalRecords();
                Response.Write("<script>alert('Medical Record Updated Successfully ✅');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
    }
}

