<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Skill.aspx.cs" Inherits="SaifPortFoliio.Admin.Skill" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Skills Management</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            --secondary-gradient: linear-gradient(135deg, #a8edea 0%, #fed6e3 100%);
            --success-gradient: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
            --danger-gradient: linear-gradient(135deg, #fc466b 0%, #3f5efb 100%);
            --dark-gradient: linear-gradient(135deg, #232526 0%, #414345 100%);
            
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
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
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
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="skillPattern" width="50" height="50" patternUnits="userSpaceOnUse"><polygon points="25,5 45,20 45,35 25,50 5,35 5,20" fill="white" opacity="0.05"/><circle cx="25" cy="25" r="3" fill="white" opacity="0.1"/></pattern></defs><rect width="100" height="100" fill="url(%23skillPattern)"/></svg>');
            pointer-events: none;
            z-index: -1;
        }

        .container {
            max-width: 1300px;
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
            background: linear-gradient(45deg, rgba(255,255,255,0.1) 25%, transparent 25%, transparent 75%, rgba(255,255,255,0.1) 75%);
            background-size: 20px 20px;
            animation: move 2s linear infinite;
        }

        @keyframes move {
            0% { background-position: 0 0; }
            100% { background-position: 20px 20px; }
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
            animation: bounce 2s ease-in-out infinite;
        }

        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% { transform: translateY(0); }
            40% { transform: translateY(-10px); }
            60% { transform: translateY(-5px); }
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
            top: -50%;
            right: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
            animation: wave 4s ease-in-out infinite;
        }

        @keyframes wave {
            0%, 100% { transform: translateX(0) translateY(0) scale(1); }
            50% { transform: translateX(-20px) translateY(-20px) scale(1.1); }
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

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 2rem;
            margin-bottom: 2rem;
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
            border-color: #4facfe;
            box-shadow: 0 0 0 3px rgba(79, 172, 254, 0.1);
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
            box-shadow: 0 20px 40px rgba(79, 172, 254, 0.4);
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
            background: rgba(79, 172, 254, 0.05);
            transform: scale(1.01);
            transition: all 0.3s ease;
        }

        /* Skill Progress Bar */
        .skill-progress {
            display: flex;
            align-items: center;
            gap: 1rem;
            min-width: 200px;
        }

        .progress-bar {
            flex: 1;
            height: 10px;
            background: #e2e8f0;
            border-radius: 10px;
            overflow: hidden;
            position: relative;
        }

        .progress-fill {
            height: 100%;
            background: var(--success-gradient);
            border-radius: 10px;
            transition: width 0.5s ease;
            position: relative;
            overflow: hidden;
        }

        .progress-fill::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.5), transparent);
            animation: progress-shine 2s ease-in-out infinite;
        }

        @keyframes progress-shine {
            0% { left: -100%; }
            100% { left: 100%; }
        }

        .progress-text {
            font-weight: 600;
            color: var(--text-primary);
            min-width: 50px;
            text-align: center;
            background: var(--secondary-gradient);
            padding: 0.25rem 0.75rem;
            border-radius: 15px;
            color: white;
            font-size: 0.875rem;
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
            box-shadow: 0 4px 15px rgba(17, 153, 142, 0.3);
        }

        .btn-edit:hover {
            transform: translateY(-2px) rotate(2deg);
            box-shadow: 0 8px 25px rgba(17, 153, 142, 0.4);
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
            box-shadow: 0 4px 15px rgba(252, 70, 107, 0.3);
        }

        .btn-delete:hover {
            transform: translateY(-2px) rotate(-2deg);
            box-shadow: 0 8px 25px rgba(252, 70, 107, 0.4);
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

            .form-row {
                grid-template-columns: 1fr;
                gap: 1rem;
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

            .skill-progress {
                min-width: 150px;
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
                            <div style="text-align: center; padding: 3rem; color: #718096;">
                                <i class="fas fa-tools fa-4x" style="margin-bottom: 1.5rem; opacity: 0.3;"></i>
                                <h4 style="margin-bottom: 1rem; color: #4a5568;">No Skills Found</h4>
                                <p style="font-size: 1.1rem;">Start by adding your first skill using the form above!</p>
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
