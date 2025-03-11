<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manage_patients.aspx.cs" Inherits="hospital_management.Admin_Dashboard.manage_patients" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Management | Hospital Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .container {
            margin-top: 50px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">

            <h2 class="text-center text-primary">🩺 Patient Management</h2>
            <div class="card p-4 shadow">
                <div class="row">
                    <div class="col-md-6">
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control mb-3" Placeholder="Name"></asp:TextBox>
                        <asp:TextBox ID="txtAge" runat="server" CssClass="form-control mb-3" Placeholder="Age" TextMode="Number"></asp:TextBox>
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control mb-3">
                            <asp:ListItem Text="Select Gender" Value="" />
                            <asp:ListItem Text="Male" Value="Male" />
                            <asp:ListItem Text="Female" Value="Female" />
                            <asp:ListItem Text="Other" Value="Other" />
                        </asp:DropDownList>
                        <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control mb-3" Placeholder="Date of Birth" TextMode="Date"></asp:TextBox>
                        <asp:DropDownList ID="ddlBloodGroup" runat="server" CssClass="form-control mb-3">
                            <asp:ListItem Text="Select Blood Group" Value="" />
                            <asp:ListItem Text="A+" Value="A+" />
                            <asp:ListItem Text="A-" Value="A-" />
                            <asp:ListItem Text="B+" Value="B+" />
                            <asp:ListItem Text="B-" Value="B-" />
                            <asp:ListItem Text="O+" Value="O+" />
                            <asp:ListItem Text="O-" Value="O-" />
                            <asp:ListItem Text="AB+" Value="AB+" />
                            <asp:ListItem Text="AB-" Value="AB-" />
                        </asp:DropDownList>
                        <asp:TextBox TextMode="Number" ID="txtContact" runat="server" CssClass="form-control mb-3" Placeholder="Contact"></asp:TextBox>
                        <asp:TextBox TextMode="Number" ID="txtEmergencyContact" runat="server" CssClass="form-control mb-3" Placeholder="Emergency Contact"></asp:TextBox>

                    </div>
                    <div class="col-md-6">
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control mb-3" Placeholder="Address"></asp:TextBox>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control mb-3" Placeholder="Email"></asp:TextBox>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control mb-3" Placeholder="Password" TextMode="Password"></asp:TextBox>
                        <asp:TextBox ID="txtAllergies" runat="server" CssClass="form-control mb-3" Placeholder="Allergies"></asp:TextBox>
                        <asp:TextBox ID="txtRunningMedicines" runat="server" CssClass="form-control mb-3" Placeholder="Running Medicines"></asp:TextBox>
                        <asp:DropDownList ID="ddlInsurance" runat="server" CssClass="form-control mb-3">
                            <asp:ListItem Text="Select Insurance" Value="" />
                            <asp:ListItem Text="Yes" Value="Yes" />
                            <asp:ListItem Text="No" Value="No" />
                        </asp:DropDownList>
                  
                    <asp:FileUpload ID="FileUploadProfile" runat="server" CssClass="form-control mb-3" />
                    </div>
                </div>

                <div class="text-center">
                    <asp:Button ID="btnAddPatient" runat="server" CssClass="btn btn-primary" Text="Add Patient" OnClick="btnAddPatient_Click" />
                </div>
            </div>

            <h3 class="mt-5 text-center text-success">Patient Details</h3>
            <asp:GridView ID="gvPatients" runat="server" CssClass="table table-bordered table-striped mt-3" AutoGenerateColumns="False" DataKeyNames="patientID"
                OnRowEditing="gvPatients_RowEditing"
                OnRowUpdating="gvPatients_RowUpdating"
                OnRowDeleting="gvPatients_RowDeleting"
                OnRowCancelingEdit="gvPatients_RowCancelingEdit">

                <Columns>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <%# Eval("name") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtNameEdit" runat="server" Text='<%# Bind("name") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Age">
                        <ItemTemplate>
                            <%# Eval("age") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtAgeEdit" runat="server" Text='<%# Bind("age") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Gender">
                        <ItemTemplate>
                            <%# Eval("gender") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlGenderEdit" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Male" Value="Male" />
                                <asp:ListItem Text="Female" Value="Female" />
                                <asp:ListItem Text="Other" Value="Other" />
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Date of Birth">
                        <ItemTemplate>
                            <%# Convert.ToDateTime(Eval("dateOfBirth")).ToString("dd-MM-yyyy") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDOBEdit" runat="server" Text='<%# Bind("dateOfBirth", "{0:yyyy-MM-dd}") %>' CssClass="form-control" TextMode="Date"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Contact Number">
                        <ItemTemplate>
                            <%# Eval("contactNumber") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtContactEdit" runat="server" Text='<%# Bind("contactNumber") %>' CssClass="form-control"  TextMode="Number"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Blood Group">
                        <ItemTemplate>
                            <%# Eval("bloodGroup") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlBloodGroupEdit" runat="server" CssClass="form-control">
                                <asp:ListItem Text="A+" Value="A+" />
                                <asp:ListItem Text="A-" Value="A-" />
                                <asp:ListItem Text="B+" Value="B+" />
                                <asp:ListItem Text="B-" Value="B-" />
                                <asp:ListItem Text="O+" Value="O+" />
                                <asp:ListItem Text="O-" Value="O-" />
                                <asp:ListItem Text="AB+" Value="AB+" />
                                <asp:ListItem Text="AB-" Value="AB-" />
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Address">
                        <ItemTemplate>
                            <%# Eval("address") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtAddressEdit" runat="server" Text='<%# Bind("address") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Emergency Contact">
                        <ItemTemplate>
                            <%# Eval("emergencyContact") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEmergencyContactEdit" runat="server" Text='<%# Bind("emergencyContact") %>' CssClass="form-control" TextMode="Number"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Allergies">
                        <ItemTemplate>
                            <%# Eval("allergies") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtAllergiesEdit" runat="server" Text='<%# Bind("allergies") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Running Medicines">
                        <ItemTemplate>
                            <%# Eval("runningMedicines") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtRunningMedicinesEdit" runat="server" Text='<%# Bind("runningMedicines") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Insurance">
                        <ItemTemplate>
                            <%# Eval("insurance") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlInsuranceEdit" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Yes" Value="Yes" />
                                <asp:ListItem Text="No" Value="No" />
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
