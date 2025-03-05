using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using hospital_management.Admin;

namespace hospital_management.Nurse_dashboard
{
    public partial class billing_manage : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBillingData();
            }
        }

        private void LoadBillingData()
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                string query = @"SELECT B.invoiceID, P.name AS PatientName, B.totalAmount, B.discounts, 
                                B.paymentMode, B.paymentStatus, B.paymentDate 
                                FROM tbl_Billing B 
                                INNER JOIN tbl_Patients P ON B.patientID = P.patientID";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvBilling.DataSource = dt;
                gvBilling.DataBind();
            }
        }
    }
}
