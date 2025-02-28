<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="nurse_dashboard.aspx.cs" Inherits="hospital_management.Nurse_dashboard.nurse_dashboard" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nurse Dashboard | Hospital Management System</title>
    <link rel="stylesheet" href="bootstrap.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>

<style>
    /* Sidebar */
    .sidebar {
        position: fixed;
        width: 250px;
        height: 100%;
        background: #2c3e50;
        padding-top: 20px;
        color: white;
    }

    .sidebar h2 {
        text-align: center;
        margin-bottom: 30px;
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
        display: block;
        cursor: pointer;
    }

    .sidebar ul li a i {
        margin-right: 10px;
    }

    .sidebar ul li:hover {
        background: #1a252f;
    }

    /* Main Content */
    .main-content {
        margin-left: 250px;
        padding: 20px;
        background: #f8f9fa;
        min-height: 100vh;
    }

    /* Header */
    .header {
        background: #3498db;
        padding: 20px;
        color: white;
        text-align: center;
        border-radius: 5px;
        margin-bottom: 20px;
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
        <h2>HMS - Nurse</h2>
        <ul>
                        <li><a href="home.aspx" target="contentFrame"><i class="fas fa-user-home"></i> Home</a></li>

            <li><a href="nurse_details.aspx" target="contentFrame"><i class="fas fa-user-nurse"></i> Nurse Details</a></li>
            <li><a href=".aspx" target="contentFrame"><i class="fas fa-ambulance"></i> Ambulance Services</a></li>
            <li><a href=".aspx" target="contentFrame"><i class="fas fa-flask"></i> Emergency Management</a></li>
            <li><a href="laboratoryTest.aspx" target="contentFrame"><i class="fas fa-utensils"></i> Laboratory Management</a></li>
            <li><a href=".aspx" target="contentFrame"><i class="fas fa-exclamation-triangle"></i> Pharmacy Cases</a></li>
            <li><a href=".aspx"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="header">
            <h2>Welcome</h2>
        </div>

        <!-- Iframe to load pages without redirecting -->
    
        <iframe name="contentFrame" class="content-frame" src="nurse_details.aspx"></iframe>

    </div>

</body>
</html>

