<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeedbackReview.aspx.cs" Inherits="hospital_management.Patient.FeedbackReview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <style type="text/css">
    .auto-style1 {
        width: 99%;
           height: 248px;
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
       .auto-style3 {
           height: 23px;
       }
       .auto-style4 {
           width: 316px;
       }
   </style>
</head>
<body style="width: 498px; height: 252px;">
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td colspan="2" style="text-align: center; font-family:large;"> <strong>Appointments</strong></td>
                </tr>
                <tr>
                    <td>Patient Name:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtPatientname" runat="server" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td class="auto-style2">Visit Date:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtVisitdate" runat="server" TextMode="Date" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" id="txtFeedback">Feedback</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtFeedback" runat="server" Width="300px" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
             
                
                <tr>
                    <td class="auto-style2" id="txtFeedback">Rating</td>
                    <td class="auto-style4">
                        &nbsp;</td>
                </tr>
             
                
                 <tr>
     <td colspan="2" style="text-align: center" class="auto-style3">
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
