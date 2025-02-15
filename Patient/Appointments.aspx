<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Appointments.aspx.cs" Inherits="hospital_management.Patient.Appointments" %>

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
            width: 280px;
        }

        .textFields {
            width: 280px;
        }

        .btnsubmit {
            margin-right: 50px;
            width: 110px;
        }

        .btnreset {
            width: 110px;
        }
    </style>
</head>
<body style="width: 530px;">
    <form id="form1" runat="server">
        <div>



            <table class="auto-style1">
                <tr>
                    <td colspan="2" style="text-align: center; font-family: large;"><strong>Appointments</strong></td>
                </tr>
                <tr>
                    <td>Patient Name</td>
                    <td>
                        <asp:TextBox ID="txtPatientname" runat="server" CssClass="textFields"></asp:TextBox><br />
                  
               <asp:RequiredFieldValidator ID="rfvPatientName" runat="server" ControlToValidate="txtPatientname"  ErrorMessage="Patient Name is required." ForeColor="Red" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revName" runat="server" ControlToValidate="txtPatientname"  ErrorMessage="Only letters allowed" ForeColor="Red" Display="Dynamic"  ValidationExpression="^[a-zA-Z\s]+$" />
                    </td>
                </tr>
                <tr>
                    <td>Doctor Name</td>
                    <td>
                        <asp:TextBox ID="txtDoctorname" runat="server" CssClass="textFields" ></asp:TextBox><br />
                         <asp:RequiredFieldValidator ID="rfvDoctorName" runat="server" ControlToValidate="txtDoctorname" ErrorMessage="Doctor Name is required." ForeColor="Red" Display="Dynamic" />
						<asp:RegularExpressionValidator ID="revDoctorName" runat="server" ControlToValidate="txtDoctorname" ErrorMessage="Only letters allowed" ForeColor="Red" Display="Dynamic" ValidationExpression="^[a-zA-Z\s]+$" />

        
                    </td>
                </tr>
                <tr>
                    <td >Appoitment Date & Time</td>
                    <td>
                        <asp:TextBox ID="txtDateandtime" runat="server" TextMode="DateTime" CssClass="textFields" ></asp:TextBox><br />
                         <asp:RequiredFieldValidator ID="rfvDateTime" runat="server" ControlToValidate="txtDateandtime"   ErrorMessage="Appointment Date & Time is required." ForeColor="Red" Display="Dynamic" />
                        <asp:CompareValidator ID="cvDateTime" runat="server" ControlToValidate="txtDateandtime"  Operator="DataTypeCheck"  ErrorMessage="Invalid Date format."  ForeColor="Red" Display="Dynamic" />
						<asp:RangeValidator ErrorMessage="Appointment date & time must be greater than current date." MinimumValue="<%#DateTime.Now%>"  ControlToValidate="txtDateandtime" ForeColor="Red" Display="Dynamic" runat="server" />
                        
                        
                    </td>
                </tr>
                <tr>
                    <td >Reason For Visit</td>
                    <td>
                        <asp:TextBox ID="txtReason" runat="server" CssClass="textFields" TextMode="MultiLine"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="rfvReason" runat="server" ControlToValidate="txtReason"  ErrorMessage="Reason for Visit is required." ForeColor="Red" Display="Dynamic" />
                        

        </td>
                   
                </tr>

                <tr>
                    <td >Clinic Location</td>
                    <td>
                        <asp:DropDownList ID="ddlCliniclocation" runat="server" Width="200px">
                            <asp:ListItem>select</asp:ListItem>
                            <asp:ListItem>Ahmedabad</asp:ListItem>
                            <asp:ListItem>vadodara</asp:ListItem>
                            <asp:ListItem>Aragonda</asp:ListItem>
                            <asp:ListItem>Bangalore</asp:ListItem>
                            <asp:ListItem>Bhubaneshwar</asp:ListItem>
                            <asp:ListItem>Bilaspur</asp:ListItem>
                            <asp:ListItem>Bhopal</asp:ListItem>
                            <asp:ListItem>Chennai</asp:ListItem>
                            <asp:ListItem>Delhi</asp:ListItem>
                            <asp:ListItem>Guwahati</asp:ListItem>
                            <asp:ListItem>Hyderabad</asp:ListItem>
                            <asp:ListItem>Indore</asp:ListItem>
                            <asp:ListItem>Kakinada</asp:ListItem>
                            <asp:ListItem>Karur</asp:ListItem>
                            <asp:ListItem>Kolkata</asp:ListItem>
                            <asp:ListItem>Kochi</asp:ListItem>
                            <asp:ListItem>Lucknow</asp:ListItem>
                            <asp:ListItem>Madurai</asp:ListItem>
                            <asp:ListItem>Mumbai</asp:ListItem>
                            <asp:ListItem>Mysore</asp:ListItem>
                            <asp:ListItem>Nashik</asp:ListItem>
                            <asp:ListItem>Nellore</asp:ListItem>
                            <asp:ListItem>Noida</asp:ListItem>
                            <asp:ListItem>Rourkela</asp:ListItem>
                            <asp:ListItem>Trichy</asp:ListItem>
                            <asp:ListItem>Trichy</asp:ListItem>
                        </asp:DropDownList> <br />
			
                        <asp:RequiredFieldValidator ID="rfvClinicLocation" runat="server" ControlToValidate="ddlCliniclocation"  ErrorMessage="Please select a Clinic Location." ForeColor="Red" Display="Dynamic" />
                        
					

                    </td>
                </tr>
                <tr>
                    <td >Appoitment Status</td>
                    <td>
                        <asp:RadioButtonList ID="rblStatus" runat="server" CellPadding="2" CellSpacing="2" RepeatDirection="Horizontal">
                            <asp:ListItem>Pending</asp:ListItem>
                            <asp:ListItem>Confirm</asp:ListItem>
                        </asp:RadioButtonList><br />
                        <asp:RequiredFieldValidator ID="rfvStatus" runat="server" ControlToValidate="rblStatus"  InitialValue="" ErrorMessage="Please select a Clinic status." ForeColor="Red" Display="Dynamic" />
                        

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
