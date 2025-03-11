<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NutritionWellness.aspx.cs" Inherits="hospital_management.Doctor.NutritionWellness" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nutrition Wellness</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../CSS/aspx.css" rel="stylesheet" />
</head>
<div class="container mt-5">
    <div class="card shadow">
        <div class="card-header bg-primary text-white">
            <h4 class="text-center">🍎 Nutrition Wellness Management</h4>
        </div>
        <div class="card-body">
            <form id="form1" runat="server">
                <asp:Label ID="lblMessage" runat="server" CssClass="text-center"></asp:Label>

                <div class="row">
                    <div class="col-md-6">
                        <label>👤 Patient Name</label>
                        <asp:DropDownList ID="ddlPatient" CssClass="form-select" runat="server" AutoPostBack="True"></asp:DropDownList>
                    </div>
                    <div class="col-md-6">
                        <label>🩺 Doctor Name</label>
                        <asp:DropDownList ID="ddlDoctor" CssClass="form-select" runat="server"></asp:DropDownList>
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col-md-6">
                        <label>🥗 Diet Plan</label>
                        <asp:TextBox ID="txtDietPlan" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label>💪 Exercise Plan</label>
                        <asp:TextBox ID="txtExercisePlan" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col-md-6">
                        <label>🎯 Health Goals</label>
                        <asp:TextBox ID="txtHealthGoals" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label>⚠ Allergies</label>
                        <asp:TextBox ID="txtAllergies" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
    <label>Notes</label>
    <asp:TextBox ID="txtNotes" runat="server" CssClass="form-control"></asp:TextBox>
</div>


                <div class="mt-4 text-center">
                    <asp:Button ID="btnAddNutrition" CssClass="btn btn-primary" runat="server" Text="➕ Add Record" OnClick="btnAddNutrition_Click" />
                </div>
                <br />
                <h3 class="mt-5 text-center text-success">Nutrition Wellness</h3>
                <br />
                <!-- GridView -->
                <div class="mt-5">
                    <asp:GridView ID="GridViewNutrition" runat="server" AutoGenerateColumns="False" DataKeyNames="wellnessID"
                        CssClass="table table-bordered" OnRowEditing="GridViewNutrition_RowEditing" OnRowCancelingEdit="GridViewNutrition_RowCancelingEdit"
                        OnRowUpdating="GridViewNutrition_RowUpdating" OnRowDeleting="GridViewNutrition_RowDeleting">
                        <Columns>
                            <asp:BoundField DataField="wellnessID" HeaderText="Wellness ID" ReadOnly="True" />
                     <asp:TemplateField HeaderText="Patient Name">
            <ItemTemplate>
                <%# Eval("patientName") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:DropDownList ID="ddlPatientEdit" runat="server" CssClass="form-select"></asp:DropDownList>
                <asp:HiddenField ID="hdnPatientID" runat="server" Value='<%# Eval("patientID") %>' />
            </EditItemTemplate>
        </asp:TemplateField>
                            <asp:TemplateField HeaderText="Doctor Name">
            <ItemTemplate>
                <%# Eval("doctorName") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:DropDownList ID="ddlDoctorEdit" runat="server" CssClass="form-select"></asp:DropDownList>
                <asp:HiddenField ID="hdnDoctorID" runat="server" Value='<%# Eval("doctorID") %>' />
            </EditItemTemplate>
        </asp:TemplateField>


                            <asp:TemplateField HeaderText="Diet Plan">
                                <ItemTemplate>
                                    <%# Eval("dietPlan") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDietPlanEdit" runat="server" Text='<%# Bind("dietPlan") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Exercise Plan">
                                <ItemTemplate>
                                    <%# Eval("exercisePlan") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtExercisePlanEdit" runat="server" Text='<%# Bind("exercisePlan") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Health Goals">
                                <ItemTemplate>
                                    <%# Eval("healthGoals") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtHealthGoalsEdit" runat="server" Text='<%# Bind("healthGoals") %>' CssClass="form-control"></asp:TextBox>
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

                             <asp:TemplateField HeaderText="Health Goals">
     <ItemTemplate>
         <%# Eval("Notes") %>
     </ItemTemplate>
     <EditItemTemplate>
         <asp:TextBox ID="txtNotesEdit" runat="server" Text='<%# Bind("Notes") %>' CssClass="form-control"></asp:TextBox>
     </EditItemTemplate>
 </asp:TemplateField>

                            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                        </Columns>
                    </asp:GridView>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>