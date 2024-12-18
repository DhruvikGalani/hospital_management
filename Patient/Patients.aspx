<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Patients.aspx.cs" Inherits="hospital_management.Patient.Patients" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 400px; 
        }
        .auto-style2 {
            width: 192px;
        }
        .no-spinner::-webkit-inner-spin-button, 
        .no-spinner::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        .no-spinner {
            -moz-appearance: textfield; /* Firefox */
            width : 300px;
        }
        .textFields {
            width : 300px;
        }
        .btnsubmit {
            margin-right: 50px;
        }
        .auto-style3 {
            width: 192px;
            height: 26px;
        }
        .auto-style4 {
            height: 26px;
        }
        .auto-style5 {
            height: 32px;
        }
        .auto-style6 {
            height: 32px;
        }
    </style>
</head>
<body style="width: 600px">
    <form id="form2" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td colspan="2" style="text-align: center">Patient Registration</td>
                </tr>
                <tr>
                    <td class="auto-style2">Name : </td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server" CssClass="textFields"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Age :</td>
                    <td>
                        <asp:TextBox ID="txtAge" runat="server" ClientIDMode="AutoID" CssClass="no-spinner" TextMode="Number"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Gender :</td>
                    <td>
                        <asp:RadioButtonList ID="rblGender" runat="server" CellPadding="2" CellSpacing="2" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Address :</td>
                    <td>
                        <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" CssClass="textFields"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Date of birth</td>
                    <td>
                        <asp:TextBox ID="txtDate" runat="server" TextMode="Date" Width="146px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Contact No :</td>
                    <td>
                        <asp:TextBox ID="txtContactNo" runat="server" TextMode="Number" ValidateRequestMode="Disabled" CssClass="no-spinner"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Email :</td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="textFields"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Password : </td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="textFields"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Emergency Contact no</td>
                    <td>
                        <asp:TextBox ID="txtEmergencycontactno" runat="server" CssClass="no-spinner" TextMode="Number" ValidateRequestMode="Disabled"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Blood Group</td>
                    <td class="auto-style4">
                        <asp:DropDownList ID="ddlBloodgroup" runat="server">
                            <asp:ListItem>---select your Blood group--</asp:ListItem>
                            <asp:ListItem>A+</asp:ListItem>
                            <asp:ListItem>A-</asp:ListItem>
                            <asp:ListItem>B+</asp:ListItem>
                            <asp:ListItem>B-</asp:ListItem>
                            <asp:ListItem>AB+</asp:ListItem>
                            <asp:ListItem>AB-</asp:ListItem>
                            <asp:ListItem>O+</asp:ListItem>
                            <asp:ListItem>O-</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Allergies</td>
                    <td>
                        <asp:TextBox ID="txtAllergies" runat="server" Width="295px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">RunningMedicines</td>
                    <td>
                        <asp:TextBox ID="txtRunningmedicine" runat="server" Width="293px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Insurance</td>
                    <td class="auto-style6">
                        <asp:RadioButtonList ID="rblInsurance" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>YES</asp:ListItem>
                            <asp:ListItem>No</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                
               
                <tr>
                    <td colspan="2" style="text-align: center">
                        &nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
