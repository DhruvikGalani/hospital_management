<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Insurance.aspx.cs" Inherits="hospital_management.Patient.Insurance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
    .auto-style1 {
        width: 99%;
       
    }
    
    .no-spinner::-webkit-inner-spin-button, 
    .no-spinner::-webkit-outer-spin-button {
        -webkit-appearance: none;
       
    }

    .no-spinner {
        -moz-appearance: textfield; 
         width : 250px;
        }
    .textFields {
        width : 250px;
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
<body style="width: 483px">
    <form id="form1" runat="server">
               <div>
                   <table class="auto-style1">
                       <tr>
                           <td colspan="2" style="text-align: center; font-size: large;"><strong>Insurance</strong></td>
                       </tr>
                       <tr>
                           <td  >Policy Number</td>
                           <td >
                               <asp:TextBox ID="txtPolicynumber" runat="server" CssClass="no-spinner" TextMode="Number"></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="rfvpolicynumber" runat="server" ControlToValidate="txtPolicynumber"  ErrorMessage="policy number is required" ForeColor="Red" Display="Dynamic" /><br />
                               <asp:RegularExpressionValidator ID="revPolicyNumber" runat="server" ControlToValidate="txtPolicynumber"  ErrorMessage="Only digits allowed" ForeColor="Red" Display="Dynamic" ValidationExpression="^\d+$" />

                           </td>
                       </tr>
                       <tr>
                           <td >provider</td>
                           <td >
                               <asp:TextBox ID="txtProvide" runat="server" ClientIDMode="AutoID" CssClass="no-spinner"></asp:TextBox><br />
                                 <asp:RequiredFieldValidator ID="rfvProvide" runat="server" ControlToValidate="txtProvide"  ErrorMessage="provider is required" ForeColor="Red" Display="Dynamic" /><br />
                                 <asp:RegularExpressionValidator ID="revprovide" runat="server" ControlToValidate="txtProvide"  ErrorMessage="Only letters allowed" ForeColor="Red" Display="Dynamic"  ValidationExpression="^[a-zA-Z\s]+$" />

                           </td>
                       </tr>
                       <tr>
                           <td  >Coverage Details</td>
                           <td >
                               <asp:TextBox ID="txtCoverage" runat="server" CssClass="textFields"></asp:TextBox><br />
                                 <asp:RequiredFieldValidator ID="rfvCoverage" runat="server" ControlToValidate="txtCoverage"  ErrorMessage="Coverage details is required" ForeColor="Red" Display="Dynamic" /><br />
                                 <asp:RegularExpressionValidator ID="revCoverage" runat="server" ControlToValidate="txtCoverage"  ErrorMessage="Only letters allowed" ForeColor="Red" Display="Dynamic"   ValidationExpression="^[a-zA-Z\s]+$" />

                           </td>
                       </tr>
                       <tr>
                           <td  >Claim Status</td>
                           <td>
                               <asp:RadioButtonList ID="rblClaimstatus" runat="server" AutoPostBack="True" RepeatDirection="Horizontal">
                                   <asp:ListItem>Approved</asp:ListItem>
                                   <asp:ListItem>Pending</asp:ListItem>
                               </asp:RadioButtonList><br />
                               <asp:RequiredFieldValidator ID="rfvClaimstatus" runat="server" ControlToValidate="rblClaimstatus"  ErrorMessage="Claim Status is required." ForeColor="Red" Height="20px" /><br />

                           </td>
                       </tr>
                       <tr>
                           <td  >Claim Amount</td>
                           <td >
                               <asp:TextBox ID="txtClaim" runat="server" TextMode="Number" Width="146px" CssClass="no-spinner"></asp:TextBox><br />
                                   <asp:RequiredFieldValidator ID="rfvClaim" runat="server" ControlToValidate="txtClaim"  ErrorMessage="claim amount is required" ForeColor="Red" Display="Dynamic" /><br />
                                   <asp:RegularExpressionValidator ID="revClaim" runat="server" ControlToValidate="txtClaim"  ErrorMessage="Only digit allowed" ForeColor="Red" Display="Dynamic"  ValidationExpression="^\d+$" />



                           </td>
                       </tr>
                       <tr>
                           <td >Approval Date</td>
                           <td >
                               <asp:TextBox ID="txtApprovaldate" runat="server" TextMode="Date" ValidateRequestMode="Disabled" Width="145px"></asp:TextBox><br />
                              <asp:RequiredFieldValidator ID="rfvApprovaldate" runat="server" ControlToValidate="txtApprovaldate"  ErrorMessage="Aproval date  is required" ForeColor="Red" Display="Dynamic" /><br />

                           </td>
                       </tr>
                       <tr>
                           <td >Policy Expiry Date</td>
                           <td>
                               <asp:TextBox ID="txtExpirydate" runat="server" TextMode="Date" Width="143px"></asp:TextBox><br />
                               <asp:RequiredFieldValidator ID="rfvExpirydate" runat="server" ControlToValidate="txtExpirydate"  ErrorMessage="policy expiry date is required" ForeColor="Red" Display="Dynamic" /><br />

                           </td>
                       </tr>
                       <tr>
                       <td colspan="2" style="text-align: center">
                           <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="SUBMIT" CssClass="btnsubmit" />
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
