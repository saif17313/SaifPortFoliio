<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="SaifPortFoliio.AdminDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    
    <style>
        :root {
            --primary-color: #5865F2;
            --secondary-color: #4752C4;
            --light-blue: #E8F2FF;
            --dark-blue: #2E3A7A;
            --text-dark: #2D3748;
            --text-light: #718096;
            --border-color: #E2E8F0;
            --section-bg: #F7FAFC;
            --white: #FFFFFF;
        }

        body {
            background: linear-gradient(135deg, #F7FAFC 0%, #EDF2F7 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
        }

        .dashboard-container {
            min-height: 100vh;
            padding: 2rem;
        }

        /* Admin Header */
        .admin-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            color: white;
            padding: 2rem;
            border-radius: 16px;
            margin-bottom: 2rem;
            box-shadow: 0 10px 30px rgba(88, 101, 242, 0.15);
        }

        .admin-title {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
            text-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .admin-subtitle {
            color: rgba(255, 255, 255, 0.9);
            font-size: 1.2rem;
            font-weight: 400;
            margin: 0;
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
            backdrop-filter: blur(10px);
        }

        /* Navigation Cards */
        .nav-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .nav-card {
            background: var(--white);
            border-radius: 12px;
            padding: 1.5rem;
            text-decoration: none;
            color: var(--text-dark);
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(88, 101, 242, 0.08);
            border: 2px solid transparent;
        }

        .nav-card:hover {
            color: var(--text-dark);
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(88, 101, 242, 0.15);
            border-color: var(--primary-color);
        }

        .nav-card-content {
            display: flex;
            align-items: center;
        }

        .nav-card-icon {
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
            font-size: 1.5rem;
            color: white;
        }

        .nav-card-text {
            font-size: 1.1rem;
            font-weight: 600;
        }

        /* Statistics Cards */
        .stats-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .stat-card {
            background: var(--white);
            border-radius: 12px;
            padding: 1.5rem;
            text-align: center;
            transition: transform 0.3s ease;
            box-shadow: 0 5px 15px rgba(88, 101, 242, 0.08);
            position: relative;
            overflow: hidden;
        }

        .stat-card:hover {
            transform: translateY(-5px);
        }

        .stat-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
        }

        .stat-number {
            font-size: 2.5rem;
            font-weight: bold;
            color: var(--primary-color);
            margin-bottom: 0.5rem;
        }

        .stat-label {
            font-size: 1rem;
            color: var(--text-light);
            font-weight: 500;
        }

        .stat-icon {
            position: absolute;
            top: 1rem;
            right: 1rem;
            font-size: 2rem;
            color: var(--primary-color);
            opacity: 0.2;
        }

        /* Footer */
        .dashboard-footer {
            text-align: center;
            color: var(--text-light);
            font-size: 0.9rem;
            margin-top: 2rem;
            padding: 1rem;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .dashboard-container {
                padding: 1rem;
            }

            .admin-header {
                flex-direction: column;
                gap: 1rem;
                text-align: center;
            }

            .admin-actions {
                width: 100%;
                justify-content: center;
            }

            .admin-title {
                font-size: 2rem;
            }

            .nav-cards {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard-container">
            <!-- Admin Header -->
            <div class="admin-header">
                <div>
                    <h1 class="admin-title">Admin Dashboard</h1>
                    <p class="admin-subtitle">Complete portfolio management system</p>
                </div>
                <div class="admin-actions">
                    <span class="user-badge">
                        <i class="fas fa-user"></i> <%: Session["AdminUsername"] ?? "Admin" %>
                    </span>
                    <asp:Button ID="btnSignOut" runat="server" Text="Sign out" CssClass="btn btn-outline-light" OnClick="btnSignOut_Click" />
                    <a href="Default.aspx" target="_blank" class="btn btn-outline-light">
                        <i class="fas fa-eye"></i> View Portfolio
                    </a>
                </div>
            </div>

            <!-- Navigation Cards -->
            <div class="nav-cards">
                <a href="Admin/Project.aspx" class="nav-card">
                    <div class="nav-card-content">
                        <div class="nav-card-icon">
                            <i class="fas fa-laptop-code"></i>
                        </div>
                        <span class="nav-card-text">Manage Projects</span>
                    </div>
                </a>

                <a href="Admin/Skill.aspx" class="nav-card">
                    <div class="nav-card-content">
                        <div class="nav-card-icon">
                            <i class="fas fa-tools"></i>
                        </div>
                        <span class="nav-card-text">Manage Skills</span>
                    </div>
                </a>

                <a href="Admin/Role.aspx" class="nav-card">
                    <div class="nav-card-content">
                        <div class="nav-card-icon">
                            <i class="fas fa-user-cog"></i>
                        </div>
                        <span class="nav-card-text">Manage Roles</span>
                    </div>
                </a>

                <a href="Admin/Photography.aspx" class="nav-card">
                    <div class="nav-card-content">
                        <div class="nav-card-icon">
                            <i class="fas fa-camera"></i>
                        </div>
                        <span class="nav-card-text">Manage Photography</span>
                    </div>
                </a>

                <a href="Admin/Message.aspx" class="nav-card">
                    <div class="nav-card-content">
                        <div class="nav-card-icon">
                            <i class="fas fa-envelope"></i>
                        </div>
                        <span class="nav-card-text">Show Messages</span>
                    </div>
                </a>
            </div>

            <!-- Statistics Dashboard -->
            <div class="stats-cards">
                <div class="stat-card">
                    <div class="stat-icon"><i class="fas fa-laptop-code"></i></div>
                    <div class="stat-number" id="projectCount">6</div>
                    <div class="stat-label">Projects</div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon"><i class="fas fa-tools"></i></div>
                    <div class="stat-number" id="skillCount">10</div>
                    <div class="stat-label">Skills</div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon"><i class="fas fa-camera"></i></div>
                    <div class="stat-number" id="photoCount">8</div>
                    <div class="stat-label">Photos</div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon"><i class="fas fa-envelope"></i></div>
                    <div class="stat-number" id="unreadCount">4</div>
                    <div class="stat-label">Unread Messages</div>
                </div>
            </div>

            <!-- Footer -->
            <div class="dashboard-footer">
                © 2025 Saif. All rights reserved.
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</body>
</html>