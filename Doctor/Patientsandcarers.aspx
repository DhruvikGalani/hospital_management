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
            display: none;
            padding: 20px;
            background-color: #f9f9ff;
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

    <script>
        function showContent(contentId) {
            // Hide all content sections
            var contents = document.querySelectorAll('.content');
            contents.forEach(function (content) {
                content.style.display = 'none';
            });

            // Show the selected content
            var selectedContent = document.getElementById(contentId);
            if (selectedContent) {
                selectedContent.style.display = 'block';
            }
        }
    </script>
</head>

<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="sidebar">
                <img src="Images/hms_logo.svg" alt="Infinity Health Care Logo" />
                <h2>Patients and Carers</h2>
                <ul>
                    <li><a href="javascript:void(0)" onclick="showContent('becoming-patient')">Becoming a Peter Mac patient</a></li>
                    <li><a href="javascript:void(0)" onclick="showContent('types-of-cancer')">Types of Cancer</a></li>
                    <li><a href="javascript:void(0)" onclick="showContent('treatments')">Treatments</a></li>
                    <li><a href="javascript:void(0)" onclick="showContent('tests-diagnosis')">Tests and Diagnosis</a></li>
                    <li><a href="javascript:void(0)" onclick="showContent('health-services')">Health Services</a></li>
                    <li><a href="javascript:void(0)" onclick="showContent('children-young')">Children and Young People</a></li>
                    <li><a href="javascript:void(0)" onclick="showContent('clinical-trials')">Clinical Trials</a></li>
                    <li><a href="javascript:void(0)" onclick="showContent('support-wellbeing')">Support and Wellbeing</a></li>
                </ul>
            </div>

            
            <div class="content" id="becoming-patient">
                <h1>Becoming a Peter Mac Patient</h1>
                <h2>Getting Started</h2>
                <h2>Information For Inpatients</h2>
                <h2>Planning Your Care</h2>
                <h2>Administration</h2>
                <h2>Patient Accommodation</h2>
            </div>

            
            <div class="content" id="types-of-cancer">
                <h1>Types of Cancer</h1>
                <h2>Blood Cancer</h2>
                <h2>Bone and Soft Tissue Cancer</h2>
                <h2>Brain and Spine Cancer</h2>
                <h2>Breast Cancer</h2>
                <h2>Cancer of Unknown Primary</h2>
                <h2>Children's Cancer</h2>
                <h2>Lung Cancer</h2>
            </div>

            
            <div class="content" id="treatments">
                <h1>Treatment</h1>
                <h2>Apheresis</h2>
                <h2>Bone Marrow and Stem Cell Transplant</h2>
                <h2>Chemotherapy</h2>
                <h2>Haematological Treatments</h2>
                <h2>Immunotherapy</h2>
                <h2>Nuclear Medicine</h2>
                <h2>Radiation Therapy</h2>
                <h2>Stomal Therapy</h2>
                <h2>Surgery</h2>
            </div>

            <div class="content" id="tests-diagnosis">
                <h1>Tests and Diagnosis</h1>
                <h2>Biopsies</h2>
                <h2>Genetic Testing</h2>
                <h2>Imaging</h2>
                <h2>Pathology</h2>
            </div>

            <div class="content" id="health-services">
                <h1>Health Services</h1>
                <h2>Allied Health Services</h2>
                <h2>Enhanced Care Unit</h2>
                <h2>End of Life</h2>
                <h2>Late effects</h2>
                <h2>Mouth/oral Health</h2>
                <h2>Pain Management</h2>
                <h2>Palliative Care</h2>
                <h2>Pharmacy</h2>
                <h2>Prehabilitation</h2>
            </div>

            <div class="content" id="children-young">
                <h1>Children and Young People</h1>
                <h2>Children</h2>
                <h2>Victorian Adolescent and Young Adult Cancer service</h2>
            </div>

            <div class="content" id="clinical-trials">
                <h1>Clinical Trials</h1>
                <h2>Understanding Clinical trial</h2>
                <h2>Joining Clinical trial</h2>
                <h2>Looking For a Clinical trial</h2>
            </div>

            <div class="content" id="support-wellbeing">
                <h1>Support and Wellbeing</h1>
                <h2>Support services</h2>
                <h2>Wellbeing programs</h2>
                <h2>Volunteer Services</h2>
                <h2>Life after treatment</h2>
                <h2>Cancer School</h2>
            </div>

         

        </div>
    </form>
</body>
</html>


        
    