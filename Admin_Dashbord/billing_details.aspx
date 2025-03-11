<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="billing_details.aspx.cs" Inherits="hospital_management.Admin_Dashbord.billing_details" %>


<!DOCTYPE html>
<html>
<head>
    <title>Billing Management</title>
    <link href="css/aspx.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
     <form id="form1" runat="server">
<div class="container mt-5">
    <h2 class="text-center text-primary"> 📝 Billing Management</h2>

     <div class="card shadow-lg p-4 mb-4">
                <h4 class="mb-3">Add Billing Record</h4>
                <div class="row">
                    <div class="col-md-4">
                        <label>Patient</label>
                        <asp:DropDownList ID="ddlPatient" runat="server" CssClass="form-select"></asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                        <label>Appointment</label>
                        <asp:DropDownList ID="ddlAppointment" runat="server" CssClass="form-select"></asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                        <label>Total Amount</label>
                        <asp:TextBox ID="txtTotalAmount" runat="server" CssClass="form-control" />
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-4">
                        <label>Discounts</label>
                        <asp:TextBox ID="txtDiscounts" runat="server" CssClass="form-control" />
                    </div>
                    <div class="col-md-4">
                        <label>Payment Mode</label>
                        <asp:DropDownList ID="ddlPaymentMode" runat="server" CssClass="form-select">
                            <asp:ListItem>Cash</asp:ListItem>
                            <asp:ListItem>Card</asp:ListItem>
                            <asp:ListItem>UPI</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                        <label>Payment Status</label>
                        <asp:DropDownList ID="ddlPaymentStatus" runat="server" CssClass="form-select">
                            <asp:ListItem>Paid</asp:ListItem>
                            <asp:ListItem>Pending</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-4">
                        <label>Payment Date</label>
                        <asp:TextBox ID="txtPaymentDate" runat="server" CssClass="form-control" TextMode="Date" />
                    </div>
                </div>
                <div class="mt-3">
                    <asp:Button ID="btnInsert" runat="server" Text="Add Billing" CssClass="btn btn-primary" OnClick="btnInsert_Click" />
                </div>
            </div>

    <div class="card shadow-lg p-4">

                        <h3 class="text-center text-success">📝  Billing Records</h3>

        <asp:GridView ID="GridView1" CssClass="table table-bordered table-striped"
            AutoGenerateColumns="False" DataKeyNames="invoiceID"
            OnRowEditing="GridView1_RowEditing"
            OnRowUpdating="GridView1_RowUpdating"
            OnRowCancelingEdit="GridView1_RowCancelingEdit"
            OnRowDeleting="GridView1_RowDeleting"
            runat="server">
            
            <Columns>
                <asp:BoundField DataField="invoiceID" HeaderText="Invoice ID" ReadOnly="True" />
                <asp:TemplateField HeaderText="Patient Name">
                    <ItemTemplate>
                        <%# Eval("name") %>
                    </ItemTemplate>
                   
                </asp:TemplateField>

                <asp:BoundField DataField="appointmentID" HeaderText="Appointment ID" />

                <asp:TemplateField HeaderText=" Total Amount">
                    <ItemTemplate>
                        <%# Eval("totalAmount") %>
                    </ItemTemplate>
                    <EditItemTemplate><asp:TextBox ID="txtEditAmount" runat="server" Text='<%# Eval("totalAmount") %>' CssClass="form-control" /></EditItemTemplate>
                </asp:TemplateField>                

                <asp:TemplateField HeaderText=" discounts">
                    <ItemTemplate>
                       <%# Eval("discounts") %>
                    </ItemTemplate>
                  <EditItemTemplate><asp:TextBox ID="txtEditdiscount" runat="server" Text='<%# Eval("discounts") %>' CssClass="form-control" /></EditItemTemplate>

               </asp:TemplateField>      

                <asp:TemplateField HeaderText="Payment Mode">
                    <ItemTemplate>
                        <%# Eval("paymentMode") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlPaymentMode" CssClass="form-select" runat="server">
                            <asp:ListItem>Cash</asp:ListItem>
                            <asp:ListItem>Card</asp:ListItem>
                            <asp:ListItem>UPI</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Payment Status">
                    <ItemTemplate>
                        <%# Eval("paymentStatus") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlPaymentStatus" CssClass="form-select" runat="server">
                            <asp:ListItem>Paid</asp:ListItem>
                            <asp:ListItem>Pending</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>

 <asp:TemplateField HeaderText="payment Date">
<ItemTemplate>
    <asp:Label ID="lblpaymentDate" runat="server" Text='<%# Eval("paymentDate", "{0:yyyy-MM-dd}") %>'></asp:Label>
</ItemTemplate>
<EditItemTemplate>
    <asp:TextBox ID="txtEditpaymentDate" runat="server" CssClass="form-control" Text='<%# Bind("paymentDate", "{0:yyyy-MM-dd}") %>' TextMode="Date"></asp:TextBox>
</EditItemTemplate>
        </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
    </div>
</div>
	 </form>
</body>
</html>
