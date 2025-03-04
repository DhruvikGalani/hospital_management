<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_DashBordPage.aspx.cs" Inherits="hospital_management.Admin_Dashbord.Admin_DashBordPage" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard | Hospital Management System</title>
    <link rel="stylesheet" href="https://bootstrap.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

    <style>
        /* Sidebar */
        .sidebar {
            position: fixed;
            width: 260px;
            height: 100vh;
            overflow-y: auto;
            background: #2c3e50;
            padding-top: 20px;
            padding-bottom: 10px;
            color: white;
            transition: width 0.3s;
            scrollbar-width: thin;
            scrollbar-color: #888 #2c3e50;
        }

        .sidebar::-webkit-scrollbar {
            width: 8px;
        }

        .sidebar::-webkit-scrollbar-thumb {
            background: #888;
            border-radius: 4px;
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 22px;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar ul li {
            padding: 15px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }

        .sidebar ul li a {
            color: white;
            text-decoration: none;
            display: flex;
            align-items: center;
            font-size: 18px;
        }

        .sidebar ul li a i {
            margin-right: 12px;
            font-size: 20px;
        }

        .sidebar ul li:hover {
            background: #1a252f;
        }

        /* Main Content */
        .main-content {
            margin-left: 260px;
            padding: 20px;
            background: #f8f9fa;
            min-height: 100vh;
            transition: margin-left 0.3s;
        }

        /* Header */
        .header {
            background: #3498db;
            padding: 20px;
            color: white;
            text-align: center;
            border-radius: 5px;
            margin-bottom: 20px;
            font-size: 24px;
        }

        /* Iframe */
        .content-frame {
            width: 100%;
            height: 80vh;
            border: none;
            background: white;
        }
    </style>
</head>
<body>

    <!-- Sidebar Navigation -->
    <div class="sidebar">
        <h2>HMS - Admin</h2>
        <ul>
            <li><a href="admin_homePage.aspx" target="contentFrame"><i class="fas fa-home"></i>Home</a></li>
            <li><a href="manage_doctors.aspx" target="contentFrame"><i class="fas fa-user-md"></i>Manage Doctors</a></li>
            <li><a href="manage_nurses.aspx" target="contentFrame"><i class="fas fa-user-nurse"></i>Manage Nurses</a></li>
            <li><a href="manage_patients.aspx" target="contentFrame"><i class="fas fa-procedures"></i>Manage Patients</a></li>
            <li><a href="manage_staff.aspx" target="contentFrame"><i class="fas fa-users"></i>Manage Staff</a></li>
            <li><a href="../Nurse_dashboard/Ambulance_details.aspx" target="contentFrame"><i class="fas fa-ambulance"></i>Ambulances</a></li>
            <li><a href="manage_insurance.aspx" target="contentFrame"><i class="fas fa-file-invoice-dollar"></i>Insurance</a></li>
            <li><a href="appointments.aspx" target="contentFrame"><i class="fas fa-calendar-check"></i>Appointments</a></li>
            <li><a href="medical_records.aspx" target="contentFrame"><i class="fas fa-file-medical"></i>Medical Records</a></li>
            <li><a href="billing.aspx" target="contentFrame"><i class="fas fa-money-bill-wave"></i>Billing & Payments</a></li>
            <li><a href="../Nurse_dashboard/laboratorytest_details.aspx" target="contentFrame"><i class="fas fa-vials"></i>Laboratory Tests</a></li>
            <li><a href="feedback_review.aspx" target="contentFrame"><i class="fas fa-comment-dots"></i>Feedback & Reviews</a></li>
            <li><a href="nutrition_wellness.aspx" target="contentFrame"><i class="fas fa-apple-alt"></i>Nutrition & Wellness</a></li>
            <li><a href="reports.aspx" target="contentFrame"><i class="fas fa-chart-line"></i>Reports</a></li>
            <li><a href="settings.aspx" target="contentFrame"><i class="fas fa-cogs"></i>Settings</a></li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="header">
            <h2>Welcome Admin</h2>
        </div>

        <!-- Iframe to load pages without redirecting -->
        <iframe name="contentFrame" class="content-frame" src="admin_homePage.aspx"></iframe>
    </div>

</body>
</html>
