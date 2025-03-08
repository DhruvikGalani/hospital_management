<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoctorDetails.aspx.cs" Inherits="hospital_management.Doctor.DoctorDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
          <title>Doctor Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 50%;
            margin: 30px auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }
        .header {
            background: #007bff;
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 22px;
            border-radius: 8px 8px 0 0;
            font-weight: bold;
        }
        .error-message {
            color: red;
            font-size: 14px;
            margin-bottom: 10px;
        }
        label {
            font-weight: bold;
            margin-top: 10px;
            display: block;
        }
        select, input, textarea {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .btn-submit {
            background: #007bff;
            color: white;
            padding: 10px;
            width: 100%;
            border: none;
            cursor: pointer;
            font-size: 16px;
            border-radius: 4px;
            margin-top: 15px;
        }
        .btn-submit:hover {
            background: #0056b3;
        }
        .btn-reset {
            background: #f8f9fa;
            color: #007bff;
            padding: 10px;
            width: 100%;
            border: 1px solid #007bff;
            cursor: pointer;
            font-size: 16px;
            border-radius: 4px;
            margin-top: 15px;
        }
        .btn-reset:hover {
    background: #0056b3;
}
    </style>
</head>
<body>
    <form id="formDoctorRegister" runat="server" enctype="multipart/form-data">
        <div class="container">
            <div class="header">🩺 Doctor Registration</div>
            <asp:Label ID="lblError" runat="server" CssClass="error-message" />

            <label>👨‍⚕️ Full Name</label>
            <asp:TextBox ID="txtName" runat="server" required></asp:TextBox>

            <label>🎂 Age</label>
            <asp:TextBox ID="txtAge" runat="server" TextMode="Number" required></asp:TextBox>

            <label>🚻 Gender</label>
            <asp:DropDownList ID="ddlGender" runat="server">
                <asp:ListItem Text="--Select Gender--" Value="" />
                <asp:ListItem Text="Male" Value="Male" />
                <asp:ListItem Text="Female" Value="Female" />
                <asp:ListItem Text="Other" Value="Other" />
            </asp:DropDownList>

            <label>📍 Address</label>
            <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" required></asp:TextBox>

            <label>🔐 Password</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" required></asp:TextBox>

            <label>🔐 Confirm Password</label>
            <asp:TextBox ID="txtcPassword" runat="server" TextMode="Password" required></asp:TextBox>

            <label>🏥 Specialization</label>
            <asp:DropDownList ID="ddlSpecialization" runat="server">
                <asp:ListItem Text="--Select Specialization--" Value="" />
                <asp:ListItem Text="Cardiology" Value="Cardiology" />
                <asp:ListItem Text="Neurology" Value="Neurology" />
                <asp:ListItem Text="Orthopedics" Value="Orthopedics" />
                <asp:ListItem Text="Pediatrics" Value="Pediatrics" />
            </asp:DropDownList>

            <label>📅 Years of Experience</label>
            <asp:TextBox ID="txtExperience" runat="server" TextMode="Number" required></asp:TextBox>

            <label>📞 Contact Number</label>
            <asp:TextBox ID="txtContact" runat="server" required></asp:TextBox>

            <label>📧 Email</label>
            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" required></asp:TextBox>

            <label>📜 License Number</label>
            <asp:TextBox ID="txtLicense" runat="server" required></asp:TextBox>

            <label>💰 Consultation Fee</label>
            <asp:TextBox ID="txtFee" runat="server" TextMode="Number" required></asp:TextBox>

            <label>🖼 Profile Picture</label>
            <asp:FileUpload ID="fileProfile" runat="server" required />

            <asp:Button ID="btnSubmit" runat="server" CssClass="btn-submit" Text="✔ Register Doctor" OnClick="btnSubmit_Click"    />
             <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn-reset" OnClick="btnReset_Click"  />
        </div>
    </form>
</body>
</html>