using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace hospital_management.Doctor
{
    public partial class NutritionWellness : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulatePatientDropdown();
                PopulateDoctorDropdown();
                BindGridView();
            }
        }

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

        private void BindGridView()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand(@"SELECT nw.wellnessID, nw.patientID, nw.doctorID, 
                                               p.name AS patientName, d.name as doctorName,
                                               nw.dietPlan, nw.exercisePlan, nw.healthGoals, 
                                               nw.allergies, nw.createdDate, nw.lastUpdated, 
                                               nw.planStatus, nw.notes
                                        FROM tbl_NutritionWellness nw
                                        INNER JOIN tbl_Patients p ON nw.patientID = p.patientID
                                        INNER JOIN tbl_Doctors d ON nw.doctorID = d.doctorID
                                        ORDER BY nw.wellnessID DESC", con))
                {
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    con.Close();

                    GridViewNutrition.DataSource = dt;
                    GridViewNutrition.DataBind();
                }
            }
        }

        protected void btnAddNutrition_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"INSERT INTO tbl_NutritionWellness(
                    patientID, doctorID, dietPlan, exercisePlan, healthGoals, 
                    allergies, createdDate, lastUpdated, planStatus, notes) 
                VALUES(@patientID, @doctorID, @dietPlan, @exercisePlan, @healthGoals, 
                    @allergies, @createdDate, @lastUpdated, @planStatus, @notes)", con);

                cmd.Parameters.AddWithValue("@patientID", ddlPatient.SelectedValue);
                cmd.Parameters.AddWithValue("@doctorID", ddlDoctor.SelectedValue);
                cmd.Parameters.AddWithValue("@dietPlan", txtDietPlan.Text);
                cmd.Parameters.AddWithValue("@exercisePlan", txtExercisePlan.Text);
                cmd.Parameters.AddWithValue("@healthGoals", txtHealthGoals.Text);
                cmd.Parameters.AddWithValue("@allergies", txtAllergies.Text);
                cmd.Parameters.AddWithValue("@createdDate", DateTime.Now);
                cmd.Parameters.AddWithValue("@lastUpdated", DateTime.Now);
                cmd.Parameters.AddWithValue("@planStatus", "Active");
                cmd.Parameters.AddWithValue("@notes", txtNotes.Text);

                cmd.ExecuteNonQuery();
                con.Close();

                lblMessage.Text = "✅ Record Added Successfully";
                lblMessage.CssClass = "text-success";

                // Clear form fields after successful submission
                txtDietPlan.Text = "";
                txtExercisePlan.Text = "";
                txtHealthGoals.Text = "";
                txtAllergies.Text = "";
                txtNotes.Text = "";

                BindGridView();
                ClearFields();


            }
            catch (Exception ex)
            {
                lblMessage.Text = "⚠ Error: " + ex.Message;
                lblMessage.CssClass = "text-danger";
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
        }

        protected void GridViewNutrition_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            // Set the edit index
            // Set the edit index
            GridViewNutrition.EditIndex = e.NewEditIndex;

            // Bind the GridView again to refresh it
            BindGridView();

            // After binding, populate the dropdown lists in the edit row
            GridViewRow row = GridViewNutrition.Rows[e.NewEditIndex];

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

        protected void GridViewNutrition_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            GridViewNutrition.EditIndex = -1;

            // Rebind the GridView
            BindGridView();
        }

        protected void GridViewNutrition_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            try
            {
                // Get the wellnessID from DataKeys
                int wellnessID = Convert.ToInt32(GridViewNutrition.DataKeys[e.RowIndex].Value);

                // Get the row being edited
                GridViewRow row = GridViewNutrition.Rows[e.RowIndex];

                // Get values from EditItemTemplate controls
                DropDownList ddlPatientEdit = (DropDownList)row.FindControl("ddlPatientEdit");
                DropDownList ddlDoctorEdit = (DropDownList)row.FindControl("ddlDoctorEdit");
                TextBox txtDietPlanEdit = (TextBox)row.FindControl("txtDietPlanEdit");
                TextBox txtExercisePlanEdit = (TextBox)row.FindControl("txtExercisePlanEdit");
                TextBox txtHealthGoalsEdit = (TextBox)row.FindControl("txtHealthGoalsEdit");
                TextBox txtAllergiesEdit = (TextBox)row.FindControl("txtAllergiesEdit");
                TextBox txtNotesEdit = (TextBox)row.FindControl("txtNotesEdit");

                // Get values safely
                int patientID = ddlPatientEdit != null ? Convert.ToInt32(ddlPatientEdit.SelectedValue) : 0;
                int doctorID = ddlDoctorEdit != null ? Convert.ToInt32(ddlDoctorEdit.SelectedValue) : 0;
                string dietPlan = txtDietPlanEdit != null ? txtDietPlanEdit.Text.Trim() : "";
                string exercisePlan = txtExercisePlanEdit != null ? txtExercisePlanEdit.Text.Trim() : "";
                string healthGoals = txtHealthGoalsEdit != null ? txtHealthGoalsEdit.Text.Trim() : "";
                string allergies = txtAllergiesEdit != null ? txtAllergiesEdit.Text.Trim() : "";
                string notes = txtNotesEdit != null ? txtNotesEdit.Text.Trim() : "";

                // Update the record in the database
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(@"UPDATE tbl_NutritionWellness 
                SET patientID = @patientID, 
                    doctorID = @doctorID, 
                    dietPlan = @dietPlan, 
                    exercisePlan = @exercisePlan, 
                    healthGoals = @healthGoals, 
                    allergies = @allergies, 
                    lastUpdated = @lastUpdated,
                    notes = @notes
                WHERE wellnessID = @wellnessID", con))
                    {
                        cmd.Parameters.AddWithValue("@wellnessID", wellnessID);
                        cmd.Parameters.AddWithValue("@patientID", patientID);
                        cmd.Parameters.AddWithValue("@doctorID", doctorID);
                        cmd.Parameters.AddWithValue("@dietPlan", dietPlan);
                        cmd.Parameters.AddWithValue("@exercisePlan", exercisePlan);
                        cmd.Parameters.AddWithValue("@healthGoals", healthGoals);
                        cmd.Parameters.AddWithValue("@allergies", allergies);
                        cmd.Parameters.AddWithValue("@lastUpdated", DateTime.Now);
                        cmd.Parameters.AddWithValue("@notes", notes);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }

                // Exit edit mode
                GridViewNutrition.EditIndex = -1;

                // Show success message
                lblMessage.Text = "✅ Nutrition Wellness Record Updated Successfully!";
                lblMessage.CssClass = "text-success";

                // Rebind the GridView
                BindGridView();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "⚠ Error: " + ex.Message;
                lblMessage.CssClass = "text-danger";
            }
        }

        protected void GridViewNutrition_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                // Get the wellnessID from DataKeys
                int wellnessID = Convert.ToInt32(GridViewNutrition.DataKeys[e.RowIndex].Value);

                // Delete the record from the database
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM tbl_NutritionWellness WHERE wellnessID = @wellnessID", con))
                    {
                        cmd.Parameters.AddWithValue("@wellnessID", wellnessID);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }

                // Show success message
                lblMessage.Text = "✅ Nutrition Wellness Record Deleted Successfully!";
                lblMessage.CssClass = "text-success";

                // Rebind the GridView
                BindGridView();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "⚠ Error: " + ex.Message;
                lblMessage.CssClass = "text-danger";
            }
        }

        void ClearFields()
        {
            ddlPatient.SelectedIndex = 0;
            ddlDoctor.SelectedIndex = 0;
            txtDietPlan.Text = "";
            txtHealthGoals.Text = "";
            txtAllergies.Text = "";
            txtNotes.Text = "";
 
        }

    }
    }
