<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="nurse_details.aspx.cs" Inherits="hospital_management.Nurse_dashboard.nurse_details" %>




<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>👩‍⚕️Nurse Management | Hospital Management System</title>
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

            <h2 class="text-center text-primary">👩‍⚕️Nurse Management</h2>
            <div class="card p-4 shadow">
                <div class="row">
                    <div class="col-md-6">
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control mb-3" Placeholder="Name"></asp:TextBox>
                        <asp:TextBox ID="txtAge" runat="server" CssClass="form-control mb-3" Placeholder="Age" TextMode="Number"></asp:TextBox>
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control mb-3">
                            <asp:ListItem Text="Select Gender" Value="" />
                            <asp:ListItem Text="Male" Value="Male" />
                            <asp:ListItem Text="Female" Value="Female" />
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-6">
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control mb-3" Placeholder="Address"></asp:TextBox>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control mb-3" Placeholder="Email"></asp:TextBox>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control mb-3" Placeholder="Password" TextMode="Password"></asp:TextBox>
                        <asp:TextBox ID="txtContact" runat="server" CssClass="form-control mb-3" Placeholder="Contact"></asp:TextBox>
                        <asp:FileUpload ID="FileUploadProfile" runat="server" CssClass="form-control mb-3" />
                    </div>
                </div>
                
                <div class="text-center">
                    <asp:Button ID="btnAddNurse" runat="server" CssClass="btn btn-primary" Text="Add Nurse" OnClick="btnAddNurse_Click" />
                </div>
            </div>

            <h3 class="mt-5 text-center text-success">Nurse Details</h3>
           <asp:GridView ID="gvNurses" runat="server" CssClass="table table-bordered table-striped mt-3" AutoGenerateColumns="False" DataKeyNames="nurseID"
    OnRowEditing="gvNurses_RowEditing"
    OnRowUpdating="gvNurses_RowUpdating"
    OnRowDeleting="gvNurses_RowDeleting"
    OnRowCancelingEdit="gvNurses_RowCancelingEdit">

                <Columns>
                   <asp:TemplateField HeaderText="Name">
    <ItemTemplate>
        <%# Eval("name") %>
    </ItemTemplate>
    <EditItemTemplate>
        <asp:TextBox ID="txtNameEdit" runat="server" Text='<%# Bind("name") %>' CssClass="form-control"></asp:TextBox>
    </EditItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Age">
    <ItemTemplate>
        <%# Eval("age") %>
    </ItemTemplate>
    <EditItemTemplate>
        <asp:TextBox ID="txtAgeEdit" runat="server" Text='<%# Bind("age") %>' CssClass="form-control"></asp:TextBox>
    </EditItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Address">
    <ItemTemplate>
        <%# Eval("address") %>
    </ItemTemplate>
    <EditItemTemplate>
        <asp:TextBox ID="txtAddressEdit" runat="server" Text='<%# Bind("address") %>' CssClass="form-control"></asp:TextBox>
    </EditItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Contact">
    <ItemTemplate>
        <%# Eval("contactNumber") %>
    </ItemTemplate>
    <EditItemTemplate>
        <asp:TextBox ID="txtContactEdit" runat="server" Text='<%# Bind("contactNumber") %>' CssClass="form-control"></asp:TextBox>
    </EditItemTemplate>
</asp:TemplateField>


                    <asp:BoundField DataField="gender" HeaderText="Gender" />
                   
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>