<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeedbackReview.aspx.cs" Inherits="hospital_management.Patient.FeedbackReview" %>

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
<body style="width: 450px; height: 252px;">
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td colspan="2" style="text-align: center; font-family: large;"><strong>Appointments</strong></td>
                </tr>
                <tr>
                    <td>Patient Name</td>
                    <td >
                        <asp:TextBox ID="txtPatientname" runat="server" CssClass="textFields" ></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtPatientname"  ErrorMessage="Name is required" ForeColor="Red" Display="Dynamic" /><br />
                        <asp:RegularExpressionValidator ID="revName" runat="server" ControlToValidate="txtPatientname"  ErrorMessage="Only letters allowed" ForeColor="Red" Display="Dynamic"  ValidationExpression="^[a-zA-Z\s]+$" />
                 


                    </td>
                </tr>

                <tr>
                    <td>Visit Date</td>
                    <td >
                        <asp:TextBox ID="txtVisitdate" runat="server" TextMode="Date" CssClass="textFields"></asp:TextBox><br/>
                        <asp:RequiredFieldValidator ID="rfvVisitdate" runat="server" ControlToValidate="txtVisitdate" ErrorMessage="Visit Date is required" ForeColor="Red" Display="Dynamic"/>
                        

                    </td>
                </tr>

                <tr>
                    <td id="textFeedback">Feedback</td>
                    <td>
                        <asp:TextBox ID="txtFeedback" runat="server" TextMode="MultiLine" CssClass="textFields"></asp:TextBox>
						<regularexpressionvalidator id="revFeedback" runat="server" controltovalidate="txtFeedback" errormessage="feedback is required" forecolor="Red" display="Dynamic" validationexpression="^[a-zA-Z\s]+$" /> 

                    </td>
                </tr>


                <tr>
                    <td  id="txtRating">Rating</td>
                    <td >slider for rating</td>
                   <regularexpressionvalidator id="revRating" runat="server" controltovalidate="txtRating" errormessage="Rating is required" forecolor="Red" display="Dynamic"  /> 

                </tr>


                <tr>
                    <td colspan="2" style="text-align: center" >

                        <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="SUBMIT" CssClass="btnsubmit"/>
                        <asp:Button ID="btnReset" runat="server" OnClick="btnReset_Click" Text="RESET" CssClass="btnreset"/>

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
