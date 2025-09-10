<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Project.aspx.cs" Inherits="SaifPortFoliio.Admin.Project" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Management</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --secondary-gradient: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            --success-gradient: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            --danger-gradient: linear-gradient(135deg, #fa709a 0%, #fee140 100%);
            --dark-gradient: linear-gradient(135deg, #2c3e50 0%, #3498db 100%);
            
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
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
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
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grain" width="100" height="100" patternUnits="userSpaceOnUse"><circle cx="25" cy="25" r="0.5" fill="white" opacity="0.1"/><circle cx="75" cy="75" r="0.3" fill="white" opacity="0.1"/><circle cx="50" cy="10" r="0.4" fill="white" opacity="0.1"/><circle cx="10" cy="60" r="0.3" fill="white" opacity="0.1"/><circle cx="90" cy="40" r="0.2" fill="white" opacity="0.1"/></pattern></defs><rect width="100" height="100" fill="url(%23grain)"/></svg>');
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
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 50%);
            animation: shimmer 3s ease-in-out infinite;
        }

        @keyframes shimmer {
            0%, 100% { transform: translateX(-100%) translateY(-100%) rotate(45deg); }
            50% { transform: translateX(100%) translateY(100%) rotate(45deg); }
        }

        .page-title {
            font-size: 2.5rem;
            font-weight: 700;
            color: white;
            text-shadow: 0 2px 20px rgba(0,0,0,0.3);
            position: relative;
            z-index: 2;
        }

        .page-title i {
            margin-right: 1rem;
            background: var(--success-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
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
            transform: translateY(-2px) scale(1.05);
            color: white;
            box-shadow: 0 8px 25px rgba(0,0,0,0.2);
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
            background: var(--primary-gradient);
            padding: 2rem;
            color: white;
            position: relative;
        }

        .form-header h3 {
            font-size: 1.5rem;
            font-weight: 600;
            margin: 0;
            display: flex;
            align-items: center;
        }

        .form-header i {
            margin-right: 0.75rem;
            padding: 10px;
            background: rgba(255,255,255,0.2);
            border-radius: 10px;
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
            padding: 1rem 1.25rem;
            border: 2px solid var(--border-light);
            border-radius: 12px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: white;
            font-family: inherit;
        }

        .form-control:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
            transform: translateY(-1px);
        }

        .form-control[type="textarea"] {
            resize: vertical;
            min-height: 100px;
        }

        /* Modern Buttons */
        .btn-primary {
            background: var(--primary-gradient);
            border: none;
            padding: 1rem 2.5rem;
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
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.5s;
        }

        .btn-primary:hover::before {
            left: 100%;
        }

        .btn-primary:hover {
            transform: translateY(-2px) scale(1.05);
            box-shadow: 0 20px 40px rgba(102, 126, 234, 0.4);
        }

        .btn-secondary {
            background: linear-gradient(135deg, #6c757d 0%, #495057 100%);
            border: none;
            padding: 1rem 2rem;
            border-radius: 12px;
            color: white;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-secondary:hover {
            transform: translateY(-1px);
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
            padding: 10px;
            background: rgba(255,255,255,0.2);
            border-radius: 10px;
        }

        .table-responsive {
            background: rgba(255,255,255,0.95);
            border-radius: 0 0 24px 24px;
        }

        .data-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 0.95rem;
        }

        .data-table th {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            padding: 1.25rem 1rem;
            text-align: left;
            font-weight: 600;
            color: var(--text-primary);
            border-bottom: 2px solid var(--border-light);
            position: sticky;
            top: 0;
            z-index: 1;
        }

        .data-table td {
            padding: 1.25rem 1rem;
            border-bottom: 1px solid var(--border-light);
            color: var(--text-secondary);
            vertical-align: middle;
        }

        .data-table tr:hover {
            background: rgba(102, 126, 234, 0.05);
            transform: scale(1.01);
            transition: all 0.2s ease;
        }

        /* Action Buttons */
        .btn-edit {
            background: var(--success-gradient);
            border: none;
            padding: 0.5rem 1.25rem;
            border-radius: 8px;
            color: white;
            font-weight: 500;
            font-size: 0.875rem;
            cursor: pointer;
            margin-right: 0.5rem;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(79, 172, 254, 0.3);
        }

        .btn-edit:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(79, 172, 254, 0.4);
        }

        .btn-delete {
            background: var(--danger-gradient);
            border: none;
            padding: 0.5rem 1.25rem;
            border-radius: 8px;
            color: white;
            font-weight: 500;
            font-size: 0.875rem;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(250, 112, 154, 0.3);
        }

        .btn-delete:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(250, 112, 154, 0.4);
        }

        /* Alert Messages */
        .alert {
            padding: 1.25rem 1.5rem;
            border-radius: 12px;
            margin-top: 1.5rem;
            border: none;
            font-weight: 500;
            position: relative;
            overflow: hidden;
        }

        .alert-success {
            background: linear-gradient(135deg, #d4edda 0%, #c3e6cb 100%);
            color: #155724;
            border-left: 4px solid #28a745;
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

            .data-table {
                font-size: 0.85rem;
            }

            .data-table th,
            .data-table td {
                padding: 0.75rem 0.5rem;
            }

            .btn-edit,
            .btn-delete {
                padding: 0.4rem 0.8rem;
                font-size: 0.8rem;
                margin: 0.25rem;
            }
        }

        /* Loading Animation */
        @keyframes pulse {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.7; }
        }

        .loading {
            animation: pulse 2s infinite;
        }
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
                            <div style="text-align: center; padding: 3rem; color: #718096;">
                                <i class="fas fa-inbox fa-4x" style="margin-bottom: 1.5rem; opacity: 0.3;"></i>
                                <h4 style="margin-bottom: 1rem; color: #4a5568;">No Projects Found</h4>
                                <p style="font-size: 1.1rem;">Start by adding your first project using the form above!</p>
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
