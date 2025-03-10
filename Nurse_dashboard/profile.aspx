<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="hospital_management.Nurse_dashboard.profile" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Nurse Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background-color: #f4f7f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .profile-container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            max-width: 650px;
            width: 100%;
        }

        h3 {
            text-align: center;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
        }

        .form-group label {
            font-weight: 600;
            margin-top:10px;
            color: #555;
        }

        .form-control {
            border-radius: 5px;
            padding: 10px;
            font-size: 16px;
        }

        .btn-primary {
            width: 100%;
            padding: 12px;
            font-size: 18px;
            font-weight: bold;
            background-color: #007bff;
            border-radius: 8px;
            transition: 0.3s;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .img-thumbnail {
            display: block;
            margin: 10px auto;
            border-radius: 50%;
            width: 120px;
            height: 120px;
            object-fit: cover;
        }

        .file-upload {
            border: 2px dashed #ccc;
            border-radius: 10px;
            padding: 10px;
            text-align: center;
            cursor: pointer;
            transition: 0.3s;
        }

        .file-upload:hover {
            background: #f1f1f1;
        }

        .mt-3 {
            font-weight: bold;
            text-align: center;
        }
    </style>

</head>
<body>

    <form id="form1" runat="server" class="profile-container">
        <h3>Edit Nurse Profile</h3>

        <div class="form-group text-center">
            <label>Profile Picture</label><br />
            <asp:Image ID="imgProfile" runat="server" CssClass="img-thumbnail" />
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label>Name:</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group">
                    <label>Age:</label>
                    <asp:TextBox ID="txtAge" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group">
                    <label>Gender:</label>
                    <asp:TextBox ID="txtGender" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group">
                    <label>Address:</label>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" />
                </div>
            </div>

            <div class="col-md-6">
                <div class="form-group">
                    <label>Email:</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group">
                    <label>Contact:</label>
                    <asp:TextBox ID="txtContact" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group file-upload">
                    <asp:FileUpload ID="fileUpload" runat="server" CssClass="form-control mt-2" />
                    <small class="text-muted">Click to upload a new profile picture</small>
                </div>
            </div>
        </div>

        <asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="btn btn-primary mt-3" OnClick="btnSave_Click" />
        <asp:Label ID="lblMessage" runat="server" CssClass="mt-3" />
    </form>

</body>
</html>
