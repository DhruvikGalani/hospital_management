<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="patient_details.aspx.cs" Inherits="hospital_management.Admin_Dashbord.patient_details" %>




<!DOCTYPE html>
<html>
<head>
    <title>Manage Patients</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h2 class="text-center text-primary">Manage Patients</h2>
            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>

            <div class="card p-4">
                <div class="row">
                    <div class="col-md-4">
                        <label>Name:</label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label>Age:</label>
                        <asp:TextBox ID="txtAge" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                    </div>

                    <div class="col-md-4">
                        <label>Gender:</label>
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                            <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="row mt-2">
                    <div class="col-md-4">
                        <label>Date of Birth:</label>
                        <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label>Contact Number:</label>
                        <asp:TextBox ID="txtContact" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label>Email:</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label>Password:</label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                    </div>
                </div>

                <div class="row mt-2">
                    <div class="col-md-6">
                        <label>Address:</label>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label>Emergency Contact:</label>
                        <asp:TextBox ID="txtEmergencyContact" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="row mt-2">
                    <div class="col-md-4">
                        <label>Blood Group:</label>
                        <asp:TextBox ID="txtBloodGroup" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label>Allergies:</label>
                        <asp:TextBox ID="txtAllergies" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label>Running Medicines:</label>
                        <asp:TextBox ID="txtRunningMedicines" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="row mt-2">
                    <div class="col-md-4">
                        <label>Insurance:</label>
 <asp:DropDownList ID="ddlInsurance" runat="server" CssClass="form-control">
     <asp:ListItem Text="yes" Value="yes"></asp:ListItem>
     <asp:ListItem Text="no" Value="no"></asp:ListItem>
 </asp:DropDownList>                    </div>
                    <div class="col-md-4">
                        <label>Profile Picture:</label>
                        <asp:FileUpload ID="fuProfile" runat="server" CssClass="form-control" />
                    </div>
                </div>

                <div class="mt-3 text-center">
                    <asp:Button ID="btnAdd" runat="server" Text="Add Patient" CssClass="btn btn-primary" OnClick="btnAddPatient_Click" />
                </div>
            </div>

            <div class="mt-4">
                <h3 class="text-center text-success">📋 Patient List</h3>
                <asp:GridView ID="gvPatients" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" DataKeyNames="patientID" OnRowEditing="gvPatients_RowEditing" OnRowCancelingEdit="gvPatients_RowCancelingEdit" OnRowUpdating="gvPatients_RowUpdating" OnRowDeleting="gvPatients_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="patientID" HeaderText="Patient ID" ReadOnly="True" />

                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Text='<%# Bind("name") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Age">
                            <ItemTemplate>
                                <asp:Label ID="lblAge" runat="server" Text='<%# Eval("age") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtAge" runat="server" CssClass="form-control" Text='<%# Bind("age") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Gender">
                            <ItemTemplate>
                                <asp:Label ID="lblGender" runat="server" Text='<%# Eval("gender") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control" SelectedValue='<%# Bind("gender") %>'>
                                    <asp:ListItem Text="Select Gender" Value="" />
                                    <asp:ListItem Text="Male" Value="Male" />
                                    <asp:ListItem Text="Female" Value="Female" />
                                    <asp:ListItem Text="Other" Value="Other" />
                                </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Date of Birth">
                            <ItemTemplate>
                                <asp:Label ID="lblDate" runat="server" Text='<%# Eval("dateOfBirth", "{0:yyyy-MM-dd}") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDOB" runat="server" Text='<%# Bind("dateOfBirth", "{0:yyyy-MM-dd}") %>' TextMode="Date" class="form-control" />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Contact Number">
                            <ItemTemplate>
                                <asp:Label ID="lblContact" runat="server" Text='<%# Eval("contactNumber") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtContact" runat="server" CssClass="form-control" Text='<%# Eval("contactNumber") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Text='<%# Bind("email") %>' TextMode="Email"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                             <asp:TemplateField HeaderText="Password">
         <ItemTemplate>
    <asp:Label ID="lblContact" runat="server" Text='<%# Eval("password") %>'></asp:Label>
</ItemTemplate>
         <EditItemTemplate>
             <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" Text='<%# Bind("password") %>' TextMode="Password"></asp:TextBox>
         </EditItemTemplate>
     </asp:TemplateField>

                        <asp:TemplateField HeaderText="Address">
                            <ItemTemplate>
                                <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("address") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" Text='<%# Bind("address") %>' TextMode="MultiLine"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                             <asp:TemplateField HeaderText="Emergency Contact">
                  <ItemTemplate>
    <asp:Label ID="lblContact" runat="server" Text='<%# Eval("emergencyContact") %>'></asp:Label>
</ItemTemplate>
         <EditItemTemplate>
             <asp:TextBox ID="txtEmergencyContact" runat="server" CssClass="form-control" Text='<%# Bind("emergencyContact") %>'></asp:TextBox>
         </EditItemTemplate>
     </asp:TemplateField>

     <asp:TemplateField HeaderText="Blood Group">
                  <ItemTemplate>
    <asp:Label ID="lblBloodGropu" runat="server" Text='<%# Eval("bloodGroup") %>'></asp:Label>
</ItemTemplate>
         <EditItemTemplate>
             <asp:TextBox ID="txtBloodGroup" runat="server" CssClass="form-control" Text='<%# Bind("bloodGroup") %>'></asp:TextBox>
         </EditItemTemplate>
     </asp:TemplateField>

     <asp:TemplateField HeaderText="Allergies">
                  <ItemTemplate>
    <asp:Label ID="lblAllergies" runat="server" Text='<%# Eval("allergies") %>'></asp:Label>
</ItemTemplate>
         <EditItemTemplate>
             <asp:TextBox ID="txtAllergies" runat="server" CssClass="form-control" Text='<%# Bind("allergies") %>'></asp:TextBox>
         </EditItemTemplate>
     </asp:TemplateField>

     <asp:TemplateField HeaderText="Running Medicines">
                  <ItemTemplate>
    <asp:Label ID="lblMedicines" runat="server" Text='<%# Eval("runningMedicines") %>'></asp:Label>
</ItemTemplate>
         <EditItemTemplate>
             <asp:TextBox ID="txtMedicines" runat="server" CssClass="form-control" Text='<%# Bind("runningMedicines") %>'></asp:TextBox>
         </EditItemTemplate>
     </asp:TemplateField>

     <asp:TemplateField HeaderText="Insurance">
                  <ItemTemplate>
    <asp:Label ID="lblInsuarance" runat="server" Text='<%# Eval("insurance") %>'></asp:Label>
</ItemTemplate>
         <EditItemTemplate>
            <asp:DropDownList ID="ddlInsurance" runat="server" CssClass="form-control" Text='<%# Bind("insurance") %>'>
    <asp:ListItem Text="Select Insurance" Value="" />
    <asp:ListItem Text="Yes" Value="Yes" />
    <asp:ListItem Text="No" Value="No" />
</asp:DropDownList>

         </EditItemTemplate>
     </asp:TemplateField>

                         <asp:TemplateField HeaderText="Profile Picture">
            <ItemTemplate>
                <asp:Image ID="imgProfile" runat="server" 
                           ImageUrl='<%# "~/Images/" + Eval("profile") %>' 
                           Width="100px" Height="100px" />
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
