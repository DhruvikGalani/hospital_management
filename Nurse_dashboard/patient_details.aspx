<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="patient_details.aspx.cs" Inherits="hospital_management.Nurse_dashboard.patient_details" %>


<!DOCTYPE html>
<html>
<head>
    <title>Patient Records</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">>
        <div class=" mt-4">
 <h2 class="text-center text-success">📝 Appointments List</h2>

          <asp:GridView ID="gvPatients" runat="server" AutoGenerateColumns="False" DataKeyNames="patientID" CssClass="table table-bordered table-striped" 
    OnRowEditing="gvPatients_RowEditing" OnRowUpdating="gvPatients_RowUpdating" OnRowCancelingEdit="gvPatients_RowCancelingEdit">

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
           <EditItemTemplate>
      <asp:TextBox ID="txtdateOfBirth" runat="server" Text='<%# Bind("dateOfBirth", "{0:yyyy-MM-ddTHH:mm}") %>' TextMode="DateTimeLocal" />
  </EditItemTemplate>
                          <ItemTemplate>
       <asp:Label ID="lblDate" runat="server" Text='<%# Eval("dateOfBirth", "{0:yyyy-MM-ddTHH:mm}") %>'></asp:Label>
   </ItemTemplate>
     </asp:TemplateField>

     <asp:TemplateField HeaderText="Contact">
         <ItemTemplate>
             <asp:Label ID="lblContact" runat="server" Text='<%# Eval("contactNumber") %>'></asp:Label>
         </ItemTemplate>
         <EditItemTemplate>
             <asp:TextBox ID="txtContact" runat="server" CssClass="form-control" Text='<%# Bind("contactNumber") %>' TextMode="Number"></asp:TextBox>
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
    <asp:Label ID="lblContact" runat="server" Text='<%# Eval("address") %>'></asp:Label>
</ItemTemplate>
         <EditItemTemplate>
             <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" Text='<%# Bind("address") %>'></asp:TextBox>
         </EditItemTemplate>
     </asp:TemplateField>

     <asp:TemplateField HeaderText="Emergency Contact">
                  <ItemTemplate>
    <asp:Label ID="lblContact" runat="server" Text='<%# Eval("emergencyContact") %>'></asp:Label>
</ItemTemplate>
         <EditItemTemplate>
             <asp:TextBox ID="txtEmergency" runat="server" CssClass="form-control" Text='<%# Bind("emergencyContact") %>'></asp:TextBox>
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
     <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
 </Columns>
</asp:GridView>
        </div>
    </form>
</body>
</html>
