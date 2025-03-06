<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="hospital_management.pages.RegisterPage" %>

<!DOCTYPE html>
<html>
<head>
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
            margin-top:100px;
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

        .content {
            width: 500px;
            padding: 40px;
            background: rgba(221, 225, 231, 0.95);
            border-radius: 20px;
            box-shadow: -3px -3px 7px #ffffff73, 2px 2px 5px rgba(94,104,121,0.288);
            position: relative;
            z-index: 1;
        }

        .content .text {
            font-size: 30px;
            font-weight: 600;
            margin-bottom: 25px;
            color: #595959;
        }

        .field {
            height: 50px;
            width: 100%;
            display: flex;
            position: relative;
            margin-bottom: 20px;
        }

        .field input, .field select, .field textarea {
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

        button {
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
    </style>
</head>

<body>
    <div class="content" >
        <div class="text">Register Patient</div>
        <form runat="server" >
            <div class="field">
                <input type="text" name="fullname" id="fullname" required>
                <span class="fas fa-user"></span>
                <label for="fullname">Full Name</label>
            </div>

            <div class="field">
                <input type="date" name="dob" id="dob" required>
                <span class="fas fa-calendar"></span>
                <label for="dob">Date of Birth</label>
            </div>

            <div class="field">
                <select name="gender" id="gender" required>
                    <option value="" disabled selected>Select Gender</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
                <span class="fas fa-venus-mars"></span>
            </div>

            <div class="field">
                <input type="text" name="contact" id="contact" pattern="[0-9]{10}" required>
                <span class="fas fa-phone"></span>
                <label for="contact">Contact Number</label>
            </div>

            <div class="field">
                <input type="email" name="email" id="email" required>
                <span class="fas fa-envelope"></span>
                <label for="email">Email</label>
            </div>

            <div class="field">
                <textarea name="address" id="address" rows="3" required></textarea>
                <span class="fas fa-home"></span>
                <label for="address">Address</label>
            </div>

            <div class="field">
                <textarea name="medical_history" id="medical_history" rows="3"></textarea>
                <span class="fas fa-notes-medical"></span>
                <label for="medical_history">Medical History (Optional)</label>
            </div>

            <div class="field">
                <input type="text" name="blood_group" id="blood_group" required>
                <span class="fas fa-tint"></span>
                <label for="blood_group">Blood Group</label>
            </div>

            <div class="field">
                <input type="text" name="allergies" id="allergies">
                <span class="fas fa-allergies"></span>
                <label for="allergies">Allergies (Optional)</label>
            </div>

            <div class="field">
                <input type="text" name="emergency_contact" id="emergency_contact" pattern="[0-9]{10}" required>
                <span class="fas fa-user-shield"></span>
                <label for="emergency_contact">Emergency Contact</label>
            </div>

            <button type="submit">Register</button>
            <div class="sign-up">
                Already registered? <a href="LoginPage.aspx">Login here</a>
            </div>
        </form>
    </div>
</body>
</html>
