<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoctorDetails.aspx.cs" Inherits="hospital_management.Doctor.DoctorDetails" %>

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
             width : 360px;
        }
        .textFields {
            width : 360px;
        }
        .btnsubmit {
            margin-right: 50px;
        }
    </style>
</head>
<body style="width: 550px; height: 430px;">
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td colspan="2" style="text-align: center; font-family:large;"><strong>Doctor's Registration</strong></td>
                </tr>
                <tr>
                    <td >Name </td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server"  CssClass="textFields"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >Age </td>
                    <td>
                        <asp:TextBox ID="txtAge" runat="server" ClientIDMode="AutoID" CssClass="no-spinner" TextMode="Number"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >Gender </td>
                    <td>
                        <asp:RadioButtonList ID="rblGender" runat="server" CellPadding="2" CellSpacing="2" RepeatDirection="Horizontal">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td >Address </td>
                    <td>
                        <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" CssClass="textFields"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >Specialization </td>
                    <td>
                        <asp:DropDownList ID="ddlSpecialities" runat="server" Width="180px" AutoPostBack="True" OnSelectedIndexChanged="ddlSpecialities_SelectedIndexChanged" >
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlSpecialitiesTypes" runat="server" Width="180px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td >Experience Years </td>
                    <td>
                        <asp:TextBox ID="txtExperienceYear" runat="server" TextMode="Number" CssClass="no-spinner"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Contact No </td>
                    <td>
                        <asp:TextBox ID="txtContactNo" runat="server" TextMode="Number" ValidateRequestMode="Disabled" CssClass="no-spinner"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >Email </td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="textFields"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >Password </td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="textFields"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >License Number </td>
                    <td>
                        <asp:TextBox ID="txtLicenseNo" runat="server" TextMode="Number" CssClass="no-spinner"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >Consultation Fee</td>
                    <td>
                        <asp:TextBox ID="txtFee" runat="server" TextMode="Number" CssClass="no-spinner"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        <asp:Button ID="btnSubmit" runat="server" Text="submit" Width="120px" CssClass="btnsubmit" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnReset" runat="server" Text="Reset" Width="120px" OnClick="btnReset_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><asp:Label ID="lblDetails" runat="server" Text="Details"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
