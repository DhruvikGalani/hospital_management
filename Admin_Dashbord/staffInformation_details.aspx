<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="staffInformation_details.aspx.cs" Inherits="hospital_management.Admin_Dashbord.staffInformation_details" %>

<!DOCTYPE html>
<html>
<head>
    <link href="../css/aspx.css" rel="stylesheet" />
    <title>🧑‍💼Staff Information</title>
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
    <h2 class="text-center text-primary">🧑‍💼Staff Information</h2>
    <div class="row">
        <div class="col-md-6">
            <asp:TextBox ID="txtName" CssClass="form-control" runat="server" placeholder="Full Name"></asp:TextBox>
            <asp:TextBox ID="txtRole" CssClass="form-control mt-2" runat="server" placeholder="Role"></asp:TextBox>
            <asp:TextBox ID="txtContact" CssClass="form-control mt-2" runat="server" placeholder="Contact Number"></asp:TextBox>
            <asp:TextBox ID="txtEmail" CssClass="form-control mt-2" runat="server" placeholder="Email"></asp:TextBox>
            <asp:TextBox ID="txtPassword" CssClass="form-control mt-2" runat="server" placeholder="Password"></asp:TextBox>
        </div>
        <div class="col-md-6">
            <asp:TextBox ID="txtShift" CssClass="form-control" TextMode="Time" runat="server"  placeholder="Shift Timing"></asp:TextBox>
            <asp:TextBox ID="txtJoining" CssClass="form-control mt-2" TextMode="Date" runat="server" placeholder="Joining Date"></asp:TextBox>
            <asp:TextBox ID="txtSalary" CssClass="form-control mt-2" runat="server" placeholder="Salary Details"></asp:TextBox>
            <asp:FileUpload ID="fileProfile" CssClass="form-control mt-2" runat="server" />
            <div class="text-center mt-3"><br />

                <asp:Button ID="btnAddStaff" runat="server"  CssClass="btn btn-primary" Text="Add Staff" OnClick="btnAddStaff_Click" />
            </div>
        </div>
    </div>

                            <h3 class="text-center text-success">📝 Staff Records</h3>


    <asp:GridView ID="GridViewStaff" runat="server" CssClass="table table-bordered mt-4" AutoGenerateColumns="False"
    DataKeyNames="staffID" OnRowEditing="GridViewStaff_RowEditing" OnRowCancelingEdit="GridViewStaff_RowCancelingEdit"
    OnRowUpdating="GridViewStaff_RowUpdating" OnRowDeleting="GridViewStaff_RowDeleting">
    <Columns>
        <asp:BoundField DataField="staffID" HeaderText="Staff ID" ReadOnly="True" />
        <asp:TemplateField HeaderText="Full Name">
            <ItemTemplate><%# Eval("fullName") %></ItemTemplate>
            <EditItemTemplate><asp:TextBox ID="txtEditName" runat="server" Text='<%# Eval("fullName") %>' CssClass="form-control" /></EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Role">
            <ItemTemplate><%# Eval("role") %></ItemTemplate>
            <EditItemTemplate><asp:TextBox ID="txtEditRole" runat="server" Text='<%# Eval("role") %>' CssClass="form-control" /></EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Contact Number">
            <ItemTemplate><%# Eval("contactNumber") %></ItemTemplate>
            <EditItemTemplate><asp:TextBox ID="txtEditContact" runat="server" Text='<%# Eval("contactNumber") %>' CssClass="form-control" /></EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Email">
            <ItemTemplate><%# Eval("email") %></ItemTemplate>
            <EditItemTemplate><asp:TextBox ID="txtEditEmail" runat="server" Text='<%# Eval("email") %>' CssClass="form-control" /></EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Shift Timing">
            <ItemTemplate><%# Eval("shiftTiming") %></ItemTemplate>
            <EditItemTemplate><asp:TextBox ID="txtEditShift" runat="server" Text='<%# Eval("shiftTiming") %>' CssClass="form-control"  TextMode="Time"/></EditItemTemplate>
        </asp:TemplateField>

		 <asp:TemplateField HeaderText="Joining Date">
     <ItemTemplate>
         <asp:Label ID="lbljoiningtDate" runat="server" Text='<%# Eval("joiningDate", "{0:yyyy-MM-dd}") %>'></asp:Label>
     </ItemTemplate>
     <EditItemTemplate>
         <asp:TextBox ID="txtEditjoiningDate" runat="server" CssClass="form-control" Text='<%# Bind("joiningDate", "{0:yyyy-MM-dd}") %>' TextMode="Date"></asp:TextBox>
     </EditItemTemplate>
             </asp:TemplateField>

        <asp:TemplateField HeaderText="Salary">
            <ItemTemplate><%# Eval("salaryDetails") %></ItemTemplate>
            <EditItemTemplate><asp:TextBox ID="txtEditSalary" runat="server" Text='<%# Eval("salaryDetails") %>' CssClass="form-control" /></EditItemTemplate>
        </asp:TemplateField>

        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
    </Columns>
</asp:GridView>

</div>
        </form>
</body>
</html>
