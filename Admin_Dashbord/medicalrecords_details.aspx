<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="medicalrecords_details.aspx.cs" Inherits="hospital_management.Admin_Dashbord.medicalrecords_details" %>




<!DOCTYPE html>
<html>
<head>
    <title>🩺 Doctor Prescription</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form2" runat="server">
        <div class="container mt-4">
            <h2 class="text-center text-primary">🩺 Doctor Prescription Management</h2>
                                            <asp:Label ID="lblMessage" runat="server" ></asp:Label>

            <div class="card p-4">
                <div class="row">
                    <div class="col-md-6">
                        <label>Patient:</label>
                        <asp:DropDownList ID="ddlPatient" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-md-6">
                        <label>Doctor:</label>
                        <asp:DropDownList ID="ddlDoctor" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-md-6">
                        <label>Visit Date:</label>
                        <asp:TextBox ID="txtVisitDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label>Diagnosis:</label>
                        <asp:TextBox ID="txtDiagnosis" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-md-6">
                        <label>Medications:</label>
                        <asp:TextBox ID="txtMedications" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label>Treatment Notes:</label>
                        <asp:TextBox ID="txtNotes" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-md-6">
                        <label>Status:</label>
                        <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                            <asp:ListItem>--Select Status--</asp:ListItem>
                            <asp:ListItem>Pending</asp:ListItem>
                            <asp:ListItem>Ongoing</asp:ListItem>
                            <asp:ListItem>Completed</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="mt-3 text-center">
                    <asp:Button ID="btnAddMedicalRecord" runat="server" Text="Add Prescription" CssClass="btn btn-primary" OnClick="btnAddMedicalRecord_Click" />
                </div>
            </div>
            
            <div class="mt-4">
                <h3 class="text-center text-success">📋 Prescription Records</h3>
                <asp:GridView ID="gvMedicalRecords" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" DataKeyNames="recordID"
                    OnRowEditing="gvMedicalRecords_RowEditing" OnRowUpdating="gvMedicalRecords_RowUpdating" OnRowCancelingEdit="gvMedicalRecords_RowCancelingEdit" OnRowDeleting="gvMedicalRecords_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="recordID" HeaderText="Record ID" ReadOnly="True" />
                        <asp:BoundField DataField="PatientName" HeaderText="Patient Name" ReadOnly="True" />
                        <asp:BoundField DataField="DoctorName" HeaderText="Doctor Name" ReadOnly="True" />
                        <asp:TemplateField HeaderText="Visit Date">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditVisitDate" runat="server" Text='<%# Bind("visitDate", "{0:yyyy-MM-dd}") %>' TextMode="Date" CssClass="form-control" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblVisitDate" runat="server" Text='<%# Eval("visitDate", "{0:yyyy-MM-dd}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Diagnosis">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditDiagnosis" runat="server" CssClass="form-control" Text='<%# Bind("diagnosis") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblDiagnosis" runat="server" Text='<%# Bind("diagnosis") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Medications">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditMedications" runat="server" CssClass="form-control" Text='<%# Bind("prescribedMedications") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblMedications" runat="server" Text='<%# Bind("prescribedMedications") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Treatment Notes">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditNotes" runat="server" CssClass="form-control" Text='<%# Bind("treatmentNotes") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblNotes" runat="server" Text='<%# Bind("treatmentNotes") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlEditStatus" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                    <asp:ListItem Text="Ongoing" Value="Ongoing"></asp:ListItem>
                                    <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("treatmentStatus") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
