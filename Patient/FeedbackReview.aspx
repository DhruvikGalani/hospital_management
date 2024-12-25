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
                        <asp:TextBox ID="txtPatientname" runat="server" CssClass="textFields" ></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>Visit Date</td>
                    <td >
                        <asp:TextBox ID="txtVisitdate" runat="server" TextMode="Date" CssClass="textFields"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td  id="txtFeedback">Feedback</td>
                    <td>
                        <asp:TextBox ID="txtFeedback" runat="server" TextMode="MultiLine" CssClass="textFields"></asp:TextBox>
                    </td>
                </tr>


                <tr>
                    <td  id="txtFeedback">Rating</td>
                    <td >slider for rating</td>
                </tr>


                <tr>
                    <td colspan="2" style="text-align: center" >
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
