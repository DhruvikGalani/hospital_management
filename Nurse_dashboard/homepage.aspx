<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="hospital_management.Nurse_dashboard.home_page" %>





<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title>Nurse Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="aspx.css" rel="stylesheet" />
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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <!-- Header Section -->


            <!-- Card Section -->
            <div class="row">
                <div class="col-md-4 mb-4">
                    <div class="dashboard-card">
                        <i class="fa fa-user-nurse text-primary"></i>
                        <h4>Nurses</h4>
                        <p>Manage Nurse Records</p>
                    </div>
                </div>

                <div class="col-md-4 mb-4">
                    <div class="dashboard-card">
                        <i class="fa fa-ambulance text-danger"></i>
                        <h4>Ambulances</h4>
                        <p>Monitor Availability</p>
                    </div>
                </div>

                <div class="col-md-4 mb-4">
                    <div class="dashboard-card">
                        <i class="fa fa-procedures text-warning"></i>
                        <h4>Emergency Cases</h4>
                        <p>Handle Critical Situations</p>
                    </div>
                </div>

                <div class="col-md-4 mb-4">
                    <div class="dashboard-card">
                        <i class="fa fa-hospital-user text-success"></i>
                        <h4>Total Patients</h4>
                        <p>Currently Admitted: 120</p>
                    </div>
                </div>

                <div class="col-md-4 mb-4">
                    <div class="dashboard-card">
                        <i class="fa fa-calendar-check text-info"></i>
                        <h4>Appointments</h4>
                        <p>Today's Appointments: 45</p>
                    </div>
                </div>

                <div class="col-md-4 mb-4">
                    <div class="dashboard-card">
                        <i class="fa fa-user-check text-secondary"></i>
                        <h4>Discharged Patients</h4>
                        <p>This Week: 30</p>
                    </div>
                </div>


            </div>
        </div>
    </form>

    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script>
		document.addEventListener("DOMContentLoaded", function () {
			console.log("Nurse Dashboard Loaded Successfully!");
		});
	</script>
</body>
</html>

