using System;
using System.Web;
using System.Web.UI;

namespace hospital_management.Nurse_dashboard
{
    public partial class Nurse_homepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["NurseID"] == null)
            {
                Response.Redirect("~/pages/LoginPage.aspx");
            }
        }
    }
}
