using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace hospital_management.Patient
{
    public partial class Insurance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            lblDetails.Text = "";
            try
            {
                string policynumber = txtPolicynumber.Text;
                string Provide = txtProvide.Text;
                string Claimstatus = rblClaimstatus.SelectedValue;
                string Coverage = txtCoverage.Text;
                string Claim = txtClaim.Text;
                string approvaldate = txtApprovaldate.Text;
                string expirydate = txtExpirydate.Text;


                lblDetails.Text = "</br> policynumber : " + policynumber +
                                    "</br> Provider name" + Provide +
                                    "</br>  Claimstatus" + Claimstatus +
                                    "</br> Coverage" + Coverage +
                                    "</br> Claim ammount" + Claim +
                                    "</br> approvaldate" + approvaldate +
                                    "</br> expirydate:" + expirydate;
            }
            catch (Exception SaveError)
            {
                Response.Write(SaveError.ToString());
                throw;
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtPolicynumber.Text = "";
            txtProvide.Text = "";
            txtCoverage.Text = "";
            txtApprovaldate.Text = "";
            txtExpirydate.Text = "";
            rblClaimstatus.ClearSelection();
            txtClaim.Text = " ";
            lblDetails.Text = "";
        }
    }
}