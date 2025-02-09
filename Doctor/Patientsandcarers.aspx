<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Patientsandcarers.aspx.cs" Inherits="hospital_management.Doctor.Patientsandcarers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }

    .container {
        display: flex;
        height: 100vh;
    }

    .sidebar {
        width: 300px;
        background-color: #f5f5f5;
        padding: 100px;
        box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        
    }

    .sidebar h2 {
        color: #8b3dc7;
        font-size: 50px;
        margin-bottom: 20px;
    }

    .sidebar ul {
        list-style: none;
        padding: 30px;
    }

    .sidebar ul li {
        margin-bottom: 10px;
    }

    .sidebar ul li a {
        text-decoration: none;
        color: #6f42c1;
        font-weight: bold;
        font-size: 20px;
        display: block;
        padding: 5px;
        border-radius: 5px;
    }

    .sidebar ul li a:hover {
        background-color: #eae6f9;
    }

    .content {
        position : absolute;
        display : none;
        padding: 20px;
        background-color: #f9f9ff;

    }
    .sidebar ul li a:hover content{
        display : block;
    }
    
    .content h1 {
        color: #6f42c1;
        font-size: 24px;
    }

    .content p {
        font-size: 16px;
        color: #333;
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
       
            
        <div class="container">
            <div class="sidebar">
                <img src="Images/hms_logo.svg" alt="Infinity Health Care Logo" />
                <h2>Patients and Carers</h2>
                <ul>
                    <li><a href="#becoming-patient">Becoming a Peter Mac patient</a></li>
                    <div class="content">
    <h1>Becoming a Peter Mac Patient</h1>
    <h2>Getting Started</h2>
    <h2>Information For Inpatients</h2>
    <h2>Planning Your care</h2>
    <h2>Administration</h2>
    <h2>patient accommodation</h2>    
</div>
                    <li><a href="#types-of-cancer">Types of Cancer</a></li>
                    <li><a href="#treatments">Treatments</a></li>
                    <li><a href="#tests-diagnosis">Tests and Diagnosis</a></li>
                    <li><a href="#health-services">Health Services</a></li>
                    <li><a href="#children-young">Children and Young People</a></li>
                    <li><a href="#clinical-trials">Clinical Trials</a></li>
                    <li><a href="#support-wellbeing">Support and Wellbeing</a></li>
                </ul>
            </div>
            
            <div class="content2">
                <h1>Type Of Cancer</h1>
                <h2>Blood Cancer</h2>
                <h2>Bone And soft Tissue Cancer</h2>
                <h2>Brain And Spine Cancer</h2>
                <h2>Breast Cancer</h2>
                <h2>Cancer Of Unknown Primary</h2>
                <h2>Children's Cancer</h2>
                <h2>Lung Cancer</h2>
            </div>
            <div class="content3">
                <h1>Treatment</h1>
                <h2>Apheresis</h2>
                <h2>Bone marrow and stem cell transplant</h2>
                <h2>Chemotherapy</h2>
                <h2>Haematological Treatments</h2>
                <h2>Immunotherapy</h2>
                <h2>Nuclear Medicine</h2>
                <h2>Radiation Therapy</h2>
                <h2>Stomal therapy</h2>
                <h2>Surgery</h2>
            </div>
        </div>
    </form>
</body>
</html>

        
    