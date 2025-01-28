<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="hospital_management.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> log in form</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .card {
            border-radius: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-card {
            width: 400px;
        }
        .login-header {
            background-color: #6f42c1; /* Blue background */
            color: white;
            text-align: center;
            padding: 20px 0;
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
        }
        .login-header img {
            width: 80px;
        }
        .btn-login {
            background-color: #6f42c1;
            color: white;
        }
        .btn-login:hover {
            background-color: #6f42c1;
        }
        a {
            color: #6f42c1;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid login-container">
            <div class="card login-card">
                <div class="login-header">
                    <img src="Images/hms_logo.svg" alt="Logo" />
                    <h3>Infinity Health Care</h3>
                </div>
                <div class="card-body">
                    <div class="mb-3">
                        <label for="email" class="form-label">Email / Number</label>
                        <input type="email" class="form-control" id="email" placeholder="Enter your email or Number" />
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" placeholder="Enter your password" />
                    </div>
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <div>
                            <input type="checkbox" id="rememberMe" />
                            <label for="rememberMe">Remember Me</label>
                        </div>
                        <a href="#">Forgot Password?</a>
                    </div>
                    <button type="button" class="btn btn-login w-100">LOGIN</button>
                    <div class="text-center mt-3">
                        <a href="#">Create Account</a>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

