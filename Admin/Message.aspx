<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Message.aspx.cs" Inherits="SaifPortFoliio.Admin.Message" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Show Messages</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    
    <style>
        :root {
            --primary-color: #5865F2;
            --secondary-color: #4752C4;
            --light-blue: #E8F2FF;
            --text-dark: #2D3748;
            --text-light: #718096;
            --border-color: #E2E8F0;
            --section-bg: #F7FAFC;
            --white: #FFFFFF;
        }

        body {
            background: linear-gradient(135deg, #F7FAFC 0%, #EDF2F7 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
        }

        .message-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem;
        }

        /* Header */
        .page-header {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            color: white;
            padding: 2rem;
            border-radius: 16px;
            margin-bottom: 2rem;
            box-shadow: 0 10px 30px rgba(88, 101, 242, 0.15);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .page-title {
            font-size: 2rem;
            font-weight: 700;
            margin: 0;
        }

        .back-button {
            background: rgba(255, 255, 255, 0.2);
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .back-button:hover {
            background: rgba(255, 255, 255, 0.3);
            color: white;
            transform: translateY(-2px);
        }

        /* Messages Section */
        .messages-section {
            background: var(--white);
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(88, 101, 242, 0.08);
            overflow: hidden;
        }

        .messages-header {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            color: white;
            padding: 1.5rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .messages-title {
            display: flex;
            align-items: center;
        }

        .messages-title h3 {
            margin: 0;
            font-weight: 600;
            font-size: 1.3rem;
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

        .btn-action {
            padding: 0.5rem 1rem;
            border: 1px solid rgba(255, 255, 255, 0.3);
            background: rgba(255, 255, 255, 0.1);
            color: white;
            border-radius: 6px;
            font-size: 0.9rem;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-action:hover {
            background: rgba(255, 255, 255, 0.2);
            border-color: rgba(255, 255, 255, 0.5);
        }

        /* Message List */
        .messages-list {
            max-height: 600px;
            overflow-y: auto;
        }

        .message-item {
            border-bottom: 1px solid var(--border-color);
            padding: 1.5rem 2rem;
            transition: all 0.3s ease;
            position: relative;
        }

        .message-item:hover {
            background: var(--section-bg);
        }

        .message-item:last-child {
            border-bottom: none;
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

        .message-time {
            display: flex;
            align-items: center;
            gap: 0.25rem;
        }

        .message-status {
            padding: 0.2rem 0.5rem;
            border-radius: 10px;
            font-size: 0.7rem;
            font-weight: 500;
        }

        .status-read {
            background: #10B981;
            color: white;
        }

        .status-unread {
            background: #F59E0B;
            color: white;
        }

        /* Loading and Empty States */
        .loading-state,
        .empty-state {
            text-align: center;
            padding: 3rem 2rem;
            color: var(--text-light);
        }

        .loading-state i,
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
            display: none;
            align-items: center;
            gap: 0.5rem;
            animation: slideInRight 0.3s ease;
        }

        @keyframes slideInRight {
            from { transform: translateX(100%); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }

        /* Responsive */
        @media (max-width: 768px) {
            .message-container {
                padding: 1rem;
            }

            .page-header {
                flex-direction: column;
                gap: 1rem;
                text-align: center;
            }

            .messages-header {
                flex-direction: column;
                gap: 1rem;
                text-align: center;
            }

            .message-meta {
                flex-direction: column;
                align-items: flex-start;
                gap: 0.5rem;
            }

            .message-item {
                padding: 1rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="message-container">
            <!-- Page Header -->
            <div class="page-header">
                <h1 class="page-title">
                    <i class="fas fa-envelope"></i> Show Messages
                </h1>
                <a href="../AdminDashboard.aspx" class="back-button">
                    <i class="fas fa-arrow-left"></i> Back to Dashboard
                </a>
            </div>

            <!-- Messages Section -->
            <div class="messages-section">
                <div class="messages-header">
                    <div class="messages-title">
                        <h3><i class="fas fa-envelope"></i> All Messages</h3>
                        <span class="message-count" id="messageCounter">Loading...</span>
                    </div>
                    <div class="messages-actions">
                        <button class="btn-action" onclick="refreshMessages()">
                            <i class="fas fa-sync"></i> Refresh
                        </button>
                    </div>
                </div>
                
                <div class="messages-list" id="messagesList">
                    <!-- Messages will be loaded here -->
                    <div class="loading-state">
                        <i class="fas fa-spinner fa-spin fa-2x"></i>
                        <p>Loading messages...</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Success/Error Toast -->
        <div id="messageToast" class="toast-notification">
            <i class="fas fa-check-circle"></i>
            <span id="toastMessage">Action completed!</span>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        // Global variables
        let allMessages = [];

        // Load messages when page loads
        document.addEventListener('DOMContentLoaded', function() {
            console.log('DOM loaded, checking for server messages...');
            
            // First try to load from server-injected data
            if (window.serverMessages && window.serverMessages.length > 0) {
                console.log('Loading from server data:', window.serverMessages);
                allMessages = window.serverMessages;
                displayMessages();
            } else if (window.serverMessagesError) {
                console.error('Server error loading messages');
                showError();
            } else {
                console.log('No server data, making AJAX call...');
                loadAllMessages();
            }
        });

        function loadAllMessages() {
            const messagesList = document.getElementById('messagesList');
            const messageCounter = document.getElementById('messageCounter');

            // Show loading state
            messagesList.innerHTML = `
                <div class="loading-state">
                    <i class="fas fa-spinner fa-spin fa-2x"></i>
                    <p>Loading messages...</p>
                </div>
            `;

            // Make AJAX call to get all messages
            $.ajax({
                type: "POST",
                url: "Message.aspx/GetAllMessages",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function(response) {
                    console.log('AJAX response:', response);
                    allMessages = response.d || [];
                    displayMessages();
                },
                error: function(xhr, status, error) {
                    console.error('AJAX Error:', error);
                    console.error('Response:', xhr.responseText);
                    showError();
                }
            });
        }

        function displayMessages() {
            const messagesList = document.getElementById('messagesList');
            const messageCounter = document.getElementById('messageCounter');
            
            console.log('Displaying messages:', allMessages);

            if (!allMessages || allMessages.length === 0) {
                messagesList.innerHTML = `
                    <div class="empty-state">
                        <i class="fas fa-inbox fa-3x"></i>
                        <h5>No Messages Found</h5>
                        <p>No messages have been received yet.</p>
                    </div>
                `;
                messageCounter.textContent = "0 messages";
                return;
            }

            let html = '';
            allMessages.forEach(message => {
                const statusClass = message.isRead ? 'status-read' : 'status-unread';
                const statusText = message.isRead ? 'Read' : 'Unread';
                
                html += `
                    <div class="message-item">
                        <div class="message-sender">
                            ${message.email}
                            <span class="message-status ${statusClass}">${statusText}</span>
                        </div>
                        <div class="message-text">
                            ${message.message}
                        </div>
                        <div class="message-meta">
                            <div class="message-time">
                                <i class="fas fa-clock"></i>
                                ${message.createdAt}
                            </div>
                        </div>
                    </div>
                `;
            });

            messagesList.innerHTML = html;
            messageCounter.textContent = `${allMessages.length} message${allMessages.length !== 1 ? 's' : ''}`;
        }

        function showError() {
            const messagesList = document.getElementById('messagesList');
            messagesList.innerHTML = `
                <div class="empty-state">
                    <i class="fas fa-exclamation-triangle fa-3x"></i>
                    <h5>Error Loading Messages</h5>
                    <p>Unable to load messages from database. Please check your database connection and try again.</p>
                    <button class="btn btn-primary" onclick="loadAllMessages()">Try Again</button>
                </div>
            `;
        }

        function refreshMessages() {
            loadAllMessages();
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
