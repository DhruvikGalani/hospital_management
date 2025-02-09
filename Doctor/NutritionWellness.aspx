<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NutritionWellness.aspx.cs" Inherits="hospital_management.Doctor.NutritionWellness" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .textbox {
            width:360px
        }
     
        .auto-style3 {
            width: 24%;
        }
        .auto-style4 {
            width: 74%;
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
<body style="width: 500px">
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td colspan="2" style="text-align: center; font-family:large"><strong>NutritionWellness</strong></td>
                </tr>
                <tr>
                    <td class="auto-style3">Patient Name</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtPatientName" runat="server" CssClass="textbox" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtPatientName"  ErrorMessage="Patient name is required" ForeColor="Red" Display="Dynamic" />
                           <asp:RegularExpressionValidator ID="revName" runat="server" ControlToValidate="txtPatientName"  ErrorMessage="Only letters allowed" ForeColor="Red" Display="Dynamic"  ValidationExpression="^[a-zA-Z\s]+$" />


                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Doctor Name</td>
                    <td class="auto-style4" >
                        <asp:TextBox ID="txtDoctorName" runat="server" CssClass="textbox" ></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDoctorName"  ErrorMessage="Doctor name is required" ForeColor="Red" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtDoctorName"  ErrorMessage="Only letters allowed" ForeColor="Red" Display="Dynamic"  ValidationExpression="^[a-zA-Z\s]+$" />



                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Diet Plan</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtDietPlan" runat="server" CssClass="textbox" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDietplan" runat="server" ControlToValidate="txtDietPlan"  ErrorMessage="Diet plan is required" ForeColor="Red" Display="Dynamic" />

                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Exercise Plan</td>
                    <td class="auto-style4" >
                        <asp:TextBox ID="txtExercisePlan" runat="server" CssClass="textbox" TextMode="MultiLine" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEcercise" runat="server" ControlToValidate="txtExercisePlan"  ErrorMessage="Exercise paln is required" ForeColor="Red" Display="Dynamic" />

                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Health Goal</td>
                    <td class="auto-style4" >
                        <asp:DropDownList ID="ddlHealthGoals" runat="server" Width="180px" AutoPostBack="True" OnSelectedIndexChanged="ddlHealthGoals_SelectedIndexChanged">
                        </asp:DropDownList>
						<asp:RequiredFieldValidator ID="rfvHealthGoals" runat="server" ControlToValidate="ddlHealthGoals" ErrorMessage="health goal  is required" ForeColor="Red" Display="Dynamic" />


                        <asp:DropDownList ID="ddlHealthGoalsTypes" runat="server" Width="180px">
                        </asp:DropDownList>
                    </td>
                     <asp:RequiredFieldValidator ID="rfvHealthtypes" runat="server" ControlToValidate="ddlHealthGoals"  ErrorMessage="health goal types is required" ForeColor="Red" Display="Dynamic" />
                    

                </tr>
                <tr>
                    <td class="auto-style3">Allergies</td>
                    <td class="auto-style4" >
                        <asp:TextBox ID="txtAllergies" runat="server" CssClass="textbox" TextMode="MultiLine" ></asp:TextBox>
						<asp:RequiredFieldValidator ID="rfvAllergies" runat="server" ControlToValidate="txtAllergies" ErrorMessage="Allergies is required" ForeColor="Red" Display="Dynamic" />
                        
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Created Date</td>
                    <td class="auto-style4" >
                        <asp:TextBox ID="txtCreatedDate" runat="server" CssClass="textbox" TextMode="Date" ></asp:TextBox>
						<asp:RequiredFieldValidator ID="rfvCreateddata" ErrorMessage="Created Date is required" ControlToValidate="txtCreatedDate" runat="server" ForeColor="Red" Display="Dynamic"  />
                         
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Last Updated</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtLastUpdated"  runat="server" CssClass="textbox" TextMode="Date" ></asp:TextBox>
                    </td>       
					<asp:RequiredFieldValidator ID="rfvLastupdated" ErrorMessage="Last Updated data is required" ControlToValidate="txtLastUpdated" runat="server"  ForeColor="Red" Display="Dynamic"  />
					
                </tr>
                <tr>
                    <td class="auto-style3">Plan Status</td>
                    <td class="auto-style4" >
                        <asp:DropDownList ID="ddlPlanStatus" runat="server" Width="180px">
                            <asp:ListItem>Active</asp:ListItem>
                            <asp:ListItem>Inactive</asp:ListItem>
                            <asp:ListItem>Completed</asp:ListItem>
                            <asp:ListItem>Discontinued</asp:ListItem>
                            <asp:ListItem>Cancelled</asp:ListItem>
                        </asp:DropDownList>
                      <asp:RequiredFieldValidator ID="rfvSatatus" ErrorMessage="Plan status is required" ControlToValidate="txtLastUpdated" runat="server" ForeColor="Red" Display="Dynamic"  />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Notes</td>
                    <td class="auto-style4" >
                        <asp:TextBox ID="txtNotes" runat="server" CssClass="textbox" TextMode="MultiLine" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNotes" ErrorMessage="notes is required" ControlToValidate="txtLastUpdated" runat="server" ForeColor="Red" Display="Dynamic"  />


                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        <asp:Button ID="btnSave" runat="server" Text="SAVE" OnClick="btnSave_Click" CssClass="btnsubmit" />
                        <asp:Button ID="btnReset" runat="server" Text="RESET" OnClick="btnReset_Click" CssClass="btnreset" />
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
