using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using SaifPortFoliio; // Add this to access the Db class

namespace SaifPortFoliio
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPageData();
            }
        }
        
        private void LoadPageData()
        {
            try
            {
                // Load dynamic data from database
                LoadTypewriterRolesFromDB();
                LoadProjectsFromDB();
                LoadPhotographyFromDB();
                LoadSkillsFromDB();
                
                // Debug output
                System.Diagnostics.Debug.WriteLine("Page data loaded successfully from database");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error loading page data: " + ex.Message);
                
                // Fallback to basic data if database fails
                LoadFallbackData();
            }
        }
        
        private void LoadTypewriterRolesFromDB()
        {
            try
            {
                // Get roles from database
                var roles = Db.GetAllRoles();
                
                if (roles.Count == 0)
                {
                    // Fallback to default roles if none in database
                    LoadFallbackRoles();
                    return;
                }
                
                // Convert roles to JavaScript array
                var roleTexts = roles.Select(r => r.RoleText).ToList();
                var rolesJson = "[" + string.Join(",", roleTexts.Select(r => "\"" + r.Replace("\"", "\\\"") + "\"")) + "]";
                
                // Register JavaScript to set roles
                var script = new StringBuilder();
                script.AppendLine("console.log('=== ROLES DATA LOADED FROM DATABASE ===');");
                script.AppendLine("window.portfolioRoles = " + rolesJson + ";");
                script.AppendLine("console.log('Roles from DB:', window.portfolioRoles);");
                
                // Add script to page
                ClientScript.RegisterStartupScript(this.GetType(), "PortfolioRoles", script.ToString(), true);
                
                System.Diagnostics.Debug.WriteLine("Typewriter roles loaded from DB: " + string.Join(", ", roleTexts));
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error loading roles from DB: " + ex.Message);
                LoadFallbackRoles();
            }
        }
        
        private void LoadFallbackRoles()
        {
            var fallbackScript = "console.log('=== FALLBACK ROLES ==='); window.portfolioRoles = ['Software Developer', 'Graphics Designer', 'Problem Solver'];";
            ClientScript.RegisterStartupScript(this.GetType(), "DefaultRoles", fallbackScript, true);
        }
        
        private void LoadProjectsFromDB()
        {
            try
            {
                // Get projects from database
                var projects = Db.GetAllProjects();
                
                if (projects.Count == 0)
                {
                    // Register empty projects array if none in database
                    var emptyScript = "console.log('=== NO PROJECTS IN DATABASE ==='); window.portfolioProjects = [];";

ClientScript.RegisterStartupScript(this.GetType(), "EmptyProjects", emptyScript, true);
                    return;
                }
                
                // Convert projects to JSON for JavaScript
                var projectsJson = new StringBuilder();
                projectsJson.AppendLine("console.log('=== PROJECTS DATA LOADED FROM DATABASE ===');");
                projectsJson.AppendLine("window.portfolioProjects = [");
                
                for (int i = 0; i < projects.Count; i++)
                {
                    var project = projects[i];
                    
                    // Determine technologies based on project title/description (you can add a Technologies table later)
                    var technologies = GetProjectTechnologies(project.Title, project.ShortDescription);
                    
                    projectsJson.AppendLine("{");
                    projectsJson.AppendLine($"  id: {project.Id},");
                    projectsJson.AppendLine($"  title: \"{EscapeJsonString(project.Title)}\",");
                    projectsJson.AppendLine($"  description: \"{EscapeJsonString(project.ShortDescription)}\",");
                    projectsJson.AppendLine($"  image: \"{project.CoverImagePath}\",");
                    projectsJson.AppendLine($"  liveUrl: \"{project.LiveUrl}\",");
                    projectsJson.AppendLine($"  repoUrl: \"{project.RepoUrl}\",");
                    projectsJson.AppendLine($"  technologies: [\"{string.Join("\",\"", technologies)}\"]");
                    
                    if (i < projects.Count - 1)
                    {
                        projectsJson.AppendLine("},");
                    }
                    else
                    {
                        projectsJson.AppendLine("}");
                    }
                }
                
                projectsJson.AppendLine("];");
                projectsJson.AppendLine("console.log('Projects loaded from DB:', window.portfolioProjects.length, 'projects');");
                
                // Register JavaScript
                ClientScript.RegisterStartupScript(this.GetType(), "PortfolioProjects", projectsJson.ToString(), true);
                
                System.Diagnostics.Debug.WriteLine("Projects loaded from DB: " + projects.Count + " projects");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error loading projects from DB: " + ex.Message);
                
                // Fallback empty projects array
                var fallbackScript = "console.log('=== FALLBACK PROJECTS ==='); window.portfolioProjects = [];";

