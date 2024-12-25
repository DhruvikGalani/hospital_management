<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Patients.aspx.cs" Inherits="hospital_management.Patient.Patients" %>

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
            width: 110px;
        }

        .btnreset {
            width: 110px;
        }
        
    </style>
</head>
<body style="width: 500px">
    <form id="form2" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td colspan="2" style="text-align: center"><strong>Patient's Registration</strong></td>
                </tr>
                <tr>
                    <td>Name </td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server" CssClass="textFields"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Age </td>
                    <td>
                        <asp:TextBox ID="txtAge" runat="server" ClientIDMode="AutoID" CssClass="no-spinner" TextMode="Number" MaxLength="3"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >Gender </td>
                    <td >
                        <asp:RadioButtonList ID="rblGender" runat="server" CellPadding="2" CellSpacing="2" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td >Address </td>
                    <td >
                        <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" CssClass="textFields"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >Date of birth</td>
                    <td >
                        <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="textFields" OnTextChanged="txtDate_TextChanged"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >Contact No </td>
                    <td >
                        <asp:TextBox ID="txtContactNo" runat="server" TextMode="Number" ValidateRequestMode="Disabled" CssClass="no-spinner" MaxLength="10"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >Email </td>
                    <td >
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="textFields"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >Password </td>
                    <td >
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="textFields"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Emergency Contact no</td>
                    <td >
                        <asp:TextBox ID="txtEmergencycontactno" runat="server" CssClass="no-spinner" TextMode="Number" ValidateRequestMode="Disabled" MaxLength="10"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >Blood Group</td>
                    <td >
                        <asp:RadioButtonList ID="rblBlood" runat="server" RepeatColumns="4" Width="270px">
                            <asp:ListItem>A+</asp:ListItem>
                            <asp:ListItem>A-</asp:ListItem>
                            <asp:ListItem>B+</asp:ListItem>
                            <asp:ListItem>B-</asp:ListItem>
                            <asp:ListItem>AB+</asp:ListItem>
                            <asp:ListItem>AB-</asp:ListItem>
                            <asp:ListItem>O+</asp:ListItem>
                            <asp:ListItem>O-</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td >Allergies</td>
                    <td >
                        <asp:TextBox ID="txtAllergies" runat="server" Width="295px" CssClass="textFields"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >Running Medicines</td>
                    <td >
                        <asp:TextBox ID="txtRunningmedicine" runat="server" Width="293px" CssClass="textFields"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Insurance</td>
                    <td >
                        <asp:RadioButtonList ID="rblInsurance" runat="server" RepeatDirection="Horizontal" Width="180px">
                            <asp:ListItem>YES</asp:ListItem>
                            <asp:ListItem>No</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                
               
                <tr>
                    <td colspan="2" style="text-align: center">
                        <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="SAVE" CssClass="btnsubmit" />
                        <asp:Button ID="btnReset" runat="server" OnClick="btnReset_Click" Text="RESET" CssClass="btnreset" />
                    </td>
                </tr>
                
               
                <tr>
                    <td colspan="2" >
                        <asp:Label ID="lblDetails" runat="server" Text="Details"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
