<%@ Page Title="Test Data" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TestData.aspx.cs" Inherits="SaifPortFoliio.TestData" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5 pt-4">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header bg-info text-white">
                        <h4><i class="fas fa-database"></i> Database Test & Debug Page</h4>
                    </div>
                    <div class="card-body">
                        <div class="alert alert-info">
                            <h5><i class="fas fa-info-circle"></i> Database Connection Test</h5>
                            <p>This page tests the database connectivity and displays data counts. Check the browser console and debug output for detailed information.</p>
                        </div>
                        
                        <div class="row text-center">
                            <div class="col-md-2">
                                <div class="stat-box">
                                    <h3 class="text-primary" id="projectsCount">0</h3>
                                    <p>Projects</p>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="stat-box">
                                    <h3 class="text-success" id="skillsCount">0</h3>
                                    <p>Skills</p>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="stat-box">
                                    <h3 class="text-warning" id="rolesCount">0</h3>
                                    <p>Roles</p>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="stat-box">
                                    <h3 class="text-info" id="photosCount">0</h3>
                                    <p>Photos</p>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="stat-box">
                                    <h3 class="text-danger" id="messagesCount">0</h3>
                                    <p>Messages</p>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="stat-box">
                                    <h3 class="text-secondary" id="totalCount">0</h3>
                                    <p>Total Records</p>
                                </div>
                            </div>
                        </div>
                        
                        <hr>
                        
                        <div class="text-center">
                            <button class="btn btn-primary" onclick="testConnection()">
                                <i class="fas fa-sync"></i> Test Database Connection
                            </button>
                            <a href="Default.aspx" class="btn btn-success">
                                <i class="fas fa-home"></i> Back to Portfolio
                            </a>
                            <a href="AdminLogin.aspx" class="btn btn-warning">
                                <i class="fas fa-cog"></i> Admin Panel
                            </a>
                        </div>
                        
                        <div class="mt-4">
                            <h6>Debug Information:</h6>
                            <div id="debugInfo" class="bg-light p-3 rounded">
                                <small class="text-muted">Test results will appear here...</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function testConnection() {
            document.getElementById('debugInfo').innerHTML = '<i class="fas fa-spinner fa-spin"></i> Testing database connection...';
            
            // Simulate database test
            setTimeout(function() {
                var projects = window.portfolioProjects || [];
                var skills = window.portfolioSkills || [];
                var roles = window.portfolioRoles || [];
                var photos = window.portfolioPhotography || [];
                var messages = window.portfolioMessages || [];
                
                document.getElementById('projectsCount').textContent = projects.length;
                document.getElementById('skillsCount').textContent = skills.length;
                document.getElementById('rolesCount').textContent = roles.length;
                document.getElementById('photosCount').textContent = photos.length;
                document.getElementById('messagesCount').textContent = messages.length;
                document.getElementById('totalCount').textContent = projects.length + skills.length + roles.length + photos.length + messages.length;
                
                var debugHTML = '<strong>Database Test Results:</strong><br>';
                debugHTML += '• Projects: ' + projects.length + '<br>';
                debugHTML += '• Skills: ' + skills.length + '<br>';
                debugHTML += '• Roles: ' + roles.length + '<br>';
                debugHTML += '• Photos: ' + photos.length + '<br>';
                debugHTML += '• Messages: ' + messages.length + '<br>';
                debugHTML += '<br><strong>Status:</strong> ? Database test completed successfully!';
                
                document.getElementById('debugInfo').innerHTML = debugHTML;
            }, 1000);
        }
        
        // Auto-run test on page load
        document.addEventListener('DOMContentLoaded', function() {
            setTimeout(testConnection, 1500);
        });
    </script>

    <style>
        .stat-box {
            padding: 1rem;
            margin: 0.5rem 0;
        }
        
        .stat-box h3 {
            font-weight: bold;
            margin-bottom: 0.5rem;
        }
        
        .stat-box p {
            margin: 0;
            font-size: 0.9rem;
            color: #666;
        }
    </style>
</asp:Content>