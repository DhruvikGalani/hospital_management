﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Insurance.aspx.cs" Inherits="hospital_management.Patient.Insurance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
    .auto-style1 {
        width: 100%;
        height: 400px; 
    }
    .auto-style2 {
        width: 190px;
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
    }
   
    </style>
</head>
<body style="width: 485px">
    <form id="form1" runat="server">
               <div>
           <table class="auto-style1">
               <tr>
                   <td colspan="2" style="text-align: center; font-size: large;"><strong>Insurance</strong></td>
               </tr>
               <tr>
                   <td class="auto-style2">PolicyNumber</td>
                   <td>
                       <asp:TextBox ID="txtPolicynumber" runat="server" CssClass="no-spinner"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td class="auto-style2">provider</td>
                   <td>
                       <asp:TextBox ID="txtProvide" runat="server" ClientIDMode="AutoID" CssClass="no-spinner"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td class="auto-style2">CoverageDetails</td>
                   <td>
                       <asp:TextBox ID="txtCoverage" runat="server" CssClass="textFields"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td class="auto-style2">ClaimStatus</td>
                   <td>
                       <asp:RadioButtonList ID="rblClaimstatus" runat="server" AutoPostBack="True" RepeatDirection="Horizontal">
                           <asp:ListItem>Approved</asp:ListItem>
                           <asp:ListItem>Pending</asp:ListItem>
                       </asp:RadioButtonList>
                   </td>
               </tr>
               <tr>
                   <td class="auto-style2">ClaimAmount</ntd>
                   <td>
                       <asp:TextBox ID="txtClaim" runat="server" TextMode="Number" Width="146px" CssClass="no-spinner"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td class="auto-style2">ApprovalDate</td>
                   <td>
                       <asp:TextBox ID="txtApprovaldate" runat="server" TextMode="Date" ValidateRequestMode="Disabled" Width="145px"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td class="auto-style2">PolicyExpiryDate</td>
                   <td>
                       <asp:TextBox ID="txtExpirydate" runat="server" TextMode="Date" Width="143px"></asp:TextBox>
                   </td>
               </tr>
              
                   <td colspan="2" style="text-align: center">
                       <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" CssClass="btnsubmit" />
                       <asp:Button ID="btnReset" runat="server" OnClick="btnReset_Click" Text="Reset" />
                   </td>
               </tr>
               
              
               <tr>
                   <td colspan="2" style="text-align: center">
                       <asp:Label ID="lblDetails" runat="server" Text="Details"></asp:Label>
                   </td>
               </tr>
           </table>
       </div>
    </form>
</body>
</html>
