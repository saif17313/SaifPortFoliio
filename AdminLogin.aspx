<%@ Page Title="Admin Login" Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="SaifPortFoliio.AdminLogin" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Login - Portfolio Dashboard</title>
    
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    
   
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    
    
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    
    <style type="text/css">
        body {
            font-family: 'Inter', sans-serif;
            background: #5865F2;
            min-height: 100vh;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-container {
            width: 100%;
            max-width: 1200px;
            height: 100vh;
            display: flex;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.15);
            overflow: hidden;
            background: #FFFFFF;
        }

        /* Left Side - Illustration */
        .login-left {
            flex: 1;
            background: linear-gradient(135deg, #E8F2FF 0%, #F0F7FF 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }

        .illustration-container {
            position: relative;
            z-index: 2;
            text-align: center;
            max-width: 400px;
            padding: 2rem;
        }

        .admin-illustration {
            width: 280px;
            height: 280px;
            margin: 0 auto 2rem;
            background: linear-gradient(135deg, #5865F2, #4752C4);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
            border: 6px solid #FFFFFF;
            box-shadow: 0 20px 40px rgba(88, 101, 242, 0.2);
        }

        .profile-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 50%;
        }

        .profile-placeholder {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 80px;
            background: linear-gradient(135deg, #5865F2, #4752C4);
            border-radius: 50%;
        }

        .illustration-text {
            color: #2E3A7A;
            margin-top: 1rem;
        }

        .illustration-title {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
            color: #5865F2;
        }

        .illustration-subtitle {
            font-size: 1rem;
            color: #718096;
            line-height: 1.5;
        }

        /* Floating Elements */
        .floating-element {
            position: absolute;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            animation: float 6s ease-in-out infinite;
        }

        .floating-element:nth-child(1) {
            width: 60px;
            height: 60px;
            top: 20%;
            left: 10%;
            animation-delay: 0s;
        }

        .floating-element:nth-child(2) {
            width: 40px;
            height: 40px;
            top: 60%;
            right: 15%;
            animation-delay: 2s;
        }

        .floating-element:nth-child(3) {
            width: 80px;
            height: 80px;
            bottom: 20%;
            left: 20%;
            animation-delay: 4s;
        }

        @keyframes float {
            0%, 100% { 
                transform: translateY(0px) rotate(0deg); 
            }
            50% { 
                transform: translateY(-20px) rotate(180deg); 
            }
        }

        /* Right Side - Login Form */
        .login-right {
            flex: 1;
            background: #FFFFFF;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 3rem;
        }

        .login-form-container {
            width: 100%;
            max-width: 400px;
        }

        .login-header {
            text-align: center;
            margin-bottom: 3rem;
        }

        .login-title {
            font-size: 2rem;
            font-weight: 700;
            color: #2D3748;
            margin-bottom: 0.5rem;
        }

        .login-subtitle {
            font-size: 1rem;
            color: #718096;
            font-weight: 400;
        }

        .form-group {
            margin-bottom: 1.5rem;
            position: relative;
        }

        .form-label {
            display: block;
            font-size: 0.875rem;
            font-weight: 500;
            color: #2D3748;
            margin-bottom: 0.5rem;
        }

        .form-control {
            width: 100%;
            padding: 1rem 1.25rem;
            font-size: 1rem;
            line-height: 1.5;
            color: #2D3748;
            background: #FFFFFF;
            border: 2px solid #E2E8F0;
            border-radius: 12px;
            transition: all 0.3s ease;
            font-family: 'Inter', sans-serif;
        }

        .form-control:focus {
            outline: none;
            border-color: #5865F2;
            box-shadow: 0 0 0 4px rgba(88, 101, 242, 0.1);
            background: #FFFFFF;
        }

        .form-control::placeholder {
            color: #718096;
        }

        .btn-login {
            width: 100%;
            padding: 1rem 1.5rem;
            font-size: 1rem;
            font-weight: 600;
            color: #FFFFFF;
            background: #5865F2;
            border: none;
            border-radius: 12px;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            cursor: pointer;
            margin-top: 1rem;
        }

        .btn-login:hover {
            background: #4752C4;
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(88, 101, 242, 0.3);
        }

        .btn-login:active {
            transform: translateY(0);
        }

        .back-link {
            text-align: center;
            margin-top: 2rem;
            padding-top: 2rem;
            border-top: 1px solid #E2E8F0;
        }

        .back-link a {
            color: #718096;
            text-decoration: none;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            transition: all 0.3s ease;
        }

        .back-link a:hover {
            color: #5865F2;
            transform: translateX(-3px);
        }

        /* Error Message */
        .error-message {
            background: #FEF2F2;
            color: #991B1B;
            border: 1px solid #FCA5A5;
            border-radius: 8px;
            padding: 1rem;
            margin-bottom: 1.5rem;
            font-size: 0.875rem;
        }

        .error-message i {
            margin-right: 0.5rem;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .login-container {
                flex-direction: column;
                height: auto;
                min-height: 100vh;
            }

            .login-left {
                flex: none;
                height: 40vh;
                min-height: 300px;
            }

            .login-right {
                flex: none;
                padding: 2rem 1.5rem;
            }

            .illustration-title {
                font-size: 1.25rem;
            }

            .login-title {
                font-size: 1.75rem;
            }
        }

        @media (max-width: 480px) {
            .login-right {
                padding: 1.5rem 1rem;
            }

            .login-form-container {
                max-width: 100%;
            }
        }

        /* Loading Animation */
        .loading-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.9);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 1000;
            opacity: 0;
            visibility: hidden;
            transition: all 0.3s ease;
        }

        .loading-overlay.show {
            opacity: 1;
            visibility: visible;
        }

        .loading-spinner {
            width: 40px;
            height: 40px;
            border: 3px solid #E2E8F0;
            border-top: 3px solid #5865F2;
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <!-- Left Side - Illustration -->
            <div class="login-left">
                <div class="floating-element"></div>
                <div class="floating-element"></div>
                <div class="floating-element"></div>
                
                <div class="illustration-container">
                    <div class="admin-illustration">
                        <img src="/Content/img/profile/profile.jpg" alt="Abdullah Al Saif" class="profile-image"
                             onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';"
                             onload="this.style.display='block'; this.nextElementSibling.style.display='none';" />
                        <div class="profile-placeholder">
                            ?????
                        </div>
                    </div>
                    <div class="illustration-text">
                        <h2 class="illustration-title">Portfolio Admin</h2>
                        <p class="illustration-subtitle">
                            Manage your portfolio content, view analytics, and control your professional presence
                        </p>
                    </div>
                </div>
            </div>

            <!-- Right Side - Login Form -->
            <div class="login-right">
                <div class="login-form-container">
                    <div class="login-header">
                        <h1 class="login-title">Login to Dashboard</h1>
                        <p class="login-subtitle">Enter your credentials to access admin panel</p>
                    </div>

                    <asp:Panel ID="pnlError" runat="server" CssClass="error-message" Visible="false">
                        <i class="fas fa-exclamation-triangle"></i>
                        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                    </asp:Panel>

                    <div class="form-group">
                        <label for="<%=txtUsername.ClientID%>" class="form-label">Username</label>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter your username" autocomplete="username" />
                    </div>

                    <div class="form-group">
                        <label for="<%=txtPassword.ClientID%>" class="form-label">Password</label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter your password" autocomplete="current-password" />
                    </div>

                    <asp:Button ID="btnLogin" runat="server" Text="LOGIN" CssClass="btn-login" OnClick="btnLogin_Click" />

                    <div class="back-link">
                        <a href="Default.aspx">
                            <i class="fas fa-arrow-left"></i>
                            Back to Portfolio
                        </a>
                    </div>

                    <div class="loading-overlay" id="loadingOverlay">
                        <div class="loading-spinner"></div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script type="text/javascript">
        // Auto-focus on username field
        document.addEventListener('DOMContentLoaded', function() {
            var usernameField = document.getElementById('<%= txtUsername.ClientID %>');
            if (usernameField) {
                usernameField.focus();
            }
            
            // Show error with animation if present
            var errorPanel = document.querySelector('.error-message');
            if (errorPanel && errorPanel.style.display !== 'none') {
                errorPanel.classList.add('show');
            }
        });

        // Loading animation on form submit
        function showLoading() {
            var usernameField = document.getElementById('<%= txtUsername.ClientID %>');
            var passwordField = document.getElementById('<%= txtPassword.ClientID %>');
            
            if (usernameField && passwordField && usernameField.value.trim() && passwordField.value.trim()) {
                var loadingOverlay = document.getElementById('loadingOverlay');
                if (loadingOverlay) {
                    loadingOverlay.classList.add('show');
                }
            }
        }

        // Enter key support
        document.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                e.preventDefault();
                var loginButton = document.getElementById('<%= btnLogin.ClientID %>');
                if (loginButton) {
                    showLoading();
                    loginButton.click();
                }
            }
        });

        // Form validation feedback
        document.addEventListener('DOMContentLoaded', function() {
            var inputs = document.querySelectorAll('.form-control');
            inputs.forEach(function(input) {
                input.addEventListener('blur', function() {
                    if (this.value.trim() === '') {
                        this.style.borderColor = '#FCA5A5';
                    } else {
                        this.style.borderColor = '#E2E8F0';
                    }
                });

                input.addEventListener('focus', function() {
                    this.style.borderColor = '#5865F2';
                });
            });
        });
    </script>
</body>
</html>