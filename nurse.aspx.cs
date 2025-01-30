using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace hospital_management
{
    public partial class nurse : System.Web.UI.Page
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
                        string Name = txtName.Text;
                        string Age = txtAge.Text;
                        string Gender = rblGender.SelectedValue;
                        string Adddress = txtAddress.Text;
                        string Email = txtEmail.Text;
                        string Password = txtpass.Text;
                        string Contact = txtContact.Text;


                        lblDetails.Text = "</br> Name : " + Name +
                                            "</br> Age " + Age +
                                            "</br>  Gender" + Gender +
                                            "</br> Adddress" + Adddress +
                                            "</br> Email" + Email +
                                            "</br> Password" + Password +
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
                    txtName.Text = "";
                    txtAge.Text = "";
                    rblGender.ClearSelection();
                    txtAddress.Text = "";
                    txtEmail.Text = "";
                    txtpass.Text = "";
                    txtContact.Text = " ";
                    lblDetails.Text = "";
                }

            }
        }
    }
