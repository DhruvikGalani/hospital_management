using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hospital_management.stock_handler
{
    public partial class pharmacy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string medicineName = txtMedicineName.Text;
                string batchNumber = txtBatchNumber.Text;
                string manufacturingDate = txtManufacturingDate.Text;
                string expiryDate = txtExpiryDate.Text;
                string stockQuantiity = txtStockQuantity.Text;
                string supplierDetails = txtSuppierDatails.Text;
                string pricePerUnit = txtPricePerUnit.Text;

                lblDetails.Text = "Medicine Name : " + medicineName +
                    "<br>Batch Number : " + batchNumber +
                    "<br>Manufacturing Date : " + manufacturingDate +
                    "<br>Expiry Date : " + expiryDate +
                    "<br>Stock Quantiity : " + stockQuantiity +
                    "<br>Supplier Details : " + supplierDetails +
                    "<br>pricePerUnit : " + pricePerUnit;
            }
            catch(Exception SubmitError)
            {
                Response.Write(SubmitError.ToString());
                throw;
            }

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtMedicineName.Text = "";
            txtBatchNumber.Text = "";
            txtManufacturingDate.Text = "";
            txtExpiryDate.Text = "";
            txtStockQuantity.Text = "";
            txtSuppierDatails.Text = "";
            txtPricePerUnit.Text = "";
            lblDetails.Text = "";
        }
    }
}