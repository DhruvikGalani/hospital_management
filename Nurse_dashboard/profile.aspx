<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="hospital_management.Nurse_dashboard.profile" %>


<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Nurse Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
        <h3>Edit Nurse Profile</h3>

        <div class="form-group">
            <label for="txtName">Name</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <label for="txtEmail">Email</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <label for="txtContact">Contact</label>
            <asp:TextBox ID="txtContact" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <label>Profile Picture</label><br />
            <asp:Image ID="imgProfile" runat="server" CssClass="img-thumbnail" Width="100" Height="100" />
            <br />
            <asp:FileUpload ID="fileUpload" runat="server" CssClass="form-control mt-2" />
        </div>

        <asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="btn btn-primary" OnClick="btnSave_Click" />
        
        <br />
        <asp:Label ID="lblMessage" runat="server" ForeColor="Green" CssClass="mt-3" />
    </form>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
