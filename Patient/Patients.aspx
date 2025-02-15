<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Patients.aspx.cs" Inherits="hospital_management.Patient.Patients" %>

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
           
        }

        .no-spinner {
            -moz-appearance: textfield; /* Firefox */
            width : 300px;
        }
        .textFields {
            width : 300px;
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
<body style="width: 500px">
    <form id="form2" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td colspan="2" style="text-align: center"><strong>Patient's Registration</strong></td>
                </tr>
                <tr>
                    <td>Name </td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server" CssClass="textFields"></asp:TextBox><br />
        
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"  ErrorMessage="Name is required" ForeColor="Red" Display="Dynamic" /><br />
                        <asp:RegularExpressionValidator ID="revName" runat="server" ControlToValidate="txtName" ErrorMessage="Only letters allowed" ForeColor="Red" Display="Dynamic" ValidationExpression="^[a-zA-Z\s]+$" />

                    </td>
                </tr>
                <tr>
                    <td>Age </td>
                    <td>
                        <asp:TextBox ID="txtAge" runat="server" ClientIDMode="AutoID" CssClass="no-spinner" TextMode="Number" MaxLength="3"></asp:TextBox><br />
                         <asp:RequiredFieldValidator ID="rfvAge" runat="server" ControlToValidate="txtAge" ErrorMessage="Age is required" ForeColor="Red" Display="Dynamic" /><br />
                         <asp:RangeValidator ID="rvAge" runat="server" ControlToValidate="txtAge" ErrorMessage="Age must be between 1 and 120" MinimumValue="1" MaximumValue="120" Type="Integer" ForeColor="Red" Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td >Gender </td>
                    <td >
                        <asp:RadioButtonList ID="rblGender" runat="server" CellPadding="2" CellSpacing="2" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:RadioButtonList><br />
                        <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="rblGender" InitialValue="" ErrorMessage="Gender is required" ForeColor="Red" Display="Dynamic" />
    </td>
                   
                </tr>
                <tr>
                    <td >Address </td>
                    <td >
                        <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" CssClass="textFields"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" ErrorMessage="Address is required" ForeColor="Red" Display="Dynamic" />

                    </td>
                </tr>
                <tr>
                    <td >Date of birth</td>
                    <td >
                        <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="textFields" ></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="txtDate" ErrorMessage="Date of Birth is required" ForeColor="Red" Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td >Contact No </td>
                    <td >
                        <asp:TextBox ID="txtContactNo" runat="server" TextMode="Number" ValidateRequestMode="Disabled" CssClass="no-spinner" MaxLength="10"></asp:TextBox><br />
                         <asp:RequiredFieldValidator ID="rfvContact" runat="server" ControlToValidate="txtContactNo" ErrorMessage="Contact number is required" ForeColor="Red" Display="Dynamic" /><br />
                         <asp:RegularExpressionValidator ID="revContact" runat="server" ControlToValidate="txtContactNo" ErrorMessage="Invalid phone number format" ForeColor="Red" Display="Dynamic" ValidationExpression="^\d{10}$" />
                    </td>
                </tr>
                <tr>
                    <td >Email </td>
                    <td >
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="textFields"></asp:TextBox><br />
                         <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required" ForeColor="Red" Display="Dynamic" /><br />
                         <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email format" ForeColor="Red" Display="Dynamic" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" />
                    </td>
                </tr>
                <tr>
                    <td >Password </td>
                    <td >
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="textFields"></asp:TextBox><br />
                         <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required" ForeColor="Red" Display="Dynamic" /><br />
                        <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password must be 8-16 characters long, include one uppercase, one number, and one special character." ValidationExpression="^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$" ForeColor="Red" Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                  <td >confirm-Password </td>
                  <td >
                        <asp:TextBox ID="txtconfirm" runat="server" TextMode="Password" CssClass="textFields"></asp:TextBox><br />
                      <asp:RequiredFieldValidator ID="rfvConfirm" runat="server" ControlToValidate="txtConfirm" ErrorMessage="Confirm Password is required" ForeColor="Red" Display="Dynamic" /><br />
                      <asp:CompareValidator ID="cvConfirmPassword" runat="server" ControlToValidate="txtConfirm" ControlToCompare="txtPassword" ErrorMessage="Passwords do not match" ForeColor="Red" Display="Dynamic" />

                  </td>
               </tr>


                <tr>
                    <td>Emergency Contact no</td>
                    <td >
                        <asp:TextBox ID="txtEmergencycontactno" runat="server" CssClass="no-spinner" TextMode="Number" ValidateRequestMode="Disabled" MaxLength="10"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="rfvEmergencyContact" runat="server" ControlToValidate="txtEmergencycontactno" ErrorMessage="Emergency Contact is required" ForeColor="Red" Display="Dynamic" /><br />
                        <asp:RegularExpressionValidator ID="revEmergencyContact" runat="server" ControlToValidate="txtEmergencycontactno" ErrorMessage="Invalid contact number (must be 10 digits)" ForeColor="Red" Display="Dynamic" ValidationExpression="^\d{10}$" />
                    </td>
                </tr>
                <tr>
                    <td >Blood Group</td>
                    <td >
                        <asp:RadioButtonList ID="rblBlood" runat="server" RepeatColumns="4" Width="270px">
                            <asp:ListItem>A+</asp:ListItem>
                            <asp:ListItem>A-</asp:ListItem>
                            <asp:ListItem>B+</asp:ListItem>
                            <asp:ListItem>B-</asp:ListItem>
                            <asp:ListItem>AB+</asp:ListItem>
                            <asp:ListItem>AB-</asp:ListItem>
                            <asp:ListItem>O+</asp:ListItem>
                            <asp:ListItem>O-</asp:ListItem>
                        </asp:RadioButtonList><br />
                         <asp:RequiredFieldValidator ID="rfvBlood" runat="server" ControlToValidate="rblBlood" InitialValue="" ErrorMessage="Blood Group is required" ForeColor="Red" Display="Dynamic" />
    </td>

                   
                </tr>
                <tr>
                    <td >Allergies</td>
                    <td >

                        <asp:TextBox ID="txtAllergies" runat="server" Width="295px" CssClass="textFields"></asp:TextBox><br />
                       <asp:RequiredFieldValidator ID="rfvAllergies" runat="server" ControlToValidate="txtAllergies"  ErrorMessage="Allergies is required" ForeColor="Red" Display="Dynamic" /><br />

                    </td>
                </tr>
                <tr>
                    <td >Running Medicines</td>
                    <td >
                        <asp:TextBox ID="txtRunningmedicine" runat="server" Width="293px" CssClass="textFields"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="rfvRunning" runat="server" ControlToValidate="txtRunningmedicine"  ErrorMessage="Running medicines is required" ForeColor="Red" Display="Dynamic" /><br />

                    </td>
                </tr>
                <tr>
                    <td>Insurance</td>
                    <td >
                        <asp:RadioButtonList ID="rblInsurance" runat="server" RepeatDirection="Horizontal" Width="180px">
                            <asp:ListItem>YES</asp:ListItem>
                            <asp:ListItem>No</asp:ListItem>
                        </asp:RadioButtonList><br />
                        <asp:RequiredFieldValidator ID="rfvInsurance" runat="server" ControlToValidate="rblInsurance" InitialValue="" ErrorMessage="Please select an Insurance option" ForeColor="Red" Display="Dynamic" />
    </td>
                    
                </tr>
                
               
                <tr>
                    <td colspan="2" style="text-align: center">
                        <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="SAVE" CssClass="btnsubmit" />
                        <asp:Button ID="btnReset" runat="server" OnClick="btnReset_Click" Text="RESET" CssClass="btnreset" />
                    </td>
                </tr>
                
               
                <tr>
                    <td colspan="2" >
                        <asp:Label ID="lblDetails" runat="server" Text="Details"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
