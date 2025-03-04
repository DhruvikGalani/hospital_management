<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="hospital_management.Nurse_dashboard.profile" %>


<!DOCTYPE html>
<html>
<head>
    <title>Nurse Profile</title>
    <link href="../css/aspx.css" rel="stylesheet" />
    <style>
        .card {
            margin: 30px auto;
            width: 50%;
            padding: 20px;
            box-shadow: 0px 0px 15px #ccc;
            border-radius: 10px;
            text-align: center;
        }
        .profile-image {
            border-radius: 50%;
            margin-bottom: 20px;
            box-shadow: 0px 0px 10px #007bff;
        }
    </style>
</head>
<body>
<form runat="server" enctype="multipart/form-data">
    <div class="card">
        <h2>Nurse Profile</h2>
        <asp:Image ID="imgProfile" CssClass="profile-image" runat="server" Width="150px" Height="150px" />
        <asp:FileUpload ID="fileProfile" runat="server" CssClass="form-control" />
        
        <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
        <asp:TextBox ID="txtContact" CssClass="form-control" runat="server"></asp:TextBox>

        <asp:Button ID="btnUpdate" CssClass="btn btn-primary" runat="server" Text="Update Profile" OnClick="btnUpdate_Click" />
        <asp:Button ID="btnLogout" CssClass="btn btn-danger" runat="server" Text="Logout" OnClick="btnLogout_Click" />
    </div>
</form>
</body>
</html>
