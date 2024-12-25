using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hospital_management.Patient
{
    public partial class FeedbackReview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            lblDetails.Text = "";
            try
            {
                string Pname = txtPatientname.Text;
                string VisitDate = txtVisitdate.Text;
                string Feedback = txtFeedback.Text;

                lblDetails.Text = "</br> Patient Name : " + Pname +
                                 "</br> VisitDate :" + VisitDate +
                                 "</br> Feedback :" + Feedback; 

            }


            catch (Exception saveError)
            {
                Response.Write(saveError.ToString());
                throw;
            }
        }


        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtPatientname.Text = "";
            txtVisitdate.Text = "";
            txtFeedback.Text = "";
            lblDetails.Text = "";
        }
    }
}