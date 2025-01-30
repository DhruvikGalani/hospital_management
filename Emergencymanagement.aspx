<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Emergencymanagement.aspx.cs" Inherits="hospital_management.Emergencymanagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <style type="text/css">

         .auto-style1 {
      width: 69%;
            height: 371px;
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
            height: 32px;
        }
        </style>
</head>
    <body style="width: 515px; height: 419px;">
    <form id="form1" runat="server">
        <div>
            <table cellpadding="3" cellspacing="4" class="auto-style1" border="0">
                <tr>
                    <td colspan="2" style="font-weight: bold; font-size: medium">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Laboratory Management</td>
                </tr>
                <tr>
                    <td>PatientName:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtPatientname" runat="server" Height="25px" Width="360px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>ContactNumber:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtContactnumber" runat="server" TextMode="Number" CssClass="no-spinner"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Repoeted Symptoms:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtSymptoms" runat="server" TextMode="MultiLine" Height="44px" Width="360px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Location:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtLocation" runat="server" TextMode="MultiLine" CssClass="no-spinner"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>AmbulanceID:</td>
                    <td class="auto-style2" id="txtTechnician">
                        <asp:TextBox ID="txtAmbulanceid" runat="server" CssClass="no-spinner" TextMode="Number"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>DriverName:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtDrivername" runat="server" Height="25px" Width="360px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>ArrivalTime:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtArrivaltime" runat="server" TextMode="Time" Height="25px" Width="360px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
     <td colspan="2" style="text-align: center">
         <asp:Button ID="btnSubmit" runat="server" Text="submit" Width="120px" CssClass="btnsubmit" OnClick="btnSubmit_Click" />
         <asp:Button ID="btnReset" runat="server" Text="Reset" Width="120px" OnClick="btnReset_Click" />
     </td>
 </tr>
 <tr>
     <td colspan="2" class="auto-style2"><asp:Label ID="lblDetails" runat="server" Text="Details"></asp:Label>
     </td>
 </tr>
            </table>
        </div>
        
    </form>

        
    </body>
</html>
