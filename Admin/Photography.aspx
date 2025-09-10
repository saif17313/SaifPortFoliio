<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Photography.aspx.cs" Inherits="SaifPortFoliio.Admin.Photography" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Photography Management</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #833ab4 0%, #fd1d1d 50%, #fcb045 100%);
            --secondary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --success-gradient: linear-gradient(135deg, #56ab2f 0%, #a8e6cf 100%);
            --danger-gradient: linear-gradient(135deg, #ff416c 0%, #ff4b2b 100%);
            --dark-gradient: linear-gradient(135deg, #434343 0%, #000000 100%);
            
            --glass-bg: rgba(255, 255, 255, 0.25);
            --glass-border: rgba(255, 255, 255, 0.18);
            --shadow-light: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            --shadow-heavy: 0 15px 35px rgba(50, 50, 93, 0.1), 0 5px 15px rgba(0, 0, 0, 0.07);
            
            --text-primary: #2d3748;
            --text-secondary: #4a5568;
            --text-muted: #718096;
            --border-light: #e2e8f0;
            --bg-light: #f7fafc;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background: var(--primary-gradient);
            min-height: 100vh;
            padding: 2rem;
            position: relative;
        }

        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="photoPattern" width="30" height="30" patternUnits="userSpaceOnUse"><rect width="30" height="30" fill="none" stroke="white" stroke-width="0.5" opacity="0.1"/><circle cx="15" cy="15" r="2" fill="white" opacity="0.1"/><rect x="10" y="10" width="10" height="10" fill="none" stroke="white" stroke-width="0.3" opacity="0.1"/></pattern></defs><rect width="100" height="100" fill="url(%23photoPattern)"/></svg>');
            pointer-events: none;
            z-index: -1;
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
            position: relative;
        }

        /* Glassmorphism Page Header */
        .page-header {
            background: var(--glass-bg);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border: 1px solid var(--glass-border);
            border-radius: 20px;
            padding: 2.5rem;
            margin-bottom: 2rem;
            box-shadow: var(--shadow-light);
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: relative;
            overflow: hidden;
        }

        .page-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, rgba(255,255,255,0.1), transparent, rgba(255,255,255,0.1), transparent);
            background-size: 40px 40px;
            animation: camera-flash 3s ease-in-out infinite;
        }

        @keyframes camera-flash {
            0%, 100% { opacity: 0.3; }
            50% { opacity: 0.7; }
        }

        .page-title {
            font-size: 2.5rem;
            font-weight: 700;
            color: white;
            text-shadow: 0 4px 20px rgba(0,0,0,0.3);
            position: relative;
            z-index: 2;
        }

        .page-title i {
            margin-right: 1rem;
            background: var(--success-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            animation: camera-shake 3s ease-in-out infinite;
        }

        @keyframes camera-shake {
            0%, 100% { transform: rotate(0deg); }
            25% { transform: rotate(-5deg); }
            75% { transform: rotate(5deg); }
        }

        .back-button {
            background: var(--glass-bg);
            backdrop-filter: blur(10px);
            color: white;
            border: 1px solid var(--glass-border);
            padding: 1rem 2rem;
            border-radius: 15px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            z-index: 2;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .back-button:hover {
            background: rgba(255,255,255,0.3);
            transform: translateY(-3px) scale(1.05);
            color: white;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }

        /* Modern Form Section */
        .form-section {
            background: var(--glass-bg);
            backdrop-filter: blur(16px);
            border: 1px solid var(--glass-border);
            border-radius: 24px;
            margin-bottom: 2rem;
            overflow: hidden;
            box-shadow: var(--shadow-light);
            position: relative;
        }

        .form-header {
            background: var(--secondary-gradient);
            padding: 2rem;
            color: white;
            position: relative;
            overflow: hidden;
        }

        .form-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: repeating-linear-gradient(
                45deg,
                transparent,
                transparent 10px,
                rgba(255,255,255,0.1) 10px,
                rgba(255,255,255,0.1) 20px
            );
            animation: camera-lines 4s linear infinite;
        }

        @keyframes camera-lines {
            0% { transform: translateX(-40px); }
            100% { transform: translateX(40px); }
        }

        .form-header h3 {
            font-size: 1.5rem;
            font-weight: 600;
            margin: 0;
            display: flex;
            align-items: center;
            position: relative;
            z-index: 1;
        }

        .form-header i {
            margin-right: 0.75rem;
            padding: 12px;
            background: rgba(255,255,255,0.2);
            border-radius: 12px;
            font-size: 1.2rem;
        }

        .form-content {
            padding: 2.5rem;
            background: rgba(255,255,255,0.95);
        }

        .form-group {
            margin-bottom: 2rem;
            position: relative;
        }

        .form-label {
            display: block;
            font-weight: 600;
            color: var(--text-primary);
            margin-bottom: 0.75rem;
            font-size: 0.95rem;
            letter-spacing: 0.025em;
        }

        .form-control {
            width: 100%;
            padding: 1.25rem 1.5rem;
            border: 2px solid var(--border-light);
            border-radius: 12px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: white;
            font-family: inherit;
        }

        .form-control:focus {
            outline: none;
            border-color: #833ab4;
            box-shadow: 0 0 0 3px rgba(131, 58, 180, 0.1);
            transform: translateY(-2px);
        }

        .text-muted {
            font-size: 0.875rem;
            color: var(--text-muted);
            margin-top: 0.5rem;
        }

        /* Modern Buttons */
        .btn-primary {
            background: var(--primary-gradient);
            border: none;
            padding: 1.25rem 3rem;
            border-radius: 12px;
            color: white;
            font-weight: 600;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            box-shadow: var(--shadow-heavy);
            position: relative;
            overflow: hidden;
        }

        .btn-primary::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.4), transparent);
            transition: left 0.6s;
        }

        .btn-primary:hover::before {
            left: 100%;
        }

        .btn-primary:hover {
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 20px 40px rgba(131, 58, 180, 0.4);
        }

        .btn-secondary {
            background: linear-gradient(135deg, #6c757d 0%, #495057 100%);
            border: none;
            padding: 1.25rem 2rem;
            border-radius: 12px;
            color: white;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-secondary:hover {
            transform: translateY(-2px);
            background: linear-gradient(135deg, #5a6268 0%, #343a40 100%);
        }

        /* Data Section */
        .data-section {
            background: var(--glass-bg);
            backdrop-filter: blur(16px);
            border: 1px solid var(--glass-border);
            border-radius: 24px;
            overflow: hidden;
            box-shadow: var(--shadow-light);
        }

        .data-header {
            background: var(--dark-gradient);
            padding: 2rem;
            color: white;
            position: relative;
        }

        .data-header h3 {
            font-size: 1.5rem;
            font-weight: 600;
            margin: 0;
            display: flex;
            align-items: center;
        }

        .data-header i {
            margin-right: 0.75rem;
            padding: 12px;
            background: rgba(255,255,255,0.2);
            border-radius: 12px;
        }

        /* Photo Grid */
        .photo-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 2rem;
            padding: 2rem;
            background: rgba(255,255,255,0.95);
        }

        .photo-card {
            background: white;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
        }

        .photo-card:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: 0 20px 40px rgba(0,0,0,0.15);
        }

        .photo-image {
            height: 250px;
            overflow: hidden;
            position: relative;
        }

        .photo-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .photo-card:hover .photo-image img {
            transform: scale(1.1);
        }

        .photo-placeholder {
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #e2e8f0 0%, #cbd5e0 100%);
            color: var(--text-muted);
            font-size: 1.2rem;
        }

        .photo-placeholder i {
            font-size: 3rem;
            margin-bottom: 1rem;
            opacity: 0.5;
        }

        .photo-content {
            padding: 1.5rem;
        }

        .photo-title {
            font-size: 1.25rem;
            font-weight: 600;
            color: var(--text-primary);
            margin-bottom: 0.75rem;
        }

        .photo-description {
            color: var(--text-secondary);
            margin-bottom: 1rem;
            line-height: 1.6;
        }

        .photo-path {
            font-size: 0.875rem;
            color: var(--text-muted);
            background: var(--bg-light);
            padding: 0.5rem 1rem;
            border-radius: 8px;
            margin-bottom: 1.5rem;
            font-family: 'Courier New', monospace;
        }

        .photo-actions {
            display: flex;
            gap: 0.75rem;
        }

        /* Action Buttons */
        .btn-edit {
            background: var(--success-gradient);
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            color: white;
            font-weight: 500;
            font-size: 0.875rem;
            cursor: pointer;
            flex: 1;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(86, 171, 47, 0.3);
        }

        .btn-edit:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(86, 171, 47, 0.4);
        }

        .btn-delete {
            background: var(--danger-gradient);
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            color: white;
            font-weight: 500;
            font-size: 0.875rem;
            cursor: pointer;
            flex: 1;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(255, 65, 108, 0.3);
        }

        .btn-delete:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(255, 65, 108, 0.4);
        }

        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 4rem 2rem;
            color: var(--text-muted);
            background: rgba(255,255,255,0.95);
        }

        .empty-state i {
            font-size: 4rem;
            margin-bottom: 2rem;
            opacity: 0.3;
            background: var(--primary-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .empty-state h5 {
            font-size: 1.5rem;
            margin-bottom: 1rem;
            color: var(--text-primary);
        }

        .empty-state p {
            font-size: 1.1rem;
            color: var(--text-secondary);
        }

        /* Alert Messages */
        .alert {
            padding: 1.5rem 2rem;
            border-radius: 12px;
            margin-top: 1.5rem;
            border: none;
            font-weight: 500;
            position: relative;
            overflow: hidden;
        }

        .alert-success {
            background: linear-gradient(135deg, #d1f2eb 0%, #a3e4d7 100%);
            color: #0c5460;
            border-left: 4px solid #20c997;
        }

        .alert-danger {
            background: linear-gradient(135deg, #f8d7da 0%, #f5c6cb 100%);
            color: #721c24;
            border-left: 4px solid #dc3545;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            body {
                padding: 1rem;
            }

            .page-header {
                flex-direction: column;
                gap: 1.5rem;
                text-align: center;
                padding: 2rem;
            }

            .page-title {
                font-size: 2rem;
            }

            .form-content {
                padding: 1.5rem;
            }

            .photo-grid {
                grid-template-columns: 1fr;
                gap: 1.5rem;
                padding: 1.5rem;
            }

            .photo-image {
                height: 200px;
            }

            .photo-actions {
                flex-direction: column;
            }
        }
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
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn-secondary ms-2" OnClick="btnCancel_Click" CausesValidation="false" />
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
