<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Appointments.aspx.cs" Inherits="hospital_management.Patient.Appointments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Medical Appointment Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        .bg-light {
            width: 100%;
            height: 100vh; /* Full height of viewport */
            background-image: url('../Images/Doctor_stethoscope.jpg');
            background-size: cover;
            background-position: center;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
        }

        /* Background overlay */
        .bg-light::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 255, 0.2);
            z-index: 0;
        }

        .card-body {
            position: relative;
            z-index: 1;
            background: rgba(255, 255, 255, 0.9); /* White semi-transparent background */
            border-radius: 10px;
            width: 100%; /* Increase width */
            max-width: 1000px; /* Set max-width */
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }

        .form-label {
            font-weight: bold;
            font-size: 18px;
            color: black;  
           
        }

        .form-control {
            width: 100%; /* Ensure full width */
            height: 100%; /* Increase height */
            font-size: 16px;
           

        }

        .btn-primary {
            font-size: 18px;
            padding: 10px;
        }
    </style>
</head>

<body class="bg-light">
    <form id="form1" runat="server">
   

    <div class="card-body">
         <h3 class="text-center">Medical Appointment Form</h3>
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>

                <div class="row">
                    <!-- First Column -->
                    <div class="col-md-6">
                        <div>
                            <label class="form-label">Patient Name:</label>
                            <asp:TextBox ID="txtPatientName" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div>
                            <label class="form-label">Phone Number:</label>
                            <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div>
                            <label class="form-label">Email:</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                        </div>
                        <div>
                            <label class="form-label">Symptoms:</label>
                            <asp:TextBox ID="txtSymptoms" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <!-- Second Column -->
                    <div class="col-md-6">
                        <div>
                            <label class="form-label">Select Date:</label>
                            <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        </div>
                        <div>
                            <label class="form-label">Department:</label>
                            <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-control">
                                <asp:ListItem>Select Department</asp:ListItem>
                                <asp:ListItem>General Medicine</asp:ListItem>
                                <asp:ListItem>Cardiology</asp:ListItem>
                                <asp:ListItem>Neurology</asp:ListItem>
                                <asp:ListItem>Orthopedics</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div>
                            <label class="form-label">Gender:</label>
                            <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                                <asp:ListItem>Select Gender</asp:ListItem>
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                                <asp:ListItem>Other</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div>
                            <label class="form-label">Time:</label>
                            <asp:TextBox ID="txtTime" runat="server" CssClass="form-control" TextMode="Time"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <!-- Submit Button (Centered) -->
                <div class="text-center mt-3">
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Make an Appointment" OnClick="btnSubmit_Click" />
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</form>
</body>
</html>
