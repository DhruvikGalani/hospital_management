<<<<<<< HEAD
﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffInformation.aspx.cs" Inherits="hospital_management.Admin.StaffInformation" %>
=======
﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffInformation.aspx.cs" Inherits="hospital_management.StaffInformation" %>
>>>>>>> ad7b026b0d8ce3bedb04ace25f41dd50cc5e226b

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<<<<<<< HEAD
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
            -moz-appearance: textfield; 
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
                    <td >Name </td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server" CssClass="textFields"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >Gender </td>
                    <td id="rblGender">
                        <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>male</asp:ListItem>
                            <asp:ListItem>female</asp:ListItem>
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
                    <td >Role </td>
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
                        <asp:TextBox ID="txtNumber" runat="server" TextMode="Number" CssClass="textFields"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >Email </td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="textFields"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >Shift Timing </td>
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
                     <td >J<span style="font-size:11.0pt;line-height:107%;
font-family:&quot;Calibri&quot;,sans-serif;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:
Calibri;mso-fareast-theme-font:minor-latin;mso-hansi-theme-font:minor-latin;
mso-bidi-font-family:Shruti;mso-bidi-theme-font:minor-bidi;mso-ansi-language:
EN-IN;mso-fareast-language:EN-US;mso-bidi-language:AR-SA">oining Date</span></td>
                         <td>
                                <asp:Calendar ID="calJoiningdate" runat="server"></asp:Calendar>
                         </td>
                </tr>
                <tr>
                    <td>S<span style="font-size:11.0pt;line-height:107%;
font-family:&quot;Calibri&quot;,sans-serif;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:
Calibri;mso-fareast-theme-font:minor-latin;mso-hansi-theme-font:minor-latin;
mso-bidi-font-family:Shruti;mso-bidi-theme-font:minor-bidi;mso-ansi-language:
EN-IN;mso-fareast-language:EN-US;mso-bidi-language:AR-SA">alary Details</span> </td>
                         <td>
                             <asp:TextBox ID="txtSalary" runat="server" TextMode="Number" CssClass="textFields"></asp:TextBox>
                         </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        <asp:Button ID="btnSubmit" runat="server" Text="SUBMIT" CssClass="btnsubmit" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnReset" runat="server" Text="RESET" CssClass="btnreset" OnClick="btnReset_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
=======
    <title>
        StaffInformation
    </title>
</head>
<body style="height: 188px; width: 1254px">
    <form id="form1" runat="server">
        <p style="font-family: Verdana; font-size: xx-large; font-weight: bold; font-style: normal">
            StaffInformation</p>
        <p style="font-family: Verdana; font-size: medium; font-weight: bold; font-style: normal">
            staffid&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Texid" runat="server"></asp:TextBox>
        </p>
        <p style="font-family: Verdana; font-size: medium; font-weight: bold; font-style: normal">
            <span style="font-size: medium; line-height: 107%; font-family: Verdana; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: Calibri; mso-fareast-theme-font: minor-latin; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: Shruti; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-IN; mso-fareast-language: EN-US; mso-bidi-language: AR-SA; font-weight: bold; font-style: normal;">FullName&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Texname" runat="server"></asp:TextBox>
            </span>
        </p>
        <p style="font-family: Verdana; font-size: medium; font-weight: bold; font-style: normal">
            <span style="font-size: medium; line-height: 107%; font-family: Verdana; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: Calibri; mso-fareast-theme-font: minor-latin; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: Shruti; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-IN; mso-fareast-language: EN-US; mso-bidi-language: AR-SA; font-weight: bold; font-style: normal;">Role&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlrole" runat="server">
                <asp:ListItem>nurse</asp:ListItem>
                <asp:ListItem>Receptionist</asp:ListItem>
                <asp:ListItem>doctor</asp:ListItem>
            </asp:DropDownList>
            </span>
        </p>
        <p style="font-family: Verdana; font-size: medium; font-weight: bold; font-style: normal">
            <span style="font-size: medium; line-height: 107%; font-family: Verdana; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: Calibri; mso-fareast-theme-font: minor-latin; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: Shruti; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-IN; mso-fareast-language: EN-US; mso-bidi-language: AR-SA; font-weight: bold; font-style: normal;">ContactNumber&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Textnumber" runat="server" ></asp:TextBox>
            </span>
        </p>
        <p style="font-family: Verdana; font-size: medium; font-weight: bold; font-style: normal">
            <span style="font-size: medium; line-height: 107%; font-family: Verdana; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: Calibri; mso-fareast-theme-font: minor-latin; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: Shruti; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-IN; mso-fareast-language: EN-US; mso-bidi-language: AR-SA; font-weight: bold; font-style: normal;">Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Textemail" runat="server"></asp:TextBox>
            </span>
        </p>
        <p style="font-family: Verdana; font-size: medium; font-weight: bold; font-style: normal">
            <span style="font-size: medium; line-height: 107%; font-family: Verdana; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: Calibri; mso-fareast-theme-font: minor-latin; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: Shruti; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-IN; mso-fareast-language: EN-US; mso-bidi-language: AR-SA; font-weight: bold; font-style: normal;">ShiftTiming<asp:CheckBoxList ID="Cblshift" runat="server" Width="182px">
                <asp:ListItem>Day Shift</asp:ListItem>
                <asp:ListItem>Evening Shift</asp:ListItem>
                <asp:ListItem>Night Shift</asp:ListItem>
                <asp:ListItem>Split Shift</asp:ListItem>
            </asp:CheckBoxList>
&nbsp;</span></p>
        <asp:Button ID="btnsubmit" runat="server"  Text="submit" OnClick="btnsubmit_Click" />
        <asp:Button ID="btnreset" runat="server"  Text="Reset" OnClick="btnreset_Click" />
    </form>
    <p>
        &nbsp;</p>
>>>>>>> ad7b026b0d8ce3bedb04ace25f41dd50cc5e226b
</body>
</html>
