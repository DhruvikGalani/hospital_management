<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="hospital_management.pages.RegisterPage" %>

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
<%--<head>
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
            backdrop-filter: blur(2px);
            -webkit-backdrop-filter: blur(5px);
            background: rgba(37, 97, 108, 0.20);
            z-index: -1;
        }

        .container {
            width: 500px;
            padding: 40px;
            background: rgba(221, 225, 231, 0.95);
            border-radius: 20px;
            box-shadow: -3px -3px 7px #ffffff73, 2px 2px 5px rgba(94,104,121,0.288);
            position: relative;
            z-index: 1;
        }

        .text-center {
            font-size: 30px;
            font-weight: 600;
            margin-bottom: 25px;
            color: #595959;
        }

        .mb-3 {
            height: 50px;
            width: 100%;
            display: flex;
            position: relative;
            margin-bottom: 20px;
        }

        .mb-3 form-label {
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

        .field span {
            position: absolute;
            color: #595959;
            width: 50px;
            line-height: 50px;
        }

        #btnSubmit {
            width: 100%;
            height: 50px;
            font-size: 18px;
            font-weight: 600;
            background: #dde1e7;
            border-radius: 25px;
            border: none;
            outline: none;
            cursor: pointer;
            color: #595959;
            box-shadow: 2px 2px 5px #BABECC, -5px -5px 10px #ffffff73;
            margin-top: 10px;
        }

        .sign-up {
            margin-top: 10px;
            font-size: 16px;
            color: #595959;
        }

        .sign-up a {
            color: #3498db;
            text-decoration: none;
        }

        .mb-3 {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            width: 100%;
        }

            .mb-3 label {
                font-weight: bold;
                margin-bottom: 5px;
            }

        .form-control {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

    </style>
</head>--%>

    <%--<body>
        <div class="container mt-5">
    <h2 class="text-center">Patient Registration</h2>
    <form id="form1" runat="server" class="card p-4">
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

    <%--<div class="container mt-5">
        <h2 class="text-center">Patient Registration</h2>
        <form id="form1" runat="server" class="card p-4">
            <div class="mb-3">
                <label class="form-label">Full Name</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" ></asp:TextBox>
            </div>

            <div class="mb-3">
                <label class="form-label">Age</label>
                <asp:TextBox ID="txtAge" runat="server" CssClass="form-control" TextMode="Number" ></asp:TextBox>
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
                <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" TextMode="Date" ></asp:TextBox>
            </div>

            <div class="mb-3">
                <label class="form-label">Contact Number</label>
                <asp:TextBox ID="txtContact" runat="server" CssClass="form-control" ></asp:TextBox>
            </div>

            <div class="mb-3">
                <label class="form-label">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" ></asp:TextBox>
            </div>

            <div class="mb-3">
                <label class="form-label">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" ></asp:TextBox>
            </div>

            <div class="mb-3">
                <label class="form-label">Address</label>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" ></asp:TextBox>
            </div>

            <div class="mb-3">
                <label class="form-label">Emergency Contact</label>
                <asp:TextBox ID="txtEmergencyContact" runat="server" CssClass="form-control" ></asp:TextBox>
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
                <asp:TextBox ID="txtAllergies" runat="server" CssClass="form-control" TextMode="MultiLine" ></asp:TextBox>
            </div>

            <div class="mb-3">
                <label class="form-label">Running Medicines</label>
                <asp:TextBox ID="txtMedicines" runat="server" CssClass="form-control" TextMode="MultiLine" ></asp:TextBox>
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
                <asp:FileUpload ID="fuProfile" runat="server" CssClass="form-control"  />
            </div>

            <asp:Button ID="btnSubmit" runat="server" Text="Register" CssClass="btn btn-primary w-100" OnClick="btnSubmit_Click"/>
        </form>
    </div>--%>
</body>


</html>
