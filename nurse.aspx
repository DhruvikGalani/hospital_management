<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="nurse.aspx.cs" Inherits="hospital_management.nurse" %>

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
<body  style="width: 508px; height: 334px; margin-bottom: 15px;">
 <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
        <td colspan="2" style="text-align: center; font-family:large;"><strong>Nurse</strong></td>

            </tr>
            <tr>
                <td class="auto-style2">Name:</td>
                <td class="auto-style3">
                        <asp:TextBox ID="txtName" runat="server"  CssClass="textFields"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Age:</td>
                <td class="auto-style3">
                        <asp:TextBox ID="txtAge" runat="server"  CssClass="textFields"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td id="rblGender" class="auto-style2">Gender:</td>
                <td id="rblGender" class="auto-style3">
                        <asp:RadioButtonList ID="rblGender" runat="server" CellPadding="2" CellSpacing="2" RepeatDirection="Horizontal">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Address:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Height="37px" Width="361px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Email:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" Height="25px" Width="360px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Password:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtpass" runat="server" TextMode="Password" CssClass="no-spinner"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Contact Number:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtContact" runat="server" TextMode="Number" CssClass="no-spinner"></asp:TextBox>
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