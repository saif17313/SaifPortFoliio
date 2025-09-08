<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="SaifPortFoliio.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5 pt-5">
        
        <!-- Portfolio Stats Section -->
        <div class="row mb-5">
            <div class="col-12">
                <div class="card border-info">
                    <div class="card-header bg-info text-white">
                        <h5><i class="fas fa-chart-bar"></i> Portfolio Statistics</h5>
                    </div>
                    <div class="card-body">
                        <div class="row text-center">
                            <div class="col-md-3">
                                <div class="stat-item">
                                    <h3 class="text-primary" id="statsProjects">0</h3>
                                    <p class="mb-0">Projects</p>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="stat-item">
                                    <h3 class="text-success" id="statsSkills">0</h3>
                                    <p class="mb-0">Skills</p>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="stat-item">
                                    <h3 class="text-warning" id="statsPhotos">0</h3>
                                    <p class="mb-0">Photos</p>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="stat-item">
                                    <h3 class="text-info" id="statsRoles">0</h3>
                                    <p class="mb-0">Roles</p>
                                </div>
                            </div>
                        </div>
                        <div class="text-center mt-3">
                            <button class="btn btn-outline-primary btn-sm" onclick="refreshStats()">
                                <i class="fas fa-sync"></i> Refresh Stats
                            </button>
                            <button class="btn btn-outline-success btn-sm" onclick="testDatabase()">
                                <i class="fas fa-database"></i> Test Database
                            </button>
                            <a href="Default.aspx" target="_blank" class="btn btn-outline-info btn-sm">
                                <i class="fas fa-eye"></i> View Portfolio
                            </a>
                        </div>
                        <div class="mt-3">
                            <small class="text-muted">
                                <strong>Admin Note:</strong> Use SQL Server Management Studio to manage portfolio content. 
                                Run App_Data/Sql/03_enhanced_seeds.sql to add more sample data.
                            </small>
                        </div>
                    </div>
                </div>
            </div>
        </div>

       
        <div class="row">
            <div class="col-lg-12 text-center mb-5">
                <h1 class="section-title">Get In Touch</h1>
                <p class="section-subtitle">Let's discuss your next project and bring your ideas to life</p>
            </div>
        </div>
        
        <!-- Contact Information -->
        <div class="row justify-content-center mb-5">
            <div class="col-lg-8">
                <div class="row">
                    <div class="col-md-4 mb-4">
                        <div class="contact-card text-center">
                            <div class="contact-icon">
                                <i class="fas fa-envelope"></i>
                            </div>
                            <h4>Email</h4>
                            <p class="text-muted">abdullah.saif@example.com</p>
                            <a href="mailto:abdullah.saif@example.com" class="btn btn-outline-primary">
                                <i class="fas fa-paper-plane"></i> Send Email
                            </a>
                        </div>
                    </div>
                    
                    <div class="col-md-4 mb-4">
                        <div class="contact-card text-center">
                            <div class="contact-icon">
                                <i class="fab fa-linkedin"></i>
                            </div>
                            <h4>LinkedIn</h4>
                            <p class="text-muted">Professional Network</p>
                            <a href="https://linkedin.com/in/abdullah-al-saif" target="_blank" class="btn btn-outline-primary">
                                <i class="fas fa-external-link-alt"></i> Connect
                            </a>
                        </div>
                    </div>
                    
                    <div class="col-md-4 mb-4">
                        <div class="contact-card text-center">
                            <div class="contact-icon">
                                <i class="fab fa-github"></i>
                            </div>
                            <h4>GitHub</h4>
                            <p class="text-muted">Code Repository</p>
                            <a href="https://github.com/saif17313" target="_blank" class="btn btn-outline-primary">
                                <i class="fas fa-code"></i> View Code
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Contact Form -->
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card">
                    <div class="card-header">
                        <h5><i class="fas fa-comment"></i> Send Message</h5>
                    </div>
                    <div class="card-body">
                        <form>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="contactName" class="form-label">Your Name</label>
                                    <input type="text" class="form-control" id="contactName" placeholder="Enter your name" />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="contactEmail" class="form-label">Your Email</label>
                                    <input type="email" class="form-control" id="contactEmail" placeholder="Enter your email" />
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="contactSubject" class="form-label">Subject</label>
                                <input type="text" class="form-control" id="contactSubject" placeholder="Enter subject" />
                            </div>
                            <div class="mb-3">
                                <label for="contactMessage" class="form-label">Message</label>
                                <textarea class="form-control" id="contactMessage" rows="5" placeholder="Enter your message"></textarea>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary btn-lg">
                                    <i class="fas fa-paper-plane"></i> Send Message
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Admin functionality
        function refreshStats() {
            const projects = window.portfolioProjects || [];
            const skills = window.portfolioSkills || [];
            const photos = window.portfolioPhotography || [];
            const roles = window.portfolioRoles || [];

            document.getElementById('statsProjects').textContent = projects.length;
            document.getElementById('statsSkills').textContent = skills.length;
            document.getElementById('statsPhotos').textContent = photos.length;
            document.getElementById('statsRoles').textContent = roles.length;

            console.log('Portfolio Stats:', {
                projects: projects.length,
                skills: skills.length,
                photos: photos.length,
                roles: roles.length
            });
        }

        function testDatabase() {
            const projects = window.portfolioProjects || [];
            const skills = window.portfolioSkills || [];
            const photos = window.portfolioPhotography || [];
            const roles = window.portfolioRoles || [];

            const total = projects.length + skills.length + photos.length + roles.length;
            
            if (total > 0) {
                alert('✅ Database Test Successful!\\n\\n• Projects: ' + projects.length + '\\n• Skills: ' + skills.length + '\\n• Photos: ' + photos.length + '\\n• Roles: ' + roles.length + '\\n\\nTotal records: ' + total);
            } else {
                alert('❌ Database appears to be empty or not loading.\\n\\nCheck your connection string and run the SQL seed files.');
            }
        }

        // Auto-refresh stats when page loads
        document.addEventListener('DOMContentLoaded', function() {
            setTimeout(refreshStats, 2000); // Wait for data to load
        });
    </script>

    <style>
        .contact-card {
            padding: 2rem 1rem;
            border: 1px solid #e9ecef;
            border-radius: 0.5rem;
            height: 100%;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        
        .contact-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }
        
        .contact-icon {
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, #2563eb, #f59e0b);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1rem;
            color: white;
            font-size: 1.5rem;
        }
        
        .stat-item {
            padding: 1rem;
        }
        
        .stat-item h3 {
            font-weight: 700;
            margin-bottom: 0.5rem;
        }
    </style>
</asp:Content>
