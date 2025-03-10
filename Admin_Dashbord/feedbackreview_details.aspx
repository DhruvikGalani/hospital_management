<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="feedbackreview_details.aspx.cs" Inherits="hospital_management.Admin_Dashbord.feedbackreview_details" %>




<!DOCTYPE html>
<html>
<head>
    <title>📝 Feedback Review Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h2 class="text-center text-success">📝 Feedback Review Management</h2>
            <asp:Label ID="lblMessage" runat="server"></asp:Label>

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
                        <label>Staff:</label>
                        <asp:DropDownList ID="ddlStaff" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-md-4">
                        <label>Visit Date:</label>
                        <asp:TextBox ID="txtVisitDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label>Feedback:</label>
                        <asp:TextBox ID="txtFeedback" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label>Rating (1-5):</label>
                        <asp:TextBox ID="txtRating" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="mt-3 text-center">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit Feedback" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                </div>
            </div>

            <div class="mt-4">
                <h3 class="text-center text-success">📌 Feedback Reviews</h3>
                <asp:GridView ID="GridViewFeedback" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" DataKeyNames="feedbackID"
                    OnRowEditing="GridViewFeedback_RowEditing" OnRowUpdating="GridViewFeedback_RowUpdating" OnRowCancelingEdit="GridViewFeedback_RowCancelingEdit" OnRowDeleting="GridViewFeedback_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="feedbackID" HeaderText="Feedback ID" ReadOnly="True" />
                        <asp:BoundField DataField="patientID" HeaderText="Patient Name" />
                        <asp:BoundField DataField="doctorID" HeaderText="Doctor Name" />
                        <asp:BoundField DataField="staffID" HeaderText="Staff Name" />
                        <asp:TemplateField HeaderText="Visit Date">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditVisitDate" runat="server" CssClass="form-control" Text='<%# Bind("visitDate", "{0:yyyy-MM-dd}") %>' TextMode="Date"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblVisitDate" runat="server" Text='<%# Eval("visitDate", "{0:yyyy-MM-dd}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Feedback">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditFeedback" runat="server" CssClass="form-control" Text='<%# Bind("feedbackText") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblFeedback" runat="server" Text='<%# Bind("feedbackText") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Rating">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditRating" runat="server" CssClass="form-control" Text='<%# Bind("rating") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblRating" runat="server" Text='<%# Bind("rating") %>'></asp:Label>
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