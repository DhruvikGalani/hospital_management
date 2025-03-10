<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="patient_details.aspx.cs" Inherits="hospital_management.Nurse_dashboard.patient_details" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Appointments Management</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h2 class="text-center text-primary">📅 Appointments List
            </h2>
            <hr />

            <asp:GridView ID="gvAppointments" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered"
                DataKeyNames="appointmentID" OnRowEditing="gvAppointments_RowEditing"
                OnRowUpdating="gvAppointments_RowUpdating" OnRowCancelingEdit="gvAppointments_RowCancelingEdit">

                <Columns>
                    <asp:BoundField DataField="appointmentID" HeaderText="ID" ReadOnly="true" Visible="false" />
                    <asp:BoundField DataField="patientID" HeaderText="Patient ID" ReadOnly="true" />
                    <asp:BoundField DataField="patientName" HeaderText="Patient Name" ReadOnly="true" />
                    <asp:BoundField DataField="contactNumber" HeaderText="Contact Number" ReadOnly="true" />
                    <asp:BoundField DataField="email" HeaderText="Email" ReadOnly="true" />

                    <asp:TemplateField HeaderText="Doctor">
                        <ItemTemplate>
                            <asp:Label ID="lblDoctorName" runat="server" Text='<%# Eval("doctorName") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlDoctor" runat="server" CssClass="form-control">
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Date & Time">
                        <ItemTemplate>
                            <asp:Label ID="lblDateTime" runat="server" Text='<%# Eval("appointmentDateTime", "{0:yyyy-MM-dd HH:mm}") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDateTime" runat="server" CssClass="form-control" Text='<%# Bind("appointmentDateTime") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Reason">
                        <ItemTemplate>
                            <asp:Label ID="lblReason" runat="server" Text='<%# Eval("reasonForVisit") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtReason" runat="server" CssClass="form-control" Text='<%# Bind("reasonForVisit") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Clinic Location">
                        <ItemTemplate>
                            <asp:Label ID="lblLocation" runat="server" Text='<%# Eval("clinicLocation") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control" Text='<%# Bind("clinicLocation") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("status") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlStatus" runat="server">
                                <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                <asp:ListItem Text="Confirmed" Value="Confirmed"></asp:ListItem>
                                <asp:ListItem Text="Cancelled" Value="Cancelled"></asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:CommandField ShowEditButton="True" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
