<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="medical_records.aspx.cs" Inherits="hospital_management.Nurse_dashboard.medical_records" %>


<!DOCTYPE html>
<html>
<head>
    <title>Medical Records</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h2 class="text-center text-success"> 📋 Medical Records</h2>
            <asp:GridView ID="gvMedicalRecords" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped"
                DataKeyNames="recordID" OnRowEditing="gvMedicalRecords_RowEditing"
                OnRowUpdating="gvMedicalRecords_RowUpdating" OnRowCancelingEdit="gvMedicalRecords_RowCancelingEdit">
                <Columns>
                    <asp:BoundField DataField="recordID" HeaderText="Record ID" ReadOnly="true" />
                    <asp:BoundField DataField="PatientName" HeaderText="Patient Name" />
                    <asp:BoundField DataField="DoctorName" HeaderText="Doctor Name" />
                    <asp:TemplateField HeaderText="Visit Date">
                        <ItemTemplate>
                            <asp:Label ID="lblVisitDate" runat="server" Text='<%# Eval("visitDate", "{0:yyyy-MM-dd}") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtVisitDate" runat="server" CssClass="form-control" Text='<%# Bind("visitDate", "{0:yyyy-MM-dd}") %>' TextMode="Date"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="diagnosis" HeaderText="Diagnosis" />
                    <asp:BoundField DataField="prescribedMedications" HeaderText="Medications" />
                    <asp:BoundField DataField="treatmentNotes" HeaderText="Notes" />
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("treatmentStatus") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlStatus" runat="server">
                                <asp:ListItem Text="Ongoing" Value="Ongoing"></asp:ListItem>
                                <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                                <asp:ListItem Text="Cancelled" Value="Cancelled"></asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="true" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>