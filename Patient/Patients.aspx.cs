using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Input;
using System.Windows.Forms;
using System.Xml.Linq;
namespace hospital_management.Patient
{
    public partial class Patients : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            lblDetails.Text = "";
            try
            {
                string nm = txtName.Text;
                string age = txtAge.Text;
                string gen = rblGender.SelectedValue;
                string add = txtAddress.Text;
                string date = txtDate.Text;
                string contactnumber = txtContactNo.Text;
                string email = txtEmail.Text;
                string password = txtPassword.Text;
                string emergencycontactnumber = txtEmergencycontactno.Text;
                string bloodgroup = rblBlood.SelectedValue;
                string allergies = txtAllergies.Text;
                string runningmedicine = txtRunningmedicine.Text;
                string insurance = rblInsurance.SelectedValue;

                lblDetails.Text = "</br> Name : " + nm +
                                    "</br> age:" + age +
                                    "</br> gen:" + gen +
                    "</br> add:" + add +
                    "</br> Date:" + date +
                    "</br> cotactnumber:" + contactnumber +
                    "</br> email:" + email +
                    "</br> password:" + password +
                    "</br> emergency contact number:" + emergencycontactnumber +
                    "</br> bloodgroup:" + bloodgroup +
                    "</br> allergies:" + allergies +
                    "</br> runningmedicine:" + runningmedicine +
                    "</br> insurance:" + insurance;

            }
            catch (Exception SaveError)
            {
                Response.Write(SaveError.ToString());
                throw;
            }


        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtName.Text = ""; txtAge.Text = "";
            rblGender.ClearSelection();
            txtAddress.Text = "";
            txtDate.Text = "";
            txtContactNo.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            rblBlood.ClearSelection();
            txtAllergies.Text = "";
            txtRunningmedicine.Text = "";
            rblInsurance.ClearSelection();
            lblDetails.Text = "";
        }
    }
}