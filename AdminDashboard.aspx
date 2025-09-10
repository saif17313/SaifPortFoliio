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

        /* Content Sections */
        .content-section {
            background: var(--white);
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(88, 101, 242, 0.08);
            overflow: hidden;
            margin-bottom: 2rem;
        }

        .section-header {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            color: white;
            padding: 1.5rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .section-title {
            margin: 0;
            font-weight: 600;
            font-size: 1.2rem;
        }

        .section-count {
            background: rgba(255, 255, 255, 0.2);
            padding: 0.25rem 0.75rem;
            border-radius: 15px;
            font-size: 0.9rem;
            margin-left: 1rem;
        }

        .section-actions {
            display: flex;
            gap: 0.5rem;
        }

        .section-content {
            max-height: 500px;
            overflow-y: auto;
        }

        /* Message Items */
        .message-item {
            border-bottom: 1px solid var(--border-color);
            padding: 1.5rem 2rem;
            display: flex;
            align-items: flex-start;
            gap: 1rem;
            transition: all 0.3s ease;
        }

        .message-item:hover {
            background: var(--section-bg);
        }

        .message-item:last-child {
            border-bottom: none;
        }

        .message-content {
            flex: 1;
        }

        .message-sender {
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .message-email {
            color: var(--primary-color);
            font-size: 0.9rem;
            font-weight: normal;
        }

        .message-text {
            color: var(--text-light);
            line-height: 1.6;
            margin-bottom: 0.75rem;
        }

        .message-meta {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 0.85rem;
            color: var(--text-light);
        }

        .message-actions {
            display: flex;
            gap: 0.5rem;
        }

        .btn-action {
            padding: 0.25rem 0.75rem;
            border: none;
            border-radius: 15px;
            font-size: 0.8rem;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-mark-read {
            background: #10B981;
            color: white;
        }

        .btn-mark-read:hover {
            background: #059669;
        }

        .btn-delete {
            background: #EF4444;
            color: white;
        }

        .btn-delete:hover {
            background: #DC2626;
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

            .section-header {
                flex-direction: column;
                gap: 1rem;
                text-align: center;
            }

            .section-actions {
                justify-content: center;
            }
        }

        /* Loading States */
        .loading-placeholder,
        .empty-state {
            text-align: center;
            padding: 3rem 2rem;
            color: var(--text-light);
        }

        .loading-placeholder i,
        .empty-state i {
            margin-bottom: 1rem;
            opacity: 0.5;
        }

        .empty-state h5 {
            margin-bottom: 1rem;
            color: var(--text-dark);
        }

        /* Toast Notification */
        .toast-notification {
            position: fixed;
            top: 20px;
            right: 20px;
            background: #10B981;
            color: white;
            padding: 1rem 1.5rem;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            z-index: 1050;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            animation: slideInRight 0.3s ease;
        }

        @keyframes slideInRight {
            from { transform: translateX(100%); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
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
                        <span class="nav-card-text">Manage Messages</span>
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

            <!-- Unread Messages Section -->
            <div class="content-section">
                <div class="section-header">
                    <div class="d-flex align-items-center">
                        <h4 class="section-title"><i class="fas fa-envelope"></i> Unread Messages</h4>
                        <span class="section-count" id="messageCounter">Loading...</span>
                    </div>
                    <div class="section-actions">
                        <button class="btn btn-outline-light btn-sm" onclick="refreshMessages()">
                            <i class="fas fa-sync"></i> Refresh
                        </button>
                        <button class="btn btn-outline-light btn-sm" onclick="markAllAsRead()">
                            <i class="fas fa-check-double"></i> Mark All Read
                        </button>
                    </div>
                </div>
                
                <div class="section-content" id="messagesList">
                    <!-- Messages will be loaded here -->
                    <div class="loading-placeholder">
                        <i class="fas fa-spinner fa-spin fa-2x"></i>
                        <p>Loading unread messages...</p>
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <div class="dashboard-footer">
                © 2025 Saif. All rights reserved.
            </div>
        </div>

        <!-- Success/Error Toast -->
        <div id="messageToast" class="toast-notification" style="display: none;">
            <i class="fas fa-check-circle"></i>
            <span id="toastMessage">Action completed!</span>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        // Global variables
        let unreadMessages = [];

        // Load messages when page loads
        document.addEventListener('DOMContentLoaded', function() {
            loadUnreadMessages();
        });

        function loadUnreadMessages() {
            const messagesList = document.getElementById('messagesList');
            const messageCounter = document.getElementById('messageCounter');
            const unreadCount = document.getElementById('unreadCount');

            // Show loading state
            messagesList.innerHTML = `
                <div class="loading-placeholder">
                    <i class="fas fa-spinner fa-spin fa-2x"></i>
                    <p>Loading unread messages...</p>
                </div>
            `;

            // Make AJAX call to get unread messages
            $.ajax({
                type: "POST",
                url: "AdminDashboard.aspx/GetUnreadMessages",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function(response) {
                    unreadMessages = response.d || [];
                    displayMessages();
                },
                error: function(xhr, status, error) {
                    console.error('Error loading messages:', error);
                    // Fallback to sample data
                    loadSampleData();
                    displayMessages();
                }
            });

            function displayMessages() {
                if (unreadMessages.length === 0) {
                    messagesList.innerHTML = `
                        <div class="empty-state">
                            <i class="fas fa-inbox fa-3x"></i>
                            <h5>No Unread Messages</h5>
                            <p>All caught up! You have no unread messages at the moment.</p>
                        </div>
                    `;
                    messageCounter.textContent = "0 unread messages";
                    unreadCount.textContent = "0";
                    return;
                }

                let html = '';
                unreadMessages.forEach(message => {
                    html += `
                        <div class="message-item" id="message-${message.id}">
                            <div class="message-content">
                                <div class="message-sender">
                                    ${message.senderName}
                                    <span class="message-email">&lt;${message.email}&gt;</span>
                                    ${message.isUrgent ? '<span class="badge bg-danger">Urgent</span>' : ''}
                                </div>
                                <div class="message-text">
                                    ${message.message}
                                </div>
                                <div class="message-meta">
                                    <div class="message-time">
                                        <i class="fas fa-clock"></i>
                                        ${message.createdAt}
                                    </div>
                                    <div class="message-actions">
                                        <button class="btn-action btn-mark-read" onclick="markAsRead(${message.id})">
                                            <i class="fas fa-check"></i> Mark Read
                                        </button>
                                        <button class="btn-action btn-delete" onclick="deleteMessage(${message.id})">
                                            <i class="fas fa-trash"></i> Delete
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    `;
                });

                messagesList.innerHTML = html;
                messageCounter.textContent = `${unreadMessages.length} unread message${unreadMessages.length !== 1 ? 's' : ''}`;
                unreadCount.textContent = unreadMessages.length;
            }
        }

        function loadSampleData() {
            // Fallback sample data when server is not available
            unreadMessages = [
                {
                    id: 1,
                    email: "john.doe@example.com",
                    senderName: "John Doe",
                    message: "Hi Abdullah, I saw your portfolio and I'm interested in discussing a web development project. Please contact me when you have a chance.",
                    createdAt: "2 hours ago",
                    isUrgent: false
                },
                {
                    id: 3,
                    email: "mike.johnson@startup.io",
                    senderName: "Mike Johnson",
                    message: "Love your photography section! Are you available for freelance photo work? We need someone for our product launch.",
                    createdAt: "5 hours ago",
                    isUrgent: true
                },
                {
                    id: 4,
                    email: "contact@webagency.com",
                    senderName: "Web Agency Team",
                    message: "Your skills in ASP.NET caught our attention. We're looking for a developer to join our team. Let's discuss!",
                    createdAt: "3 days ago",
                    isUrgent: false
                }
            ];
        }

        function markAsRead(messageId) {
            const messageElement = document.getElementById(`message-${messageId}`);
            messageElement.style.opacity = '0.7';
            
            // Make AJAX call to mark as read
            $.ajax({
                type: "POST",
                url: "AdminDashboard.aspx/MarkMessageAsRead",
                data: JSON.stringify({ messageId: messageId }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function(response) {
                    if (response.d) {
                        messageElement.style.transform = 'translateX(100%)';
                        messageElement.style.opacity = '0';
                        
                        setTimeout(() => {
                            unreadMessages = unreadMessages.filter(msg => msg.id !== messageId);
                            loadUnreadMessages();
                            showToast('Message marked as read!');
                        }, 300);
                    } else {
                        messageElement.style.opacity = '1';
                        showToast('Failed to mark message as read!', 'error');
                    }
                },
                error: function(xhr, status, error) {
                    console.error('Error marking message as read:', error);
                    messageElement.style.opacity = '1';
                    showToast('Error connecting to server!', 'error');
                }
            });
        }

        function deleteMessage(messageId) {
            if (confirm('Are you sure you want to delete this message?')) {
                const messageElement = document.getElementById(`message-${messageId}`);
                messageElement.style.opacity = '0.7';
                
                $.ajax({
                    type: "POST",
                    url: "AdminDashboard.aspx/DeleteMessage",
                    data: JSON.stringify({ messageId: messageId }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function(response) {
                        if (response.d) {
                            messageElement.style.transform = 'translateX(-100%)';
                            messageElement.style.opacity = '0';
                            
                            setTimeout(() => {
                                unreadMessages = unreadMessages.filter(msg => msg.id !== messageId);
                                loadUnreadMessages();
                                showToast('Message deleted successfully!');
                            }, 300);
                        } else {
                            messageElement.style.opacity = '1';
                            showToast('Failed to delete message!', 'error');
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error('Error deleting message:', error);
                        messageElement.style.opacity = '1';
                        showToast('Error connecting to server!', 'error');
                    }
                });
            }
        }

        function markAllAsRead() {
            if (unreadMessages.length === 0) {
                showToast('No unread messages to mark!', 'warning');
                return;
            }

            if (confirm(`Mark all ${unreadMessages.length} messages as read?`)) {
                $.ajax({
                    type: "POST",
                    url: "AdminDashboard.aspx/MarkAllMessagesAsRead",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function(response) {
                        if (response.d) {
                            unreadMessages = [];
                            loadUnreadMessages();
                            showToast('All messages marked as read!');
                        } else {
                            showToast('Failed to mark all messages as read!', 'error');
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error('Error marking all messages as read:', error);
                        showToast('Error connecting to server!', 'error');
                    }
                });
            }
        }

        function refreshMessages() {
            loadUnreadMessages();
            showToast('Messages refreshed!');
        }

        function showToast(message, type = 'success') {
            const toast = document.getElementById('messageToast');
            const toastMessage = document.getElementById('toastMessage');
            
            toastMessage.textContent = message;
            
            if (type === 'error') {
                toast.style.background = '#EF4444';
            } else if (type === 'warning') {
                toast.style.background = '#F59E0B';
            } else {
                toast.style.background = '#10B981';
            }
            
            toast.style.display = 'flex';
            
            setTimeout(() => {
                toast.style.display = 'none';
            }, 3000);
        }
    </script>
</body>
</html>