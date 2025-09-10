using System;
using System.Web.UI;

namespace SaifPortFoliio
{
    public partial class AdminRedirect : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect("AdminDashboard.aspx");
        }
    }
}
