using System;
using System.Web;
using System.Web.UI;

namespace SaifPortFoliio
{
    public partial class AdminCRUD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check authentication
            if (Session["AdminAuthenticated"] == null || !(bool)Session["AdminAuthenticated"])
            {
                Response.Redirect("AdminLogin.aspx");
                return;
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("AdminLogin.aspx");
        }
    }
}