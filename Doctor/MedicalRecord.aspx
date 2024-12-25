<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MedicalRecord.aspx.cs" Inherits="hospital_management.Doctor.MedicalRecord" %>

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
            width: 250px;
        }

        .textFields {
            width: 250px;
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
<body style="width: 474px">
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td colspan="2" style="text-align: center;font-family:large"><strong>Medical Records</strong></td>
                </tr>
                <tr>
                    <td >Patient Name </td>
                    <td>
                        <asp:TextBox ID="txtPatientName" runat="server" CssClass="textFields"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >Blood Group </td>
                    <td>
                        <asp:RadioButtonList ID="rblBlood" runat="server" RepeatColumns="4">
                            <asp:ListItem>A+</asp:ListItem>
                            <asp:ListItem>A-</asp:ListItem>
                            <asp:ListItem>B+</asp:ListItem>
                            <asp:ListItem>B-</asp:ListItem>
                            <asp:ListItem>AB+</asp:ListItem>
                            <asp:ListItem>AB-</asp:ListItem>
                            <asp:ListItem>O+</asp:ListItem>
                            <asp:ListItem>O-</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>Doctor Name </td>
                    <td>
                        <asp:TextBox ID="txtDoctorName" runat="server" CssClass="textFields"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >Visit Date </td>
                    <td>
                        <asp:TextBox ID="txtVisitDate" runat="server" CssClass="textFields" TextMode="Date"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Diagnosis </td>
                    <td >
                        <asp:TextBox ID="txtDiagnosis" runat="server" CssClass="textFields" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >Prescribed Medications </td>
                    <td>
                        <asp:TextBox ID="txtPrescribedMedications" runat="server" CssClass="textFields" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >Treatment Notes </td>
                    <td>
                        <asp:TextBox ID="txtTreatmentNote" runat="server" CssClass="textFields" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >Treatment Status :</td>
                    <td>
                        <asp:DropDownList ID="ddlTreatmentStatus" runat="server" Width="255px" style ="text-align:center">
                            <asp:ListItem>Not Started</asp:ListItem>
                            <asp:ListItem>In Progress</asp:ListItem>
                            <asp:ListItem>Paused</asp:ListItem>
                            <asp:ListItem>Completed</asp:ListItem>
                            <asp:ListItem>Discontinued</asp:ListItem>
                            <asp:ListItem>Awaiting Test Result</asp:ListItem>
                            <asp:ListItem>Under Review</asp:ListItem>
                            <asp:ListItem>Referred</asp:ListItem>
                            <asp:ListItem>Follow-up Required</asp:ListItem>
                            <asp:ListItem>Emergency</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        <asp:Button ID="btnSubmit" runat="server" Text="SUBMIT" CssClass="btnsubmit" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnreset" runat="server" Text="RESET" OnClick="btnreset_Click" CssClass="btnreset" />
                    </td>
                </tr>
                <tr>
                    <td  colspan="2">
                        <asp:Label ID="lblDetails" runat="server" Text="Details"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
