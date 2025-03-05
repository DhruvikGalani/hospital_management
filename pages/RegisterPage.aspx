<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="hospital_management.pages.RegisterPage" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Register Form</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <style>
        /* Reset styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        html, body {
            height: 100%;
        }

        /* Background Styling */
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: url("../Images/formImage_2.jpg") no-repeat center center fixed;
            background-size: cover;
            position: relative;
            text-align: center;
        }

            /* Blur and Color Overlay */
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

        /* Form Container */
        .content {
            width: 380px;
            padding: 40px;
            background: rgba(221, 225, 231, 0.95);
            border-radius: 20px;
            box-shadow: -3px -3px 7px #ffffff73, 2px 2px 5px rgba(94,104,121,0.288);
            position: relative;
            z-index: 1;
        }

            .content .text {
                font-size: 33px;
                font-weight: 600;
                margin-bottom: 25px;
                color: #595959;
            }

        /* Input Fields */
        .field {
            height: 50px;
            width: 100%;
            display: flex;
            position: relative;
            margin-bottom: 20px;
        }

            .field input {
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

                .field input:focus {
                    box-shadow: inset 1px 1px 2px #BABECC, inset -1px -1px 2px #ffffff73;
                }

            .field span {
                position: absolute;
                color: #595959;
                width: 50px;
                line-height: 50px;
            }

            .field label {
                position: absolute;
                top: 50%;
                transform: translateY(-50%);
                left: 45px;
                pointer-events: none;
                color: #666666;
            }

            .field input:valid ~ label {
                opacity: 0;
            }

        /* Forgot Password Link */
        .forgot-pass {
            text-align: left;
            margin-bottom: 15px;
        }

            .forgot-pass a {
                font-size: 16px;
                color: #3498db;
                text-decoration: none;
            }

            .forgot-pass:hover a {
                text-decoration: underline;
            }

        /* Buttons */
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

            button:focus {
                color: #3498db;
                box-shadow: inset 2px 2px 5px #BABECC, inset -5px -5px 10px #ffffff73;
            }

        /* Sign Up/Login Links */
        .sign-up {
            margin-top: 10px;
            font-size: 16px;
            color: #595959;
        }

            .sign-up a {
                color: #3498db;
                text-decoration: none;
            }

                .sign-up a:hover {
                    text-decoration: underline;
                }
    </style>
</head>

<body>
    <div class="content">
        <div class="text">Register</div>
        <form runat="server">
            <div class="field">
                <input type="text" name="fullname" id="fullname" minlength="3" maxlength="50" onerror="not required length" required>
                <span class="fas fa-user"></span>
                <label for="fullname">Full Name</label>
            </div>

            <div class="field">
                <input type="email" name="email" id="email" required>
                <span class="fas fa-envelope"></span>
                <label for="email">Email</label>
            </div>

            <div class="field">
                <input type="password" name="password" id="password" minlength="8" required>
                <span class="fas fa-lock"></span>
                <label for="password">Password</label>
            </div>

            <div class="field">
                <input type="password" name="confirm_password" id="confirm_password" oninput="this.setCustomValidity(this.value !== document.getElementById('password').value ? 'Passwords do not match!' : '')" required>
                <span class="fas fa-lock"></span>
                <label for="confirm_password">Confirm Password</label>
            </div>

            <button type="submit">Sign up</button>
            <div class="sign-up">
                Already have an account? <a href="LoginPage.aspx">Login here</a>
            </div>
        </form>
    </div>
</body>
</html>
