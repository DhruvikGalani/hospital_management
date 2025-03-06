using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hospital_management.Admin_Dashbord
{
    public partial class manage_doctors : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadDoctors();
            }
        }

        protected void LoadDoctors()
        {
            using(SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString))
            {
                string query = "SELECT doctorID, name, age, gender, address, email, contactNumber, specialization, experienceYears, licenseNumber, consultationFee, profile FROM tbl_Doctors";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvDoctors.DataSource = dt;
                gvDoctors.DataBind();
            }
        }

        protected void btnAddDoctor_Click(object sender, EventArgs e)
        {
            if(string.IsNullOrWhiteSpace(txtName.Text) || string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                Response.Write("<script>alert('Please Fill All Fields');</script>");
                return;
            }

            byte[] profileData = null;
            if(FileUploadProfile.HasFile)
            {
                using(Stream fs = FileUploadProfile.PostedFile.InputStream)
                {
                    using(BinaryReader br = new BinaryReader(fs))
                    {
                        profileData = br.ReadBytes((int)fs.Length);
                    }
                }
            }

            using(SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString))
            {
                string query = "INSERT INTO tbl_Doctors (name, age, gender, address, password, specialization, experienceYears, contactNumber, email, licenseNumber, consultationFee, profile) " +
                "VALUES (@Name, @Age, @Gender, @Address, @Password, @Specialization, @ExperienceYears, @Contact, @Email, @License, @ConsultationFee, @Profile)";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@Age", txtAge.Text.Trim());
                cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@Specialization", txtSpecialization.Text.Trim());
                cmd.Parameters.AddWithValue("@ExperienceYears", txtExperience.Text.Trim());
                cmd.Parameters.AddWithValue("@Contact", txtContact.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@License", txtLicense.Text.Trim());
                cmd.Parameters.AddWithValue("@ConsultationFee", txtConsultationFee.Text.Trim());
                cmd.Parameters.AddWithValue("@Profile", profileData);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Doctor Added Successfully');</script>");
                ClearFields();
                LoadDoctors();
            }
        }

        protected void gvDoctors_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDoctors.EditIndex = e.NewEditIndex;
            LoadDoctors();
        }

        protected void gvDoctors_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvDoctors.EditIndex = -1;
            LoadDoctors();
        }

        protected void gvDoctors_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int doctorID = Convert.ToInt32(gvDoctors.DataKeys[e.RowIndex].Value);
            GridViewRow row = gvDoctors.Rows[e.RowIndex];

            string name = ((TextBox)row.FindControl("txtNameEdit")).Text;
            string age = ((TextBox)row.FindControl("txtAgeEdit")).Text;
            string address = ((TextBox)row.FindControl("txtAddressEdit")).Text;
            string contact = ((TextBox)row.FindControl("txtContactEdit")).Text;
            string specialization = ((TextBox)row.FindControl("txtSpecializationEdit")).Text;
            string experienceYears = ((TextBox)row.FindControl("txtExperienceEdit")).Text;
            string licenseNumber = ((TextBox)row.FindControl("txtLicenseEdit")).Text;
            string consultationFee = ((TextBox)row.FindControl("txtConsultationFeeEdit")).Text;

            using(SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString))
            {
                string query = "UPDATE tbl_Doctors SET name=@Name, age=@Age, address=@Address, contactNumber=@Contact, specialization=@Specialization, experienceYears=@ExperienceYears, licenseNumber=@License, consultationFee=@ConsultationFee WHERE doctorID=@DoctorID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Age", age);
                cmd.Parameters.AddWithValue("@Address", address);
                cmd.Parameters.AddWithValue("@Contact", contact);
                cmd.Parameters.AddWithValue("@Specialization", specialization);
                cmd.Parameters.AddWithValue("@ExperienceYears", experienceYears);
                cmd.Parameters.AddWithValue("@License", licenseNumber);
                cmd.Parameters.AddWithValue("@ConsultationFee", consultationFee);
                cmd.Parameters.AddWithValue("@DoctorID", doctorID);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            gvDoctors.EditIndex = -1;
            LoadDoctors();
        }

        protected void gvDoctors_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int doctorID = Convert.ToInt32(gvDoctors.DataKeys[e.RowIndex].Value);

            using(SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString))
            {
                string query = "DELETE FROM tbl_Doctors WHERE doctorID=@DoctorID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@DoctorID", doctorID);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            Response.Write("<script>alert('Doctor Deleted Successfully');</script>");
            LoadDoctors();
        }

        private void ClearFields()
        {
            txtName.Text = "";
            txtAge.Text = "";
            txtAddress.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            txtSpecialization.Text = "";
            txtExperience.Text = "";
            txtContact.Text = "";
            txtLicense.Text = "";
            txtConsultationFee.Text = "";
            ddlGender.SelectedIndex = 0;
        }
    }
} 