<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manage_doctors.aspx.cs" Inherits="hospital_management.Admin_Dashbord.manage_doctors" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Management | Hospital Management System</title>
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

            <h2 class="text-center text-primary">👨‍⚕️Doctor Management</h2>
            <div class="card p-4 shadow">
                <div class="row">
                    <div class="col-md-6">
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control mb-3" Placeholder="Name"></asp:TextBox>
                        <asp:TextBox ID="txtAge" runat="server" CssClass="form-control mb-3" Placeholder="Age" TextMode="Number"></asp:TextBox>
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control mb-3">
                            <asp:ListItem Text="Select Gender" Value="" />
                            <asp:ListItem Text="Male" Value="Male" />
                            <asp:ListItem Text="Female" Value="Female" />
                        </asp:DropDownList>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control mb-3" Placeholder="Address"></asp:TextBox>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control mb-3" Placeholder="Email"></asp:TextBox>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control mb-3" Placeholder="Password" TextMode="Password"></asp:TextBox>

                    </div>
                    <div class="col-md-6">
                        <asp:TextBox ID="txtSpecialization" runat="server" CssClass="form-control mb-3" Placeholder="Specialization"></asp:TextBox>
                        <asp:TextBox ID="txtExperience" runat="server" CssClass="form-control mb-3" Placeholder="Experience Years" TextMode="Number"></asp:TextBox>
                        <asp:TextBox ID="txtContact" runat="server" CssClass="form-control mb-3" Placeholder="Contact"></asp:TextBox>
                        <asp:TextBox ID="txtLicense" runat="server" CssClass="form-control mb-3" Placeholder="License Number"></asp:TextBox>
                        <asp:TextBox ID="txtConsultationFee" runat="server" CssClass="form-control mb-3" Placeholder="Consultation Fee" TextMode="Number"></asp:TextBox>
                        <asp:FileUpload ID="FileUploadProfile" runat="server" CssClass="form-control mb-3" />
                    </div>
                </div>

                <div class="text-center">
                    <asp:Button ID="btnAddDoctor" runat="server" CssClass="btn btn-primary" Text="Add Doctor" OnClick="btnAddDoctor_Click" />
                </div>
            </div>

            <h3 class="mt-5 text-center text-success">Doctor Details</h3>
            <asp:GridView ID="gvDoctors" runat="server" CssClass="table table-bordered table-striped mt-3" AutoGenerateColumns="False" DataKeyNames="doctorID"
                OnRowEditing="gvDoctors_RowEditing"
                OnRowUpdating="gvDoctors_RowUpdating"
                OnRowDeleting="gvDoctors_RowDeleting"
                OnRowCancelingEdit="gvDoctors_RowCancelingEdit">

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

                    <asp:TemplateField HeaderText="Address">
                        <ItemTemplate>
                            <%# Eval("address") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtAddressEdit" runat="server" Text='<%# Bind("address") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Contact">
                        <ItemTemplate>
                            <%# Eval("contactNumber") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtContactEdit" runat="server" Text='<%# Bind("contactNumber") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Specialization">
                        <ItemTemplate>
                            <%# Eval("specialization") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtSpecializationEdit" runat="server" Text='<%# Bind("specialization") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Experience Years">
                        <ItemTemplate>
                            <%# Eval("experienceYears") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtExperienceEdit" runat="server" Text='<%# Bind("experienceYears") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="License Number">
                        <ItemTemplate>
                            <%# Eval("licenseNumber") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtLicenseEdit" runat="server" Text='<%# Bind("licenseNumber") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>     
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Consultation Fee">
                        <ItemTemplate>
                            <%# Eval("consultationFee") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtConsultationFeeEdit" runat="server" Text='<%# Bind("consultationFee") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
