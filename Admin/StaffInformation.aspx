<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffInformation.aspx.cs" Inherits="hospital_management.StaffInformation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
</body>
</html>
