<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Appointments.aspx.cs" Inherits="hospital_management.Patient.Appointments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .no-spinner::-webkit-inner-spin-button,
        .no-spinner::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        .no-spinner {
            -moz-appearance: textfield; /* Firefox */
            width: 280px;
        }

        .textFields {
            width: 280px;
        }

        .btnsubmit {
            margin-right: 50px;
            width: 110px;
        }

        .btnreset {
            width: 110px;
        }
    </style>
</head>
<body style="width: 530px;">
    <form id="form1" runat="server">
        <div>



            <table class="auto-style1">
                <tr>
                    <td colspan="2" style="text-align: center; font-family: large;"><strong>Appointments</strong></td>
                </tr>
                <tr>
                    <td>Patient Name</td>
                    <td>
                        <asp:TextBox ID="txtPatientname" runat="server" CssClass="textFields"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Doctor Name</td>
                    <td>
                        <asp:TextBox ID="txtDoctorname" runat="server" CssClass="textFields" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >Appoitment Date &amp; Time</td>
                    <td>
                        <asp:TextBox ID="txtDateandtime" runat="server" TextMode="DateTime" CssClass="textFields" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >Reason For Visit</td>
                    <td>
                        <asp:TextBox ID="txtReason" runat="server" CssClass="textFields" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >Clinic Location</td>
                    <td>
                        <asp:DropDownList ID="ddlCliniclocation" runat="server" Width="200px">
                            <asp:ListItem>select</asp:ListItem>
                            <asp:ListItem>Ahmedabad
</asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Aragonda</asp:ListItem>
                            <asp:ListItem>Bangalore</asp:ListItem>
                            <asp:ListItem>Bhubaneshwar</asp:ListItem>
                            <asp:ListItem>Bilaspur</asp:ListItem>
                            <asp:ListItem>Bhopal
</asp:ListItem>
                            <asp:ListItem>Chennai</asp:ListItem>
                            <asp:ListItem>Delhi</asp:ListItem>
                            <asp:ListItem>Guwahati</asp:ListItem>
                            <asp:ListItem>Hyderabad</asp:ListItem>
                            <asp:ListItem>Indore
</asp:ListItem>
                            <asp:ListItem>Kakinada
</asp:ListItem>
                            <asp:ListItem>Karur</asp:ListItem>
                            <asp:ListItem>Kolkata</asp:ListItem>
                            <asp:ListItem>Kochi
</asp:ListItem>
                            <asp:ListItem>Lucknow
</asp:ListItem>
                            <asp:ListItem>Madurai</asp:ListItem>
                            <asp:ListItem>Mumbai</asp:ListItem>
                            <asp:ListItem>Mysore
</asp:ListItem>
                            <asp:ListItem>Nashik</asp:ListItem>
                            <asp:ListItem>Nellore
</asp:ListItem>
                            <asp:ListItem>Noida</asp:ListItem>
                            <asp:ListItem>Rourkela
</asp:ListItem>
                            <asp:ListItem>Trichy</asp:ListItem>
                            <asp:ListItem>Trichy</asp:ListItem>
                        </asp:DropDownList>


                    </td>
                </tr>
                <tr>
                    <td >Appoitment Status</td>
                    <td>
                        <asp:RadioButtonList ID="rblStatus" runat="server" CellPadding="2" CellSpacing="2" RepeatDirection="Horizontal">
                            <asp:ListItem>Pending</asp:ListItem>
                            <asp:ListItem>Confirm</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="SUBMIT" CssClass="btnsubmit" />
                        <asp:Button ID="btnReset" runat="server" OnClick="btnReset_Click" Text="RESET" CssClass="btnreset" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblDetails" runat="server" Text="Details"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
