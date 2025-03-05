

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="hospital_management.pages.LoginPage" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Login Form</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <style>
        * {
            margin: 0;
            padding: 0;
            /* user-select: none; */
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        html, body {
            height: 100%;
        }
        /* Background Image */
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: url("../Images/formImage_1.jpg") no-repeat center center fixed;
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
                backdrop-filter: blur(2px); /* Blur effect */
                -webkit-backdrop-filter: blur(5px);
                background: rgb(37, 97, 108, 0.20); /* Light white overlay */
                z-index: -1; /* Moves it behind the form */
            }

        

        .content {
            width: 350px;
            padding: 30px 30px;
          
            background: rgba(221, 225, 231, 0.90); /* Light transparent background */
            border-radius: 20px;
            box-shadow: -3px -3px 7px #ffffff73, 2px 2px 5px rgba(94,104,121,0.288);
            position: relative; /* Keeps it above the blur */
            z-index: 1;
        }

            .content .text {
                font-size: 33px;
                font-weight: 600;
                margin-bottom: 35px;
                color: #595959;
            }




        .field {
            height: 50px;
            width: 100%;
            display: flex;
            position: relative;
        }

            .field:nth-child(2) {
                margin-top: 20px;
            }

            .field input {
                height: 100%;
                width: 100%;
                padding-left: 45px;
                outline: none;
                border: none;
                font-size: 18px;
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

        .forgot-pass {
            text-align: left;
            margin: 10px 0 10px 5px;
        }

            .forgot-pass a {
                font-size: 16px;
                color: #3498db;
                text-decoration: none;
            }

            .forgot-pass:hover a {
                text-decoration: underline;
            }

        button {
            margin: 15px 0;
            width: 100%;
            height: 50px;
            font-size: 18px;
            line-height: 50px;
            font-weight: 600;
            background: #dde1e7;
            border-radius: 25px;
            border: none;
            outline: none;
            cursor: pointer;
            color: #595959;
            box-shadow: 2px 2px 5px #BABECC, -5px -5px 10px #ffffff73;
        }

            button:focus {
                color: #3498db;
                box-shadow: inset 2px 2px 5px #BABECC, inset -5px -5px 10px #ffffff73;
            }

        .sign-up {
            margin: 10px 0;
            color: #595959;
            font-size: 16px;
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
        <div class="text">Login</div>
        <form asp-action="Login" asp-controller="Account" method="post">
            <div class="field">
                <input type="text" name="email" id="email" required>
                <span class="fas fa-user"></span>
                <label for="email">Email</label>

                 
            </div>
            <div class="field">
                <input type="password" name="password" id="password" minlength="8" required />
                <span class="fas fa-lock"></span>
                <label for="password">Password</label>
            </div>



            <div class="forgot-pass">
                <a href="#">Forgot Password?</a>
            </div>


            <button type="submit">Sign in</button>
            <div class="sign-up">
                Not a member? <a href="RegisterPage.aspx">Signup now</a>
            </div>

        </form>
    </div>
</body>
</html>
