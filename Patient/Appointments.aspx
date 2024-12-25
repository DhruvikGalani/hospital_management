<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Appointments.aspx.cs" Inherits="hospital_management.Patient.Appointments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
     .auto-style1 {
         width: 99%;
            height: 298px;
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
        .auto-style2 {
            width: 167px;
        }
 </style>
</head>
<body style="width: 498px; height: 303px;">
    <form id="form1" runat="server">
        <div>
           
                
                    
            <table class="auto-style1">
                <tr>
                    <td colspan="2" style="text-align: center; font-family:large;"> <strong>Appointments</strong></td>
                </tr>
                <tr>
                    <td>Patient Name:</td>
                    <td>
                        <asp:TextBox ID="txtPatientname" runat="server" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Doctor Name:</td>
                    <td>
                        <asp:TextBox ID="txtDoctorname" runat="server" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Appoitment Date &amp; Time:</td>
                    <td>
                        <asp:TextBox ID="txtDateandtime" runat="server" TextMode="DateTime" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Reason For Visit</td>
                    <td>
                        <asp:TextBox ID="txtReason" runat="server" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">ClinicLocation</td>
                    <td>
                        <asp:DropDownList ID="ddlCliniclocation" runat="server"  Width="180px" AutoPostBack="True">
                            </asp:DropDownList>
                            
                        
                  </td>
                </tr>
                <tr>
                    <td class="auto-style2">Appoitment Status</td>
                    <td>
                        <asp:RadioButtonList ID="rblStatus" runat="server" CellPadding="2" CellSpacing="2" RepeatDirection="Horizontal" Height="25px" Width="300px">
                            <asp:ListItem>Pending</asp:ListItem>
                            <asp:ListItem>Confirm</asp:ListItem>
                        </asp:RadioButtonList>
                      </td>
                          </tr>
                 <tr>
     <td colspan="2" style="text-align: center">
         <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" CssClass="btnsubmit" />
         <asp:Button ID="btnReset" runat="server" OnClick="btnReset_Click" Text="Reset" />
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
