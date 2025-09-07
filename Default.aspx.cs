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
    }
}