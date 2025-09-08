using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace SaifPortFoliio
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTypewriterRoles();
                LoadProjects();
            }
        }
        
        private void LoadTypewriterRoles()
        {
            try
            {
                // Get roles from database - using default roles for now
                // TODO: Fix database access after ensuring proper project structure
                var defaultRoles = new List<string> { "Software Developer", "Graphics Designer", "Problem Solver" };
                
                // Convert roles to JavaScript array
                var rolesJson = "[" + string.Join(",", defaultRoles.Select(r => "\"" + r.Replace("\"", "\\\"") + "\"")) + "]";
                
                // Register JavaScript to set roles
                var script = new StringBuilder();
                script.AppendLine("<script type='text/javascript'>");
                script.AppendLine("window.portfolioRoles = " + rolesJson + ";");
                script.AppendLine("</script>");
                
                // Add script to page
                ClientScript.RegisterStartupScript(this.GetType(), "PortfolioRoles", script.ToString(), false);
            }
            catch (Exception ex)
            {
                // Log error (in production, use proper logging)
                System.Diagnostics.Debug.WriteLine("Error loading roles: " + ex.Message);
                
                // Fallback: Register default roles
                var defaultScript = "<script type='text/javascript'>window.portfolioRoles = ['Software Developer', 'Graphics Designer', 'Problem Solver'];</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "DefaultRoles", defaultScript, false);
            }
        }
        
        private void LoadProjects()
        {
            try
            {
                // For now, we'll use hardcoded projects. Later we'll integrate with database
                var projects = new[]
                {
                    new {
                        Id = 1,
                        Title = "Unified Class Co-ordination App",
                        ShortDescription = "A comprehensive class management system for coordinating academic activities and student collaboration.",
                        CoverImagePath = "/Content/img/projects/project1.jpg",
                        LiveUrl = "",
                        RepoUrl = "https://github.com/saif17313/Unified-Class-Co-ordination-App",
                        Technologies = new[] { "Java", "Android", "SQLite" }
                    },
                    new {
                        Id = 2,
                        Title = "Portfolio Website",
                        ShortDescription = "A modern, responsive portfolio website built with ASP.NET and featuring dynamic content management.",
                        CoverImagePath = "/Content/img/projects/project2.jpg",
                        LiveUrl = "",
                        RepoUrl = "https://github.com/saif17313/SaifPortFoliio",
                        Technologies = new[] { "ASP.NET", "C#", "JavaScript", "Bootstrap" }
                    },
                    new {
                        Id = 3,
                        Title = "Graphics Design Projects",
                        ShortDescription = "Collection of professional graphic design work including branding, UI/UX design, and digital illustrations.",
                        CoverImagePath = "/Content/img/projects/project3.jpg",
                        LiveUrl = "",
                        RepoUrl = "",
                        Technologies = new[] { "Photoshop", "Illustrator", "Figma" }
                    }
                };
                
                // Convert projects to JSON for JavaScript
                var projectsJson = new StringBuilder();
                projectsJson.AppendLine("window.portfolioProjects = [");
                
                for (int i = 0; i < projects.Length; i++)
                {
                    var project = projects[i];
                    projectsJson.AppendLine("{");
                    projectsJson.AppendLine($"  id: {project.Id},");
                    projectsJson.AppendLine($"  title: \"{project.Title.Replace("\"", "\\\"")}\",");
                    projectsJson.AppendLine($"  description: \"{project.ShortDescription.Replace("\"", "\\\"")}\",");
                    projectsJson.AppendLine($"  image: \"{project.CoverImagePath}\",");
                    projectsJson.AppendLine($"  liveUrl: \"{project.LiveUrl}\",");
                    projectsJson.AppendLine($"  repoUrl: \"{project.RepoUrl}\",");
                    projectsJson.AppendLine($"  technologies: [\"{string.Join("\",\"", project.Technologies)}\"]");
                    projectsJson.AppendLine(i < projects.Length - 1 ? "}," : "}");
                }
                
                projectsJson.AppendLine("];");
                
                // Register JavaScript
                var script = "<script type='text/javascript'>" + projectsJson.ToString() + "</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "PortfolioProjects", script, false);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error loading projects: " + ex.Message);
                
                // Fallback empty projects array
                var fallbackScript = "<script type='text/javascript'>window.portfolioProjects = [];</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "FallbackProjects", fallbackScript, false);
            }
        }
    }
}