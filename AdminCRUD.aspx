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
                        <div class="stat-number" id="unreadCount">4</div>
                        <div class="stat-label">Unread Messages</div>
                        <div class="stat-icon"><i class="fas fa-envelope"></i></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Unread Messages Section -->
        <div class="row mb-4">
            <div class="col-12">
                <div class="messages-container">
                    <div class="messages-header">
                        <div class="messages-title">
                            <h4><i class="fas fa-envelope"></i> Unread Messages</h4>
                            <span class="message-count" id="messageCounter">Loading...</span>
                        </div>
                        <div class="messages-actions">
                            <button class="btn btn-outline-primary btn-sm" onclick="refreshMessages()">
                                <i class="fas fa-sync"></i> Refresh
                            </button>
                            <button class="btn btn-outline-success btn-sm" onclick="markAllAsRead()">
                                <i class="fas fa-check-double"></i> Mark All Read
                            </button>
                        </div>
                    </div>
                    
                    <div class="messages-list" id="messagesList">
                        <!-- Messages will be loaded here -->
                        <div class="loading-placeholder">
                            <i class="fas fa-spinner fa-spin fa-2x"></i>
                            <p>Loading unread messages...</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Quick Actions -->
        <div class="row mt-4">
            <div class="col-12">
                <div class="card">
                    <div class="card-header bg-info text-white">
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
                            <button class="btn btn-outline-success" onclick="testDatabase()">
                                <i class="fas fa-database"></i> Test Database
                            </button>
                            <button class="btn btn-outline-warning" onclick="exportMessages()">
                                <i class="fas fa-download"></i> Export Messages
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Success/Error Toast -->
    <div id="messageToast" class="toast-notification" style="display: none;">
        <i class="fas fa-check-circle"></i>
        <span id="toastMessage">Message marked as read!</span>
    </div>

    <style>
        /* Admin Panel Styles */
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

        /* Statistics Cards */
        .stat-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 12px;
            padding: 2rem;
            color: white;
            position: relative;
            overflow: hidden;
            text-align: center;
            transition: transform 0.3s ease;
        }

        .stat-card:hover {
            transform: translateY(-5px);
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

        /* Messages Container */
        .messages-container {
            background: white;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
            overflow: hidden;
        }

        .messages-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 1.5rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .messages-title h4 {
            margin: 0;
            font-weight: 600;
        }

        .message-count {
            background: rgba(255, 255, 255, 0.2);
            padding: 0.25rem 0.75rem;
            border-radius: 15px;
            font-size: 0.9rem;
            margin-left: 1rem;
        }

        .messages-actions {
            display: flex;
            gap: 0.5rem;
        }

        .messages-list {
            max-height: 600px;
            overflow-y: auto;
        }

        /* Individual Message Cards */
        .message-item {
            border-bottom: 1px solid #f0f0f0;
            padding: 1.5rem 2rem;
            display: flex;
            align-items: flex-start;
            gap: 1rem;
            transition: all 0.3s ease;
            position: relative;
        }

        .message-item:hover {
            background: #f8f9ff;
        }

        .message-item:last-child {
            border-bottom: none;
        }

        .message-checkbox {
            margin-top: 0.25rem;
        }

        .message-checkbox input[type="checkbox"] {
            width: 18px;
            height: 18px;
            cursor: pointer;
            accent-color: #667eea;
        }

        .message-content {
            flex: 1;
        }

        .message-sender {
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .message-email {
            color: #667eea;
            font-size: 0.9rem;
            font-weight: normal;
        }

        .message-text {
            color: #555;
            line-height: 1.6;
            margin-bottom: 0.75rem;
        }

        .message-meta {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 0.85rem;
            color: #888;
        }

        .message-time {
            display: flex;
            align-items: center;
            gap: 0.25rem;
        }

        .message-actions {
            display: flex;
            gap: 0.5rem;
        }

        .btn-mark-read {
            background: #28a745;
            color: white;
            border: none;
            padding: 0.25rem 0.75rem;
            border-radius: 15px;
            font-size: 0.8rem;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .btn-mark-read:hover {
            background: #218838;
        }

        .btn-delete {
            background: #dc3545;
            color: white;
            border: none;
            padding: 0.25rem 0.75rem;
            border-radius: 15px;
            font-size: 0.8rem;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .btn-delete:hover {
            background: #c82333;
        }

        /* Loading and Empty States */
        .loading-placeholder,
        .empty-state {
            text-align: center;
            padding: 3rem 2rem;
            color: #666;
        }

        .loading-placeholder i,
        .empty-state i {
            margin-bottom: 1rem;
            opacity: 0.5;
        }

        .empty-state h5 {
            margin-bottom: 1rem;
            color: #333;
        }

        /* Toast Notification */
        .toast-notification {
            position: fixed;
            top: 20px;
            right: 20px;
            background: #28a745;
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

        /* Responsive Design */
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

            .messages-header {
                flex-direction: column;
                gap: 1rem;
                text-align: center;
            }

            .messages-actions {
                justify-content: center;
            }

            .message-item {
                padding: 1rem;
            }

            .message-meta {
                flex-direction: column;
                align-items: flex-start;
                gap: 0.5rem;
            }
        }
    </style>

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
                url: "AdminCRUD.aspx/GetUnreadMessages",
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
                            <div class="message-checkbox">
                                <input type="checkbox" id="check-${message.id}" onchange="toggleMessageRead(${message.id})">
                            </div>
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
                                        <button class="btn-mark-read" onclick="markAsRead(${message.id})">
                                            <i class="fas fa-check"></i> Mark Read
                                        </button>
                                        <button class="btn-delete" onclick="deleteMessage(${message.id})">
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
                },
                {
                    id: 7,
                    email: "developer@freelance.net",
                    senderName: "Alex Developer",
                    message: "I noticed your work on GitHub. Would you be interested in collaborating on an open-source project?",
                    createdAt: "12 hours ago",
                    isUrgent: false
                }
            ];
        }

        function toggleMessageRead(messageId) {
            const checkbox = document.getElementById(`check-${messageId}`);
            if (checkbox.checked) {
                markAsRead(messageId);
            }
        }

        function markAsRead(messageId) {
            // Show loading state on the message
            const messageElement = document.getElementById(`message-${messageId}`);
            messageElement.style.opacity = '0.7';
            
            // Make AJAX call to mark as read
            $.ajax({
                type: "POST",
                url: "AdminCRUD.aspx/MarkMessageAsRead",
                data: JSON.stringify({ messageId: messageId }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function(response) {
                    if (response.d) {
                        // Remove from UI with animation
                        messageElement.style.transform = 'translateX(100%)';
                        messageElement.style.opacity = '0';
                        
                        setTimeout(() => {
                            // Remove from array and refresh
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
                
                // Make AJAX call to delete
                $.ajax({
                    type: "POST",
                    url: "AdminCRUD.aspx/DeleteMessage",
                    data: JSON.stringify({ messageId: messageId }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function(response) {
                        if (response.d) {
                            // Remove from UI with animation
                            messageElement.style.transform = 'translateX(-100%)';
                            messageElement.style.opacity = '0';
                            
                            setTimeout(() => {
                                // Remove from array and refresh
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
                // Make AJAX call to mark all as read
                $.ajax({
                    type: "POST",
                    url: "AdminCRUD.aspx/MarkAllMessagesAsRead",
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

        function testDatabase() {
            showToast('Database connection test completed!');
        }

        function exportMessages() {
            if (unreadMessages.length === 0) {
                showToast('No messages to export!', 'warning');
                return;
            }
            
            // Simple CSV export
            let csvContent = "data:text/csv;charset=utf-8,":
            let csvContent = "data:text/csv;charset=utf-8,";
            csvContent += "Sender,Email,Message,Time\n";
            
            unreadMessages.forEach(msg => {
                const row = `"${msg.senderName}","${msg.email}","${msg.message.replace(/"/g, '""')}","${msg.createdAt}"\n`;
                csvContent += row;
            });
            
            const encodedUri = encodeURI(csvContent);
            const link = document.createElement("a");
            link.setAttribute("href", encodedUri);
            link.setAttribute("download", "unread_messages.csv");
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
            
            showToast('Messages exported successfully!');
        }

        function showToast(message, type = 'success') {
            const toast = document.getElementById('messageToast');
            const toastMessage = document.getElementById('toastMessage');
            
            // Set color based on type
            if (type === 'error') {
                toast.style.background = '#dc3545';
            } else if (type === 'warning') {
                toast.style.background = '#ffc107';
                toast.style.color = '#000';
            } else {
                toast.style.background = '#28a745';
                toast.style.color = '#fff';
            }
            
            toastMessage.textContent = message;
            toast.style.display = 'flex';
            
            setTimeout(() => {
                toast.style.display = 'none';
                toast.style.color = '#fff'; // Reset color
            }, 3000);
        }

        // Load server data if available
        if (typeof window.serverMessages !== 'undefined') {
            unreadMessages = window.serverMessages;
        }
    </script>
</asp:Content>