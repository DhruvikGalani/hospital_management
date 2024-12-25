<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pharmacy.aspx.cs" Inherits="hospital_management.stock_handler.pharmacy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 178px;
        }

        .no-spinner::-webkit-inner-spin-button,
        .no-spinner::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        .no-spinner {
            -moz-appearance: textfield; /* Firefox */
            width: 250px;
        }

        .textFields {
            width: 250px;
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
<body style="width: 450px">
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td colspan="2" style="text-align: center; font-size: large;"><strong>Phamacy</strong></td>
            </tr>
            <tr>
                <td class="auto-style2">Medicine Name</td>
                <td>
                    <asp:TextBox ID="txtMedicineName" runat="server" CssClass="textFields"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Batch Number</td>
                <td>
                    <asp:TextBox ID="txtBatchNumber" runat="server" CssClass="no-spinner" TextMode="Number"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Manufacturing Date</td>
                <td>
                    <asp:TextBox ID="txtManufacturingDate" runat="server" CssClass="textFields" TextMode="Date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Expiry Date</td>
                <td>
                    <asp:TextBox ID="txtExpiryDate" runat="server" CssClass="textFields" TextMode="Date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Stock Quantity</td>
                <td>
                    <asp:TextBox ID="txtStockQuantity" runat="server" CssClass="no-spinner" TextMode="Number"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Suppier Details</td>
                <td>
                    <asp:TextBox ID="txtSuppierDatails" runat="server" CssClass="textFields" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Price per Unit</td>
                <td>
                    <asp:TextBox ID="txtPricePerUnit" runat="server" CssClass="no-spinner" TextMode="Number"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btnsubmit" OnClick="btnSubmit_Click" Text="SUBMIT" />
                    <asp:Button ID="btnReset" runat="server" CssClass="btnreset" OnClick="btnReset_Click" Text="RESET" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblDetails" runat="server" Text="Details"></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
