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
                    description = p.ShortDescription,
                    image = p.CoverImagePath,
                    liveUrl = p.LiveUrl,
                    repoUrl = p.RepoUrl
                }).ToList();

                var jsSkills = skills.Select(s => new {
                    name = s.Name,
                    level = s.LevelPercent ?? 0,
                    category = s.Category,
                    icon = GetSkillIcon(s.Name)
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
                { "HTML/CSS", "fab fa-html5" },
                { "ASP.NET", "fas fa-window-maximize" },
                { "Graphics Design", "fas fa-paint-brush" },
                { "Photoshop", "fab fa-adobe" },
                { "Problem Solving", "fas fa-lightbulb" },
                { "Team Leadership", "fas fa-users" }
            };

            return iconMap.ContainsKey(skillName) ? iconMap[skillName] : "fas fa-cog";
        }
    }
}