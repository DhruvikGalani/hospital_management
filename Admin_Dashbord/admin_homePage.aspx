<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_homePage.aspx.cs" Inherits="hospital_management.Admin_Dashbord.admin_homePage" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title>Admin HomePage</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
        }

        .dashboard-card {
            padding: 40px;
            text-align: center;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
            transition: transform 0.3s ease;
            cursor: pointer;
        }

        .dashboard-card:hover {
            transform: scale(1.05);
        }

        i {
            font-size: 50px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <div class="row">
                <div class="col-md-4 mb-4">
                    <div class="dashboard-card">
                        <i class="fa fa-user-md text-primary"></i>
                        <h4>Doctors</h4>
                        <p>Manage Doctor Records</p>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="dashboard-card">
                        <i class="fa fa-user-nurse text-danger"></i>
                        <h4>Nurses</h4>
                        <p>Manage Nurse Records</p>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="dashboard-card">
                        <i class="fa fa-users text-warning"></i>
                        <h4>Patients</h4>
                        <p>View and Manage Patient Records</p>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="dashboard-card">
                        <i class="fa fa-ambulance text-success"></i>
                        <h4>Ambulances</h4>
                        <p>Monitor Availability</p>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="dashboard-card">
                        <i class="fa fa-calendar-check text-info"></i>
                        <h4>Appointments</h4>
                        <p>Manage Appointments</p>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="dashboard-card">
                        <i class="fa fa-file-invoice-dollar text-secondary"></i>
                        <h4>Billing</h4>
                        <p>Manage Hospital Billing</p>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="dashboard-card">
                        <i class="fa fa-vials text-danger"></i>
                        <h4>Laboratory</h4>
                        <p>Manage Lab Tests</p>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="dashboard-card">
                        <i class="fa fa-chart-line text-primary"></i>
                        <h4>Reports</h4>
                        <p>Generate Reports</p>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="dashboard-card">
                        <i class="fa fa-cogs text-dark"></i>
                        <h4>Settings</h4>
                        <p>Configure System Settings</p>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
