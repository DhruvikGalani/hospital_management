using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web.UI.WebControls;

namespace hospital_management.Admin_Dashbord
{
    public partial class patient_details : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        protected void gvPatients_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvPatients.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        protected void gvPatients_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvPatients.EditIndex = -1;
            BindGridView();
        }

        protected void gvPatients_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int patientID = Convert.ToInt32(gvPatients.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM tbl_Patients WHERE patientID=@patientID", con);
                cmd.Parameters.AddWithValue("@patientID", patientID);
                cmd.ExecuteNonQuery();
            }

            BindGridView();
        }

        protected void gvPatients_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int patientID = Convert.ToInt32(gvPatients.DataKeys[e.RowIndex].Value);
            TextBox txtName = (TextBox)gvPatients.Rows[e.RowIndex].FindControl("txtName");
            TextBox txtAge = (TextBox)gvPatients.Rows[e.RowIndex].FindControl("txtAge");
            DropDownList ddlGender = (DropDownList)gvPatients.Rows[e.RowIndex].FindControl("ddlGender");
            TextBox txtDOB = (TextBox)gvPatients.Rows[e.RowIndex].FindControl("txtDOB");
            TextBox txtContact = (TextBox)gvPatients.Rows[e.RowIndex].FindControl("txtContact");
            TextBox txtEmail = (TextBox)gvPatients.Rows[e.RowIndex].FindControl("txtEmail");
            TextBox txtPassword = (TextBox)gvPatients.Rows[e.RowIndex].FindControl("txtPassword");
            TextBox txtAddress = (TextBox)gvPatients.Rows[e.RowIndex].FindControl("txtAddress");
            TextBox txtEmergencyContact = (TextBox)gvPatients.Rows[e.RowIndex].FindControl("txtEmergencyContact");
            TextBox txtBloodGroup = (TextBox)gvPatients.Rows[e.RowIndex].FindControl("txtBloodGroup");
            TextBox txtAllergies = (TextBox)gvPatients.Rows[e.RowIndex].FindControl("txtAllergies");
            TextBox txtMedicines = (TextBox)gvPatients.Rows[e.RowIndex].FindControl("txtMedicines");
            DropDownList ddlInsurance = (DropDownList)gvPatients.Rows[e.RowIndex].FindControl("ddlInsurance");

            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE tbl_Patients SET name=@name, age=@age, gender=@gender, dateOfBirth=@dateOfBirth, contactNumber=@contactNumber, email=@email, password=@password, address=@address, emergencyContact=@emergencyContact, bloodGroup=@bloodGroup, allergies=@allergies, runningMedicines=@runningMedicines, insurance=@insurance WHERE patientID=@patientID", con);
                cmd.Parameters.AddWithValue("@name", txtName.Text);
                cmd.Parameters.AddWithValue("@age", txtAge.Text);
                cmd.Parameters.AddWithValue("@gender", ddlGender.SelectedValue);
                cmd.Parameters.AddWithValue("@dateOfBirth", DateTime.Parse(txtDOB.Text));
                cmd.Parameters.AddWithValue("@contactNumber", txtContact.Text);
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@password", txtPassword.Text);
                cmd.Parameters.AddWithValue("@address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@emergencyContact", txtEmergencyContact.Text);
                cmd.Parameters.AddWithValue("@bloodGroup", txtBloodGroup.Text);
                cmd.Parameters.AddWithValue("@allergies", txtAllergies.Text);
                cmd.Parameters.AddWithValue("@runningMedicines", txtMedicines.Text);
                cmd.Parameters.AddWithValue("@insurance", ddlInsurance.SelectedValue);
                cmd.Parameters.AddWithValue("@patientID", patientID);
                cmd.ExecuteNonQuery();
            }

            gvPatients.EditIndex = -1;
            BindGridView();
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            try
            {
                if (fuProfile.HasFile)
                {
                    string fileExtension = Path.GetExtension(fuProfile.FileName).ToLower();

                    if (fileExtension == ".jpg" || fileExtension == ".png" || fileExtension == ".jpeg" || fileExtension == ".svg" || fileExtension == ".pdf")
                    {
                        byte[] fileData = fuProfile.FileBytes;

                        lblMessage.Text = "File uploaded successfully!";
                    }
                    else
                    {
                        lblMessage.Text = "Only .jpg, .png, .jpeg, .svg, .pdf files are allowed!";
                    }
                }
                else
                {
                    lblMessage.Text = "Please select a file to upload.";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }

        protected void btnAddPatient_Click(object sender, EventArgs e)
        {
            try
            {
                string name = txtName.Text;
                int age = 0;
                if (!int.TryParse(txtAge.Text, out age))
                {
                    lblMessage.Text = "Please enter a valid age.";
                    return;
                }

                string gender = ddlGender.SelectedValue;
                DateTime dateOfBirth;
                if (!DateTime.TryParse(txtDOB.Text, out dateOfBirth))
                {
                    lblMessage.Text = "Please enter a valid date of birth.";
                    return;
                }

                string contactNumber = txtContact.Text;
                string email = txtEmail.Text;

                // Check if email already exists in the database
                if (CheckIfEmailExists(email))
                {
                    lblMessage.Text = "This email is already in use. Please choose a different one.";
                    return;
                }

                string password = txtPassword.Text;
                string address = txtAddress.Text;
                string emergencyContact = txtEmergencyContact.Text;
                string bloodGroup = txtBloodGroup.Text;
                string allergies = txtAllergies.Text;
                string runningMedicines = txtRunningMedicines.Text;
                string insurance = ddlInsurance.SelectedValue;

                byte[] profileImage = null;

                // Check if a file is uploaded
                if (fuProfile.HasFile)
                {
                    // Get the uploaded file as byte array (varbinary format)
                    profileImage = fuProfile.FileBytes;
                }

                // Insert data into the database
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand("INSERT INTO tbl_Patients (name, age, gender, dateOfBirth, contactNumber, email, password, address, emergencyContact, bloodGroup, allergies, runningMedicines, insurance, profile) " +
                                                   "VALUES (@name, @age, @gender, @dateOfBirth, @contactNumber, @email, @password, @address, @emergencyContact, @bloodGroup, @allergies, @runningMedicines, @insurance, @profile)", con);

                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@age", age);
                    cmd.Parameters.AddWithValue("@gender", gender);
                    cmd.Parameters.AddWithValue("@dateOfBirth", dateOfBirth);
                    cmd.Parameters.AddWithValue("@contactNumber", contactNumber);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@password", password);
                    cmd.Parameters.AddWithValue("@address", address);
                    cmd.Parameters.AddWithValue("@emergencyContact", emergencyContact);
                    cmd.Parameters.AddWithValue("@bloodGroup", bloodGroup);
                    cmd.Parameters.AddWithValue("@allergies", allergies);
                    cmd.Parameters.AddWithValue("@runningMedicines", runningMedicines);
                    cmd.Parameters.AddWithValue("@insurance", insurance);

                    // If the profile image is null, set it to DBNull
                    cmd.Parameters.AddWithValue("@profile", profileImage ?? (object)DBNull.Value);

                    cmd.ExecuteNonQuery();
                    lblMessage.Text = "Patient added successfully!";
                }

                // After inserting the patient, bind the data to the GridView
                BindGridView();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }

        private bool CheckIfEmailExists(string email)
        {
            bool emailExists = false;

            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("SELECT COUNT(1) FROM tbl_Patients WHERE email = @Email", con);
                cmd.Parameters.AddWithValue("@Email", email);

                // Check if email already exists
                emailExists = (int)cmd.ExecuteScalar() > 0;
            }

            return emailExists;
        }


        protected void BindGridView()
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_Patients", con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    gvPatients.DataSource = dt;
                    gvPatients.DataBind();
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                }
            }
        }
    }
}
