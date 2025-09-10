<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Skill.aspx.cs" Inherits="SaifPortFoliio.Admin.Skill" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Skills Management</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <style>
        /* keep your CSS styles */
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Page Header -->
            <div class="page-header">
                <h1 class="page-title">
                    <i class="fas fa-tools"></i> Skills Management
                </h1>
                <a href="../AdminDashboard.aspx" class="back-button">
                    <i class="fas fa-arrow-left"></i> Back to Dashboard
                </a>
            </div>

            <!-- Add/Edit Form Section -->
            <div class="form-section">
                <div class="form-header">
                    <h3><i class="fas fa-plus"></i> 
                        <asp:Label ID="formTitle" runat="server" Text="Add New Skill"></asp:Label>
                    </h3>
                </div>
                <div class="form-content">
                    <asp:HiddenField ID="hfSkillId" runat="server" Value="0" />
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label">Skill Name *</label>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter skill name" MaxLength="100"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label class="form-label">Category</label>
                            <asp:TextBox ID="txtCategory" runat="server" CssClass="form-control" placeholder="e.g., Programming, Web Development" MaxLength="80"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Proficiency Level (0-100%)</label>
                        <asp:TextBox ID="txtLevelPercent" runat="server" CssClass="form-control" placeholder="Enter level percentage (0-100)" TextMode="Number"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <asp:Button ID="btnSave" runat="server" Text="Add Skill" CssClass="btn-primary" OnClick="btnSave_Click" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary ms-2" OnClick="btnCancel_Click" CausesValidation="false" />
                    </div>

                    <!-- Status Messages -->
                    <asp:Panel ID="pnlMessage" runat="server" Visible="false">
                        <div id="divMessage" runat="server" class="alert">
                            <asp:Label ID="lblMessage" runat="server"></asp:Label>
                        </div>
                    </asp:Panel>
                </div>
            </div>

            <!-- Data Display Section -->
            <div class="data-section">
                <div class="data-header">
                    <h3><i class="fas fa-list"></i> Existing Skills</h3>
                </div>
                <div class="table-responsive">
                    <asp:GridView ID="gvSkills" runat="server" CssClass="data-table" AutoGenerateColumns="false" 
                                  OnRowCommand="gvSkills_RowCommand" DataKeyNames="Id" OnRowDataBound="gvSkills_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="ID" />
                            <asp:BoundField DataField="Name" HeaderText="Skill Name" />
                            <asp:BoundField DataField="Category" HeaderText="Category" />
                            <asp:TemplateField HeaderText="Proficiency">
                                <ItemTemplate>
                                    <div class="skill-progress">
                                        <div class="progress-bar">
                                            <div class="progress-fill" style='width: <%# Eval("LevelPercent") %>%'></div>
                                        </div>
                                        <div class="progress-text"><%# Eval("LevelPercent") %>%</div>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn-edit" 
                                                CommandName="EditSkill" CommandArgument='<%# Eval("Id") %>' />
                                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn-delete" 
                                                CommandName="DeleteSkill" CommandArgument='<%# Eval("Id") %>' 
                                                OnClientClick="return confirm('Are you sure you want to delete this skill?');" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div style="text-align: center; padding: 2rem; color: #718096;">
                                <i class="fas fa-tools fa-3x" style="margin-bottom: 1rem; opacity: 0.5;"></i>
                                <h5>No Skills Found</h5>
                                <p>Start by adding your first skill!</p>
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
