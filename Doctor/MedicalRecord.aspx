<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MedicalRecord.aspx.cs" Inherits="hospital_management.Doctor.MedicalRecord" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Prescription</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../CSS/aspx.css" rel="stylesheet" />


</head>
<body>
    <div class="container mt-5">
        <div class="card shadow">
            <div class="card-header bg-primary text-white">
                <h4 class="text-center">🩺 Doctor Prescription Management</h4>
            </div>
            <div class="card-body">
                <form id="form1" runat="server">
                    <asp:Label ID="lblMessage" runat="server" CssClass="text-center"></asp:Label>

                    <div class="row">
                        <div class="col-md-4">
                            <label>👤 Patient Name</label>
                            <asp:DropDownList ID="ddlPatient" CssClass="form-select" runat="server"></asp:DropDownList>
                        </div>

                        <div class="col-md-4">
                            <label>🩺 Doctor Name</label>
                            <asp:DropDownList ID="ddlDoctor" CssClass="form-select" runat="server" AutoPostBack="True"></asp:DropDownList>
                        </div>

                        <div class="col-md-4">
                            <label>📅 Visit Date</label>
                            <asp:TextBox ID="txtVisitDate" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row mt-3">
                        <div class="col-md-6">
                            <label>🔍 Diagnosis</label>
                            <asp:TextBox ID="txtDiagnosis" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="col-md-6">
                            <label>💊 Medications</label>
                            <asp:TextBox ID="txtMedications" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row mt-3">
                        <div class="col-md-6">
                            <label>📝 Treatment Notes</label>
                            <asp:TextBox ID="txtNotes" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                        </div>

                        <div class="col-md-6">
                            <label>✔ Treatment Status</label>
                            <asp:DropDownList ID="ddlStatus" CssClass="form-select" runat="server">
                                <asp:ListItem>--Select Status--</asp:ListItem>
                                <asp:ListItem>Pending</asp:ListItem>
                                <asp:ListItem>Ongoing</asp:ListItem>
                                <asp:ListItem>Completed</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="mt-4 text-center">
                        <asp:Button ID="btnAddMedicalRecord" CssClass="btn btn-primary" runat="server" Text="➕ Add Prescription" OnClick="btnAddMedicalRecord_Click" />
                    </div>

                    <br />
                    <h3 class="mt-5 text-center text-success">Medical Record</h3>
                    <br />
                    <!-- GridView -->
                    <div class="mt-5">
                        <asp:GridView ID="gvMedicalRecords" runat="server" AutoGenerateColumns="False"
                            DataKeyNames="recordID,patientID,doctorID"
                            CssClass="table table-bordered"
                            OnRowEditing="gvMedicalRecords_RowEditing"
                            OnRowCancelingEdit="gvMedicalRecords_RowCancelingEdit"
                            OnRowUpdating="gvMedicalRecords_RowUpdating"
                            OnRowDeleting="gvMedicalRecords_RowDeleting"
                            OnRowDataBound="gvMedicalRecords_RowDataBound"
                            OnSelectedIndexChanged="gvMedicalRecords_SelectedIndexChanged">

                            <Columns>
                                <asp:BoundField DataField="recordID" HeaderText="Record ID" ReadOnly="True" />
                                <asp:TemplateField HeaderText="Patient Name">
                                    <ItemTemplate>
                                        <%# Eval("patientName") %>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddlPatientEdit" runat="server" CssClass="form-select"></asp:DropDownList>
                                        <asp:HiddenField ID="hdnPatientID" runat="server" Value='<%# Bind("patientID") %>' />
                                    </EditItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Doctor Name">
                                    <ItemTemplate>
                                        <%# Eval("doctorName") %>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddlDoctorEdit" runat="server" CssClass="form-select"></asp:DropDownList>
                                        <asp:HiddenField ID="hdnDoctorID" runat="server" Value='<%# Eval("doctorID") %>' />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Visit Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblVisitDate" runat="server" Text='<%# Eval("visitDate") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtVisitDateEdit" CssClass="form-control" runat="server" Text='<%# Bind("visitDate") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Diagnosis">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDiagnosis" runat="server" Text='<%# Eval("diagnosis") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtDiagnosisEdit" CssClass="form-control" runat="server" Text='<%# Bind("diagnosis") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Prescribed Medications">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMedications" runat="server" Text='<%# Eval("prescribedMedications") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtMedicationsEdit" CssClass="form-control" runat="server" Text='<%# Bind("prescribedMedications") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Treatment Notes">
                                    <ItemTemplate>
                                        <asp:Label ID="lblNotes" runat="server" Text='<%# Eval("treatmentNotes") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtNotesEdit" CssClass="form-control" runat="server" Text='<%# Bind("treatmentNotes") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("treatmentStatus") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddlStatusEdit" runat="server" CssClass="form-control">
                                            <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                            <asp:ListItem Text="Ongoing" Value="Ongoing"></asp:ListItem>
                                            <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                            </Columns>
                        </asp:GridView>

                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>--%>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MedicalRecord.aspx.cs" Inherits="hospital_management.Doctor.MedicalRecord" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Prescription</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .container {
            margin-top: 50px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="text-center text-primary">🩺 Doctor Prescription Management</h2>
            <div class="card p-4 shadow">
                <asp:Label ID="lblMessage" runat="server" CssClass="text-center text-danger"></asp:Label>
                <div class="row">
                    <div class="col-md-6">
                        <label>👤 Patient Name</label>
                        <asp:DropDownList ID="ddlPatient" CssClass="form-control mb-3" runat="server"></asp:DropDownList>
                    </div>
                    <div class="col-md-6">
                        <label>🩺 Doctor Name</label>
                        <asp:DropDownList ID="ddlDoctor" CssClass="form-control mb-3" runat="server"></asp:DropDownList>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <label>📅 Visit Date</label>
                        <asp:TextBox ID="txtVisitDate" CssClass="form-control mb-3" runat="server" TextMode="Date"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label>🔍 Diagnosis</label>
                        <asp:TextBox ID="txtDiagnosis" CssClass="form-control mb-3" runat="server" Placeholder="Enter diagnosis"></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <label>💊 Medications</label>
                        <asp:TextBox ID="txtMedications" CssClass="form-control mb-3" runat="server" Placeholder="Enter medications"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label>📝 Treatment Notes</label>
                        <asp:TextBox ID="txtNotes" CssClass="form-control mb-3" runat="server" Placeholder="Enter treatment notes" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <label>✔ Treatment Status</label>
                        <asp:DropDownList ID="ddlStatus" CssClass="form-control mb-3" runat="server">
                            <asp:ListItem>Pending</asp:ListItem>
                            <asp:ListItem>Ongoing</asp:ListItem>
                            <asp:ListItem>Completed</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="text-center">
                    <asp:Button ID="btnAddMedicalRecord" CssClass="btn btn-primary" runat="server" Text="Add Prescription" OnClick="btnAddMedicalRecord_Click" />
                </div>
            </div>

            <h3 class="mt-5 text-center text-success">Medical Records</h3>
            <asp:GridView ID="gvMedicalRecords" runat="server" AutoGenerateColumns="False"
                DataKeyNames="recordID,patientID,doctorID"
                CssClass="table table-bordered table-striped mt-3"
                OnRowEditing="gvMedicalRecords_RowEditing"
                OnRowCancelingEdit="gvMedicalRecords_RowCancelingEdit"
                OnRowUpdating="gvMedicalRecords_RowUpdating"
                OnRowDeleting="gvMedicalRecords_RowDeleting"
                OnRowDataBound="gvMedicalRecords_RowDataBound">

                <Columns>
                    <asp:BoundField DataField="recordID" HeaderText="Record ID" ReadOnly="True" />

                    <asp:TemplateField HeaderText="Patient Name">
                        <ItemTemplate>
                            <%# Eval("patientName") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlPatientEdit" runat="server" CssClass="form-control"></asp:DropDownList>
                            <asp:HiddenField ID="hdnPatientID" runat="server" Value='<%# Bind("patientID") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Doctor Name">
                        <ItemTemplate>
                            <%# Eval("doctorName") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlDoctorEdit" runat="server" CssClass="form-control"></asp:DropDownList>
                            <asp:HiddenField ID="hdnDoctorID" runat="server" Value='<%# Eval("doctorID") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Visit Date">
                        <ItemTemplate>
                            <%# Eval("visitDate", "{0:dd-MM-yyyy}") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtVisitDateEdit" CssClass="form-control" runat="server" Text='<%# Bind("visitDate") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Diagnosis">
                        <ItemTemplate>
                            <%# Eval("diagnosis") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDiagnosisEdit" runat="server" Text='<%# Bind("diagnosis") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Prescribed Medications">
                        <ItemTemplate>
                            <%# Eval("prescribedMedications") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtMedicationsEdit" runat="server" Text='<%# Bind("prescribedMedications") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Treatment Notes">
                        <ItemTemplate>
                            <%# Eval("treatmentNotes") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtNotesEdit" runat="server" Text='<%# Bind("treatmentNotes") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <%# Eval("treatmentStatus") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlStatusEdit" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                <asp:ListItem Text="Ongoing" Value="Ongoing"></asp:ListItem>
                                <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
