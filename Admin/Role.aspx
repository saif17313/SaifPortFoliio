<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Role.aspx.cs" Inherits="SaifPortFoliio.Admin.Role" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Roles Management</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <style>
        /* keep your CSS styles as-is */
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Page Header -->
            <div class="page-header">
                <h1 class="page-title">
                    <i class="fas fa-user-cog"></i> Roles Management
                </h1>
                <a href="../AdminDashboard.aspx" class="back-button">
                    <i class="fas fa-arrow-left"></i> Back to Dashboard
                </a>
            </div>

            <!-- Add/Edit Form Section -->
            <div class="form-section">
                <div class="form-header">
                    <h3><i class="fas fa-plus"></i> 
                        <asp:Label ID="formTitle" runat="server" Text="Add New Role"></asp:Label>
                    </h3>
                </div>
                <div class="form-content">
                    <div class="description-text">
                        Roles are displayed in the typewriter effect on your portfolio homepage. Add professional titles or descriptions that represent you.
                    </div>
                    
                    <asp:HiddenField ID="hfRoleId" runat="server" Value="0" />
                    
                    <div class="form-group">
                        <label class="form-label">Role Text *</label>
                        <asp:TextBox ID="txtRoleText" runat="server" CssClass="form-control" placeholder="e.g., Full Stack Developer, Software Engineer" MaxLength="100"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <asp:Button ID="btnSave" runat="server" Text="Add Role" CssClass="btn-primary" OnClick="btnSave_Click" />
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
                    <h3><i class="fas fa-list"></i> Existing Roles</h3>
                </div>
                <div class="table-responsive">
                    <asp:GridView ID="gvRoles" runat="server" CssClass="data-table" AutoGenerateColumns="false" 
                                  OnRowCommand="gvRoles_RowCommand" DataKeyNames="Id">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="ID" />
                            <asp:TemplateField HeaderText="Role Text">
                                <ItemTemplate>
                                    <div class="role-badge"><%# Eval("RoleText") %></div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn-edit" 
                                                CommandName="EditRole" CommandArgument='<%# Eval("Id") %>' />
                                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn-delete" 
                                                CommandName="DeleteRole" CommandArgument='<%# Eval("Id") %>' 
                                                OnClientClick="return confirm('Are you sure you want to delete this role?');" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div style="text-align: center; padding: 2rem; color: #718096;">
                                <i class="fas fa-user-cog fa-3x" style="margin-bottom: 1rem; opacity: 0.5;"></i>
                                <h5>No Roles Found</h5>
                                <p>Start by adding your first professional role!</p>
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
