<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="hospital_management.pages.RegisterPage" %>

<!DOCTYPE html>
<html>
    <head>
    <meta charset="utf-8">
    <title>Register Patient</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            background: url("../Images/formImage_2.jpg") no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
            position: relative;
        }

        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            backdrop-filter: blur(3px);
            background: rgba(37, 97, 108, 0.20);
            z-index: -1;
        }

        .container {
            max-width: 800px;
            background: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .form-label {
            font-weight: bold;
        }
    </style>
</head>

<body>
    <div class="container">
        <h2 class="text-center mb-4">Patient Registration</h2>
        <form id="form1" runat="server">
            <div class="row">
                <!-- Left Column -->
                <div class="col-md-6">
                    <div class="mb-3">
                        <label class="form-label">Full Name</label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Age</label>
                        <asp:TextBox ID="txtAge" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Gender</label>
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                            <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                            <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Date of Birth</label>
                        <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Contact Number</label>
                        <asp:TextBox ID="txtContact" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                    </div>
                </div>

                <!-- Right Column -->
                <div class="col-md-6">
                    <div class="mb-3">
                        <label class="form-label">Address</label>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Emergency Contact</label>
                        <asp:TextBox ID="txtEmergencyContact" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Blood Group</label>
                        <asp:DropDownList ID="ddlBloodGroup" runat="server" CssClass="form-control">
                            <asp:ListItem Text="A+" Value="A+"></asp:ListItem>
                            <asp:ListItem Text="A-" Value="A-"></asp:ListItem>
                            <asp:ListItem Text="B+" Value="B+"></asp:ListItem>
                            <asp:ListItem Text="B-" Value="B-"></asp:ListItem>
                            <asp:ListItem Text="O+" Value="O+"></asp:ListItem>
                            <asp:ListItem Text="O-" Value="O-"></asp:ListItem>
                            <asp:ListItem Text="AB+" Value="AB+"></asp:ListItem>
                            <asp:ListItem Text="AB-" Value="AB-"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Allergies</label>
                        <asp:TextBox ID="txtAllergies" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Running Medicines</label>
                        <asp:TextBox ID="txtMedicines" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Do you have Insurance?</label>
                        <asp:DropDownList ID="ddlInsurance" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Profile Picture</label>
                        <asp:FileUpload ID="fuProfile" runat="server" CssClass="form-control"/>
                    </div>
                </div>
            </div>

            <asp:Button ID="btnSubmit" runat="server" Text="Register" CssClass="btn btn-primary w-100 mt-3" OnClick="btnSubmit_Click"/>
        </form>
    </div>
</body>
</html>--%>


<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="hospital_management.pages.RegisterPage" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Register Patient</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        html, body {
            height: 100%;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: url("../Images/formImage_2.jpg") no-repeat center center fixed;
            background-size: cover;
            position: relative;
            text-align: center;
        }

        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            backdrop-filter: blur(5px);
            background: rgba(37, 97, 108, 0.20);
            z-index: -1;
        }

        .container {
            width: 800px;
            padding: 30px;
            background: rgba(221, 225, 231, 0.90);
            border-radius: 20px;
            box-shadow: -3px -3px 7px #ffffff73, 2px 2px 5px rgba(94,104,121,0.288);
            position: relative;
            z-index: 1;
        }

        .container h2 {
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 20px;
            color: #595959;
        }

        .row {
            display: flex;
            gap: 20px;
        }

        .column {
            flex: 1;
        }

        .field {
            height: 50px;
            width: 100%;
            display: flex;
            position: relative;
            margin-bottom: 20px;
        }

        .field input, .field select, .field textarea {
            height: 100%;
            width: 100%;
            padding-left: 45px;
            outline: none;
            border: none;
            font-size: 16px;
            background: #dde1e7;
            color: #595959;
            border-radius: 25px;
            box-shadow: inset 2px 2px 5px #BABECC, inset -5px -5px 10px #ffffff73;
        }

        .field textarea {
            padding-left: 15px;
            padding-top: 10px;
            height: 70px;
        }

        .field span {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #595959;
        }

        .submit-btn {
            width: 100%;
            height: 50px;
            font-size: 18px;
            font-weight: 600;
            background: #dde1e7;
            border-radius: 25px;
            border: none;
            cursor: pointer;
            color: #595959;
            box-shadow: 2px 2px 5px #BABECC, -5px -5px 10px #ffffff73;
        }

        .submit-btn:hover {
            background: #cdd1d7;
        }
       /* General input styles */
