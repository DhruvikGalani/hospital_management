<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Doctorhomepage.aspx.cs" Inherits="hospital_management.Doctor.Doctorhomepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title>Doctor Dashboard | Hospital Management System</title>
 <link rel="stylesheet" href="https://bootstrap.min.css">
 <script src="https://kit.fontawesome.com/a076d05399.js"></script>
 <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">     <style>
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
      <div class="sidebar">
      <h2>HMS - Doctor</h2>
      <ul>
          <%--  <li><a href="profile.aspx" target="contentFrame"> 👤Profile</a></li>
  <li><a href="homepage.aspx" target="contentFrame">🏠 Home</a></li>
  <li><a href="Ambulance_details.aspx" target="contentFrame">🚑 Ambulance Services</a></li>
  <li><a href="Emergency_details.aspx" target="contentFrame">⚠️ Emergency Cases</a></li>
  <li><a href="laboratorytest_details.aspx" target="contentFrame">🧪 Laboratory Management</a></li>
  <li><a href="patient_details.aspx" target="contentFrame">🧑‍⚕️ Patient Management</a></li>
  <li><a href="medical_records.aspx" target="contentFrame">📄 Doctor Records</a></li>
  <li><a href="billing_manage.aspx" target="contentFrame"> 💳Billing Management</a></li>--%>
          <li><a href="DoctorProfile.aspx" target="contentFrame"><i class="fas fa-user"></i>Profile</a></li>
          <li><a href="DHomepage.aspx" target="contentFrame"><i class="fas fa-home"></i>Home</a></li>
          <li><a href="MedicalRecord.aspx" target="contentFrame"><i class="fas fa-ambulance"></i>Medical Record</a></li>
          <li><a href="NutritionWellness.aspx" target="contentFrame"><i class="fas fa-exclamation-triangle"></i>Nutrition Wellness</a></li>
          <li><a href="Patientsandcarers.aspx" target="contentFrame"><i class="fas fa-vials"></i>Patients and carers</a></li>
  
      </ul>

  </div>

  <div class="main-content">
      <div class="header">
          <h2>Welcome</h2>
      </div>

      <!-- Iframe to load pages without redirecting -->

      <iframe name="contentFrame" class="content-frame" src="DHomepage.aspx"></iframe>

  </div>

</body>
</html>
