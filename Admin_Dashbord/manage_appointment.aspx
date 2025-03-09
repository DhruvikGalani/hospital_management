    <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manage_appointment.aspx.cs" Inherits="hospital_management.Admin_Dashbord.manage_appointment" %>


    <!DOCTYPE html>
    <html>
    <head>
        <title>📅 Manage Appointments</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    </head>
    <body>
            <form id="form1" runat="server">

        <div class="container mt-4">
            <h2 class="text-center text-success"> 📅 Manage Appointments</h2>
                                        <asp:Label ID="lblMessage" runat="server" ></asp:Label>

            <div class="card p-4">
                <div class="row">
                    <div class="col-md-4">
                        <label>Patient:</label>
                        <asp:DropDownList ID="ddlPatient" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                        <label>Doctor:</label>
                        <asp:DropDownList ID="ddlDoctor" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                        <label>Appointment Date & Time:</label>
                        <asp:TextBox ID="txtDateTime" runat="server" CssClass="form-control" TextMode="DateTimeLocal" ></asp:TextBox>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-md-6">
                        <label>Reason for Visit:</label>
                        <asp:TextBox ID="txtReason" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label>Clinic Location:</label>
                        <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="mt-3 text-center">
                    <asp:Button ID="btnAdd" runat="server" Text="Add Appointment" CssClass="btn btn-primary" OnClick="btnAdd_Click" />
                </div>
            </div>

            <div class="mt-4">
            <h3 class="text-center text-success">📝 Appointments List</h3>

                <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" DataKeyNames="appointmentID"
                    OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="appointmentID" HeaderText="ID" ReadOnly="True" />
                        <asp:BoundField DataField="patientID" HeaderText="Patient Name" ReadOnly="True" />
                        <asp:BoundField DataField="doctorID" HeaderText="Doctor Name" ReadOnly="True" />
                       <asp:TemplateField HeaderText="Appointment Date">
        <EditItemTemplate>
            <asp:TextBox ID="txtEditDate" runat="server" Text='<%# Bind("appointmentDateTime", "{0:yyyy-MM-ddTHH:mm}") %>' TextMode="DateTimeLocal" />
        </EditItemTemplate>
                                <ItemTemplate>
             <asp:Label ID="lblDate" runat="server" Text='<%# Eval("appointmentDateTime", "{0:yyyy-MM-ddTHH:mm}") %>'></asp:Label>
         </ItemTemplate>
    </asp:TemplateField>
                        <asp:TemplateField HeaderText="Reason for Visit">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditReason" runat="server" CssClass="form-control" Text='<%# Bind("reasonForVisit") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblReason" runat="server" Text='<%# Bind("reasonForVisit") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Clinic Location">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditLocation" runat="server" CssClass="form-control" Text='<%# Bind("clinicLocation") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblLocation" runat="server" Text='<%# Bind("clinicLocation") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlEditStatus" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                    <asp:ListItem Text="Confirmed" Value="Confirmed"></asp:ListItem>
                                    <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                                    <asp:ListItem Text="Cancelled" Value="Cancelled"></asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("status") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" ButtonType="Button" EditText="Edit" UpdateText="Update" CancelText="Cancel" />
                        <asp:CommandField ShowDeleteButton="True" ButtonType="Button" DeleteText="Delete" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
                </form>
    </body>
    </html>