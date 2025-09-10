<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Role.aspx.cs" Inherits="SaifPortFoliio.Admin.Role" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Roles Management</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #ff6b6b 0%, #ee5a24 100%);
            --secondary-gradient: linear-gradient(135deg, #ffa726 0%, #fb8c00 100%);
            --success-gradient: linear-gradient(135deg, #26d0ce 0%, #1a9068 100%);
            --danger-gradient: linear-gradient(135deg, #ff5722 0%, #e91e63 100%);
            --dark-gradient: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
            
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
            background: linear-gradient(135deg, #ff6b6b 0%, #ee5a24 100%);
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
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="rolePattern" width="40" height="40" patternUnits="userSpaceOnUse"><circle cx="20" cy="20" r="1" fill="white" opacity="0.1"/><circle cx="10" cy="10" r="0.5" fill="white" opacity="0.1"/><circle cx="30" cy="10" r="0.5" fill="white" opacity="0.1"/><circle cx="10" cy="30" r="0.5" fill="white" opacity="0.1"/><circle cx="30" cy="30" r="0.5" fill="white" opacity="0.1"/></pattern></defs><rect width="100" height="100" fill="url(%23rolePattern)"/></svg>');
            pointer-events: none;
            z-index: -1;
        }

        .container {
            max-width: 1200px;
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
            background: conic-gradient(from 45deg, rgba(255,255,255,0.1), transparent, rgba(255,255,255,0.1));
            animation: rotate 4s linear infinite;
        }

        @keyframes rotate {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
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
            animation: pulse 2s ease-in-out infinite alternate;
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            100% { transform: scale(1.1); }
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
            background: var(--primary-gradient);
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
            background: linear-gradient(45deg, transparent 30%, rgba(255,255,255,0.1) 50%, transparent 70%);
            animation: sweep 3s ease-in-out infinite;
        }

        @keyframes sweep {
            0% { transform: translateX(-100%); }
            100% { transform: translateX(100%); }
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

        .description-text {
            background: linear-gradient(135deg, #e3f2fd 0%, #bbdefb 100%);
            padding: 1.5rem;
            border-radius: 12px;
            margin-bottom: 2rem;
            border-left: 4px solid #2196f3;
            color: #1565c0;
            font-weight: 500;
            position: relative;
        }

        .description-text::before {
            content: '💡';
            position: absolute;
            top: 1rem;
            right: 1rem;
            font-size: 1.5rem;
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
            position: relative;
        }

        .form-control:focus {
            outline: none;
            border-color: #ff6b6b;
            box-shadow: 0 0 0 3px rgba(255, 107, 107, 0.1);
            transform: translateY(-2px);
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
            box-shadow: 0 20px 40px rgba(255, 107, 107, 0.4);
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
            padding: 1.5rem 1.25rem;
            text-align: left;
            font-weight: 600;
            color: var(--text-primary);
            border-bottom: 2px solid var(--border-light);
            position: sticky;
            top: 0;
            z-index: 1;
        }

        .data-table td {
            padding: 1.5rem 1.25rem;
            border-bottom: 1px solid var(--border-light);
            color: var(--text-secondary);
            vertical-align: middle;
        }

        .data-table tr:hover {
            background: rgba(255, 107, 107, 0.05);
            transform: scale(1.01);
            transition: all 0.3s ease;
        }

        /* Role Badge */
        .role-badge {
            background: var(--secondary-gradient);
            color: white;
            padding: 0.75rem 1.5rem;
            border-radius: 25px;
            font-weight: 600;
            display: inline-block;
            box-shadow: 0 4px 15px rgba(255, 167, 38, 0.3);
            position: relative;
            overflow: hidden;
        }

        .role-badge::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            animation: shine 2s ease-in-out infinite;
        }

        @keyframes shine {
            0% { left: -100%; }
            100% { left: 100%; }
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
            margin-right: 0.5rem;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(38, 208, 206, 0.3);
        }

        .btn-edit:hover {
            transform: translateY(-2px) rotate(2deg);
            box-shadow: 0 8px 25px rgba(38, 208, 206, 0.4);
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
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(255, 87, 34, 0.3);
        }

        .btn-delete:hover {
            transform: translateY(-2px) rotate(-2deg);
            box-shadow: 0 8px 25px rgba(255, 87, 34, 0.4);
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

            .data-table {
                font-size: 0.85rem;
            }

            .data-table th,
            .data-table td {
                padding: 1rem 0.75rem;
            }

            .btn-edit,
            .btn-delete {
                padding: 0.5rem 1rem;
                font-size: 0.8rem;
                margin: 0.25rem;
            }

            .role-badge {
                padding: 0.5rem 1rem;
                font-size: 0.875rem;
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
                            <div style="text-align: center; padding: 3rem; color: #718096;">
                                <i class="fas fa-user-cog fa-4x" style="margin-bottom: 1.5rem; opacity: 0.3;"></i>
                                <h4 style="margin-bottom: 1rem; color: #4a5568;">No Roles Found</h4>
                                <p style="font-size: 1.1rem;">Start by adding your first professional role using the form above!</p>
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
