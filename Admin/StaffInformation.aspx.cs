using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
<<<<<<< HEAD

namespace hospital_management.Admin
=======
using System.Xml.Linq;

namespace hospital_management
>>>>>>> ad7b026b0d8ce3bedb04ace25f41dd50cc5e226b
{
    public partial class StaffInformation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

<<<<<<< HEAD
        protected void btnSubmit_Click(object sender, EventArgs e)
=======
        

      

        protected void btnsubmit_Click(object sender, EventArgs e)
>>>>>>> ad7b026b0d8ce3bedb04ace25f41dd50cc5e226b
        {

        }

<<<<<<< HEAD
        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            rblGender.ClearSelection();
            txtAddress.Text = "";
            ddlRole.ClearSelection();
            ddlShift.ClearSelection();
            txtEmail.Text = "";
            txtNumber.Text = "";
            calJoiningdate.NextMonthText = "";
            txtSalary.Text = "";

=======
        protected void btnreset_Click(object sender, EventArgs e)
        {

            Texid.Text = "";
            Texname.Text = "";
            ddlrole.ClearSelection();
            Textnumber.Text = "";
            Textemail.Text = "";
            Cblshift.ClearSelection();
>>>>>>> ad7b026b0d8ce3bedb04ace25f41dd50cc5e226b
        }
    }
}