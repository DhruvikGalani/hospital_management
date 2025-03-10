using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hospital_management.Admin_Dashbord
{
    
    public partial class billing_details : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGrid();
                LoadPatients();
                LoadAppointments();
            }
        }

        private void LoadPatients()
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "SELECT patientID, name FROM tbl_Patients";
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader reader = cmd.ExecuteReader();

                ddlPatient.DataSource = reader;
                ddlPatient.DataTextField = "name";
                ddlPatient.DataValueField = "patientID";
                ddlPatient.DataBind();

                reader.Close();
            }
        }

        private void LoadAppointments()
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "SELECT appointmentID FROM tbl_Appointments";
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader reader = cmd.ExecuteReader();

                ddlAppointment.DataSource = reader;
                ddlAppointment.DataTextField = "appointmentID";
                ddlAppointment.DataValueField = "appointmentID";
                ddlAppointment.DataBind();

                reader.Close();
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = @"INSERT INTO tbl_Billing (patientID, appointmentID, totalAmount, discounts, paymentMode, paymentStatus, paymentDate) 
                                 VALUES (@patientID, @appointmentID, @totalAmount, @discounts, @paymentMode, @paymentStatus, @paymentDate)";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@patientID", ddlPatient.SelectedValue);
                cmd.Parameters.AddWithValue("@appointmentID", ddlAppointment.SelectedValue);
                cmd.Parameters.AddWithValue("@totalAmount", txtTotalAmount.Text);
                cmd.Parameters.AddWithValue("@discounts", txtDiscounts.Text);
                cmd.Parameters.AddWithValue("@paymentMode", ddlPaymentMode.SelectedValue);
                cmd.Parameters.AddWithValue("@paymentStatus", ddlPaymentStatus.SelectedValue);
                cmd.Parameters.AddWithValue("@paymentDate", txtPaymentDate.Text);

                cmd.ExecuteNonQuery();
            }

            // डेटा ऐड करने के बाद टेक्स्ट बॉक्स क्लियर करें
            txtTotalAmount.Text = "";
            txtDiscounts.Text = "";
            txtPaymentDate.Text = "";

            // ऑप्शन को डिफ़ॉल्ट पर सेट करें
            ddlPatient.SelectedIndex = 0;
            ddlAppointment.SelectedIndex = 0;
            ddlPaymentMode.SelectedIndex = 0;
            ddlPaymentStatus.SelectedIndex = 0;

            // पेज को रीफ्रेश करें (यदि आवश्यक हो)
            Response.Redirect(Request.RawUrl);
        }


        void LoadGrid()
        {
            SqlCommand cmd = new SqlCommand(@"SELECT b.invoiceID, p.name, b.appointmentID, b.totalAmount, b.discounts, b.paymentMode, b.paymentStatus, b.paymentDate 
                                         FROM tbl_Billing b
                                         INNER JOIN tbl_Patients p ON b.patientID = p.patientID", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            LoadGrid();
        }

        protected void GridView1_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            int invoiceID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            string totalAmount = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditAmount")).Text;
            string discounts = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditdiscount")).Text;
            string paymentMode = ((DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlPaymentMode")).SelectedValue;
            string paymentStatus = ((DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlPaymentStatus")).SelectedValue;
            string paymentDate = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditpaymentDate")).Text;

            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE tbl_Billing SET    totalAmount=@totalAmount ,discounts=@discounts,paymentMode=@paymentMode, paymentStatus=@paymentStatus, paymentDate=@paymentDate  WHERE invoiceID=@invoiceID", con);
           cmd.Parameters.AddWithValue("@totalAmount", totalAmount);
            cmd.Parameters.AddWithValue("@discounts", discounts);
            cmd.Parameters.AddWithValue("@paymentMode", paymentMode);
            cmd.Parameters.AddWithValue("@paymentStatus", paymentStatus);
            cmd.Parameters.AddWithValue("@paymentDate", paymentDate);
            cmd.Parameters.AddWithValue("@invoiceID", invoiceID);
            cmd.ExecuteNonQuery();
            con.Close();

            GridView1.EditIndex = -1;
            LoadGrid();
        }

        protected void GridView1_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            LoadGrid();
        }

        protected void GridView1_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int invoiceID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            con.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM tbl_Billing WHERE invoiceID=@invoiceID", con);
            cmd.Parameters.AddWithValue("@invoiceID", invoiceID);
            cmd.ExecuteNonQuery();
            con.Close();

            LoadGrid();
        }
    }

}

