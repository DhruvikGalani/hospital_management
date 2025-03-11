using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Reflection;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hospital_management.Admin_Dashbord
{
    public partial class feedbackreview_details : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDropDownLists();
                BindGridView();
            }
        }

        private void BindDropDownLists()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();

                SqlDataAdapter daPatients = new SqlDataAdapter("SELECT patientID, name FROM tbl_Patients", con);
                DataTable dtPatients = new DataTable();
                daPatients.Fill(dtPatients);
                ddlPatient.DataSource = dtPatients;
                ddlPatient.DataTextField = "name";
                ddlPatient.DataValueField = "patientID";
                ddlPatient.DataBind();

                SqlDataAdapter daDoctors = new SqlDataAdapter("SELECT doctorID, name FROM tbl_Doctors", con);
                DataTable dtDoctors = new DataTable();
                daDoctors.Fill(dtDoctors);
                ddlDoctor.DataSource = dtDoctors;
                ddlDoctor.DataTextField = "name";
                ddlDoctor.DataValueField = "doctorID";
                ddlDoctor.DataBind();

                SqlDataAdapter daStaffs = new SqlDataAdapter("SELECT staffID, fullName FROM tbl_StaffInformation", con);
                DataTable dtStaffs = new DataTable();
                daStaffs.Fill(dtStaffs);
                ddlStaff.DataSource = dtStaffs;
                ddlStaff.DataTextField = "fullName";
                ddlStaff.DataValueField = "staffID";
                ddlStaff.DataBind();
            }
        }

        private void BindGridView()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"SELECT f.feedbackID, 
                        p.name AS patientID, 
                        d.name AS doctorID, 
                        s.fullName AS staffID,
                        f.visitDate, 
                        f.feedbackText, 
                        f.rating 
                 FROM tbl_FeedbackReview f
                 INNER JOIN tbl_Patients p ON f.patientID = p.patientID
                 INNER JOIN tbl_Doctors d ON f.doctorID = d.doctorID
                 INNER JOIN tbl_StaffInformation s ON f.staffID = s.staffID";


                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        GridViewFeedback.DataSource = dt;
                        GridViewFeedback.DataBind();
                    }
                }
            }
        }



        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "INSERT INTO tbl_FeedbackReview (patientID, doctorID, staffID, visitDate, feedbackText, rating) VALUES (@patientID, @doctorID, @staffID, @visitDate, @feedbackText, @rating)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@patientID", ddlPatient.SelectedValue);
                    cmd.Parameters.AddWithValue("@doctorID", ddlDoctor.SelectedValue);
                    cmd.Parameters.AddWithValue("@staffID", ddlStaff.SelectedValue);
                    cmd.Parameters.AddWithValue("@visitDate", txtVisitDate.Text);
                    cmd.Parameters.AddWithValue("@feedbackText", txtFeedback.Text);
                    cmd.Parameters.AddWithValue("@rating", txtRating.Text);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    BindGridView();
                    ClearForm();
                }

            }
        }
        private void ClearForm()
        {
            ddlPatient.SelectedIndex = 0;
            ddlDoctor.SelectedIndex = 0;
            ddlStaff.SelectedIndex = 0;
            txtVisitDate.Text = "";
            txtFeedback.Text = "";
            txtRating.Text = "";
        }
        protected void GridViewFeedback_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewFeedback.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        protected void GridViewFeedback_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridViewFeedback.Rows[e.RowIndex];
            int feedbackID = Convert.ToInt32(GridViewFeedback.DataKeys[e.RowIndex].Value);

            TextBox txtEditVisitDate = row.FindControl("txtEditVisitDate") as TextBox;
            TextBox txtEditFeedback = row.FindControl("txtEditFeedback") as TextBox;
            TextBox txtEditRating = row.FindControl("txtEditRating") as TextBox;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "UPDATE tbl_FeedbackReview SET visitDate=@visitDate, feedbackText=@feedbackText, rating=@rating WHERE feedbackID=@feedbackID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@feedbackID", feedbackID);
                    cmd.Parameters.AddWithValue("@visitDate", txtEditVisitDate.Text);
                    cmd.Parameters.AddWithValue("@feedbackText", txtEditFeedback.Text);
                    cmd.Parameters.AddWithValue("@rating", txtEditRating.Text);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            GridViewFeedback.EditIndex = -1;
            BindGridView();
        }

        protected void GridViewFeedback_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewFeedback.EditIndex = -1;
            BindGridView();
        }

        protected void GridViewFeedback_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int feedbackID = Convert.ToInt32(GridViewFeedback.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "DELETE FROM tbl_FeedbackReview WHERE feedbackID=@feedbackID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@feedbackID", feedbackID);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            BindGridView();
        }
    }
}
