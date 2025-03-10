<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="insurance_details.aspx.cs" Inherits="hospital_management.Admin_Dashbord.insurance_details" %>

<!DOCTYPE html>
<html>
<head>
    <title>Insurance Management</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
                <form id="form1" runat="server">

    <div class="container mt-4">

 <h2 class="text-center text-primary">🏥 Insurance Management</h2>
            <asp:Label ID="lblMessage" runat="server" CssClass="text-success"></asp:Label>
        <div class="card p-4">
                <div class="row">
                    <div class="col-md-4">
                        <label>Patient Name:</label>
                        <asp:DropDownList ID="ddlPatient" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                        <label>Policy Number:</label>
                        <asp:TextBox ID="txtPolicyNumber" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label>Provider:</label>
                        <asp:TextBox ID="txtProvider" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="row mt-2">
                    <div class="col-md-4">
                        <label>Coverage Details:</label>
                        <asp:TextBox ID="txtCoverageDetails" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label>Claim Status:</label>
                        <asp:DropDownList ID="ddlClaimStatus" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                            <asp:ListItem Text="Approved" Value="Approved"></asp:ListItem>
                            <asp:ListItem Text="Rejected" Value="Rejected"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                        <label>Claim Amount:</label>
                        <asp:TextBox ID="txtClaimAmount" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                    </div>
                </div>

                <div class="row mt-2">
                    <div class="col-md-6">
                        <label>Approval Date:</label>
                        <asp:TextBox ID="txtApprovalDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label>Policy Expiry Date:</label>
                        <asp:TextBox ID="txtExpiryDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </div>
                </div>

                <div class="mt-3 text-center">
                    <asp:Button ID="btnAdd" runat="server" Text="➕ Add Insurance" CssClass="btn btn-primary" OnClick="btnAdd_Click" />
                </div>
            </div>

            <div class="mt-4">

                <h3 class="text-center text-success">📝 Insurance Records</h3>
        <asp:GridView ID="gvInsurance" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False"
            DataKeyNames="insuranceID" OnRowEditing="gvInsurance_RowEditing" OnRowUpdating="gvInsurance_RowUpdating"
            OnRowDeleting="gvInsurance_RowDeleting" OnRowCancelingEdit="gvInsurance_RowCancelingEdit">
            <Columns>
                           <asp:BoundField DataField="insuranceID" HeaderText="ID" ReadOnly="True" />

                           <asp:BoundField DataField="name" HeaderText="Patient Name" ReadOnly="True" />

                <asp:TemplateField HeaderText="Policy Number">
                    <ItemTemplate><%# Eval("policyNumber") %></ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPolicyNumber" runat="server" CssClass="form-control" Text='<%# Eval("policyNumber") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Provider">
                    <ItemTemplate><%# Eval("provider") %></ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtProvider" runat="server" CssClass="form-control" Text='<%# Eval("provider") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Coverage Details">
                    <ItemTemplate><%# Eval("coverageDetails") %></ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCoverageDetails" runat="server" CssClass="form-control" Text='<%# Eval("coverageDetails") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Claim Status">
                    <ItemTemplate><%# Eval("claimStatus") %></ItemTemplate>
                   <EditItemTemplate>
                        <asp:DropDownList ID="ddlClaimStatus" runat="server" CssClass="form-control">
                              <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                              <asp:ListItem Text="Approved" Value="Approved"></asp:ListItem>
                              <asp:ListItem Text="Rejected" Value="Rejected"></asp:ListItem>
                          </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Claim Amount">
                      <ItemTemplate><%# Eval("claimAmount") %></ItemTemplate>
                      <EditItemTemplate>
                         <asp:TextBox ID="txtClaimAmount" runat="server" CssClass="form-control" Text='<%# Eval("claimAmount") %>'></asp:TextBox>
                      </EditItemTemplate>
                 </asp:TemplateField>

                 <asp:TemplateField HeaderText="Test Date">
                      <ItemTemplate>
                        <asp:Label ID="lblApprovalDate" runat="server" Text='<%# Eval("approvalDate", "{0:yyyy-MM-dd}") %>'></asp:Label>
                      </ItemTemplate>
                      <EditItemTemplate>
                        <asp:TextBox ID="txtEditApprovalDate" runat="server" CssClass="form-control" Text='<%# Bind("approvalDate", "{0:yyyy-MM-dd}") %>' TextMode="Date"></asp:TextBox>
                      </EditItemTemplate>
                 </asp:TemplateField>

                 <asp:TemplateField HeaderText="Test Date">
                      <ItemTemplate>
                         <asp:Label ID="lblPolicyExpiryDate" runat="server" Text='<%# Eval("policyExpiryDate", "{0:yyyy-MM-dd}") %>'></asp:Label>
                      </ItemTemplate>
                     <EditItemTemplate>
                          <asp:TextBox ID="txtEditPolicyExpiryDate" runat="server" CssClass="form-control" Text='<%# Bind("policyExpiryDate", "{0:yyyy-MM-dd}") %>' TextMode="Date"></asp:TextBox>
                       </EditItemTemplate>
               </asp:TemplateField>

                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
    </div>
	</div>
                    </form>
</body>
</html>
