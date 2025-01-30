<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ambulance.aspx.cs" Inherits="hospital_management.ambulance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
      
           .auto-style1 {
           width: 29%;
            height: 321px;
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
<body>
    <form id="form1" runat="server">
        <table cellpadding="3" cellspacing="4" class="auto-style1">
            <tr>
                <td class="auto-style2" colspan="2" style="font-weight: bold; font-size: x-large; text-align: center">Ambulance</td>
            </tr>
            <tr>
                <td class="auto-style3">VehicleNumber:</td>
                <td>
                    <asp:TextBox ID="txtVehicle" runat="server" TextMode="Number" CssClass="no-spinner" Height="25px" Width="360px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">DriverName:</td>
                <td>
                    <asp:TextBox ID="txtdrivername" runat="server" Height="25px" Width="360px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">ContactNumber:</td>
                <td>
                    <asp:TextBox ID="txtContact" runat="server"  TextMode="Number" CssClass="no-spinner" Height="25px" Width="360px" MaxLength="10"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">AvailabilityStatus:</td>
                <td>
                    <asp:RadioButtonList ID="rblStatus" runat="server" RepeatDirection="Horizontal" CellPadding="2" CellSpacing="2" Height="25px" Width="250px">
                        <asp:ListItem>Available</asp:ListItem>
                        <asp:ListItem>Not Available</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
                    <tr>
    <td colspan="2" style="text-align: center">
        <asp:Button ID="btnSubmit" runat="server" Text="SUBMIT" CssClass="btnsubmit" OnClick="btnSubmit_Click" />
        <asp:Button ID="btnReset" runat="server" Text="RESET" OnClick="btnReset_Click" CssClass="btnreset" />
    </td>
</tr>
<tr>
    <td colspan="2"><asp:Label ID="lblDetails" runat="server" Text="Details"></asp:Label>
    </td>
</tr>
        </table>
    </form>
    </body>
</html>
