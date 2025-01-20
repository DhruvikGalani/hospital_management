
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
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td colspan="2" style="text-align: center; font-family:large;"><strong>Billing</strong></td>
                </tr>
                <tr>
                    <td ><span style="font-size:11.0pt;line-height:107%;
font-family:&quot;Calibri&quot;,sans-serif;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:
Calibri;mso-fareast-theme-font:minor-latin;mso-hansi-theme-font:minor-latin;
mso-bidi-font-family:Shruti;mso-bidi-theme-font:minor-bidi;mso-ansi-language:
EN-IN;mso-fareast-language:EN-US;mso-bidi-language:AR-SA">InvoiceID</span></td>
                    <td>
                        <asp:TextBox ID="txtInvoiceid" runat="server" CssClass="textFields"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >P<span style="font-size:11.0pt;line-height:107%;
font-family:&quot;Calibri&quot;,sans-serif;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:
Calibri;mso-fareast-theme-font:minor-latin;mso-hansi-theme-font:minor-latin;
mso-bidi-font-family:Shruti;mso-bidi-theme-font:minor-bidi;mso-ansi-language:
EN-IN;mso-fareast-language:EN-US;mso-bidi-language:AR-SA">atient Name</span></td>
                    <td id="rblGender">
                        <asp:TextBox ID="txtPatientname" runat="server" CssClass="textFields"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >P<span style="font-size:11.0pt;line-height:107%;
font-family:&quot;Calibri&quot;,sans-serif;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:
Calibri;mso-fareast-theme-font:minor-latin;mso-hansi-theme-font:minor-latin;
mso-bidi-font-family:Shruti;mso-bidi-theme-font:minor-bidi;mso-ansi-language:
EN-IN;mso-fareast-language:EN-US;mso-bidi-language:AR-SA">atientID</span> </td>
                    <td>
                        <asp:TextBox ID="txtPatientid" runat="server" CssClass="textFields"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >A<span style="font-size:11.0pt;line-height:107%;
font-family:&quot;Calibri&quot;,sans-serif;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:
Calibri;mso-fareast-theme-font:minor-latin;mso-hansi-theme-font:minor-latin;
mso-bidi-font-family:Shruti;mso-bidi-theme-font:minor-bidi;mso-ansi-language:
EN-IN;mso-fareast-language:EN-US;mso-bidi-language:AR-SA">ppointmentID</span></td>
                    <td>
                        <asp:TextBox ID="txtAppointmentid" runat="server" CssClass="textFields"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>T<span style="font-size:11.0pt;line-height:107%;
font-family:&quot;Calibri&quot;,sans-serif;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:
Calibri;mso-fareast-theme-font:minor-latin;mso-hansi-theme-font:minor-latin;
mso-bidi-font-family:Shruti;mso-bidi-theme-font:minor-bidi;mso-ansi-language:
EN-IN;mso-fareast-language:EN-US;mso-bidi-language:AR-SA">otal Amount</span></td>
                    <td>
                        <asp:TextBox ID="txtTotal" runat="server" CssClass="textFields" TextMode="Number"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td ><span style="font-size:11.0pt;line-height:107%;
font-family:&quot;Calibri&quot;,sans-serif;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:
Calibri;mso-fareast-theme-font:minor-latin;mso-hansi-theme-font:minor-latin;
mso-bidi-font-family:Shruti;mso-bidi-theme-font:minor-bidi;mso-ansi-language:
EN-IN;mso-fareast-language:EN-US;mso-bidi-language:AR-SA">Discounts</span></td>
                    <td>
                        <asp:TextBox ID="txtDiscounts" runat="server" CssClass="textFields" TextMode="Number"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >P<span style="font-size:11.0pt;line-height:107%;
font-family:&quot;Calibri&quot;,sans-serif;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:
Calibri;mso-fareast-theme-font:minor-latin;mso-hansi-theme-font:minor-latin;
mso-bidi-font-family:Shruti;mso-bidi-theme-font:minor-bidi;mso-ansi-language:
EN-IN;mso-fareast-language:EN-US;mso-bidi-language:AR-SA">ayment Mode</span></td>
                    <td>
                        <asp:DropDownList ID="ddlPayment" runat="server">
                            <asp:ListItem>Cash</asp:ListItem>
                            <asp:ListItem>Credit card</asp:ListItem>
                            <asp:ListItem>Debit Card</asp:ListItem>
                            <asp:ListItem>Net Banking</asp:ListItem>
                            <asp:ListItem>UPI</asp:ListItem>
                            <asp:ListItem>Cheque </asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                     <td >P<span style="font-size:11.0pt;line-height:107%;
font-family:&quot;Calibri&quot;,sans-serif;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:
Calibri;mso-fareast-theme-font:minor-latin;mso-hansi-theme-font:minor-latin;
mso-bidi-font-family:Shruti;mso-bidi-theme-font:minor-bidi;mso-ansi-language:
EN-IN;mso-fareast-language:EN-US;mso-bidi-language:AR-SA">ayment Status</span></td>
                         <td>
                                <asp:RadioButtonList ID="rblPaymentstatus" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem>Paid</asp:ListItem>
                                    <asp:ListItem>Pending</asp:ListItem>
                                </asp:RadioButtonList>
                         </td>
                </tr>
                <tr>
                    <td>P<span style="font-size:11.0pt;line-height:107%;
font-family:&quot;Calibri&quot;,sans-serif;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:
Calibri;mso-fareast-theme-font:minor-latin;mso-hansi-theme-font:minor-latin;
mso-bidi-font-family:Shruti;mso-bidi-theme-font:minor-bidi;mso-ansi-language:
EN-IN;mso-fareast-language:EN-US;mso-bidi-language:AR-SA">ayment Date</span> </td>
                         <td>
                             <asp:TextBox ID="txtPaymentdate" runat="server" CssClass="textFields" TextMode="Date"></asp:TextBox>
                         </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btnsubmit" OnClick="btnSubmit_Click" Text="SUBMIT" />
                        <asp:Button ID="btnReset" runat="server" CssClass="btnreset" OnClick="btnReset_Click" Text="RESET" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
