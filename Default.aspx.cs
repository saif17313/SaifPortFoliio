using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

namespace SaifPortFoliio
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Maintain scroll position during PostBack (for contact form)
            Page.MaintainScrollPositionOnPostBack = true;

            // Always load portfolio data, regardless of PostBack status
            LoadPortfolioData();
        }

        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            try
            {
                // Track that this is a contact form submission to skip loading screen
                string skipLoadingScript = @"
                    sessionStorage.setItem('contactFormSubmitted', 'true');
                    console.log('📧 Contact form submitted - Loading screen will be skipped');
                ";
                ClientScript.RegisterStartupScript(this.GetType(), "skipLoading", skipLoadingScript, true);

                // Validate form data - only email and message required
                if (string.IsNullOrWhiteSpace(txtEmail.Text) || 
                    string.IsNullOrWhiteSpace(txtMessage.Text))
                {
                    ShowMessage("Please fill in all required fields.", "error");
                    return;
                }

                // Save message directly to database (email and message only)
                string email = txtEmail.Text.Trim();
                string message = txtMessage.Text.Trim();

                int messageId = Db.InsertMessage(email, message);

                if (messageId > 0)
                {
                    // Clear form
                    txtEmail.Text = "";
                    txtMessage.Text = "";

                    ShowMessage("Thank you! Your message has been sent successfully. I will get back to you soon.", "success");
                }
                else
                {
                    ShowMessage("Sorry, there was an error sending your message. Please try again later.", "error");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error sending message: " + ex.Message);
                ShowMessage("Sorry, there was an error sending your message. Please try again later.", "error");
            }
        }

        private void ShowMessage(string message, string type)
        {
            messageStatus.Visible = true;
            lblMessage.Text = message;
            
            if (type == "success")
            {
                messageStatus.Attributes["class"] = "alert alert-success";
            }
            else
            {
                messageStatus.Attributes["class"] = "alert alert-danger";
            }

            // Enhanced message display with smooth scroll to contact section
            string script = @"
                setTimeout(function() {
                    var messageStatus = document.getElementById('" + messageStatus.ClientID + @"');
                    if (messageStatus) {
                        // Smooth scroll to contact section and show message
                        var contactSection = document.getElementById('contact');
                        if (contactSection) {
                            contactSection.scrollIntoView({ behavior: 'smooth', block: 'center' });
                        }
                        
                        // Animate message appearance
                        messageStatus.style.opacity = '0';
                        messageStatus.style.transform = 'translateY(-10px)';
                        messageStatus.style.transition = 'all 0.3s ease';
                        
                        setTimeout(function() {
                            messageStatus.style.opacity = '1';
                            messageStatus.style.transform = 'translateY(0)';
                        }, 300);
                        
                        // Auto-hide message after 5 seconds
                        setTimeout(function() {
                            messageStatus.style.opacity = '0';
                            messageStatus.style.transform = 'translateY(-10px)';
                            setTimeout(function() {
                                messageStatus.style.display = 'none';
                            }, 300);
                        }, 5000);
                    }
                }, 100);
            ";
            ClientScript.RegisterStartupScript(this.GetType(), "showContactMessage", script, true);
        }

        private void LoadPortfolioData()
        {
            try
            {
                // Get data from database
                var projects = Db.GetAllProjects();
                var skills = Db.GetAllSkills();
                var roles = Db.GetAllRoles();
                var photos = Db.GetAllPhotos();

                // Convert to JavaScript objects
                var jsProjects = projects.Select(p => new {
                    id = p.Id,
                    title = p.Title,
                    description = p.ShortDescription ?? "",
                    shortDescription = p.ShortDescription ?? "",
                    coverImagePath = p.CoverImagePath ?? "",
                    liveUrl = p.LiveUrl ?? "",
                    repoUrl = p.RepoUrl ?? "",
                    technologies = GetProjectTechnologies(p.Title) // Add technologies based on project
                }).ToList();

                var jsSkills = skills.Select(s => new {
                    name = s.Name,
                    level = s.LevelPercent ?? 0,
                    category = s.Category ?? "General",
                    icon = GetSkillIcon(s.Name),
                    colorClass = GetSkillColorClass(s.Category)
                }).ToList();

                var jsRoles = roles.Select(r => r.RoleText).ToList();

                var jsPhotos = photos.Select(p => new {
                    id = p.Id,
                    title = p.Name,
                    description = p.Description ?? "",
                    imagePath = p.ImagePath
                }).ToList();

                // Inject roles for typewriter effect
                string rolesScript = $"window.portfolioRoles = {JsonConvert.SerializeObject(jsRoles)};";
                ClientScript.RegisterStartupScript(this.GetType(), "portfolioRoles", rolesScript, true);

                // Inject projects data
                string projectsScript = $"window.portfolioProjects = {JsonConvert.SerializeObject(jsProjects)};";
                ClientScript.RegisterStartupScript(this.GetType(), "portfolioProjects", projectsScript, true);

                // Inject skills data
                string skillsScript = $"window.portfolioSkills = {JsonConvert.SerializeObject(jsSkills)};";
                ClientScript.RegisterStartupScript(this.GetType(), "portfolioSkills", skillsScript, true);

                // Inject photography data
                string photosScript = $"window.portfolioPhotos = {JsonConvert.SerializeObject(jsPhotos)};";
                ClientScript.RegisterStartupScript(this.GetType(), "portfolioPhotos", photosScript, true);

                // Create combined server data object
                var serverData = new {
                    projects = jsProjects,
                    skills = jsSkills,
                    roles = jsRoles,
                    photography = jsPhotos
                };

                // Serialize to JSON using Newtonsoft.Json
                string jsonData = JsonConvert.SerializeObject(serverData, new JsonSerializerSettings
                {
                    ContractResolver = new Newtonsoft.Json.Serialization.CamelCasePropertyNamesContractResolver()
                });

                // Inject combined data into page
                string script = $"window.serverData = {jsonData}; console.log('Server data loaded:', window.serverData);";
                ClientScript.RegisterStartupScript(this.GetType(), "serverData", script, true);

                // Trigger data reload after PostBack but skip loading screen for contact form
                if (IsPostBack)
                {
                    string reloadScript = @"
                        setTimeout(function() {
                            console.log('🔄 PostBack detected - Reloading portfolio data...');
                            
                            // Skip loading screen for contact form submissions
                            if (sessionStorage.getItem('contactFormSubmitted')) {
                                console.log('📧 Contact form PostBack - Skipping loading screen');
                                var loadingScreen = document.getElementById('loading-screen');
                                if (loadingScreen) {
                                    loadingScreen.style.display = 'none';
                                }
                                var navigation = document.getElementById('main-nav');
                                if (navigation) {
                                    navigation.style.display = 'block';
                                }
                            }
                            
                            // Reload portfolio sections
                            if (typeof loadSkillsData === 'function') {
                                loadSkillsData();
                                console.log('✅ Skills data reloaded after PostBack');
                            }
                            if (typeof loadProjectsData === 'function') {
                                loadProjectsData();
                                console.log('✅ Projects data reloaded after PostBack');
                            }
                            if (typeof loadPhotographyData === 'function') {
                                loadPhotographyData();
                                console.log('✅ Photography data reloaded after PostBack');
                            }
                            
                            // Also reload from master.js functions
                            if (typeof loadSkillsSection === 'function') {
                                loadSkillsSection();
                                console.log('✅ Skills section reloaded from master.js');
                            }
                            if (typeof loadProjectsSection === 'function') {
                                loadProjectsSection();
                                console.log('✅ Projects section reloaded from master.js');
                            }
                            if (typeof loadPhotographySection === 'function') {
                                loadPhotographySection();
                                console.log('✅ Photography section reloaded from master.js');
                            }
                            
                            // Clear the contact form submission flag after 2 seconds
                            setTimeout(function() {
                                sessionStorage.removeItem('contactFormSubmitted');
                            }, 2000);
                        }, 100);
                    ";
                    ClientScript.RegisterStartupScript(this.GetType(), "reloadData", reloadScript, true);
                }
            }
            catch (Exception ex)
            {
                // Log error and continue with fallback data
                System.Diagnostics.Debug.WriteLine("Error loading portfolio data: " + ex.Message);
                
                // Inject error handling script
                string errorScript = @"
                    console.error('❌ Error loading portfolio data from server');
                    setTimeout(function() {
                        // Try to load with fallback data
                        if (typeof loadPortfolioData === 'function') {
                            loadPortfolioData();
                            console.log('🔄 Attempted fallback data loading');
                        }
                    }, 1000);
                ";
                ClientScript.RegisterStartupScript(this.GetType(), "errorFallback", errorScript, true);
            }
        }

        private string[] GetProjectTechnologies(string projectTitle)
        {
            // Map project titles to technologies for better display
            var techMap = new Dictionary<string, string[]>(StringComparer.OrdinalIgnoreCase)
            {
                { "Portfolio Website", new[] { "ASP.NET", "C#", "Bootstrap", "JavaScript", "SQL Server" } },
                { "E-Commerce Platform", new[] { "ASP.NET", "C#", "Entity Framework", "Bootstrap", "jQuery" } },
                { "Task Management App", new[] { "ASP.NET", "C#", "SignalR", "Bootstrap", "JavaScript" } },
                { "Weather Dashboard", new[] { "JavaScript", "API Integration", "Bootstrap", "Chart.js" } },
                { "Social Media App", new[] { "ASP.NET", "C#", "SignalR", "Bootstrap", "Entity Framework" } },
                { "Restaurant Website", new[] { "ASP.NET", "C#", "Bootstrap", "JavaScript", "Payment Gateway" } }
            };

            return techMap.ContainsKey(projectTitle) ? techMap[projectTitle] : new[] { "Web Development", "Programming" };
        }

        private string GetSkillIcon(string skillName)
        {
            // Map skill names to Font Awesome icons
            var iconMap = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase)
            {
                { "Java", "fab fa-java" },
                { "C++", "fas fa-code" },
                { "C", "fas fa-code" },
                { "JavaScript", "fab fa-js-square" },
                { "HTML/CSS", "fab fa-html5" },
                { "HTML5", "fab fa-html5" },
                { "CSS3", "fab fa-css3-alt" },
                { "ASP.NET", "fas fa-window-maximize" },
                { "Python", "fab fa-python" },
                { "jQuery", "fab fa-js" },
                { "Bootstrap", "fab fa-bootstrap" },
                { "Photoshop", "fab fa-adobe" },
                { "Graphics Design", "fas fa-paint-brush" },
                { "WordPress", "fab fa-wordpress" },
                { "SEO", "fas fa-search" },
                { "Git", "fab fa-git-alt" },
                { "Database Design", "fas fa-database" },
                { "Problem Solving", "fas fa-puzzle-piece" },
                { "Team Leadership", "fas fa-users" }
            };

            return iconMap.ContainsKey(skillName) ? iconMap[skillName] : "fas fa-cog";
        }

        private string GetSkillColorClass(string category)
        {
            // Map categories to CSS color classes
            var colorMap = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase)
            {
                { "Programming", "programming" },
                { "Web Development", "web-development" },
                { "Design", "design" },
                { "Tools", "soft-skills" },
                { "Soft Skills", "soft-skills" },
                { "Database", "programming" },
                { "CMS", "web-development" },
                { "Marketing", "design" }
            };

            return colorMap.ContainsKey(category) ? colorMap[category] : "default";
        }
    }
}