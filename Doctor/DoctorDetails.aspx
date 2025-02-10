<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoctorDetails.aspx.cs" Inherits="hospital_management.Doctor.DoctorDetails" %>

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
<body style="width: 550px; height: 430px;">
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td colspan="2" style="text-align: center; font-family:large;"><strong>Doctor's Registration</strong></td>
                </tr>
                <tr>
                    <td >Name </td>
                    <td>
                      <asp:TextBox ID="txtName" runat="server" CssClass="textFields"></asp:TextBox><br />
                     <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"  ErrorMessage="Name is required" ForeColor="Red" Display="Dynamic" /><br />
                     <asp:RegularExpressionValidator ID="revName" runat="server" ControlToValidate="txtName"  ErrorMessage="Only letters allowed" ForeColor="Red" Display="Dynamic"  ValidationExpression="^[a-zA-Z\s]+$" />
                 

                    </td>
                </tr>
                <tr>
                    <td >Age </td>
                    <td>
                       <asp:TextBox ID="txtAge" runat="server" ClientIDMode="AutoID" CssClass="no-spinner" TextMode="Number" MaxLength="3"></asp:TextBox><br />
                       <asp:RequiredFieldValidator ID="rfvAge" runat="server" ControlToValidate="txtAge" ErrorMessage="Age is required" ForeColor="Red" Display="Dynamic" /><br />
                       <asp:RangeValidator ID="rvAge" runat="server" ControlToValidate="txtAge"  ErrorMessage="Age must be between 18 and 100" MinimumValue="18" MaximumValue="100" Type="Integer" ForeColor="Red" Display="Dynamic" />

                    </td>
                </tr>
                <tr>
                    <td >Gender </td>
                    <td>
                        <asp:RadioButtonList ID="rblGender" runat="server" CellPadding="2" CellSpacing="2" RepeatDirection="Horizontal">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:RadioButtonList><br />

                        <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="rblGender"  ErrorMessage="Gender is required." ForeColor="Red" Height="20px" /><br />

                    </td>
                </tr>
                <tr>
                    <td >Address </td>
                    <td>
                        <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" CssClass="textFields"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress"  ErrorMessage="Address is required." ForeColor="Red" Height="20px" /><br />

                    </td>
                </tr>
                <tr>
                    <td >Specialization </td>
                    <td>
                        <asp:DropDownList ID="ddlSpecialities" runat="server" Width="180px" AutoPostBack="True" OnSelectedIndexChanged="ddlSpecialities_SelectedIndexChanged" >
                        </asp:DropDownList><br />
                     <asp:RequiredFieldValidator ID="rfvSpecial" runat="server" ControlToValidate="ddlSpecialities" ErrorMessage="Specialities  is required." ForeColor="Red" Height="20px" /><br />

                        <asp:DropDownList ID="ddlSpecialitiesTypes" runat="server" Width="180px">
                        </asp:DropDownList><br />

                      <asp:RequiredFieldValidator ID="rfvTyps" runat="server" ControlToValidate="ddlSpecialitiesTypes" ErrorMessage="Specialities Types is required." ForeColor="Red" Height="20px" /><br />

                    </td>
                </tr>
                <tr>
                    <td >Experience Years </td>
                    <td>
                        <asp:TextBox ID="txtExperienceYear" runat="server" TextMode="Number" CssClass="no-spinner" MaxLength="3"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="rfvExperience" runat="server" ControlToValidate="txtExperienceYear" ErrorMessage="Experience is required." ForeColor="Red" Height="20px"/><br />

                    </td>
                </tr>
                <tr>
                    <td>Contact No </td>
                    <td>
                        <asp:TextBox ID="txtContactNo" runat="server" TextMode="Number" CssClass="no-spinner" MaxLength="10"></asp:TextBox><br />
                       <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server" ControlToValidate="txtContactNo"  ErrorMessage="Phone Number is required." ForeColor="Red" Display="Dynamic" /><br />
                     <asp:RegularExpressionValidator ID="revPhoneNumber" runat="server" ControlToValidate="txtContactNo" ErrorMessage="Invalid Phone Number (must be 10 digits)" ValidationExpression="^\d{10}$"  ForeColor="Red" Display="Dynamic" />

                    </td>
                </tr>
                <tr>
                    <td >Email </td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="textFields"></asp:TextBox><br />
                          <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required." ForeColor="Red" Height="20px" /><br />
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email format." CssClass="error" ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" ForeColor="Red" Height="20px" />
                    </td>
                </tr>
                <tr>
                    <td >Password </td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="textFields"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required." ForeColor="Red" Display="Dynamic" /><br />
                       <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="txtPassword"  ErrorMessage="Password must be at least 8 characters long, with one uppercase, one lowercase, one number, and one special character." ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"  ForeColor="Red" Display="Dynamic" />


                    </td>
                </tr>


                <tr>
                   <td >confirm-Password </td>
                    <td>
                         <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password" CssClass="textFields"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="txtConfirm"  ErrorMessage="Confirm Password is required." ForeColor="Red" Display="Dynamic" /><br />
                        <asp:CompareValidator ID="cvPassword" runat="server" ControlToValidate="txtConfirm" ControlToCompare="txtPassword"  ErrorMessage="Passwords do not match." ForeColor="Red" Display="Dynamic" />



                    </td>
               </tr>

                <tr>
                    <td >License Number </td>
                    <td>
                       <asp:TextBox ID="txtLicenseNo" runat="server" TextMode="Number" CssClass="no-spinner" MaxLength="12"></asp:TextBox><br />
                      <asp:RequiredFieldValidator ID="rfvLicense" runat="server" ControlToValidate="txtLicenseNo"  ErrorMessage="License Number is required." ForeColor="Red" Display="Dynamic" /><br />
                      <asp:RegularExpressionValidator ID="revLicense" runat="server" ControlToValidate="txtLicenseNo"  ErrorMessage="License Number must be exactly 12 digits." ValidationExpression="^\d{12}$" ForeColor="Red" Display="Dynamic" />

                    </td>
                </tr>
                <tr>
                    <td >Consultation Fee</td>
                    <td>
                        <asp:TextBox ID="txtFee" runat="server" TextMode="Number" CssClass="no-spinner"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="rfvConsul" runat="server" ControlToValidate="txtFee" ErrorMessage="Fee is required." ForeColor="Red" Height="20px" />
                       


                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        <asp:Button ID="btnSubmit" runat="server" Text="SUBMIT" CssClass="btnsubmit" OnClick="btnSubmit_Click"/>
                        <asp:Button ID="btnReset" runat="server" Text="RESET" OnClick="btnReset_Click" CssClass="btnreset"/>
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
