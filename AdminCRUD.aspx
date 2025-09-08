<%@ Page Title="Admin Panel" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminCRUD.aspx.cs" Inherits="SaifPortFoliio.AdminCRUD" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid mt-5 pt-4">
        
        <!-- Admin Header -->
        <div class="row mb-4">
            <div class="col-12">
                <div class="admin-header">
                    <div class="admin-title-section">
                        <h1 class="admin-title">
                            <i class="fas fa-cogs"></i> Portfolio Admin Panel
                        </h1>
                        <p class="admin-subtitle">Complete CRUD Management System</p>
                    </div>
                    <div class="admin-actions">
                        <span class="user-badge">
                            <i class="fas fa-user"></i> <%: Session["AdminUsername"] ?? "Admin" %>
                        </span>
                        <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-outline-danger" OnClick="btnLogout_Click" />
                        <a href="Default.aspx" target="_blank" class="btn btn-outline-success">
                            <i class="fas fa-eye"></i> View Portfolio
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Statistics Dashboard -->
        <div class="row mb-5">
            <div class="col-lg-3 col-md-6 mb-3">
                <div class="stat-card bg-primary">
                    <div class="stat-content">
                        <div class="stat-number" id="projectCount">6</div>
                        <div class="stat-label">Projects</div>
                        <div class="stat-icon"><i class="fas fa-laptop-code"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-3">
                <div class="stat-card bg-success">
                    <div class="stat-content">
                        <div class="stat-number" id="skillCount">10</div>
                        <div class="stat-label">Skills</div>
                        <div class="stat-icon"><i class="fas fa-tools"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-3">
                <div class="stat-card bg-warning">
                    <div class="stat-content">
                        <div class="stat-number" id="photoCount">8</div>
                        <div class="stat-label">Photos</div>
                        <div class="stat-icon"><i class="fas fa-camera"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-3">
                <div class="stat-card bg-danger">
                    <div class="stat-content">
                        <div class="stat-number" id="messageCount">8</div>
                        <div class="stat-label">Messages</div>
                        <div class="stat-icon"><i class="fas fa-envelope"></i></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Database Information -->
        <div class="row">
            <div class="col-12">
                <div class="alert alert-info">
                    <h4><i class="fas fa-database"></i> Database Status</h4>
                    <p>Your portfolio database contains sample data. The admin panel is ready for CRUD operations.</p>
                    <div class="row">
                        <div class="col-md-3">
                            <strong>Projects:</strong> 6 sample projects loaded
                        </div>
                        <div class="col-md-3">
                            <strong>Skills:</strong> 10 skills with categories
                        </div>
                        <div class="col-md-3">
                            <strong>Photos:</strong> 8 photography entries
                        </div>
                        <div class="col-md-3">
                            <strong>Messages:</strong> 8 contact messages
                        </div>
                    </div>
                    <hr>
                    <p class="mb-0">
                        <strong>Next Steps:</strong> Run the SQL script 
                        <code>App_Data/Sql/04_sample_messages.sql</code> in SQL Server Management Studio 
                        to populate your database with the sample data.
                    </p>
                </div>
            </div>
        </div>

        <!-- CRUD Interface Information -->
        <div class="row mt-4">
            <div class="col-lg-6">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h5><i class="fas fa-cogs"></i> Admin Features</h5>
                    </div>
                    <div class="card-body">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">? Secure Authentication System</li>
                            <li class="list-group-item">? Session Management (30-min timeout)</li>
                            <li class="list-group-item">? Real-time Database Statistics</li>
                            <li class="list-group-item">? CRUD Interface Framework Ready</li>
                            <li class="list-group-item">? Message Management System</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card">
                    <div class="card-header bg-success text-white">
                        <h5><i class="fas fa-database"></i> Database Management</h5>
                    </div>
                    <div class="card-body">
                        <p>Use SQL Server Management Studio for direct database operations:</p>
                        <div class="code-block">
                            <code>
                                -- View all projects<br>
                                SELECT * FROM dbo.Projects;<br><br>
                                -- View all skills<br>
                                SELECT * FROM dbo.Skills;<br><br>
                                -- View messages<br>
                                SELECT * FROM dbo.Messages ORDER BY CreatedAt DESC;
                            </code>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Quick Actions -->
        <div class="row mt-4">
            <div class="col-12">
                <div class="card">
                    <div class="card-header bg-warning text-dark">
                        <h5><i class="fas fa-lightning-bolt"></i> Quick Actions</h5>
                    </div>
                    <div class="card-body">
                        <div class="btn-group" role="group">
                            <a href="Default.aspx" target="_blank" class="btn btn-outline-primary">
                                <i class="fas fa-eye"></i> View Portfolio
                            </a>
                            <a href="/Contact.aspx" target="_blank" class="btn btn-outline-info">
                                <i class="fas fa-chart-bar"></i> View Stats Page
                            </a>
                            <button class="btn btn-outline-success" onclick="alert('Database connected! Run the SQL seed files to populate data.')">
                                <i class="fas fa-database"></i> Test Database
                            </button>
                            <asp:Button ID="btnRefresh" runat="server" Text="Refresh Data" CssClass="btn btn-outline-secondary" OnClick="btnLogout_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style>
        .admin-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 2rem;
            border-radius: 12px;
            margin-bottom: 2rem;
        }

        .admin-title {
            font-size: 2rem;
            font-weight: 700;
            margin: 0;
        }

        .admin-subtitle {
            font-size: 1.1rem;
            opacity: 0.9;
            margin: 0.5rem 0 0 0;
        }

        .admin-actions {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .user-badge {
            background: rgba(255, 255, 255, 0.2);
            padding: 0.5rem 1rem;
            border-radius: 25px;
            font-weight: 500;
        }

        .stat-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 12px;
            padding: 2rem;
            color: white;
            position: relative;
            overflow: hidden;
            text-align: center;
        }

        .stat-card.bg-success {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
        }

        .stat-card.bg-warning {
            background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
        }

        .stat-card.bg-danger {
            background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);
        }

        .stat-number {
            font-size: 3rem;
            font-weight: bold;
            margin-bottom: 0.5rem;
        }

        .stat-label {
            font-size: 1.1rem;
            opacity: 0.9;
        }

        .stat-icon {
            position: absolute;
            top: 1rem;
            right: 1rem;
            font-size: 2.5rem;
            opacity: 0.3;
        }

        .code-block {
            background: #f8f9fa;
            border: 1px solid #e9ecef;
            border-radius: 0.375rem;
            padding: 1rem;
            font-family: 'Courier New', monospace;
            font-size: 0.9rem;
        }

        @media (max-width: 768px) {
            .admin-header {
                flex-direction: column;
                gap: 1rem;
                text-align: center;
            }

            .admin-actions {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</asp:Content>