<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DHomepage.aspx.cs" Inherits="hospital_management.Doctor.DHomepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Doctor Dashboard</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
   <link href="aspx.css" rel="stylesheet" />
   <script src="https://kit.fontawesome.com/a076d05399.js"></script>
   <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

   <style>
       body {
           background-color: #f8f9fa;
       }

       .dashboard-card {
           padding: 50px; /* Increased padding */
           text-align: center;
           background: white;
           border-radius: 15px;
           box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.3);
           transition: transform 0.3s ease;
           cursor: pointer;
       }

       .dashboard-card:hover {
           transform: scale(1.1); /* Slightly bigger on hover */
       }

       i {
           font-size: 60px; /* Larger icons */
           margin-bottom: 20px;
       }

       h4 {
           font-size: 24px; /* Bigger text */
       }

       p {
           font-size: 18px; /* Adjust paragraph size */
       }
   </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <div class="row">
                <div class="col-md-6 mb-4">
                    <div class="dashboard-card">
                        <i class="fa fa-user-nurse text-primary"></i>
                        <h4>Doctor</h4>
                        <p>Manage Doctor Records</p>
                    </div>
                </div>

                <div class="col-md-6 mb-4">
                    <div class="dashboard-card">
                        <i class="fa fa-ambulance text-danger"></i>
                        <h4>Medical Record</h4>
                        <p>Monitor Availability</p>
                    </div>
                </div>

                <div class="col-md-6 mb-4">
                    <div class="dashboard-card">
                        <i class="fa fa-procedures text-warning"></i>
                        <h4>Nutrition Wellness</h4>
                        <p>Handle Critical Situations</p>
                    </div>
                </div>

                <div class="col-md-6 mb-4">
                    <div class="dashboard-card">
                        <i class="fa fa-hospital-user text-success"></i>
                        <h4>Patients and Carers</h4>
                        <p>Currently Admitted: 120</p>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            console.log("Doctor Dashboard Loaded Successfully!");
        });
    </script>
</body>
</html>
