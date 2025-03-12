using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hospital_management.Nurse_dashboard
{
    public partial class nurse_logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Clear all session variables
            Session.Clear();  // Clears the current session values
            Session.Abandon(); // Destroys the session

            // Redirect to login page
            Response.Redirect("~/pages/LoginPage.aspx");
        }
    }
}