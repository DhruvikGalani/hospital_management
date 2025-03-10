using hospital_management.Patient;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace hospital_management.Admin_Dashbord
{
    public partial class insurance_details : System.Web.UI.Page
    {

        string connStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadInsuranceData();
                LoadPatients();
            }
        }

        void LoadPatients()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT patientID, name FROM tbl_Patients", con);
                con.Open();
                ddlPatient.DataSource = cmd.ExecuteReader();
                ddlPatient.DataTextField = "name";
                ddlPatient.DataValueField = "patientID";
                ddlPatient.DataBind();
            }
        }
        private void LoadInsuranceData()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT i.insuranceID, p.name, i.policyNumber, i.provider, i.coverageDetails, i.claimStatus, i.claimAmount, i.approvalDate, i.policyExpiryDate  FROM tbl_Insurance i INNER JOIN tbl_Patients p ON i.patientID = p.patientID", conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvInsurance.DataSource = dt;
                gvInsurance.DataBind();
            }
        }

        protected void gvInsurance_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvInsurance.EditIndex = e.NewEditIndex;
            LoadInsuranceData();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO tbl_Insurance (patientID, policyNumber, provider, coverageDetails, claimStatus, claimAmount, approvalDate, policyExpiryDate) VALUES (@patientID, @policyNumber, @provider, @coverageDetails, @claimStatus, @claimAmount, @approvalDate, @policyExpiryDate)", con);
                cmd.Parameters.AddWithValue("@patientID", ddlPatient.SelectedValue);
                cmd.Parameters.AddWithValue("@policyNumber", txtPolicyNumber.Text);
                cmd.Parameters.AddWithValue("@provider", txtProvider.Text);
                cmd.Parameters.AddWithValue("@coverageDetails", txtCoverageDetails.Text);
                cmd.Parameters.AddWithValue("@claimStatus", ddlClaimStatus.SelectedValue);
                cmd.Parameters.AddWithValue("@claimAmount", txtClaimAmount.Text);
                cmd.Parameters.AddWithValue("@approvalDate", txtApprovalDate.Text);
                cmd.Parameters.AddWithValue("@policyExpiryDate", txtExpiryDate.Text);

                con.Open();
                cmd.ExecuteNonQuery();
                lblMessage.Text = "✅ Insurance record added successfully!";
                LoadInsuranceData();
            }
        }

        protected void gvInsurance_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int insuranceID = Convert.ToInt32(gvInsurance.DataKeys[e.RowIndex].Value);
            GridViewRow row = gvInsurance.Rows[e.RowIndex];
            string policyNumber = (row.FindControl("txtPolicyNumber") as TextBox).Text;
            string provider = (row.FindControl("txtProvider") as TextBox).Text;
            string coverageDetails = (row.FindControl("txtCoverageDetails") as TextBox).Text;
            string claimStatus = (row.FindControl("ddlClaimStatus") as DropDownList).SelectedValue;
            string claimAmount = (row.FindControl("txtClaimAmount") as TextBox).Text;
            string approvalDate = (row.FindControl("txtEditApprovalDate") as TextBox).Text;
            string policyExpiryDate = (row.FindControl("txtEditPolicyExpiryDate") as TextBox).Text;


            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("UPDATE tbl_Insurance SET policyNumber=@policyNumber, provider=@provider, coverageDetails=@coverageDetails, claimStatus=@claimStatus, claimAmount=@claimAmount, approvalDate=@approvalDate, policyExpiryDate=@policyExpiryDate  WHERE insuranceID=@insuranceID", conn);
                cmd.Parameters.AddWithValue("@insuranceID", insuranceID);
                cmd.Parameters.AddWithValue("@policyNumber", policyNumber);
                cmd.Parameters.AddWithValue("@provider", provider);
                cmd.Parameters.AddWithValue("@coverageDetails", coverageDetails);
                cmd.Parameters.AddWithValue("@claimStatus", claimStatus);
                cmd.Parameters.AddWithValue("@claimAmount", claimAmount);
                cmd.Parameters.AddWithValue("@approvalDate", approvalDate);
                cmd.Parameters.AddWithValue("@policyExpiryDate", policyExpiryDate);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            gvInsurance.EditIndex = -1;
            LoadInsuranceData();
        }

        protected void gvInsurance_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int insuranceID = Convert.ToInt32(gvInsurance.DataKeys[e.RowIndex].Value);
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM tbl_Insurance WHERE insuranceID=@insuranceID", conn);
                cmd.Parameters.AddWithValue("@insuranceID", insuranceID);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            LoadInsuranceData();
        }

        protected void gvInsurance_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvInsurance.EditIndex = -1;
            LoadInsuranceData();
        }
    }

}
