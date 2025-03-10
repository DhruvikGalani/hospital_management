using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Web.UI;

namespace hospital_management.Nurse_dashboard
{
    public partial class Emergency_details : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
                BindPatientID();
                BindAmbulanceID();
            }
        }
        protected void ddlPatientID_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Fetch patient name based on selected patient ID
            SqlCommand cmd = new SqlCommand("SELECT name FROM tbl_Patients WHERE patientID = @patientID", con);
            cmd.Parameters.AddWithValue("@patientID", ddlPatientID.SelectedValue);

            con.Open();
            object result = cmd.ExecuteScalar();
            con.Close();

            if(result != null)
            {
                ViewState["SelectedPatientName"] = result.ToString(); // Store in ViewState for later use
            }
        }

      protected void btnAddEmergency_Click(object sender, EventArgs e)
{
    try
    {
        string patientName = "Unknown";
        SqlCommand cmdPatient = new SqlCommand("SELECT name FROM tbl_Patients WHERE patientID = @patientID", con);
        cmdPatient.Parameters.AddWithValue("@patientID", ddlPatientID.SelectedValue);
        con.Open();
        object result = cmdPatient.ExecuteScalar();
        if (result != null)
            patientName = result.ToString();
        con.Close();

        con.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO tbl_EmergencyManagement(patientID, ambulanceID, patientName, contactNumber, reportedSymptoms, location, arrivalTime) VALUES (@patientID, @ambulanceID, @patientName, @contactNumber, @reportedSymptoms, @location, @arrivalTime)", con);
        cmd.Parameters.AddWithValue("@patientID", ddlPatientID.SelectedValue);
        cmd.Parameters.AddWithValue("@ambulanceID", ddlAmbulanceID.SelectedValue);
        cmd.Parameters.AddWithValue("@patientName", patientName);
        cmd.Parameters.AddWithValue("@contactNumber", txtContactNumber.Text);
        cmd.Parameters.AddWithValue("@reportedSymptoms", txtReportedSymptoms.Text);
        cmd.Parameters.AddWithValue("@location", txtLocation.Text);
       cmd.Parameters.AddWithValue("@arrivalTime", DateTime.Parse(txtArrivalTime.Text));

        cmd.ExecuteNonQuery();
        con.Close();

        lblMessage.Text = "🚨 Emergency Case Added Successfully!";
        lblMessage.CssClass = "text-success";
        BindGridView();
        ClearFields();
    }
    catch (Exception ex)
    {
        lblMessage.Text = "⚠️ Error: " + ex.Message;
        lblMessage.CssClass = "text-danger";
    }
}


        protected void gvEmergency_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                int emergencyCaseID = Convert.ToInt32(gvEmergency.DataKeys[e.RowIndex].Value);
                GridViewRow row = gvEmergency.Rows[e.RowIndex];

                TextBox txtContact = row.FindControl("txtContactNumberEdit") as TextBox;
                TextBox txtLocation = row.FindControl("txtLocationEdit") as TextBox;
                TextBox txtArrival = row.FindControl("txtArrivalTimeEdit") as TextBox;

                string query = "UPDATE tbl_EmergencyManagement SET contactNumber=@contactNumber, location=@location, arrivalTime=@arrivalTime WHERE emergencyCaseID=@emergencyCaseID";
                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@contactNumber", txtContact.Text);
                cmd.Parameters.AddWithValue("@location", txtLocation.Text);
                cmd.Parameters.AddWithValue("@arrivalTime", txtArrival.Text);
                cmd.Parameters.AddWithValue("@emergencyCaseID", emergencyCaseID);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                gvEmergency.EditIndex = -1;
                BindGridView();

                lblMessage.Text = "✅ Emergency Case Updated Successfully!";
                lblMessage.CssClass = "text-success";
            }
            catch(Exception ex)
            {
                lblMessage.Text = "⚠️ Error: " + ex.Message;
                lblMessage.CssClass = "text-danger";
            }
        }

        void BindPatientID()
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT patientID, name FROM tbl_Patients", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddlPatientID.DataSource = dt;
            ddlPatientID.DataTextField = "name";
            ddlPatientID.DataValueField = "patientID";
            ddlPatientID.DataBind();
            ddlPatientID.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select Patient--", "0"));
        }

        void BindAmbulanceID()
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT ambulanceID,driverName FROM tbl_Ambulances", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddlAmbulanceID.DataSource = dt;
            ddlAmbulanceID.DataTextField = "driverName";
            ddlAmbulanceID.DataValueField = "ambulanceID";
            ddlAmbulanceID.DataBind();
            ddlAmbulanceID.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select Ambulance--", "0"));
        }

        
        protected void gvEmergency_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvEmergency.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        protected void gvEmergency_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvEmergency.EditIndex = -1;
            BindGridView();
        }

        

        protected void gvEmergency_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int emergencyCaseID = Convert.ToInt32(gvEmergency.DataKeys[e.RowIndex].Value);

            con.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM tbl_EmergencyManagement WHERE emergencyCaseID=@ID", con);
            cmd.Parameters.AddWithValue("@ID", emergencyCaseID);
            cmd.ExecuteNonQuery();
            con.Close();

            BindGridView();
            lblMessage.Text = "❌ Emergency Case Deleted Successfully!";
            lblMessage.CssClass = "text-danger";
        }


        void BindGridView()
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM tbl_EmergencyManagement", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvEmergency.DataSource = dt;
            gvEmergency.DataBind();
        }
        protected void gvEmergency_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState & DataControlRowState.Edit) > 0)
            {
                // Get the dropdown
                DropDownList ddlPatientNameEdit = (DropDownList)e.Row.FindControl("ddlPatientNameEdit");
                if(ddlPatientNameEdit != null)
                {
                    // Fetch all patients for dropdown
                    SqlDataAdapter da = new SqlDataAdapter("SELECT patientID, name FROM tbl_Patients", con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    ddlPatientNameEdit.DataSource = dt;
                    ddlPatientNameEdit.DataTextField = "name";
                    ddlPatientNameEdit.DataValueField = "patientID";
                    ddlPatientNameEdit.DataBind();

                    // Get the currently bound patientID
                    string selectedPatientID = DataBinder.Eval(e.Row.DataItem, "patientID").ToString();

                    // Set the selected value
                    ddlPatientNameEdit.SelectedValue = selectedPatientID;
                }
            }
        }

        void ClearFields()
        {
            //txtPatientName.Text = "";
            txtContactNumber.Text = "";
            txtReportedSymptoms.Text = "";
            txtLocation.Text = "";
            txtArrivalTime.Text = "";
            ddlPatientID.SelectedIndex = 0;
            ddlAmbulanceID.SelectedIndex = 0;
        }
    }
}
