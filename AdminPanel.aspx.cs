using System;
using System.Web;
using System.Web.UI;

namespace SaifPortFoliio
{
    public partial class AdminPanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is authenticated
            if (Session["AdminAuthenticated"] == null || !(bool)Session["AdminAuthenticated"])
            {
                Response.Redirect("AdminLogin.aspx");
                return;
            }

            if (!IsPostBack)
            {
                // Show welcome message or username
                string username = Session["AdminUsername"]?.ToString() ?? "Admin";
                // You can use this username in the page if needed
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Clear session
            Session.Clear();
            Session.Abandon();
            
            // Redirect to login
            Response.Redirect("AdminLogin.aspx");
        }
    }
}