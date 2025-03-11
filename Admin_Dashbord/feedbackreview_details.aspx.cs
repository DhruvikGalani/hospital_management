using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hospital_management.Admin_Dashbord
{
    public partial class feedbackreview_details : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindDropDownLists();
                BindGridView();
            }
        }

        private void BindDropDownLists()
        {
            using(SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();

                // Bind Patients Dropdown
                SqlDataAdapter daPatients = new SqlDataAdapter("SELECT patientID, name FROM tbl_Patients", con);
                DataTable dtPatients = new DataTable();
                daPatients.Fill(dtPatients);
                ddlPatient.DataSource = dtPatients;
                ddlPatient.DataTextField = "name";
                ddlPatient.DataValueField = "patientID";
                ddlPatient.DataBind();
                ddlPatient.Items.Insert(0, new ListItem("-- Select Patient --", "0"));

                // Bind Doctors Dropdown
                SqlDataAdapter daDoctors = new SqlDataAdapter("SELECT doctorID, name FROM tbl_Doctors", con);
                DataTable dtDoctors = new DataTable();
                daDoctors.Fill(dtDoctors);
                ddlDoctor.DataSource = dtDoctors;
                ddlDoctor.DataTextField = "name";
                ddlDoctor.DataValueField = "doctorID";
                ddlDoctor.DataBind();
                ddlDoctor.Items.Insert(0, new ListItem("-- Select Doctor --", "0"));
            }
        }

        private void BindGridView()
        {
            using(SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"
                    SELECT f.feedbackID, 
                           p.patientID, 
                           p.name AS PatientName, 
                           d.doctorID, 
                           d.name AS DoctorName, 
                           f.visitDate, 
                           f.feedbackText, 
                           f.rating 
                    FROM tbl_FeedbackReview f
                    INNER JOIN tbl_Patients p ON f.patientID = p.patientID
                    INNER JOIN tbl_Doctors d ON f.doctorID = d.doctorID";

                using(SqlCommand cmd = new SqlCommand(query, con))
                {
                    using(SqlDataAdapter da = new SqlDataAdapter(cmd))
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
            if(ddlPatient.SelectedValue == "0" || ddlDoctor.SelectedValue == "0")
            {
                Response.Write("<script>alert('Please select a valid patient and doctor.');</script>");
                return;
            }

            using(SqlConnection con = new SqlConnection(connStr))
            {
                string query = "INSERT INTO tbl_FeedbackReview (patientID, doctorID, visitDate, feedbackText, rating) VALUES (@patientID, @doctorID, @visitDate, @feedbackText, @rating)";
                using(SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@patientID", ddlPatient.SelectedValue);
                    cmd.Parameters.AddWithValue("@doctorID", ddlDoctor.SelectedValue);
                    cmd.Parameters.AddWithValue("@visitDate", txtVisitDate.Text);
                    cmd.Parameters.AddWithValue("@feedbackText", txtFeedback.Text);
                    cmd.Parameters.AddWithValue("@rating", txtRating.Text);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            BindGridView();
            ClearForm();
        }

        private void ClearForm()
        {
            ddlPatient.SelectedIndex = 0;
            ddlDoctor.SelectedIndex = 0;
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

            DropDownList ddlPatientEdit = (DropDownList)row.FindControl("ddlPatientEdit");
            DropDownList ddlDoctorEdit = (DropDownList)row.FindControl("ddlDoctorEdit");
            TextBox txtEditVisitDate = (TextBox)row.FindControl("txtEditVisitDate");
            TextBox txtEditFeedback = (TextBox)row.FindControl("txtEditFeedback");
            TextBox txtEditRating = (TextBox)row.FindControl("txtEditRating");

            using(SqlConnection con = new SqlConnection(connStr))
            {
                string query = "UPDATE tbl_FeedbackReview SET patientID=@patientID, doctorID=@doctorID, visitDate=@visitDate, feedbackText=@feedbackText, rating=@rating WHERE feedbackID=@feedbackID";
                using(SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@feedbackID", feedbackID);
                    cmd.Parameters.AddWithValue("@patientID", ddlPatientEdit.SelectedValue);
                    cmd.Parameters.AddWithValue("@doctorID", ddlDoctorEdit.SelectedValue);
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

            using(SqlConnection con = new SqlConnection(connStr))
            {
                string query = "DELETE FROM tbl_FeedbackReview WHERE feedbackID=@feedbackID";
                using(SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@feedbackID", feedbackID);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            BindGridView();
        }

        protected void GridViewFeedback_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex == GridViewFeedback.EditIndex)
            {
                DropDownList ddlPatientEdit = (DropDownList)e.Row.FindControl("ddlPatientEdit");
                DropDownList ddlDoctorEdit = (DropDownList)e.Row.FindControl("ddlDoctorEdit");

                if(ddlPatientEdit != null)
                {
                    using(SqlConnection con = new SqlConnection(connStr))
                    {
                        SqlDataAdapter da = new SqlDataAdapter("SELECT patientID, name FROM tbl_Patients", con);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        ddlPatientEdit.DataSource = dt;
                        ddlPatientEdit.DataTextField = "name";
                        ddlPatientEdit.DataValueField = "patientID";
                        ddlPatientEdit.DataBind();
                        ddlPatientEdit.SelectedValue = DataBinder.Eval(e.Row.DataItem, "patientID").ToString();
                    }
                }

                if(ddlDoctorEdit != null)
                {
                    using(SqlConnection con = new SqlConnection(connStr))
                    {
                        SqlDataAdapter da = new SqlDataAdapter("SELECT doctorID, name FROM tbl_Doctors", con);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        ddlDoctorEdit.DataSource = dt;
                        ddlDoctorEdit.DataTextField = "name";
                        ddlDoctorEdit.DataValueField = "doctorID";
                        ddlDoctorEdit.DataBind();
                        ddlDoctorEdit.SelectedValue = DataBinder.Eval(e.Row.DataItem, "doctorID").ToString();
                    }
                }
            }
        }
    }
}
