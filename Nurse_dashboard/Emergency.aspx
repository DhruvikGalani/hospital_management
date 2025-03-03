<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Emergency.aspx.cs" Inherits="hospital_management.Nurse_dashboard.Emergency" %>

<!DOCTYPE html>
<html lang="en">
    <head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>⚠️ Emergency Management | Hospital Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            margin-top: 50px;
        }
    </style>
</head>
<body>
   
    <form runat="server">
             <div class="container mt-5">
     <h2 class="text-center text-primary">⚠️Emergency Management</h2>
                    <div class="card shadow-lg p-4">

            <div class="row">
                <div class="col-md-6">
                    <label>Patient ID:</label>
                    <asp:DropDownList ID="ddlPatientID" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                </div>
                <div class="col-md-6">
                    <label>Ambulance ID:</label>
                    <asp:DropDownList ID="ddlAmbulanceID" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                </div>
            </div>

            <div class="row mt-3">
                <div class="col-md-6">
                    <label>Patient Name:</label>
                    <asp:TextBox ID="txtPatientName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <label>Contact Number:</label>
                    <asp:TextBox ID="txtContactNumber" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="row mt-3">
                <div class="col-md-6">
                    <label>Reported Symptoms:</label>
                    <asp:TextBox ID="txtReportedSymptoms" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <label>Location:</label>
                    <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="row mt-3">
                <div class="col-md-6">
                    <label>Arrival Time:</label>
                    <asp:TextBox ID="txtArrivalTime" runat="server" CssClass="form-control" TextMode="Time"></asp:TextBox>
                </div>
            </div>

            <div class="text-center mt-4">
                <asp:Button ID="btnAddEmergency" runat="server" CssClass="btn btn-primary" Text="Add Emergency Case" OnClick="btnAddEmergency_Click" />
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="mt-3"></asp:Label>
                        </div>

            <h3 class="mt-5 text-center text-success">Emergency Cases</h3>
       <asp:GridView ID="gvEmergency" runat="server" CssClass="table table-bordered table-striped mt-3"
    AutoGenerateColumns="False" DataKeyNames="emergencyCaseID"
    OnRowEditing="gvEmergency_RowEditing"
    OnRowCancelingEdit="gvEmergency_RowCancelingEdit"
    OnRowUpdating="gvEmergency_RowUpdating"
    OnRowDeleting="gvEmergency_RowDeleting">
    <Columns>
        <asp:TemplateField HeaderText="Patient Name">
            <ItemTemplate>
                <asp:Label ID="lblPatientName" runat="server" Text='<%# Eval("patientName") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtPatientNameEdit" runat="server" CssClass="form-control" Text='<%# Bind("patientName") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="ReportedSymptoms">
    <ItemTemplate>
        <asp:Label ID="lblReportSymptoms" runat="server" Text='<%# Eval("ReportedSymptoms") %>'></asp:Label>
    </ItemTemplate>
    <EditItemTemplate>
        <asp:TextBox ID="txtReportedSymptoms" runat="server" CssClass="form-control" Text='<%# Bind("ReportedSymptoms") %>'></asp:TextBox>
    </EditItemTemplate>
</asp:TemplateField>

        <asp:TemplateField HeaderText="Contact Number">
            <ItemTemplate>
                <asp:Label ID="lblContactNumber" runat="server" Text='<%# Eval("contactNumber") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtContactNumberEdit" runat="server" CssClass="form-control" Text='<%# Bind("contactNumber") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Location">
            <ItemTemplate>
                <asp:Label ID="lblLocation" runat="server" Text='<%# Eval("location") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtLocationEdit" runat="server" CssClass="form-control" Text='<%# Bind("location") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Arrival Time">
            <ItemTemplate>
                <asp:Label ID="lblArrivalTime" runat="server" Text='<%# Eval("arrivalTime") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtArrivalTimeEdit" runat="server" CssClass="form-control" Text='<%# Bind("arrivalTime") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
    </Columns>
</asp:GridView>

                 </div>
            
        </form>
  
    
</body>
</html>
