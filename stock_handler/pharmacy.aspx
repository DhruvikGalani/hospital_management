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
                <td colspan="2" style="text-align: center; font-size: large;"><strong>Pharmacy</strong></td>
            </tr>
            <tr>
                <td class="auto-style2">Medicine Name</td>
                <td>
                    <asp:TextBox ID="txtMedicineName" runat="server" CssClass="textFields"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvMedicineName" runat="server" ControlToValidate="txtMedicineName" ErrorMessage="Medicine Name is required" ForeColor="Red" Display="Dynamic" /><br />
                    <asp:RegularExpressionValidator ID="revMedicineName" runat="server" ControlToValidate="txtMedicineName" ErrorMessage="Only alphabets allowed" ForeColor="Red" Display="Dynamic" ValidationExpression="^[A-Za-z\s]+$" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Batch Number</td>
                <td>
                    <asp:TextBox ID="txtBatchNumber" runat="server" CssClass="no-spinner" TextMode="Number"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvBatchNumber" runat="server" ControlToValidate="txtBatchNumber"  ErrorMessage="Batch Number is required" ForeColor="Red" Display="Dynamic" /><br />
                    <asp:RegularExpressionValidator ID="revBatchNumber" runat="server" ControlToValidate="txtBatchNumber" ErrorMessage="Alphanumeric only" ForeColor="Red" Display="Dynamic" ValidationExpression="^[A-Za-z0-9]+$" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Manufacturing Date</td>
                <td>
                    <asp:TextBox ID="txtManufacturingDate" runat="server" CssClass="textFields" TextMode="Date"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvManufacturingDate" runat="server" ControlToValidate="txtManufacturingDate" ErrorMessage="Manufacturing Date is required" ForeColor="Red" Display="Dynamic" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Expiry Date</td>
                <td>
                    <asp:TextBox ID="txtExpiryDate" runat="server" CssClass="textFields" TextMode="Date"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvExpiryDate" runat="server" ControlToValidate="txtExpiryDate" ErrorMessage="Expiry Date is required" ForeColor="Red" Display="Dynamic" /><br />
                    <asp:CompareValidator ID="cvExpiryDate" runat="server" ControlToValidate="txtExpiryDate" ControlToCompare="txtManufacturingDate" Operator="GreaterThan"  ErrorMessage="Expiry Date must be later than Manufacturing Date" ForeColor="Red" Display="Dynamic" />

                </td>
            </tr>
            <tr>
                <td class="auto-style2">Stock Quantity</td>
                <td>
                    <asp:TextBox ID="txtStockQuantity" runat="server" CssClass="no-spinner" TextMode="Number"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvStockQuantity" runat="server" ControlToValidate="txtStockQuantity" ErrorMessage="Stock Quantity is required" ForeColor="Red" Display="Dynamic" /><br />
                    <asp:RangeValidator ID="rvStockQuantity" runat="server" ControlToValidate="txtStockQuantity"  MinimumValue="1" MaximumValue="1000000" Type="Integer" ErrorMessage="Enter a valid stock quantity (1+)" ForeColor="Red" Display="Dynamic" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Suppier Details</td>
                <td>
                    <asp:TextBox ID="txtSuppierDatails" runat="server" CssClass="textFields" TextMode="MultiLine"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvSupplierDetails" runat="server" ControlToValidate="txtSuppierDatails" ErrorMessage="Supplier Details are required" ForeColor="Red" Display="Dynamic" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Price per Unit</td>
                <td>
                    <asp:TextBox ID="txtPricePerUnit" runat="server" CssClass="no-spinner" TextMode="Number"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvPricePerUnit" runat="server" ControlToValidate="txtPricePerUnit" ErrorMessage="Price per unit is required" ForeColor="Red" Display="Dynamic" /><br />
                    <asp:RegularExpressionValidator ID="revPricePerUnit" runat="server" ControlToValidate="txtPricePerUnit" ErrorMessage="Enter a valid price (e.g., 10.50)" ForeColor="Red" Display="Dynamic" ValidationExpression="^\d+(\.\d{1,2})?$" />
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
