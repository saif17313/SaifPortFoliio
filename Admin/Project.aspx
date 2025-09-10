<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Project.aspx.cs" Inherits="SaifPortFoliio.Admin.Project" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Management</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <style>
        /* your CSS styles (same as before) */
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Page Header -->
            <div class="page-header">
                <h1 class="page-title">
                    <i class="fas fa-laptop-code"></i> Project Management
                </h1>
                <a href="../AdminDashboard.aspx" class="back-button">
                    <i class="fas fa-arrow-left"></i> Back to Dashboard
                </a>
            </div>

            <!-- Add/Edit Form Section -->
            <div class="form-section">
                <div class="form-header">
                    <h3><i class="fas fa-plus"></i> 
                        <asp:Label ID="formTitle" runat="server" Text="Add New Project"></asp:Label>
                    </h3>
                </div>
                <div class="form-content">
                    <asp:HiddenField ID="hfProjectId" runat="server" Value="0" />
                    
                    <div class="form-group">
                        <label class="form-label">Title *</label>
                        <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" placeholder="Enter project title" MaxLength="140"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Slug *</label>
                        <asp:TextBox ID="txtSlug" runat="server" CssClass="form-control" placeholder="Enter project slug (e.g., my-project)" MaxLength="160"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Short Description</label>
                        <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Enter project description" MaxLength="300"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Cover Image Path</label>
                        <asp:TextBox ID="txtCoverImagePath" runat="server" CssClass="form-control" placeholder="/Content/img/projects/project.jpg" MaxLength="260"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Live URL</label>
                        <asp:TextBox ID="txtLiveUrl" runat="server" CssClass="form-control" placeholder="https://example.com" MaxLength="260"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Repository URL</label>
                        <asp:TextBox ID="txtRepoUrl" runat="server" CssClass="form-control" placeholder="https://github.com/user/repo" MaxLength="260"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <asp:Button ID="btnSave" runat="server" Text="Add Project" CssClass="btn-primary" OnClick="btnSave_Click" />
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
                    <h3><i class="fas fa-list"></i> Existing Projects</h3>
                </div>
                <div class="table-responsive">
                    <asp:GridView ID="gvProjects" runat="server" CssClass="data-table" AutoGenerateColumns="false" 
                                  OnRowCommand="gvProjects_RowCommand" DataKeyNames="Id">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="ID" />
                            <asp:BoundField DataField="Title" HeaderText="Title" />
                            <asp:BoundField DataField="Slug" HeaderText="Slug" />
                            <asp:BoundField DataField="ShortDescription" HeaderText="Description" />
                            <asp:BoundField DataField="LiveUrl" HeaderText="Live URL" />
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn-edit" 
                                                CommandName="EditProject" CommandArgument='<%# Eval("Id") %>' />
                                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn-delete" 
                                                CommandName="DeleteProject" CommandArgument='<%# Eval("Id") %>' 
                                                OnClientClick="return confirm('Are you sure you want to delete this project?');" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div style="text-align: center; padding: 2rem; color: #718096;">
                                <i class="fas fa-inbox fa-3x" style="margin-bottom: 1rem; opacity: 0.5;"></i>
                                <h5>No Projects Found</h5>
                                <p>Start by adding your first project!</p>
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
