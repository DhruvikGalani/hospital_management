<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Insurance.aspx.cs" Inherits="hospital_management.Patient.Insurance" %>

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
        width: 192px;
    }
    .no-spinner::-webkit-inner-spin-button, 
    .no-spinner::-webkit-outer-spin-button {
        -webkit-appearance: none;
       
    }

    .no-spinner {
        -moz-appearance: textfield; /* Firefox */
        }
    .textFields {
        }
    .btnsubmit {
        margin-right: 50px;
    }
    .auto-style4 {
        height: 26px;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
               <div>
           <table class="auto-style1">
               <tr>
                   <td colspan="2" style="text-align: center; font-size: large;"><strong>Insurance</strong></td>
               </tr>
               <tr>
                   <td class="auto-style2"><span style="font-size: medium; line-height: 107%; font-family: &quot;Calibri&quot;,sans-serif; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: Calibri; mso-fareast-theme-font: minor-latin; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: Shruti; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-IN; mso-fareast-language: EN-US; mso-bidi-language: AR-SA">PolicyNumber:</span></td>
                   <td>
                       <asp:TextBox ID="txtPolicynumber" runat="server" CssClass="textFields" Width="283px"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td class="auto-style2"><span style="font-size:11.0pt;line-height:107%;
font-family:&quot;Calibri&quot;,sans-serif;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:
Calibri;mso-fareast-theme-font:minor-latin;mso-hansi-theme-font:minor-latin;
mso-bidi-font-family:Shruti;mso-bidi-theme-font:minor-bidi;mso-ansi-language:
EN-IN;mso-fareast-language:EN-US;mso-bidi-language:AR-SA">Provider</span></td>
                   <td>
                       <asp:TextBox ID="txtProvide" runat="server" ClientIDMode="AutoID" CssClass="no-spinner" Width="289px"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td class="auto-style2"><span style="font-size:11.0pt;line-height:107%;
font-family:&quot;Calibri&quot;,sans-serif;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:
Calibri;mso-fareast-theme-font:minor-latin;mso-hansi-theme-font:minor-latin;
mso-bidi-font-family:Shruti;mso-bidi-theme-font:minor-bidi;mso-ansi-language:
EN-IN;mso-fareast-language:EN-US;mso-bidi-language:AR-SA">CoverageDetails</span></td>
                   <td>
                       <asp:TextBox ID="txtCoverage" runat="server" Width="297px"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td class="auto-style2"><span style="font-size:11.0pt;line-height:107%;
font-family:&quot;Calibri&quot;,sans-serif;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:
Calibri;mso-fareast-theme-font:minor-latin;mso-hansi-theme-font:minor-latin;
mso-bidi-font-family:Shruti;mso-bidi-theme-font:minor-bidi;mso-ansi-language:
EN-IN;mso-fareast-language:EN-US;mso-bidi-language:AR-SA">ClaimStatus</span></td>
                   <td>
                       <asp:RadioButtonList ID="rblClaimstatus" runat="server" AutoPostBack="True" RepeatDirection="Horizontal">
                           <asp:ListItem>Approved</asp:ListItem>
                           <asp:ListItem>Pending</asp:ListItem>
                       </asp:RadioButtonList>
                   </td>
               </tr>
               <tr>
                   <td class="auto-style2"><span style="font-size:11.0pt;line-height:107%;
font-family:&quot;Calibri&quot;,sans-serif;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:
Calibri;mso-fareast-theme-font:minor-latin;mso-hansi-theme-font:minor-latin;
mso-bidi-font-family:Shruti;mso-bidi-theme-font:minor-bidi;mso-ansi-language:
EN-IN;mso-fareast-language:EN-US;mso-bidi-language:AR-SA">ClaimAmount</span></td>
                   <td>
                       <asp:TextBox ID="txtClaim" runat="server" TextMode="Number" Width="146px"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td class="auto-style2"><span style="font-size:11.0pt;line-height:107%;
font-family:&quot;Calibri&quot;,sans-serif;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:
Calibri;mso-fareast-theme-font:minor-latin;mso-hansi-theme-font:minor-latin;
mso-bidi-font-family:Shruti;mso-bidi-theme-font:minor-bidi;mso-ansi-language:
EN-IN;mso-fareast-language:EN-US;mso-bidi-language:AR-SA">ApprovalDate</span></td>
                   <td>
                       <asp:TextBox ID="txtApprovaldate" runat="server" TextMode="Date" ValidateRequestMode="Disabled" CssClass="no-spinner" Width="145px"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td class="auto-style2"><span style="font-size:11.0pt;line-height:107%;
font-family:&quot;Calibri&quot;,sans-serif;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:
Calibri;mso-fareast-theme-font:minor-latin;mso-hansi-theme-font:minor-latin;
mso-bidi-font-family:Shruti;mso-bidi-theme-font:minor-bidi;mso-ansi-language:
EN-IN;mso-fareast-language:EN-US;mso-bidi-language:AR-SA">PolicyExpiryDate</span></td>
                   <td>
                       <asp:TextBox ID="txtExpirydate" runat="server" TextMode="Date" CssClass="textFields" Width="143px"></asp:TextBox>
                   </td>
               </tr>
              
                   <td colspan="2" style="text-align: center">
                       <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" />
                       <asp:Button ID="btnReset" runat="server" OnClick="btnReset_Click" Text="Reset" />
                   </td>
               </tr>
               
              
               <tr>
                   <td colspan="2" style="text-align: center" class="auto-style4">
                       <asp:Label ID="lblDetails" runat="server" Text="Details"></asp:Label>
                   </td>
               </tr>
           </table>
       </div>
    </form>
</body>
</html>
