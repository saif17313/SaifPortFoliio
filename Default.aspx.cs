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
            if (!IsPostBack)
            {
                LoadPortfolioData();
            }
        }

        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            try
            {
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

            // Auto-hide message after 5 seconds using JavaScript
            string script = @"
                setTimeout(function() {
                    var messageStatus = document.getElementById('" + messageStatus.ClientID + @"');
                    if (messageStatus) {
                        messageStatus.style.opacity = '0';
                        setTimeout(function() {
                            messageStatus.style.display = 'none';
                        }, 300);
                    }
                }, 5000);
            ";
            ClientScript.RegisterStartupScript(this.GetType(), "hideMessage", script, true);
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
                    shortDescription = p.ShortDescription,
                    coverImagePath = p.CoverImagePath,
                    liveUrl = p.LiveUrl,
                    repoUrl = p.RepoUrl
                }).ToList();

                var jsSkills = skills.Select(s => new {
                    name = s.Name,
                    level = s.LevelPercent ?? 0,
                    category = s.Category,
                    icon = GetSkillIcon(s.Name),
                    colorClass = GetSkillColorClass(s.Category)
                }).ToList();

                var jsRoles = roles.Select(r => r.RoleText).ToList();

                var jsPhotos = photos.Select(p => new {
                    id = p.Id,
                    title = p.Name,
                    description = p.Description,
                    imagePath = p.ImagePath
                }).ToList();

                // Create JavaScript object
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

                // Inject into page
                string script = $"window.serverData = {jsonData};";
                ClientScript.RegisterStartupScript(this.GetType(), "serverData", script, true);
            }
            catch (Exception ex)
            {
                // Log error and continue with fallback data
                System.Diagnostics.Debug.WriteLine("Error loading portfolio data: " + ex.Message);
            }
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
                { "HTML5", "fab fa-html5" },
                { "CSS3", "fab fa-css3-alt" },
                { "ASP.NET", "fas fa-window-maximize" },
                { "Python", "fab fa-python" },
                { "jQuery", "fab fa-js" },
                { "Bootstrap", "fab fa-bootstrap" },
                { "Photoshop", "fab fa-adobe" },
                { "WordPress", "fab fa-wordpress" },
                { "SEO", "fas fa-search" },
                { "Git", "fab fa-git-alt" },
                { "Database Design", "fas fa-database" }
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
                { "Database", "programming" },
                { "CMS", "web-development" },
                { "Marketing", "design" }
            };

            return colorMap.ContainsKey(category) ? colorMap[category] : "default";
        }
    }
}