<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Billing.aspx.cs" Inherits="hospital_management.Admin.Billing" %>

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
                    <td colspan="2" style="text-align: center; font-family:large;"><strong>Billing</strong></td>
                </tr>
                <tr>
                    <td >InvoiceID</td>
                    <td>
                        <asp:TextBox ID="txtInvoiceid" runat="server" CssClass="textFields"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td >Patient Name</td>
                         <td>
                             <asp:TextBox ID="txtPatientname" runat="server" CssClass="textFields"></asp:TextBox>
                     </td>
                </tr>
                <tr>
                    <td >PatientID</td>
                    <td>
                        <asp:TextBox ID="txtPatientid" runat="server" CssClass="textFields"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >AppointmentID</td>
                    <td>
                        <asp:TextBox ID="txtAppointmentid" runat="server" CssClass="textFields"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >Gender</td>
                    <td>
                        <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td >Total Amount</td>
                    <td>
                        <asp:TextBox ID="txtTotalamount" runat="server" CssClass="textFields" TextMode="Number"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Discounts</td>
                    <td>
                        <asp:TextBox ID="txtDiscount" runat="server" CssClass="textFields" TextMode="Number"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >Payment Mode</td>
                    <td>
                        <asp:DropDownList ID="ddlPaymentmode" runat="server">
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
                    <td >Payment Status</td>
                    <td>
                        <asp:RadioButtonList ID="rblPaymentstatus" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Paid</asp:ListItem>
                            <asp:ListItem>Pending</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td >Payment Dtae</td>
                    <td>
                        <asp:TextBox ID="txtPaymentdate" runat="server" CssClass="textFields" TextMode="Date"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >ContactNumber</td>
                    <td>
                        <asp:TextBox ID="txtContactno" runat="server" CssClass="textFields" TextMode="Number"></asp:TextBox>
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
