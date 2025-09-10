<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Photography.aspx.cs" Inherits="SaifPortFoliio.Admin.Photography" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Photography Management</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <style>
        /* Your CSS styles (same as before) */
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Page Header -->
            <div class="page-header">
                <h1 class="page-title">
                    <i class="fas fa-camera"></i> Photography Management
                </h1>
                <a href="../AdminDashboard.aspx" class="back-button">
                    <i class="fas fa-arrow-left"></i> Back to Dashboard
                </a>
            </div>

            <!-- Add/Edit Form Section -->
            <div class="form-section">
                <div class="form-header">
                    <h3><i class="fas fa-plus"></i> 
                        <asp:Label ID="formTitle" runat="server" Text="Add New Photo"></asp:Label>
                    </h3>
                </div>
                <div class="form-content">
                    <asp:HiddenField ID="hfPhotoId" runat="server" Value="0" />

                    <div class="form-group">
                        <label class="form-label">Photo Name *</label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter photo name/title" MaxLength="140"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Description</label>
                        <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Enter photo description"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Image Path *</label>
                        <asp:TextBox ID="txtImagePath" runat="server" CssClass="form-control" placeholder="/Content/img/photography/photo.jpg" MaxLength="260"></asp:TextBox>
                        <small class="text-muted">Enter the path to your photo file (e.g., /Content/img/photography/landscape.jpg)</small>
                    </div>

                    <div class="form-group">
                        <asp:Button ID="btnSave" runat="server" Text="Add Photo" CssClass="btn-primary" OnClick="btnSave_Click" />
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
                    <h3><i class="fas fa-images"></i> Photo Gallery</h3>
                </div>

                <asp:Repeater ID="rptPhotos" runat="server" OnItemCommand="rptPhotos_ItemCommand">
                    <HeaderTemplate>
                        <div class="photo-grid">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="photo-card">
                            <div class="photo-image">
                                <img src='<%# Eval("ImagePath") %>' alt='<%# Eval("Name") %>' 
                                     onerror="this.style.display='none'; this.parentElement.innerHTML='<div class=&quot;photo-placeholder&quot;><i class=&quot;fas fa-image&quot;></i><br>Image not found</div>';" />
                            </div>
                            <div class="photo-content">
                                <div class="photo-title"><%# Eval("Name") %></div>
                                <div class="photo-description"><%# Eval("Description") %></div>
                                <div class="photo-path"><%# Eval("ImagePath") %></div>
                                <div class="photo-actions">
                                    <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn-edit" 
                                                CommandName="EditPhoto" CommandArgument='<%# Eval("Id") %>' />
                                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn-delete" 
                                                CommandName="DeletePhoto" CommandArgument='<%# Eval("Id") %>' 
                                                OnClientClick="return confirm('Are you sure you want to delete this photo?');" />
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                    <FooterTemplate>
                        </div>
                    </FooterTemplate>
                </asp:Repeater>

                <!-- Empty State -->
                <asp:Panel ID="pnlEmpty" runat="server" Visible="false">
                    <div class="empty-state">
                        <i class="fas fa-camera"></i>
                        <h5>No Photos Found</h5>
                        <p>Start by adding your first photo to the gallery!</p>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </form>
</body>
</html>
