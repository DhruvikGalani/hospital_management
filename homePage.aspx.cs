//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;

//namespace hospital_management
//{
//    public partial class homePage : System.Web.UI.Page
//    {

//        protected void Page_Load(object sender, EventArgs e)
//        {

//        }

//    }
//}

using System;
using System.Web;

namespace hospital_management
{
    public partial class homePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                // Check if the user is logged in
                if(Session["UserType"] != null && Session["UserType"].ToString() == "Patient")
                {
                    // Ensure Patient Name and Profile Picture exist in session
                    if(Session["PatientName"] == null)
                    {
                        Session["PatientName"] = "Guest"; // Default name if missing
                    }
                    if(Session["PatientProfilePicture"] == null)
                    {
                        Session["PatientProfilePicture"] = "~/Images/default.png"; // Default profile picture
                    }
                }
            }
        }
    }
}
