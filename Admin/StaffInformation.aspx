<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffInformation.aspx.cs" Inherits="hospital_management.Admin.StaffInformation" %>

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
     width : 110px;
 }
 .btnreset {
         width : 110px;
 }
    </style>
</head>
<body style="width: 550px; height: 430px;">
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td colspan="2" style="text-align: center; font-family:large;"><strong>Staff Information</strong></td>
                </tr>
                <tr>
                    <td >Staff ID</td>
                    <td>
                        <asp:TextBox ID="txtStaffid" runat="server" CssClass="textFields"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td >Name </td>
                         <td>
                             <asp:TextBox ID="txtName" runat="server" CssClass="textFields"></asp:TextBox>
                     </td>
                </tr>
                <tr>
                    <td >Age </td>
                    <td>
                        <asp:TextBox ID="txtAge" runat="server" CssClass="textFields" TextMode="Number"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >Gender </td>
                    <td>
                        <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td >Address </td>
                    <td>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="textFields" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >Role</td>
                    <td>
                        <asp:DropDownList ID="ddlRole" runat="server">
                            <asp:ListItem>Doctor</asp:ListItem>
                            <asp:ListItem>Nurse</asp:ListItem>
                            <asp:ListItem>Receptionist</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Contact No </td>
                    <td>
                        <asp:TextBox ID="txtContactno" runat="server" CssClass="textFields" TextMode="Number"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >Email </td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="textFields" TextMode="Email"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >Shift Timing</td>
                    <td>
                        <asp:DropDownList ID="ddlShift" runat="server">
                            <asp:ListItem>Day Shift</asp:ListItem>
                            <asp:ListItem>Evening Shift</asp:ListItem>
                            <asp:ListItem>Night Shift</asp:ListItem>
                            <asp:ListItem>Split Shift</asp:ListItem>
                            <asp:ListItem>On-Call Shift</asp:ListItem>
                            <asp:ListItem>Rotational Shift</asp:ListItem>
                            <asp:ListItem>Part-Time Shift</asp:ListItem>
                            <asp:ListItem>Weekend Shift</asp:ListItem>
                            <asp:ListItem>Holiday Shift</asp:ListItem>
                            <asp:ListItem>Flexible Shift</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td >Joining Date</td>
                    <td>
                        <asp:Calendar ID="calJoining" runat="server"></asp:Calendar>
                    </td>
                </tr>
                <tr>
                    <td >Salary </td>
                    <td>
                        <asp:TextBox ID="txtSalary" runat="server" CssClass="textFields" TextMode="Number"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btnsubmit" Text="SUBMIT" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnReset" runat="server" CssClass="btnreset" Text="RESET" OnClick="btnReset_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
