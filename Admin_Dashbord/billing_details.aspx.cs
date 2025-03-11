
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hospital_management.Admin_Dashbord
{
    public partial class billing_details : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadPatients();
                LoadGrid();
            }
        }

        private void LoadPatients()
        {
            using(SqlCommand cmd = new SqlCommand("SELECT DISTINCT p.patientID, p.name FROM tbl_Patients p INNER JOIN tbl_Appointments a ON p.patientID = a.patientID", con))
            {
                con.Open();
                ddlPatient.DataSource = cmd.ExecuteReader();
                ddlPatient.DataTextField = "name";
                ddlPatient.DataValueField = "patientID";
                ddlPatient.DataBind();
                con.Close();
            }
            ddlPatient.Items.Insert(0, new ListItem("-- Select Patient --", "0"));
        }

        protected void ddlPatient_SelectedIndexChanged(object sender, EventArgs e)
        {
            int patientID = Convert.ToInt32(ddlPatient.SelectedValue);
            if(patientID > 0)
            {
                using(SqlCommand cmd = new SqlCommand("SELECT TOP 1 appointmentID, appointmentDateTime FROM tbl_Appointments WHERE patientID = @patientID ORDER BY appointmentDateTime DESC", con))
                {
                    cmd.Parameters.AddWithValue("@patientID", patientID);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if(reader.Read())
                    {
                        hfAppointmentID.Value = reader["appointmentID"].ToString();
                        txtAppointmentDate.Text = Convert.ToDateTime(reader["appointmentDateTime"]).ToString("yyyy-MM-dd HH:mm");
                    }
                    else
                    {
                        hfAppointmentID.Value = "0";
                        txtAppointmentDate.Text = "No Appointment Found";
                    }
                    con.Close();
                }
            }
        }

        private void LoadGrid()
        {
            string query = @"
                SELECT b.invoiceID, 
                       p.name AS PatientName, 
                       a.appointmentDateTime, 
                       b.totalAmount, 
                       b.discounts, 
                       b.paymentMode, 
                       b.paymentStatus, 
                       b.paymentDate
                FROM tbl_Billing b
                INNER JOIN tbl_Appointments a ON b.appointmentID = a.appointmentID
                INNER JOIN tbl_Patients p ON a.patientID = p.patientID";

            using(SqlCommand cmd = new SqlCommand(query, con))
            {
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            if(ddlPatient.SelectedValue == "0" || hfAppointmentID.Value == "0")
            {
                Response.Write("<script>alert('Please select a valid patient with an appointment.');</script>");
                return;
            }

            using(SqlCommand cmd = new SqlCommand(@"
                INSERT INTO tbl_Billing (patientID, appointmentID, totalAmount, discounts, paymentMode, paymentStatus, paymentDate) 
                VALUES (@patientID, @appointmentID, @totalAmount, @discounts, @paymentMode, @paymentStatus, @paymentDate)", con))
            {
                cmd.Parameters.AddWithValue("@patientID", ddlPatient.SelectedValue);
                cmd.Parameters.AddWithValue("@appointmentID", hfAppointmentID.Value);
                cmd.Parameters.AddWithValue("@totalAmount", txtTotalAmount.Text);
                cmd.Parameters.AddWithValue("@discounts", txtDiscounts.Text);
                cmd.Parameters.AddWithValue("@paymentMode", ddlPaymentMode.SelectedValue);
                cmd.Parameters.AddWithValue("@paymentStatus", ddlPaymentStatus.SelectedValue);
                cmd.Parameters.AddWithValue("@paymentDate", txtPaymentDate.Text);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            ClearFields();
            LoadGrid();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            LoadGrid();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int invoiceID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            GridViewRow row = GridView1.Rows[e.RowIndex];

            string totalAmount = ((TextBox)row.FindControl("txtEditAmount")).Text;
            string discounts = ((TextBox)row.FindControl("txtEditDiscount")).Text;
            string paymentMode = ((DropDownList)row.FindControl("ddlPaymentMode")).SelectedValue;
            string paymentStatus = ((DropDownList)row.FindControl("ddlPaymentStatus")).SelectedValue;
            string paymentDate = ((TextBox)row.FindControl("txtEditPaymentDate")).Text;

            using(SqlCommand cmd = new SqlCommand(@"
                UPDATE tbl_Billing 
                SET totalAmount = @totalAmount, 
                    discounts = @discounts, 
                    paymentMode = @paymentMode, 
                    paymentStatus = @paymentStatus, 
                    paymentDate = @paymentDate 
                WHERE invoiceID = @invoiceID", con))
            {
                cmd.Parameters.AddWithValue("@invoiceID", invoiceID);
                cmd.Parameters.AddWithValue("@totalAmount", totalAmount);
                cmd.Parameters.AddWithValue("@discounts", discounts);
                cmd.Parameters.AddWithValue("@paymentMode", paymentMode);
                cmd.Parameters.AddWithValue("@paymentStatus", paymentStatus);
                cmd.Parameters.AddWithValue("@paymentDate", paymentDate);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            GridView1.EditIndex = -1;
            LoadGrid();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            LoadGrid();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int invoiceID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            using(SqlCommand cmd = new SqlCommand("DELETE FROM tbl_Billing WHERE invoiceID=@invoiceID", con))
            {
                cmd.Parameters.AddWithValue("@invoiceID", invoiceID);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            LoadGrid();
        }

        private void ClearFields()
        {
            ddlPatient.SelectedIndex = 0;
            txtAppointmentDate.Text = "";
            txtTotalAmount.Text = "";
            txtDiscounts.Text = "";
            ddlPaymentMode.SelectedIndex = 0;
            ddlPaymentStatus.SelectedIndex = 0;
            txtPaymentDate.Text = "";
        }
    }
}
