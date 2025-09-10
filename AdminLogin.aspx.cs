using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SaifPortFoliio
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected TextBox txtUsername;
        protected TextBox txtPassword;
        protected Panel pnlError;
        protected Label lblError;
        protected Button btnLogin;

        protected void Page_Load(object sender, EventArgs e)
        {
            // If already logged in, redirect to admin dashboard
            if (Session["IsAdminLoggedIn"] != null && (bool)Session["IsAdminLoggedIn"])
            {
                Response.Redirect("AdminDashboard.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Check credentials
            if (username == "saif" && password == "2107017")
            {
                // Set session
                Session["IsAdminLoggedIn"] = true;
                Session["AdminUsername"] = username;
                Session.Timeout = 30; // 30 minutes timeout

                // Redirect to admin dashboard
                Response.Redirect("AdminDashboard.aspx");
            }
            else
            {
                // Show error
                pnlError.Visible = true;
                lblError.Text = "Invalid username or password. Please try again.";
                
                // Clear password field
                txtPassword.Text = "";
                txtUsername.Focus();
            }
        }
    }
}