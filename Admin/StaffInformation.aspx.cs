using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace hospital_management
{
    public partial class StaffInformation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        

      

        protected void btnsubmit_Click(object sender, EventArgs e)
        {

        }

        protected void btnreset_Click(object sender, EventArgs e)
        {

            Texid.Text = "";
            Texname.Text = "";
            ddlrole.ClearSelection();
            Textnumber.Text = "";
            Textemail.Text = "";
            Cblshift.ClearSelection();
        }
    }
}