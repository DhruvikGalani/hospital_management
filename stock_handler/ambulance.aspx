<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ambulance.aspx.cs" Inherits="hospital_management.stock_handler.ambulance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 164px;
        }

        .no-spinner::-webkit-inner-spin-button,
        .no-spinner::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        .no-spinner {
            -moz-appearance: textfield; /* Firefox */
            width: 270px;
        }

        .textFields {
            width: 270px;
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
<body style="width: 456px">
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td colspan="2" style="text-align: center; font-family: large;"><strong>Ambulance</strong></td>
                </tr>
                <tr>
                    <td class="auto-style2">Vehicle Number</td>
                    <td>
                        <asp:TextBox ID="txtVehicleNumber" runat="server" CssClass="textFields"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="rfvVehicleNumber" runat="server" ControlToValidate="txtVehicleNumber" ErrorMessage="Vehicle Number is required" ForeColor="Red" Display="Dynamic" /><br />
                        <asp:RegularExpressionValidator ID="revVehicleNumber" runat="server" ControlToValidate="txtVehicleNumber" ErrorMessage="Invalid format (e.g., MH12AB1234)" ForeColor="Red" Display="Dynamic" ValidationExpression="^[A-Z]{2}[0-9]{2}[A-Z]{1,2}[0-9]{4}$" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Driver Name</td>
                    <td>
                        <asp:TextBox ID="txtDriverName" runat="server" CssClass="textFields"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="rfvDriverName" runat="server" ControlToValidate="txtDriverName" ErrorMessage="Driver Name is required" ForeColor="Red" Display="Dynamic" /><br />
                        <asp:RegularExpressionValidator ID="revDriverName" runat="server" ControlToValidate="txtDriverName" ErrorMessage="Only alphabets allowed" ForeColor="Red" Display="Dynamic" ValidationExpression="^[A-Za-z\s]+$" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Contact Number</td>
                    <td>
                        <asp:TextBox ID="txtContactNumber" runat="server" CssClass="no-spinner" MaxLength="10" TextMode="Number"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="rfvContactNumber" runat="server" ControlToValidate="txtContactNumber"  ErrorMessage="Contact Number is required" ForeColor="Red" Display="Dynamic" /><br />
                        <asp:RegularExpressionValidator ID="revContactNumber" runat="server" ControlToValidate="txtContactNumber" ErrorMessage="Enter a valid 10-digit number" ForeColor="Red" Display="Dynamic" ValidationExpression="^\d{10}$" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Availability Status</td>
                    <td>
                        <asp:RadioButtonList ID="rblAvailabilityStatus" runat="server">
                            <asp:ListItem>Available</asp:ListItem>
                            <asp:ListItem>Not Available</asp:ListItem>
                        </asp:RadioButtonList><br />
                         <asp:RequiredFieldValidator ID="rfvAvailabilityStatus" runat="server" ControlToValidate="rblAvailabilityStatus"  InitialValue="" ErrorMessage="Please select availability status" ForeColor="Red" Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        <asp:Button ID="btnSave" runat="server" CssClass="btnsubmit" OnClick="btnSave_Click" Text="SUBMIT" />
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
