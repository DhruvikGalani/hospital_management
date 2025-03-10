<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="laboratorytest_details.aspx.cs" Inherits="hospital_management.Nurse_dashboard.laboratorytest_details" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8" />
    <title>Laboratory Test Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>

    .container {
        margin-top: 50px;
    }
</style>
</head>
<body>
    <form runat="server">
        <div class="container mt-5">
            <h2 class="text-center text-primary">🧪 Laboratory Test Management</h2>
            <hr />

            <!-- Add Test Section -->
            <div class="card shadow-lg p-4">

                <div class="row">
                    <div class="col-md-6">
                        <label>Patient Name:</label>
                        <asp:DropDownList ID="ddlPatientID" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-md-6">
                        <label>Test Type:</label>
                        <asp:DropDownList ID="ddlTestType" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col-md-6">
                        <label>Test Date:</label>
                        <asp:TextBox ID="txtTestDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label>Result Date:</label>
                        <asp:TextBox ID="txtResultDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col-md-6">
                        <label>Technician Name:</label>
                        <asp:TextBox ID="txtTechnicianName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label>Results:</label>
                        <asp:TextBox ID="txtResults" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                    </div>
                </div>

                <div class="text-center mt-4">
                    <asp:Button ID="btnAddTest" runat="server" CssClass="btn btn-primary" Text="Add Test" OnClick="btnAddTest_Click" />
                </div>

                <div class="text-center mt-3">
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                </div>
            </div>

            <!-- Laboratory Test Records -->
            <div class="mt-5">
                <h3 class="text-center text-success">📝 Laboratory Test Records</h3>
               <asp:GridView ID="gvLabTests" runat="server" CssClass="table table-bordered table-striped text-center"
    AutoGenerateColumns="False" DataKeyNames="testID" AllowPaging="True" PageSize="5"
    OnRowEditing="gvLabTests_RowEditing"
    OnRowUpdating="gvLabTests_RowUpdating"
    OnRowCancelingEdit="gvLabTests_RowCancelingEdit"
    OnRowDeleting="gvLabTests_RowDeleting">
    <Columns>

        <asp:TemplateField HeaderText="Patient Name">
            <ItemTemplate>
                <asp:Label ID="lblPatientName" runat="server" Text='<%# Eval("patientName") %>'>

                </asp:Label>
            </ItemTemplate>
        </asp:TemplateField>


        <asp:TemplateField HeaderText="Test Type">
    <ItemTemplate>
        <asp:Label ID="lblTestType" runat="server" Text='<%# Eval("testType") %>'></asp:Label>
    </ItemTemplate>
    <EditItemTemplate>
        <asp:DropDownList ID="ddlTestType" runat="server" CssClass="form-control">
            <asp:ListItem Text="Blood test" Value="Blood test"></asp:ListItem>
            <asp:ListItem Text="Urine Test" Value="Urine Test"></asp:ListItem>
            <asp:ListItem Text="X-ray" Value="X-ray"></asp:ListItem>
            <asp:ListItem Text="MRI" Value="MRI"></asp:ListItem>
            <asp:ListItem Text="CT scan" Value="CT scan"></asp:ListItem>
            <asp:ListItem Text="UltraSound" Value="UltraSound"></asp:ListItem>
            <asp:ListItem Text="ECG" Value="ECG"></asp:ListItem>
            <asp:ListItem Text="Echocardiogram" Value="Echocardiogram"></asp:ListItem>
            <asp:ListItem Text="Liver Function Test" Value="Liver Function Test"></asp:ListItem>
            <asp:ListItem Text="Kidney Function Test" Value="Kidney Function Test"></asp:ListItem>
            <asp:ListItem Text="Thyroid Function Test" Value="Thyroid Function Test"></asp:ListItem>
            <asp:ListItem Text="Blood Sugar Test" Value="Blood Sugar Test"></asp:ListItem>
            <asp:ListItem Text="Cholesterol Test" Value="Cholesterol Test"></asp:ListItem>
            <asp:ListItem Text="Allergy Test" Value="Allergy Test"></asp:ListItem>
            <asp:ListItem Text="COVID19 Test" Value="COVID19 Test"></asp:ListItem>
            <asp:ListItem Text="Stool Test" Value="Stool Test"></asp:ListItem>
            <asp:ListItem Text="Biopsy" Value="Biopsy"></asp:ListItem>
            <asp:ListItem Text="Vitamin Level Test" Value="Vitamin Level Test"></asp:ListItem>
            <asp:ListItem Text="Hormonal Test" Value="Hormonal Test"></asp:ListItem>


        </asp:DropDownList>
    </EditItemTemplate>
</asp:TemplateField>

        <asp:TemplateField HeaderText="Test Date">
<ItemTemplate>
    <asp:Label ID="lbltestDate" runat="server" Text='<%# Eval("testDate", "{0:yyyy-MM-dd}") %>'></asp:Label>
</ItemTemplate>
<EditItemTemplate>
    <asp:TextBox ID="txtEdittestDate" runat="server" CssClass="form-control" Text='<%# Bind("testDate", "{0:yyyy-MM-dd}") %>' TextMode="Date"></asp:TextBox>
</EditItemTemplate>
        </asp:TemplateField>

 <asp:TemplateField HeaderText="Result Date">
<ItemTemplate>
    <asp:Label ID="lblresulttDate" runat="server" Text='<%# Eval("resultDate", "{0:yyyy-MM-dd}") %>'></asp:Label>
</ItemTemplate>
<EditItemTemplate>
    <asp:TextBox ID="txtEditresultDate" runat="server" CssClass="form-control" Text='<%# Bind("resultDate", "{0:yyyy-MM-dd}") %>' TextMode="Date"></asp:TextBox>
</EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Technician">
            <ItemTemplate>
                <asp:Label ID="lblTechnicianName" runat="server" Text='<%# Eval("TechnicianName") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtTechnicianName" runat="server" CssClass="form-control" Text='<%# Bind("TechnicianName") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Results">
     <ItemTemplate>
         <asp:Label ID="lblResults" runat="server" Text='<%# Eval("results") %>'></asp:Label>
     </ItemTemplate>
     <EditItemTemplate>
         <asp:TextBox ID="txtResults" runat="server" CssClass="form-control" Text='<%# Bind("results") %>'></asp:TextBox>
     </EditItemTemplate>
 </asp:TemplateField>

        <asp:CommandField ShowEditButton="True"  />
        <asp:CommandField ShowDeleteButton="True"  />

    </Columns>
</asp:GridView>

            </div>
        </div>
    </form>
</body>
</html>
