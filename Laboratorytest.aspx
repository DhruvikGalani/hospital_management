<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Laboratorytest.aspx.cs" Inherits="hospital_management.Laboratorytest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
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
      }
        .auto-style1 {
            height: 327px;
            width: 482px;
        }
    </style>
</head>
<body style="width: 480px; height: 325px;">
    <form id="form1" runat="server">
        <div>
            <table cellpadding="3" cellspacing="4" class="auto-style1">
                <tr>
                    <td colspan="2" style="font-weight: bold; text-align:center; font-size: medium">Laboratory Tests</td>
                </tr>
                <tr>
                    <td>TestsType:</td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlTesttype" runat="server" AutoPostBack="True" Height="25px" OnSelectedIndexChanged="ddlTesttype_SelectedIndexChanged" Width="180px">
                        </asp:DropDownList><br />
                        <asp:RequiredFieldValidator ID="rfvTestType" runat="server" ControlToValidate="ddlTesttype"  ErrorMessage="Please select a test type!" CssClass="error" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                    </td>
                </tr>
                <tr>
                    <td>TestDate:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtTestdate" runat="server" TextMode="Date" Height="25px" Width="360px"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="rfvTestDate" runat="server" ControlToValidate="txtTestdate" ErrorMessage="Test date is required!" CssClass="error" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>ResultDate:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtResultdate" runat="server" TextMode="Date" Height="25px" Width="360px"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="rfvResultDate" runat="server" ControlToValidate="txtResultdate" ErrorMessage="Result date is required!" CssClass="error" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cvResultDate" runat="server" ControlToValidate="txtResultdate" ControlToCompare="txtTestdate" Operator="GreaterThanEqual" Type="Date"  ErrorMessage="Result date must be after or on the test date!" CssClass="error" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>

                    </td>
                </tr>
                <tr>
                    <td>Result:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtResult" runat="server" TextMode="MultiLine" Height="37px" Width="360px"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="rfvResult" runat="server" ControlToValidate="txtResult" ErrorMessage="Test result is required!" CssClass="error" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
       <td colspan="2" style="text-align: center">
           <asp:Button ID="btnSubmit" runat="server" Text="Submit" Width="120px"  OnClick="btnSubmit_Click" CssClass="btnsubmit" />
           <asp:Button ID="btnReset" runat="server" Text="Reset" Width="120px" OnClick="btnReset_Click" CssClass="btnreset" />
       </td>
   </tr>
   <tr>
       <td colspan="2"><asp:Label ID="lblDetails" runat="server" Text="Details"></asp:Label>
       </td>
   </tr>
            </table>
        </div>
    </form>
</body>
</html>
