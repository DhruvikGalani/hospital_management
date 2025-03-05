
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
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        html, body {
            height: 100%;
        }

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
            width: 350px;
            padding: 30px;
            background: rgba(221, 225, 231, 0.90);
            border-radius: 20px;
            box-shadow: -3px -3px 7px #ffffff73, 2px 2px 5px rgba(94,104,121,0.288);
            position: relative;
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
            margin-bottom: 20px;
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

        .field span {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #595959;
        }

        .forgot-pass {
            text-align: left;
            margin-bottom: 15px;
        }

        .forgot-pass a {
            font-size: 16px;
            color: #3498db;
            text-decoration: none;
        }

        .forgot-pass a:hover {
            text-decoration: underline;
        }

        input[type="submit"] {
            width: 100%;
            height: 50px;
            font-size: 18px;
            font-weight: 600;
            background: #dde1e7;
            border-radius: 25px;
            border: none;
            cursor: pointer;
            color: #595959;
            box-shadow: 2px 2px 5px #BABECC, -5px -5px 10px #ffffff73;
        }

        input[type="submit"]:hover {
            background: #cdd1d7;
        }

        .sign-up {
            margin-top: 15px;
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
        <form id="form1" runat="server">
            <div class="field">
                <asp:TextBox ID="txtEmail" runat="server" placeholder="Email"></asp:TextBox>
                <span class="fas fa-user"></span>
            </div>
            <div class="field">
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
                <span class="fas fa-lock"></span>
            </div>
            <div class="forgot-pass">
                <a href="#">Forgot Password?</a>
            </div>
            <asp:Button ID="btnLogin" runat="server" Text="Sign in" OnClick="btnLogin_Click" CssClass="submit-btn" />
          <%--  <div class="sign-up">
                Not a member? <a href="RegisterPage.aspx">Signup now</a>
            </div>--%>
        </form>
    </div>
</body>
</html>
