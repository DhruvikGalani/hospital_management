<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ambulance_details.aspx.cs" Inherits="hospital_management.Nurse_dashboard.Ambulance_details" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>🚑 Ambulance Management | Hospital Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>

        .container {
            margin-top: 50px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="text-center text-primary">🚑 Ambulance Management</h2>
            <div class="card p-4 shadow">
                <div class="row">
                    <div class="col-md-6">
                        <asp:TextBox ID="txtVehicleNumber" runat="server" CssClass="form-control mb-3" Placeholder="Vehicle Number"></asp:TextBox>
                        <asp:TextBox ID="txtDriverName" runat="server" CssClass="form-control mb-3" Placeholder="Driver Name"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <asp:TextBox ID="txtContactNumber" runat="server" CssClass="form-control mb-3" Placeholder="Contact Number"></asp:TextBox>
                        <asp:RadioButtonList ID="rblAvailability" runat="server" CssClass="form-control mb-3">
                            <asp:ListItem Text="Available" Value="Available"></asp:ListItem>
                            <asp:ListItem Text="Not Available" Value="Not Available"></asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </div>

                <div class="text-center">
                    <asp:Button ID="btnAddAmbulance" runat="server" CssClass="btn btn-primary" Text="Add Ambulance" OnClick="btnSave_Click" />
                </div>
            </div>

            <h3 class="mt-5 text-center text-success">Ambulance Details</h3>
            <asp:GridView ID="gvAmbulance" runat="server" CssClass="table table-bordered table-striped mt-3"
                AutoGenerateColumns="False" DataKeyNames="vehicleNumber"

                OnRowEditing="gvAmbulance_RowEditing"
                OnRowUpdating="gvAmbulance_RowUpdating"
                OnRowDeleting="gvAmbulance_RowDeleting"
                OnRowCancelingEdit="gvAmbulance_RowCancelingEdit">

                <Columns>
                    <asp:BoundField DataField="vehicleNumber" HeaderText="Vehicle Number" ReadOnly="true" />
        
        <asp:TemplateField HeaderText="Driver Name">
            <ItemTemplate>
                <asp:Label ID="lblDriverName" runat="server" Text='<%# Eval("driverName") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtDriverNameEdit" runat="server" CssClass="form-control" Text='<%# Eval("driverName") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Contact Number">
            <ItemTemplate>
                <asp:Label ID="lblContactNumber" runat="server" Text='<%# Eval("contactNumber") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtContactNumberEdit" runat="server" CssClass="form-control" Text='<%# Eval("contactNumber") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Availability">
            <ItemTemplate>
                <asp:Label ID="lblAvailability" runat="server" Text='<%# Eval("availabilityStatus") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:DropDownList ID="ddlAvailabilityEdit" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Available" Value="Available"></asp:ListItem>
                    <asp:ListItem Text="Not Available" Value="Not Available"></asp:ListItem>
                </asp:DropDownList>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
