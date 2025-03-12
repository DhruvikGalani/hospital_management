<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddAppointment.aspx.cs" Inherits="hospital_management.AddAppointment" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <style>
        /* General Styling */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

body {
    background-color: #f4f4f4;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

/* Form Container */
.form-container {
    background: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    width: 350px;
    text-align: center;
}

h2 {
    margin-bottom: 15px;
    color: #333;
}

/* Input Fields */
.input-field {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
}

/* Submit Button */
.submit-btn {
    width: 100%;
    padding: 10px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    transition: 0.3s;
}

.submit-btn:hover {
    background-color: #0056b3;
}

/* Message Label */
.message {
    color: red;
    font-size: 14px;
}

    </style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Appointment</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <form runat="server">
    <div class="form-container">
        <h2>Book an Appointment</h2>

        <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>

        <asp:DropDownList ID="ddlDoctor" runat="server" CssClass="input-field" required>
            <asp:ListItem Value="">Select Doctor</asp:ListItem>
        </asp:DropDownList>

        <asp:TextBox ID="txtAppointmentDateTime" runat="server" CssClass="input-field" type="datetime-local" required></asp:TextBox>

        <asp:TextBox ID="txtReasonForVisit" runat="server" CssClass="input-field" placeholder="Reason for Visit" required></asp:TextBox>

        <asp:TextBox ID="txtClinicLocation" runat="server" CssClass="input-field" placeholder="Clinic Location" required></asp:TextBox>

        <asp:Button ID="btnBookAppointment" runat="server" CssClass="submit-btn" Text="Book Appointment" OnClick="btnBookAppointment_Click" />
    </div>
        </form>
</body>
</html>--%>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddAppointment.aspx.cs" Inherits="hospital_management.AddAppointment" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Appointment</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <style>
        /* General Styling */
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
            backdrop-filter: blur(5px);
            background: rgba(37, 97, 108, 0.20);
            z-index: -1;
        }

        .form-container {
            width: 380px;
            padding: 30px;
            background: rgba(221, 225, 231, 0.90);
            border-radius: 20px;
            box-shadow: -3px -3px 7px #ffffff73, 2px 2px 5px rgba(94,104,121,0.288);
            position: relative;
            z-index: 1;
        }

        .form-container h2 {
            font-size: 28px;
            font-weight: 600;
            color: #595959;
            margin-bottom: 20px;
        }

        .field {
            width: 100%;
            position: relative;
            margin-bottom: 20px;
        }

        .input-field {
            width: 100%;
            height: 50px;
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
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #595959;
            font-size: 18px;
        }

        .submit-btn {
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
            transition: 0.3s;
        }

        .submit-btn:hover {
            background: #cdd1d7;
        }

        .message {
            color: red;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <form runat="server">
        <div class="form-container">
            <h2>Book an Appointment</h2>

            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>

            <div class="field">
                <span class="fas fa-user-md"></span>
                <asp:DropDownList ID="ddlDoctor" runat="server" CssClass="input-field" required>
                    <asp:ListItem Value="">Select Doctor</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="field">
                <span class="fas fa-calendar-alt"></span>
                <asp:TextBox ID="txtAppointmentDateTime" runat="server" CssClass="input-field" type="datetime-local" required></asp:TextBox>
            </div>

            <div class="field">
                <span class="fas fa-stethoscope"></span>
                <asp:TextBox ID="txtReasonForVisit" runat="server" CssClass="input-field" placeholder="Reason for Visit" required></asp:TextBox>
            </div>

            <div class="field">
                <span class="fas fa-map-marker-alt"></span>
                <asp:TextBox ID="txtClinicLocation" runat="server" CssClass="input-field" placeholder="Clinic Location" required></asp:TextBox>
            </div>

            <asp:Button ID="btnBookAppointment" runat="server" CssClass="submit-btn" Text="Book Appointment" OnClick="btnBookAppointment_Click" />
        </div>
    </form>
</body>
</html>
