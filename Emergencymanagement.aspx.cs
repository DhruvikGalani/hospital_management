using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hospital_management
{
    public partial class Emergencymanagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                if (!Page.IsPostBack)
                {

                }
            }



            protected void btnSubmit_Click(object sender, EventArgs e)
            {

                try

                {

                    string Patientname = txtPatientname.Text;
                    string comtactnumber = txtContactnumber.Text;
                    string symptoms = txtSymptoms.Text;
                    string location = txtLocation.Text;
                    string Ambulaneid = txtAmbulanceid.Text;
                    string Drivername = txtDrivername.Text;
                    string Arrivaltime = txtArrivaltime.Text;


                    lblDetails.Text =
                                "</br> Patientname : " + Patientname +
                                "</br> comtactnumber : " + comtactnumber +
                                "</br> symptoms : " + symptoms +
                                "</br> location : " + location +
                                "</br> Ambulaneid : " + Ambulaneid +
                                "</br> Drivername : " + Drivername +
                                  "</br> Arrivaltime : " + Arrivaltime;



                }
                catch (Exception saveError)
                {
                    Response.Write(saveError.ToString());
                    throw;
                }
            }
            protected void btnReset_Click(object sender, EventArgs e)
            {
                txtPatientname.Text = " ";
                txtContactnumber.Text = "";
                txtSymptoms.Text = "";
                txtLocation.Text = "";
                txtAmbulanceid.Text = "";
                txtDrivername.Text = "";
                txtArrivaltime.Text = "";
                lblDetails.Text = "";
            }







        }
    }
