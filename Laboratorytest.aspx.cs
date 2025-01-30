using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hospital_management
{
    public partial class Laboratorytest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                if (!Page.IsPostBack)
                {
                    fnBindTesttype();
                }
        }



            protected void btnSubmit_Click(object sender, EventArgs e)
            {

                try

                {

                    string Testtype = ddlTesttype.SelectedValue;
                    string TestDate = txtTestdate.Text;
                    string ResultDate = txtResultdate.Text;
                    string Result = txtResult.Text;
                    string details = String.Empty;

                    lblDetails.Text =
                                "</br> Testtype : " + Testtype +
                                "</br> TestDate : " + TestDate +
                                "</br> ResultDate : " + ResultDate +
                                "</br> Result : " + Result;

                }
                catch (Exception saveError)
                {
                    Response.Write(saveError.ToString());
                    throw;
                }
            }
            protected void btnReset_Click(object sender, EventArgs e)
            {

                ddlTesttype.ClearSelection();
                txtTestdate.Text = "";
                txtResultdate.Text = "";
                txtResult.Text = "";
                lblDetails.Text = "";
            }

            protected void fnBindTesttype()
            {
                ddlTesttype.Items.Clear();
                ddlTesttype.Items.Add("Blood test");
                ddlTesttype.Items.Add("Urine Test");
                ddlTesttype.Items.Add("X-ray");
                ddlTesttype.Items.Add("MRI");
                ddlTesttype.Items.Add("CT scan");
                ddlTesttype.Items.Add("UltraSound");
                ddlTesttype.Items.Add("ECG ");
                ddlTesttype.Items.Add("Echocardiogram ");
                ddlTesttype.Items.Add("Liver Function Test");
                ddlTesttype.Items.Add("Kidney Function Test ");
                ddlTesttype.Items.Add("Thyroid Function Test ");
                ddlTesttype.Items.Add("Blood Sugar Test ");
                ddlTesttype.Items.Add("Cholesterol Test ");
                ddlTesttype.Items.Add("Allergy Test ");
                ddlTesttype.Items.Add("COVID19 Test ");
                ddlTesttype.Items.Add("Stool Test ");
                ddlTesttype.Items.Add("Culture Test ");
                ddlTesttype.Items.Add("Biopsy ");
                ddlTesttype.Items.Add("Vitamin Level Test ");
                ddlTesttype.Items.Add("Hormonal Test ");



                ddlTesttype.Items.Insert(0, new ListItem("select"));
            }




            protected void ddlTesttype_SelectedIndexChanged(object sender, EventArgs e)
            {
                fnBindTesttype();
            }


        }
    }
