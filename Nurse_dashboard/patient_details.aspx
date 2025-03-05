<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="patient_details.aspx.cs" Inherits="hospital_management.Nurse_dashboard.patient_details" %>


<!DOCTYPE html>
<html>
<head>
    <title>Patient Records</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h2 class="text-center mb-4">Patient Records</h2>

           <asp:GridView ID="gvPatients" runat="server" AutoGenerateColumns="False" DataKeyNames="patientID" CssClass="table table-bordered" 
    OnRowEditing="gvPatients_RowEditing" OnRowUpdating="gvPatients_RowUpdating" OnRowCancelingEdit="gvPatients_RowCancelingEdit">
    <Columns>
        <asp:BoundField DataField="patientID" HeaderText="Patient ID" ReadOnly="true" />
        <asp:TemplateField HeaderText="Name">
            <ItemTemplate>
                <asp:Label ID="lblName" runat="server" Text='<%# Eval("name") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Text='<%# Eval("name") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Age">
            <ItemTemplate>
                <asp:Label ID="lblAge" runat="server" Text='<%# Eval("age") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtAge" runat="server" CssClass="form-control" Text='<%# Eval("age") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Gender">
            <ItemTemplate>
                <asp:Label ID="lblGender" runat="server" Text='<%# Eval("gender") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                    <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                </asp:DropDownList>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Address">
            <ItemTemplate>
                <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("address") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" Text='<%# Eval("address") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:CommandField ShowEditButton="true" />
    </Columns>
</asp:GridView>
        </div>
    </form>
</body>
</html>
