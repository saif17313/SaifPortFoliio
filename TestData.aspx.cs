using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SaifPortFoliio
{
    public partial class TestData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Test page for database operations and debugging
            if (!IsPostBack)
            {
                LoadTestData();
            }
        }

        private void LoadTestData()
        {
            try
            {
                // Test database connectivity and data loading
                var projects = Db.GetAllProjects();
                var skills = Db.GetAllSkills();
                var roles = Db.GetAllRoles();
                var photos = Db.GetAllPhotos();
                var messages = Db.GetAllMessages();

                // Log results for debugging
                System.Diagnostics.Debug.WriteLine($"TestData - Projects: {projects.Count}");
                System.Diagnostics.Debug.WriteLine($"TestData - Skills: {skills.Count}");
                System.Diagnostics.Debug.WriteLine($"TestData - Roles: {roles.Count}");
                System.Diagnostics.Debug.WriteLine($"TestData - Photos: {photos.Count}");
                System.Diagnostics.Debug.WriteLine($"TestData - Messages: {messages.Count}");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"TestData Error: {ex.Message}");
            }
        }
    }
}