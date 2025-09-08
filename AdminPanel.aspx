<%@ Page Title="Admin Panel" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPanel.aspx.cs" Inherits="SaifPortFoliio.AdminPanel" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5 pt-4">
        
        <!-- Admin Header -->
        <div class="row mb-4">
            <div class="col-12">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h1 class="admin-title">
                            <i class="fas fa-cogs"></i> Portfolio Admin Panel
                        </h1>
                        <p class="text-muted">Welcome back! Manage your portfolio content and view messages</p>
                    </div>
                    <div>
                        <span class="badge bg-success me-2">
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

        <!-- Quick Stats -->
        <div class="row mb-4">
            <div class="col-lg-3 col-md-6 mb-3">
                <div class="stat-card bg-primary text-white">
                    <h3 id="projectCount">0</h3>
                    <p>Projects</p>
                    <i class="fas fa-laptop-code stat-icon"></i>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-3">
                <div class="stat-card bg-success text-white">
                    <h3 id="skillCount">0</h3>
                    <p>Skills</p>
                    <i class="fas fa-cogs stat-icon"></i>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-3">
                <div class="stat-card bg-warning text-white">
                    <h3 id="photoCount">0</h3>
                    <p>Photos</p>
                    <i class="fas fa-camera stat-icon"></i>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-3">
                <div class="stat-card bg-danger text-white">
                    <h3 id="messageCount">0</h3>
                    <p>Messages</p>
                    <i class="fas fa-envelope stat-icon"></i>
                </div>
            </div>
        </div>

        <!-- Data Management Sections -->
        <div class="row">
            <!-- Projects Section -->
            <div class="col-lg-6 mb-4">
                <div class="admin-card">
                    <div class="card-header">
                        <h5><i class="fas fa-laptop-code"></i> Projects Management</h5>
                        <button class="btn btn-sm btn-primary" onclick="showAddProject()">Add Project</button>
                    </div>
                    <div class="card-body">
                        <div id="projectsList">Loading...</div>
                        
                        <!-- Add/Edit Project Form -->
                        <div id="projectForm" class="form-section" style="display: none;">
                            <h6>Project Details</h6>
                            <div class="mb-3">
                                <label class="form-label">Title</label>
                                <input type="text" id="projectTitle" class="form-control" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Slug</label>
                                <input type="text" id="projectSlug" class="form-control" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Description</label>
                                <textarea id="projectDescription" class="form-control" rows="3"></textarea>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Cover Image Path</label>
                                <input type="text" id="projectCover" class="form-control" placeholder="/Content/img/projects/project1.jpg" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Live URL</label>
                                <input type="text" id="projectLive" class="form-control" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Repository URL</label>
                                <input type="text" id="projectRepo" class="form-control" />
                            </div>
                            <div class="form-actions">
                                <button class="btn btn-success" onclick="saveProject()">Save</button>
                                <button class="btn btn-secondary" onclick="cancelProject()">Cancel</button>
                            </div>
                            <input type="hidden" id="projectId" value="0" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- Skills Section -->
            <div class="col-lg-6 mb-4">
                <div class="admin-card">
                    <div class="card-header">
                        <h5><i class="fas fa-cogs"></i> Skills Management</h5>
                        <button class="btn btn-sm btn-success" onclick="showAddSkill()">Add Skill</button>
                    </div>
                    <div class="card-body">
                        <div id="skillsList">Loading...</div>
                        
                        <!-- Add/Edit Skill Form -->
                        <div id="skillForm" class="form-section" style="display: none;">
                            <h6>Skill Details</h6>
                            <div class="mb-3">
                                <label class="form-label">Skill Name</label>
                                <input type="text" id="skillName" class="form-control" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Level (%)</label>
                                <input type="number" id="skillLevel" class="form-control" min="0" max="100" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Category</label>
                                <input type="text" id="skillCategory" class="form-control" />
                            </div>
                            <div class="form-actions">
                                <button class="btn btn-success" onclick="saveSkill()">Save</button>
                                <button class="btn btn-secondary" onclick="cancelSkill()">Cancel</button>
                            </div>
                            <input type="hidden" id="skillId" value="0" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- Roles Section -->
            <div class="col-lg-6 mb-4">
                <div class="admin-card">
                    <div class="card-header">
                        <h5><i class="fas fa-user-tie"></i> Roles Management</h5>
                        <button class="btn btn-sm btn-info" onclick="showAddRole()">Add Role</button>
                    </div>
                    <div class="card-body">
                        <div id="rolesList">Loading...</div>
                        
                        <!-- Add/Edit Role Form -->
                        <div id="roleForm" class="form-section" style="display: none;">
                            <h6>Role Details</h6>
                            <div class="mb-3">
                                <label class="form-label">Role Text</label>
                                <input type="text" id="roleText" class="form-control" placeholder="e.g., Full Stack Developer" />
                            </div>
                            <div class="form-actions">
                                <button class="btn btn-success" onclick="saveRole()">Save</button>
                                <button class="btn btn-secondary" onclick="cancelRole()">Cancel</button>
                            </div>
                            <input type="hidden" id="roleId" value="0" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- Photography Section -->
            <div class="col-lg-6 mb-4">
                <div class="admin-card">
                    <div class="card-header">
                        <h5><i class="fas fa-camera"></i> Photography Management</h5>
                        <button class="btn btn-sm btn-warning" onclick="showAddPhoto()">Add Photo</button>
                    </div>
                    <div class="card-body">
                        <div id="photosList">Loading...</div>
                        
                        <!-- Add/Edit Photo Form -->
                        <div id="photoForm" class="form-section" style="display: none;">
                            <h6>Photo Details</h6>
                            <div class="mb-3">
                                <label class="form-label">Photo Name</label>
                                <input type="text" id="photoName" class="form-control" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Image Path</label>
                                <input type="text" id="photoPath" class="form-control" placeholder="/Content/img/photography/pic1.jpg" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Description</label>
                                <textarea id="photoDescription" class="form-control" rows="3"></textarea>
                            </div>
                            <div class="form-actions">
                                <button class="btn btn-success" onclick="savePhoto()">Save</button>
                                <button class="btn btn-secondary" onclick="cancelPhoto()">Cancel</button>
                            </div>
                            <input type="hidden" id="photoId" value="0" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- Messages Section -->
            <div class="col-12 mb-4">
                <div class="admin-card">
                    <div class="card-header">
                        <h5><i class="fas fa-envelope"></i> Messages & Session Data</h5>
                        <button class="btn btn-sm btn-outline-primary" onclick="loadMessages()">Refresh</button>
                    </div>
                    <div class="card-body">
                        <div id="messagesList">Loading...</div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Instructions -->
        <div class="row">
            <div class="col-12">
                <div class="alert alert-info">
                    <h6>Admin Instructions:</h6>
                    <ul class="mb-0">
                        <li>This admin panel allows you to manage all portfolio content through your browser</li>
                        <li>All changes are saved directly to your database and appear immediately on your portfolio</li>
                        <li>For advanced database operations, use SQL Server Management Studio</li>
                        <li>Run the enhanced seeds SQL file to add more sample data</li>
                        <li><strong>Security:</strong> You are logged in as <em><%: Session["AdminUsername"] ?? "Admin" %></em> - Remember to logout when finished</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <script>
        console.log('Admin Panel Loaded');
        
        // Load all data when page loads
        document.addEventListener('DOMContentLoaded', function() {
            // Wait for the portfolio data to load first
            setTimeout(function() {
                loadAllData();
            }, 2000);
        });
        
        function loadAllData() {
            console.log('Loading admin data...');
            loadStats();
            loadProjects();
            loadSkills();
            loadRoles();
            loadPhotos();
            loadMessages();
        }
        
        function loadStats() {
            // Get actual data from the Db through AJAX or use global variables
            fetch('/api/GetStats')
                .then(response => response.json())
                .then(data => {
                    document.getElementById('projectCount').textContent = data.projects || 0;
                    document.getElementById('skillCount').textContent = data.skills || 0;
                    document.getElementById('photoCount').textContent = data.photos || 0;
                    document.getElementById('messageCount').textContent = data.messages || 0;
                })
                .catch(error => {
                    // Fallback to global portfolio data
                    const projects = window.portfolioProjects || [];
                    const skills = window.portfolioSkills || [];
                    const photos = window.portfolioPhotography || [];
                    const roles = window.portfolioRoles || [];
                    
                    document.getElementById('projectCount').textContent = projects.length;
                    document.getElementById('skillCount').textContent = skills.length;
                    document.getElementById('photoCount').textContent = photos.length;
                    document.getElementById('roleCount').textContent = roles.length;
                    
                    console.log('Stats loaded from global data:', {
                        projects: projects.length,
                        skills: skills.length,
                        photos: photos.length,
                        roles: roles.length
                    });
                });
        }
        
        function loadProjects() {
            const projects = window.portfolioProjects || [];
            const container = document.getElementById('projectsList');
            
            if (projects.length === 0) {
                container.innerHTML = '<p class="text-muted">No projects found. Add some projects to get started.</p>';
                return;
            }
            
            let html = '<div class="data-list">';
            projects.forEach((project, index) => {
                html += `
                    <div class="data-item">
                        <div class="item-thumbnail">
                            <img src="${project.image || '/Content/img/projects/placeholder.jpg'}" alt="${project.title}" class="admin-thumbnail" />
                        </div>
                        <div class="item-info">
                            <strong>${project.title}</strong><br>
                            <small class="text-muted">${project.description || 'No description'}</small>
                        </div>
                        <div class="item-actions">
                            <button class="btn btn-sm btn-outline-primary" onclick="editProject(${index})">Edit</button>
                            <button class="btn btn-sm btn-outline-danger" onclick="deleteProject(${index})">Delete</button>
                        </div>
                    </div>
                `;
            });
            html += '</div>';
            container.innerHTML = html;
        }
        
        function loadSkills() {
            const skills = window.portfolioSkills || [];
            const container = document.getElementById('skillsList');
            
            if (skills.length === 0) {
                container.innerHTML = '<p class="text-muted">No skills found. Add some skills to showcase your abilities.</p>';
                return;
            }
            
            let html = '<div class="data-list">';
            skills.forEach((skill, index) => {
                html += `
                    <div class="data-item">
                        <div class="item-info">
                            <strong>${skill.name}</strong> - ${skill.level}%<br>
                            <small class="text-muted">${skill.category || 'No category'}</small>
                        </div>
                        <div class="item-actions">
                            <button class="btn btn-sm btn-outline-primary" onclick="editSkill(${index})">Edit</button>
                            <button class="btn btn-sm btn-outline-danger" onclick="deleteSkill(${index})">Delete</button>
                        </div>
                    </div>
                `;
            });
            html += '</div>';
            container.innerHTML = html;
        }
        
        function loadRoles() {
            const roles = window.portfolioRoles || [];
            const container = document.getElementById('rolesList');
            
            if (roles.length === 0) {
                container.innerHTML = '<p class="text-muted">No roles found. Add roles for the typewriter effect.</p>';
                return;
            }
            
            let html = '<div class="data-list">';
            roles.forEach((role, index) => {
                html += `
                    <div class="data-item">
                        <div class="item-info">
                            <strong>${role}</strong>
                        </div>
                        <div class="item-actions">
                            <button class="btn btn-sm btn-outline-primary" onclick="editRole(${index})">Edit</button>
                            <button class="btn btn-sm btn-outline-danger" onclick="deleteRole(${index})">Delete</button>
                        </div>
                    </div>
                `;
            });
            html += '</div>';
            container.innerHTML = html;
        }
        
        function loadPhotos() {
            const photos = window.portfolioPhotography || [];
            const container = document.getElementById('photosList');
            
            if (photos.length === 0) {
                container.innerHTML = '<p class="text-muted">No photos found. Add photos to showcase your photography.</p>';
                return;
            }
            
            let html = '<div class="data-list">';
            photos.forEach((photo, index) => {
                html += `
                    <div class="data-item">
                        <div class="item-thumbnail">
                            <img src="${photo.imagePath || '/Content/img/photography/placeholder.jpg'}" alt="${photo.title}" class="admin-thumbnail" />
                        </div>
                        <div class="item-info">
                            <strong>${photo.title}</strong><br>
                            <small class="text-muted">${photo.description || 'No description'}</small>
                        </div>
                        <div class="item-actions">
                            <button class="btn btn-sm btn-outline-primary" onclick="editPhoto(${index})">Edit</button>
                            <button class="btn btn-sm btn-outline-danger" onclick="deletePhoto(${index})">Delete</button>
                        </div>
                    </div>
                `;
            });
            html += '</div>';
            container.innerHTML = html;
        }
        
        function loadMessages() {
            // This would load from database in a real implementation
            const container = document.getElementById('messagesList');
            container.innerHTML = `
                <div class="alert alert-info">
                    <h6>Messages from Sessions & Cookies:</h6>
                    <p class="mb-0">Messages are tracked in the database table <code>dbo.Messages</code>. 
                    Use SQL Server Management Studio to view and manage messages, or implement additional 
                    server-side code to display them here.</p>
                    <hr>
                    <small><strong>Note:</strong> Your current database schema includes an IsRead column to track message status.</small>
                    <br><small><strong>Sample Query:</strong> <code>SELECT * FROM dbo.Messages ORDER BY CreatedAt DESC</code></small>
                </div>
            `;
        }
        
        // Form Management Functions
        function showAddProject() {
            clearProjectForm();
            document.getElementById('projectForm').style.display = 'block';
        }
        
        function showAddSkill() {
            clearSkillForm();
            document.getElementById('skillForm').style.display = 'block';
        }
        
        function showAddRole() {
            clearRoleForm();
            document.getElementById('roleForm').style.display = 'block';
        }
        
        function showAddPhoto() {
            clearPhotoForm();
            document.getElementById('photoForm').style.display = 'block';
        }
        
        function clearProjectForm() {
            document.getElementById('projectId').value = '0';
            document.getElementById('projectTitle').value = '';
            document.getElementById('projectSlug').value = '';
            document.getElementById('projectDescription').value = '';
            document.getElementById('projectCover').value = '';
            document.getElementById('projectLive').value = '';
            document.getElementById('projectRepo').value = '';
        }
        
        function clearSkillForm() {
            document.getElementById('skillId').value = '0';
            document.getElementById('skillName').value = '';
            document.getElementById('skillLevel').value = '';
            document.getElementById('skillCategory').value = '';
        }
        
        function clearRoleForm() {
            document.getElementById('roleId').value = '0';
            document.getElementById('roleText').value = '';
        }
        
        function clearPhotoForm() {
            document.getElementById('photoId').value = '0';
            document.getElementById('photoName').value = '';
            document.getElementById('photoPath').value = '';
            document.getElementById('photoDescription').value = '';
        }
        
        function cancelProject() {
            document.getElementById('projectForm').style.display = 'none';
        }
        
        function cancelSkill() {
            document.getElementById('skillForm').style.display = 'none';
        }
        
        function cancelRole() {
            document.getElementById('roleForm').style.display = 'none';
        }
        
        function cancelPhoto() {
            document.getElementById('photoForm').style.display = 'none';
        }
        
        // Save functions (for demonstration - would need server-side implementation)
        function saveProject() {
            alert('Project save functionality would be implemented with server-side code.\nFor now, use SQL Server Management Studio to add/edit projects.');
            cancelProject();
        }
        
        function saveSkill() {
            alert('Skill save functionality would be implemented with server-side code.\nFor now, use SQL Server Management Studio to add/edit skills.');
            cancelSkill();
        }
        
        function saveRole() {
            alert('Role save functionality would be implemented with server-side code.\nFor now, use SQL Server Management Studio to add/edit roles.');
            cancelRole();
        }
        
        function savePhoto() {
            alert('Photo save functionality would be implemented with server-side code.\nFor now, use SQL Server Management Studio to add/edit photos.');
            cancelPhoto();
        }
        
        // Auto-generate slug from title
        document.addEventListener('input', function(e) {
            if (e.target.id === 'projectTitle') {
                const slug = e.target.value
                    .toLowerCase()
                    .replace(/[^a-z0-9\s-]/g, '')
                    .trim()
                    .replace(/\s+/g, '-');
                document.getElementById('projectSlug').value = slug;
            }
        });
        
        console.log('Admin Panel JavaScript Initialized');
    </script>

    <style>
        .admin-title {
            color: #2c3e50;
            font-weight: 600;
        }
        
        .stat-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 12px;
            padding: 1.5rem;
            position: relative;
            overflow: hidden;
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
        
        .stat-card h3 {
            font-size: 2.5rem;
            font-weight: bold;
            margin-bottom: 0.5rem;
        }
        
        .stat-icon {
            position: absolute;
            top: 1rem;
            right: 1rem;
            font-size: 2rem;
            opacity: 0.3;
        }
        
        .admin-card {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border: none;
        }
        
        .admin-card .card-header {
            background: #f8f9fa;
            border-bottom: 2px solid #e9ecef;
            border-radius: 12px 12px 0 0;
            padding: 1rem 1.5rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .admin-card .card-header h5 {
            margin: 0;
            color: #2c3e50;
            font-weight: 600;
        }
        
        .admin-card .card-body {
            padding: 1.5rem;
        }
        
        .form-section {
            background: #f8f9fa;
            border-radius: 8px;
            padding: 1.5rem;
            margin-top: 1rem;
            border: 1px solid #e9ecef;
        }
        
        .form-actions {
            border-top: 1px solid #dee2e6;
            padding-top: 1rem;
            margin-top: 1rem;
        }
        
        .data-list {
            max-height: 400px;
            overflow-y: auto;
        }
        
        .data-item {
            display: flex;
            align-items: center;
            padding: 0.75rem;
            border: 1px solid #e9ecef;
            border-radius: 6px;
            margin-bottom: 0.5rem;
            background: white;
        }
        
        .data-item:hover {
            background: #f8f9fa;
        }
        
        .item-thumbnail {
            width: 60px;
            height: 60px;
            margin-right: 1rem;
            flex-shrink: 0;
        }
        
        .admin-thumbnail {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 6px;
            border: 2px solid #e9ecef;
        }
        
        .item-info {
            flex: 1;
            margin-right: 1rem;
        }
        
        .item-actions {
            white-space: nowrap;
            flex-shrink: 0;
        }
        
        .item-actions .btn {
            margin-left: 0.25rem;
        }
        
        .badge {
            font-size: 0.9rem;
            padding: 0.5rem 0.75rem;
        }
    </style>
</asp:Content>