ClientScript.RegisterStartupScript(this.GetType(), "FallbackProjects", fallbackScript, true);
            }
        }
        
        private void LoadPhotographyFromDB()
        {
            try
            {
                // Get photos from database
                var photos = Db.GetAllPhotos();
                
                if (photos.Count == 0)
                {
                    // Register empty photography array if none in database
                    var emptyScript = "console.log('=== NO PHOTOS IN DATABASE ==='); window.portfolioPhotography = [];";

ClientScript.RegisterStartupScript(this.GetType(), "EmptyPhotography", emptyScript, true);
                    return;
                }
                
                // Convert photography to JSON for JavaScript
                var photographyJson = new StringBuilder();
                photographyJson.AppendLine("console.log('=== PHOTOGRAPHY DATA LOADED FROM DATABASE ===');");
                photographyJson.AppendLine("window.portfolioPhotography = [");
                
                for (int i = 0; i < photos.Count; i++)
                {
                    var photo = photos[i];
                    
                    // Determine category based on photo name/description (you can add a Category column later)
                    var category = GetPhotoCategory(photo.Name, photo.Description);
                    
                    photographyJson.AppendLine("{");
                    photographyJson.AppendLine($"  id: {photo.Id},");
                    photographyJson.AppendLine($"  title: \"{EscapeJsonString(photo.Name)}\",");
                    photographyJson.AppendLine($"  description: \"{EscapeJsonString(photo.Description)}\",");
                    photographyJson.AppendLine($"  category: \"{category}\",");
                    photographyJson.AppendLine($"  imagePath: \"{photo.ImagePath}\",");
                    photographyJson.AppendLine($"  thumbnailPath: \"{photo.ImagePath}\","); // Using same path for now
                    photographyJson.AppendLine($"  date: \"{DateTime.Now.ToString("yyyy-MM-dd")}\",");
                    photographyJson.AppendLine($"  camera: \"Portfolio Camera\",");
                    photographyJson.AppendLine($"  settings: \"Portfolio Settings\"");
                    
                    if (i < photos.Count - 1)
                    {
                        photographyJson.AppendLine("},");
                    }
                    else
                    {
                        photographyJson.AppendLine("}");
                    }
                }
                
                photographyJson.AppendLine("];");
                photographyJson.AppendLine("console.log('Photography loaded from DB:', window.portfolioPhotography.length, 'photos');");
                
                // Register JavaScript
                ClientScript.RegisterStartupScript(this.GetType(), "PortfolioPhotography", photographyJson.ToString(), true);
                
                System.Diagnostics.Debug.WriteLine("Photography loaded from DB: " + photos.Count + " photos");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error loading photography from DB: " + ex.Message);
                
                // Fallback empty photography array
                var fallbackScript = "console.log('=== FALLBACK PHOTOGRAPHY ==='); window.portfolioPhotography = [];";

ClientScript.RegisterStartupScript(this.GetType(), "FallbackPhotography", fallbackScript, true);
            }
        }
        
        private void LoadSkillsFromDB()
        {
            try
            {
                // Get skills from database
                var skills = Db.GetAllSkills();
                
                if (skills.Count == 0)
                {
                    // Register empty skills array if none in database
                    var emptyScript = "console.log('=== NO SKILLS IN DATABASE ==='); window.portfolioSkills = [];";

ClientScript.RegisterStartupScript(this.GetType(), "EmptySkills", emptyScript, true);
                    return;
                }
                
                // Convert skills to JSON for JavaScript
                var skillsJson = new StringBuilder();
                skillsJson.AppendLine("console.log('=== SKILLS DATA LOADED FROM DATABASE ===');");
                skillsJson.AppendLine("window.portfolioSkills = [");
                
                for (int i = 0; i < skills.Count; i++)
                {
                    var skill = skills[i];
                    var icon = GetSkillIcon(skill.Name);
                    
                    skillsJson.AppendLine("{");
                    skillsJson.AppendLine($"  id: {skill.Id},");
                    skillsJson.AppendLine($"  name: \"{EscapeJsonString(skill.Name)}\",");
                    skillsJson.AppendLine($"  level: {skill.LevelPercent ?? 0},");
                    skillsJson.AppendLine($"  category: \"{EscapeJsonString(skill.Category)}\",");
                    skillsJson.AppendLine($"  icon: \"{icon}\"");
                    
                    if (i < skills.Count - 1)
                    {
                        skillsJson.AppendLine("},");
                    }
                    else
                    {
                        skillsJson.AppendLine("}");
                    }
                }
                
                skillsJson.AppendLine("];");
                skillsJson.AppendLine("console.log('Skills loaded from DB:', window.portfolioSkills.length, 'skills');");
                
                // Register JavaScript
                ClientScript.RegisterStartupScript(this.GetType(), "PortfolioSkills", skillsJson.ToString(), true);
                
                System.Diagnostics.Debug.WriteLine("Skills loaded from DB: " + skills.Count + " skills");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error loading skills from DB: " + ex.Message);
                
                // Fallback empty skills array
                var fallbackScript = "console.log('=== FALLBACK SKILLS ==='); window.portfolioSkills = [];";

ClientScript.RegisterStartupScript(this.GetType(), "FallbackSkills", fallbackScript, true);
            }
        }
        
        private void LoadFallbackData()
        {
            System.Diagnostics.Debug.WriteLine("Loading fallback data due to database error");
            LoadFallbackRoles();
            
            var fallbackScript = @"
                console.log('=== LOADING FALLBACK DATA ===');
                window.portfolioProjects = [];
                window.portfolioPhotography = [];
                window.portfolioSkills = [];
            ";
            ClientScript.RegisterStartupScript(this.GetType(), "FallbackData", fallbackScript, true);
        }
        
        // Helper methods
        private string EscapeJsonString(string input)
        {
            if (string.IsNullOrEmpty(input))
                return string.Empty;
            
            return input.Replace("\"", "\\\"").Replace("\r\n", "\\n").Replace("\n", "\\n").Replace("\r", "\\n");
        }
        
        private string[] GetProjectTechnologies(string title, string description)
        {
            // Simple logic to determine technologies based on title/description
            // You can enhance this or add a separate Technologies table
            var technologies = new List<string>();
            
            var content = (title + " " + description).ToLower();
            
            if (content.Contains("java") || content.Contains("android"))
                technologies.AddRange(new[] { "Java", "Android" });
            
            if (content.Contains("asp.net") || content.Contains("c#"))
                technologies.AddRange(new[] { "ASP.NET", "C#" });
            
            if (content.Contains("javascript") || content.Contains("js"))
                technologies.Add("JavaScript");
            
            if (content.Contains("html") || content.Contains("css"))
                technologies.Add("HTML/CSS");
            
            if (content.Contains("bootstrap"))
                technologies.Add("Bootstrap");
            
            if (content.Contains("sql") || content.Contains("database"))
                technologies.Add("SQL Server");
            
            if (content.Contains("graphics") || content.Contains("design"))
                technologies.AddRange(new[] { "Photoshop", "Illustrator" });
            
            // Default if no technologies detected
            if (technologies.Count == 0)
                technologies.Add("General");
            
            return technologies.Distinct().ToArray();
        }
        
        private string GetPhotoCategory(string name, string description)
        {
            // Simple logic to determine photo category
            // You can add a Category column to Photography table later
            var content = (name + " " + description).ToLower();
            
            if (content.Contains("portrait") || content.Contains("person") || content.Contains("face"))
                return "portraits";
            
            if (content.Contains("nature") || content.Contains("landscape") || content.Contains("mountain") || content.Contains("forest") || content.Contains("sunset"))
                return "nature";
            
            if (content.Contains("urban") || content.Contains("city") || content.Contains("street") || content.Contains("building"))
                return "urban";
            
            if (content.Contains("event") || content.Contains("wedding") || content.Contains("conference") || content.Contains("party"))
                return "events";
            
            // Default category
            return "nature";
        }
        
        private string GetSkillIcon(string skillName)
        {
            // Map skill names to Font Awesome icons
            switch (skillName.ToLower())
            {
                case "java":
                    return "fab fa-java";
                case "c++":
                    return "fab fa-cuttlefish";
                case "c":
                    return "fas fa-code";
                case "html":
                case "html/css":
                    return "fab fa-html5";
                case "css":
                    return "fab fa-css3-alt";
                case "javascript":
                case "js":
                    return "fab fa-js-square";
                case "python":
                    return "fab fa-python";
                case "react":
                    return "fab fa-react";
                case "node.js":
                case "nodejs":
                    return "fab fa-node-js";
                case "angular":
                    return "fab fa-angular";
                case "vue":
                    return "fab fa-vuejs";
                case "bootstrap":
                    return "fab fa-bootstrap";
                case "git":
                    return "fab fa-git-alt";
                case "github":
                    return "fab fa-github";
                case "docker":
                    return "fab fa-docker";
                case "linux":
                    return "fab fa-linux";
                case "windows":
                    return "fab fa-windows";
                case "database":
                case "sql":
                    return "fas fa-database";
                case "design":
                case "graphics":
                    return "fas fa-paint-brush";
                case "photoshop":
                    return "fas fa-palette";
                default:
                    return "fas fa-code";
            }
        }
    }
}