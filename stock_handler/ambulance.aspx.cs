using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hospital_management.stock_handler
{
    public partial class ambulance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                string vehicleNumber = txtVehicleNumber.Text;
                string driverName = txtDriverName.Text;
                string contactNumber = txtContactNumber.Text;
                string availibility = rblAvailabilityStatus.SelectedValue;

                lblDetails.Text = "<br> Vehicle Number : " + vehicleNumber +
                                  "<br> Driver Name : " + driverName +
                                  "<br> ContactNumber : " + contactNumber +
                                  "<br> Availibility : " + availibility;
            }
            catch(Exception ErrorSave)
            {
                Response.Write(ErrorSave.ToString());
                throw;
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtContactNumber.Text = "";
            txtDriverName.Text = "";
            txtVehicleNumber.Text = "";
            rblAvailabilityStatus.ClearSelection();
            lblDetails.Text = "";   
        }
    }
}