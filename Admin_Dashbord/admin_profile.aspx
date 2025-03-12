<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_profile.aspx.cs" Inherits="hospital_management.Admin_dashboard.admin_profile" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Admin Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f4f7f9;
        }
        .profile-container {
            max-width: 500px;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            margin: 50px auto;
        }
        .img-thumbnail {
            border-radius: 50%;
            width: 120px;
            height: 120px;
            object-fit: cover;
            display: block;
            margin: 0 auto;
        }
        .form-control {
            border-radius: 5px;
            padding: 10px;
            font-size: 16px;
        }
        .btn-primary {
            width: 100%;
            padding: 10px;
            font-size: 18px;
            font-weight: bold;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server" class="profile-container">
        <h3 class="text-center">Admin Profile</h3>

        <div class="text-center">
            <asp:Image ID="imgProfile" runat="server" CssClass="img-thumbnail" />
        </div>

        <div class="row mt-4">
            <div class="col-md-12">
                <label class="form-label text-start d-block">Name:</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-md-12">
                <label class="form-label text-start d-block">Email:</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ReadOnly="true" />
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-md-12">
                <label class="form-label text-start d-block">Profile Picture:</label>
                <asp:FileUpload ID="fileUpload" runat="server" CssClass="form-control" />
                <small class="text-muted">Upload a new profile picture</small>
            </div>
        </div>

        <asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="btn btn-primary mt-3" OnClick="btnSave_Click" />
        <asp:Label ID="lblMessage" runat="server" CssClass="mt-3 text-center d-block" />
    </form>

</body>
</html>
