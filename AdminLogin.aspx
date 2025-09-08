<%@ Page Title="Admin Login" Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="SaifPortFoliio.AdminLogin" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Login - Portfolio</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .login-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: 100%;
            max-width: 400px;
            padding: 0;
        }
        
        .login-header {
            background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
            color: white;
            text-align: center;
            padding: 2rem;
        }
        
        .login-header h2 {
            margin: 0;
            font-weight: 600;
        }
        
        .login-header p {
            margin: 0.5rem 0 0 0;
            opacity: 0.9;
        }
        
        .login-body {
            padding: 2rem;
        }
        
        .form-group {
            margin-bottom: 1.5rem;
            position: relative;
        }
        
        .form-control {
            border-radius: 10px;
            border: 2px solid #e9ecef;
            padding: 0.75rem 1rem 0.75rem 3rem;
            font-size: 1rem;
            transition: all 0.3s ease;
        }
        
        .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        }
        
        .input-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: #6c757d;
        }
        
        .btn-login {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            border-radius: 10px;
            padding: 0.75rem 2rem;
            font-weight: 600;
            width: 100%;
            transition: all 0.3s ease;
        }
        
        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(102, 126, 234, 0.3);
        }
        
        .error-message {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
            border-radius: 8px;
            padding: 0.75rem;
            margin-bottom: 1rem;
            display: none;
        }
        
        .back-link {
            text-align: center;
            margin-top: 1.5rem;
        }
        
        .back-link a {
            color: #667eea;
            text-decoration: none;
            font-weight: 500;
        }
        
        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <div class="login-header">
                <i class="fas fa-shield-alt fa-2x mb-3"></i>
                <h2>Admin Panel</h2>
                <p>Portfolio Management System</p>
            </div>
            
            <div class="login-body">
                <asp:Panel ID="pnlError" runat="server" CssClass="error-message" Visible="false">
                    <i class="fas fa-exclamation-triangle"></i>
                    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                </asp:Panel>
                
                <div class="form-group">
                    <i class="fas fa-user input-icon"></i>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Username" />
                </div>
                
                <div class="form-group">
                    <i class="fas fa-lock input-icon"></i>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password" />
                </div>
                
                <asp:Button ID="btnLogin" runat="server" Text="Login to Admin Panel" CssClass="btn btn-primary btn-login" OnClick="btnLogin_Click" />
                
                <div class="back-link">
                    <a href="Default.aspx">
                        <i class="fas fa-arrow-left"></i> Back to Portfolio
                    </a>
                </div>
            </div>
        </div>
    </form>
    
    <script>
        // Auto-focus on username field
        document.addEventListener('DOMContentLoaded', function() {
            document.getElementById('<%=txtUsername.ClientID%>').focus();
        });
        
        // Enter key support
        document.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                document.getElementById('<%=btnLogin.ClientID%>').click();
            }
        });
    </script>
</body>
</html>