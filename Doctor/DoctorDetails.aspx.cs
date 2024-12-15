using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace hospital_management.Doctor
{
    public partial class DoctorDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) 
            {
                fnBindSpecialities();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            lblDetails.Text = "";
            try
            {
                string name = txtName.Text;
                string age = txtAge.Text;
                string gender = rblGender.SelectedValue;
                string address = txtAddress.Text;
                string specialization = ddlSpecialities.SelectedValue;
                string TypeOfSpecialization = ddlSpecialitiesTypes.SelectedValue;
                string experienceYear = txtExperienceYear.Text;
                string contact = txtContactNo.Text;
                string email = txtEmail.Text;
                string password = txtPassword.Text;
                string license = txtLicenseNo.Text;
                string consultationFee = txtFee.Text;

                lblDetails.Text = "</br> Name : " + name +
                    "</br> age : " + age +
                    "</br> gender : " + gender +
                    "</br> address : " + address +
                    "</br> specialization : " + specialization +
                    "</br> TypeOfSpecialization : " + TypeOfSpecialization +
                    "</br> experienceYear : " + experienceYear +
                    "</br> contact : " + contact +
                    "</br> email : " + email +
                    "</br> password : " + password +
                    "</br> license : " + license +
                    "</br> consultationFee : " + consultationFee;
            }
            catch (Exception)
            {

                throw;
            }

            txtName.Text = "";
            txtAge.Text = "";
            rblGender.ClearSelection();
            txtAddress.Text = "";
            ddlSpecialities.ClearSelection();
            ddlSpecialitiesTypes.ClearSelection();
            txtExperienceYear.Text = "";
            txtContactNo.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            txtLicenseNo.Text = "";
            txtFee.Text = "";
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
           txtName.Text ="";
           txtAge.Text = "";
           rblGender.ClearSelection();
           txtAddress.Text = "";
           ddlSpecialities.ClearSelection();
           ddlSpecialitiesTypes.ClearSelection();
           txtExperienceYear.Text = "";
           txtContactNo.Text = "";
           txtEmail.Text = "";
           txtPassword.Text = "";
           txtLicenseNo.Text = "";
           txtFee.Text = "";
            lblDetails.Text = "";
        }

        protected void fnBindSpecialities()
        {
            ddlSpecialities.Items.Clear();
            ddlSpecialities.Items.Add("Clinical Specialties");
            ddlSpecialities.Items.Add("Surgical Specialties");
            ddlSpecialities.Items.Add("Diagnostic Specialties");
            ddlSpecialities.Items.Add("Subspecialties");
            ddlSpecialities.Items.Add("Emergency and Critical Care");
            ddlSpecialities.Items.Add("Alternative and Holistic Specialties");
            ddlSpecialities.Items.Add("Specialized Fields");
            ddlSpecialities.Items.Add("Emerging Fields");
            ddlSpecialities.Items.Insert(0, new ListItem("select"));
        }

        protected void fnBindTypesOfSpecialities()
        {
            ddlSpecialitiesTypes.Items.Clear();

            if (ddlSpecialities.SelectedValue == "Clinical Specialties")
            {
                ddlSpecialitiesTypes.Items.Add("Cardiology");
                ddlSpecialitiesTypes.Items.Add("Neurology");
                ddlSpecialitiesTypes.Items.Add("Dermatology");
                ddlSpecialitiesTypes.Items.Add("Endocrinology");
                ddlSpecialitiesTypes.Items.Add("Gastroenterology");
                ddlSpecialitiesTypes.Items.Add("Hematology");
                ddlSpecialitiesTypes.Items.Add("Oncology");
                ddlSpecialitiesTypes.Items.Add("Nephrology");
                ddlSpecialitiesTypes.Items.Add("Pulmonology");
                ddlSpecialitiesTypes.Items.Add("Rheumatology");
                ddlSpecialitiesTypes.Items.Add("Psychiatry");
                ddlSpecialitiesTypes.Items.Add("Ophthalmology");
                ddlSpecialitiesTypes.Items.Add("Otolaryngology (ENT)");
                ddlSpecialitiesTypes.Items.Add("Urology");
                ddlSpecialitiesTypes.Items.Add("Gynecology");
                ddlSpecialitiesTypes.Items.Add("Obstetrics");
                ddlSpecialitiesTypes.Items.Add("Pediatrics");
                ddlSpecialitiesTypes.Items.Add("Geriatrics");
                ddlSpecialitiesTypes.Items.Add("Allergy and Immunology");
            }
            else if (ddlSpecialities.SelectedValue == "Surgical Specialties")
            {
                ddlSpecialitiesTypes.Items.Add("General Surgery");
                ddlSpecialitiesTypes.Items.Add("Cardiothoracic Surgery");
                ddlSpecialitiesTypes.Items.Add("Neurosurgery");
                ddlSpecialitiesTypes.Items.Add("Orthopedic Surgery");
                ddlSpecialitiesTypes.Items.Add("Plastic and Reconstructive Surgery");
                ddlSpecialitiesTypes.Items.Add("Vascular Surgery");
                ddlSpecialitiesTypes.Items.Add("Ophthalmic Surgery");
                ddlSpecialitiesTypes.Items.Add("ENT Surgery");
                ddlSpecialitiesTypes.Items.Add("Trauma Surgery");
            }
            else if (ddlSpecialities.SelectedValue == "Diagnostic Specialties")
            {
                ddlSpecialitiesTypes.Items.Add("Radiology");
                ddlSpecialitiesTypes.Items.Add("Pathology");
                ddlSpecialitiesTypes.Items.Add("Nuclear Medicine");
            }
            else if (ddlSpecialities.SelectedValue == "Subspecialties")
            {
                ddlSpecialitiesTypes.Items.Add("Interventional Cardiology");
                ddlSpecialitiesTypes.Items.Add("Pediatric Neurology");
                ddlSpecialitiesTypes.Items.Add("Pediatric Oncology");
                ddlSpecialitiesTypes.Items.Add("Reproductive Endocrinology");
                ddlSpecialitiesTypes.Items.Add("Sleep Medicine");
                ddlSpecialitiesTypes.Items.Add("Sports Medicine");
                ddlSpecialitiesTypes.Items.Add("Pain Management");
            }
            else if (ddlSpecialities.SelectedValue == "Emergency and Critical Care")
            {
                ddlSpecialitiesTypes.Items.Add("Emergency Medicine");
                ddlSpecialitiesTypes.Items.Add("Critical Care Medicine (ICU)");
                ddlSpecialitiesTypes.Items.Add("Anesthesiology");
            }
            else if (ddlSpecialities.SelectedValue == "Alternative and Holistic Specialties")
            {
                ddlSpecialitiesTypes.Items.Add("Homeopathy");
                ddlSpecialitiesTypes.Items.Add("Ayurveda");
                ddlSpecialitiesTypes.Items.Add("Chiropractic Medicine");
                ddlSpecialitiesTypes.Items.Add("Acupuncture");
            }
            else if (ddlSpecialities.SelectedValue == "Specialized Fields")
            {
                ddlSpecialitiesTypes.Items.Add("Forensic Medicine");
                ddlSpecialitiesTypes.Items.Add("Occupational Medicine");
                ddlSpecialitiesTypes.Items.Add("Palliative Medicine");
                ddlSpecialitiesTypes.Items.Add("Preventive Medicine");
                ddlSpecialitiesTypes.Items.Add("Tropical Medicine");
                ddlSpecialitiesTypes.Items.Add("Aerospace Medicine");
            }
            else if (ddlSpecialities.SelectedValue == "Emerging Fields")
            {
                ddlSpecialitiesTypes.Items.Add("Genomic Medicine");
                ddlSpecialitiesTypes.Items.Add("Regenerative Medicine");
                ddlSpecialitiesTypes.Items.Add("Telemedicine");
                ddlSpecialitiesTypes.Items.Add("Lifestyle Medicine");
            }

            ddlSpecialitiesTypes.Items.Insert(0, new ListItem("select"));
        }

        protected void ddlSpecialities_SelectedIndexChanged(object sender, EventArgs e)
        {
            fnBindTypesOfSpecialities();
        }
    }
}