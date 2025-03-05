<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="billing_manage.aspx.cs" Inherits="hospital_management.Nurse_dashboard.billing_manage" %>


<!DOCTYPE html>
<html>
<head>
    <title>Billing Management</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h2 class="text-center mb-4">Billing Management</h2>
            <asp:GridView ID="gvBilling" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered"
                DataKeyNames="invoiceID" AllowPaging="true" PageSize="10">
                <Columns>
                    <asp:BoundField DataField="invoiceID" HeaderText="Invoice ID" ReadOnly="true" />
                    <asp:BoundField DataField="PatientName" HeaderText="Patient Name" />
                    <asp:BoundField DataField="totalAmount" HeaderText="Total Amount" />
                    <asp:BoundField DataField="discounts" HeaderText="Discounts" />
                    <asp:BoundField DataField="paymentMode" HeaderText="Payment Mode" />
                    <asp:BoundField DataField="paymentStatus" HeaderText="Payment Status" />
                    <asp:BoundField DataField="paymentDate" HeaderText="Payment Date" DataFormatString="{0:yyyy-MM-dd}" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