.field {
    height: 50px;
    width: 100%;
    display: flex;
    position: relative;
    margin-bottom: 20px;
}

/* File Upload Styling */
.file-upload-box {
    display: flex;
    align-items: center;
    padding: 12px;
    background: #dde1e7;
    border-radius: 25px;
    box-shadow: inset 2px 2px 5px #BABECC, inset -5px -5px 10px #ffffff73;
    cursor: pointer;
}

/* File Upload Input */
.file-upload {
    flex: 1;
    padding-left: 15px;
    font-size: 16px;
    color: #595959;
    background: transparent;
    border: none;
    outline: none;
    cursor: pointer;
}

/* Icon styling */
.file-upload-box span {
    position: absolute;
    left: 15px;
    top: 50%;
    transform: translateY(-50%);
    color: #595959;
}


    </style>
</head>

<body>
    <div class="container">
        <h2>Patient Registration</h2>
        <form id="form1" runat="server">
            <div class="row">
                <!-- Left Column -->
                <div class="column">
                    <div class="field">
                        <span class="fas fa-user"></span>
                        <asp:TextBox ID="txtName" runat="server" placeholder="Full Name"></asp:TextBox>
                    </div>
                    <div class="field">
                        <span class="fas fa-sort-numeric-up"></span>
                        <asp:TextBox ID="txtAge" runat="server" TextMode="Number" placeholder="Age"></asp:TextBox>
                    </div>
                    <div class="field">
                        <span class="fas fa-venus-mars"></span>
                        <asp:DropDownList ID="ddlGender" runat="server">
                            <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                            <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                            <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="field">
                        <span class="fas fa-calendar-alt"></span>
                        <asp:TextBox ID="txtDOB" runat="server" TextMode="Date"></asp:TextBox>
                    </div>
                    <div class="field">
                        <span class="fas fa-phone"></span>
                        <asp:TextBox ID="txtContact" runat="server" placeholder="Contact Number"></asp:TextBox>
                    </div>
                    <div class="field">
                        <span class="fas fa-envelope"></span>
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" placeholder="Email"></asp:TextBox>
                    </div>
                    <div class="field">
                        <span class="fas fa-lock"></span>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
                    </div>
                </div>

                <!-- Right Column -->
                <div class="column">
                    <div class="field">
                        <span class="fas fa-home"></span>
                        <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" placeholder="Address"></asp:TextBox>
                    </div>
                    <div class="field">
                        <span class="fas fa-phone-square-alt"></span>
                        <asp:TextBox ID="txtEmergencyContact" runat="server" placeholder="Emergency Contact"></asp:TextBox>
                    </div>
                    <div class="field">
                        <span class="fas fa-tint"></span>
                        <asp:DropDownList ID="ddlBloodGroup" runat="server">
                            <asp:ListItem Text="A+" Value="A+"></asp:ListItem>
                            <asp:ListItem Text="A-" Value="A-"></asp:ListItem>
                            <asp:ListItem Text="B+" Value="B+"></asp:ListItem>
                            <asp:ListItem Text="B-" Value="B-"></asp:ListItem>
                            <asp:ListItem Text="O+" Value="O+"></asp:ListItem>
                            <asp:ListItem Text="O-" Value="O-"></asp:ListItem>
                            <asp:ListItem Text="AB+" Value="AB+"></asp:ListItem>
                            <asp:ListItem Text="AB-" Value="AB-"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="field">
                        <span class="fas fa-allergies"></span>
                        <asp:TextBox ID="txtAllergies" runat="server" TextMode="MultiLine" placeholder="Allergies"></asp:TextBox>
                    </div>
                    <div class="field">
                        <span class="fas fa-pills"></span>
                        <asp:TextBox ID="txtMedicines" runat="server" TextMode="MultiLine" placeholder="Running Medicines"></asp:TextBox>
                    </div>
                    <div class="field">
                        <span class="fas fa-user-shield"></span>
                        <asp:DropDownList ID="ddlInsurance" runat="server">
                            <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="field file-upload-box">
                        <span class="fas fa-upload"></span>
                        <asp:FileUpload ID="fuProfile" runat="server" CssClass="file-upload" />
                    </div>

                </div>
            </div>
            <asp:Button ID="btnSubmit" runat="server" Text="Register" CssClass="submit-btn" OnClick="btnSubmit_Click" />
        </form>
    </div>
</body>
</html>
