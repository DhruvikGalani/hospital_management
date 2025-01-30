using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hospital_management
{
    public partial class ambulance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                if (!Page.IsPostBack)
                {

                }
        }




            protected void btnSubmit_Click(object sender, EventArgs e)
            {
                {
                    lblDetails.Text = "";
                    try
                    {
                        string Vehiclenumber = txtVehicle.Text;
                        string Drivername = txtdrivername.Text;
                        string AvailibilityStatus = rblStatus.SelectedValue;

                        string Contact = txtContact.Text;


                        lblDetails.Text = "</br> Vehiclenumber : " + Vehiclenumber +
                                            "</br> Drivername " + Drivername +
                                            "</br>  AvailibilityStatus" + AvailibilityStatus +

                                            "</br> Contact:" + Contact;
                    }
                    catch (Exception SaveError)
                    {
                        Response.Write(SaveError.ToString());
                        throw;
                    }
                }

            }

            protected void btnReset_Click(object sender, EventArgs e)
            {
                {
                    txtVehicle.Text = "";
                    txtdrivername.Text = "";
                    rblStatus.ClearSelection();
                    txtContact.Text = "";
                    txtContact.Text = " ";
                    lblDetails.Text = "";
                }

            }

       
    }
}
