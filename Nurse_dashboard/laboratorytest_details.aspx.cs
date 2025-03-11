    using System;
    using System.Data;
    using System.Data.SqlClient;
    using System.Configuration;
    using System.Web.UI.WebControls;
    using System.Web.UI;

    namespace hospital_management.Nurse_dashboard
    {
        public partial class laboratorytest_details : System.Web.UI.Page
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);

            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    BindPatients();
                    BindTestTypes();
                    BindLabTestData();
                }
            }

            void BindPatients()
            {
                using (SqlDataAdapter da = new SqlDataAdapter("SELECT patientID, name FROM tbl_Patients", con))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    ddlPatientID.DataSource = dt;
                    ddlPatientID.DataTextField = "name";
                    ddlPatientID.DataValueField = "patientID";
                    ddlPatientID.DataBind();
                }
                ddlPatientID.Items.Insert(0, new ListItem("--Select Patient--", "0"));
            }

            void BindTestTypes()
            {
                ddlTestType.Items.Clear();
                string[] testTypes = {
                    "Blood test", "Urine Test", "X-ray", "MRI", "CT scan", "UltraSound", "ECG",
                    "Echocardiogram", "Liver Function Test", "Kidney Function Test", "Thyroid Function Test",
                    "Blood Sugar Test", "Cholesterol Test", "Allergy Test", "COVID19 Test",
                    "Stool Test", "Culture Test", "Biopsy", "Vitamin Level Test", "Hormonal Test"
                };

                foreach (var type in testTypes)
                {
                    ddlTestType.Items.Add(new ListItem(type, type));
                }

                ddlTestType.Items.Insert(0, new ListItem("--Select Test Type--", "0"));
            }

            protected void btnAddTest_Click(object sender, EventArgs e)
            {
                try
                {
                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString))
                    {
                        con.Open();
                        using (SqlCommand cmd = new SqlCommand("INSERT INTO tbl_LaboratoryTests (patientID, testType, testDate, resultDate, technicianName, results) VALUES (@patientID, @testType, @testDate, @resultDate, @technicianName, @results)", con))
                        {
                            cmd.Parameters.AddWithValue("@patientID", ddlPatientID.SelectedValue);
                            cmd.Parameters.AddWithValue("@testType", ddlTestType.SelectedValue);
                            cmd.Parameters.AddWithValue("@testDate", txtTestDate.Text);
                            cmd.Parameters.AddWithValue("@resultDate", Convert.ToDateTime(txtResultDate.Text));
                            cmd.Parameters.AddWithValue("@technicianName", txtTechnicianName.Text);
                            cmd.Parameters.AddWithValue("@results", txtResults.Text);
                            cmd.ExecuteNonQuery();
                        }
                    }
                    lblMessage.Text = "✅ Test Added Successfully!";
                    lblMessage.CssClass = "text-success";
                    BindLabTestData();
                    ClearFields();
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "⚠️ Error: " + ex.Message;
                    lblMessage.CssClass = "text-danger";
                }
            }

            protected void gvLabTests_RowEditing(object sender, GridViewEditEventArgs e)
            {
                gvLabTests.EditIndex = e.NewEditIndex;
                BindLabTestData(); // Refresh the GridView
            }

            protected void gvLabTests_RowUpdating(object sender, GridViewUpdateEventArgs e)
            {
                int testID = Convert.ToInt32(gvLabTests.DataKeys[e.RowIndex].Value);
                DropDownList ddlTestType = (DropDownList)gvLabTests.Rows[e.RowIndex].FindControl("ddlTestType");
                string txtTestDate = ((TextBox)gvLabTests.Rows[e.RowIndex].FindControl("txtEdittestDate")).Text;
                string txtResultDate = ((TextBox)gvLabTests.Rows[e.RowIndex].FindControl("txtEditresultDate")).Text;
                string txtTechnicianName = ((TextBox)gvLabTests.Rows[e.RowIndex].FindControl("txtTechnicianName")).Text;
                string txtResults = ((TextBox)gvLabTests.Rows[e.RowIndex].FindControl("txtResults")).Text;

                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE tbl_LaboratoryTests SET testType=@testType,testDate=@testDate, resultDate=@resultDate, technicianName=@technicianName, results=@results WHERE testID=@testID", con);
                    cmd.Parameters.AddWithValue("@testID", testID);
                    cmd.Parameters.AddWithValue("@testType", ddlTestType.SelectedValue);
                    cmd.Parameters.AddWithValue("@testDate", txtTestDate);
                    cmd.Parameters.AddWithValue("@resultDate", txtResultDate);
                    cmd.Parameters.AddWithValue("@technicianName", txtTechnicianName);
                    cmd.Parameters.AddWithValue("@results", txtResults);

                    cmd.ExecuteNonQuery();
                }
                gvLabTests.EditIndex = -1;
                BindLabTestData();
                lblMessage.Text = "✅ Test Updated Successfully!";
                lblMessage.CssClass = "text-success";
            }

            protected void gvLabTests_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
            {
                gvLabTests.EditIndex = -1;
                BindLabTestData();
            }


            public void BindLabTestData()
            {
               using (SqlDataAdapter da = new SqlDataAdapter(
    "SELECT lt.testID, p.name AS patientName, lt.testType, lt.testDate, lt.resultDate, lt.technicianName, lt.results " +
    "FROM tbl_LaboratoryTests lt " +
    "INNER JOIN tbl_Patients p ON lt.patientID = p.patientID", con))

                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    gvLabTests.DataSource = dt;
                    gvLabTests.DataBind();
                }
            }
            protected void gvLabTests_RowDeleting(object sender, GridViewDeleteEventArgs e)
            {
                int testID = Convert.ToInt32(gvLabTests.DataKeys[e.RowIndex].Value);

                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("DELETE FROM tbl_LaboratoryTests WHERE testID=@testID", con);
                    cmd.Parameters.AddWithValue("@testID", testID);
                    cmd.ExecuteNonQuery();
                }
                lblMessage.Text = "✅ Test Deleted Successfully!";
                lblMessage.CssClass = "text-danger";
                BindLabTestData(); // Refresh GridView after deleting
            }


            void ClearFields()
            {
                ddlPatientID.SelectedIndex = 0;
                ddlTestType.SelectedIndex = 0;
                txtTestDate.Text = "";
                txtResultDate.Text = "";
                txtTechnicianName.Text = "";
                txtResults.Text = "";
            }
        }
    }
