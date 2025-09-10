using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace SaifPortFoliio.Admin
{
    public partial class Message : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is authenticated
            if (Session["IsAdminLoggedIn"] == null || !(bool)Session["IsAdminLoggedIn"])
            {
                // Redirect to login page if not authenticated
                Response.Redirect("../AdminLogin.aspx");
                return;
            }

            // Maintain scroll position during PostBack
            Page.MaintainScrollPositionOnPostBack = true;

            if (!IsPostBack)
            {
                LoadAllMessages();
            }
        }

        private void LoadAllMessages()
        {
            try
            {
                // Test database connection first
                if (!SaifPortFoliio.Db.TestConnection())
                {
                    throw new Exception("Database connection failed");
                }

                // Get all messages from database (both read and unread)
                var allMessages = SaifPortFoliio.Db.GetAllMessages();
                
                System.Diagnostics.Debug.WriteLine($"LoadAllMessages: Found {allMessages.Count} messages");
                
                // Pass only the actual table attributes to JavaScript
                var jsMessages = allMessages.Select(m => new {
                    id = m.Id,
                    email = m.Email,
                    message = m.MessageText,
                    isRead = m.IsRead,
                    createdAt = m.CreatedAt.ToString("MMM dd, yyyy HH:mm")
                }).ToList();

                // Inject data into JavaScript with enhanced error handling
                string script = $@"
                    try {{
                        window.serverMessages = {Newtonsoft.Json.JsonConvert.SerializeObject(jsMessages)};
                        console.log('✅ Server messages loaded:', window.serverMessages);
                        console.log('📊 Message count:', window.serverMessages.length);
                        
                        // Load messages immediately if DOM is ready
                        if (document.readyState === 'loading') {{
                            document.addEventListener('DOMContentLoaded', function() {{
                                console.log('📱 DOM loaded, loading messages...');
                                if (window.serverMessages) {{
                                    allMessages = window.serverMessages;
                                    displayMessages();
                                }}
                            }});
                        }} else {{
                            console.log('📱 DOM already loaded, loading messages immediately...');
                            setTimeout(function() {{
                                if (typeof allMessages !== 'undefined' && window.serverMessages) {{
                                    allMessages = window.serverMessages;
                                    displayMessages();
                                }} else {{
                                    console.log('🔄 Variables not ready, retrying...');
                                    setTimeout(function() {{
                                        if (window.serverMessages) {{
                                            allMessages = window.serverMessages;
                                            displayMessages();
                                        }}
                                    }}, 500);
                                }}
                            }}, 100);
                        }}
                    }} catch (error) {{
                        console.error('❌ Error in server script:', error);
                        window.serverMessagesError = true;
                    }}
                ";
                
                ClientScript.RegisterStartupScript(this.GetType(), "serverMessages", script, true);
            }
            catch (Exception ex)
            {
                // Log detailed error
                System.Diagnostics.Debug.WriteLine("Error loading messages: " + ex.Message);
                System.Diagnostics.Debug.WriteLine("Stack trace: " + ex.StackTrace);
                
                // Inject error message to JavaScript
                string errorScript = $@"
                    console.error('❌ Error loading messages from server:', '{ex.Message}');
                    console.error('📋 Error details:', '{ex.ToString().Replace("'", "\\''")}');
                    window.serverMessagesError = true;
                    window.serverErrorMessage = '{ex.Message.Replace("'", "\\''")}';
                ";
                ClientScript.RegisterStartupScript(this.GetType(), "serverMessagesError", errorScript, true);
            }
        }

        // Web method to get all messages (both read and unread) - for AJAX refresh
        [WebMethod]
        public static object GetAllMessages()
        {
            try
            {
                System.Diagnostics.Debug.WriteLine("GetAllMessages called via AJAX");
                
                // Test connection first
                if (!SaifPortFoliio.Db.TestConnection())
                {
                    System.Diagnostics.Debug.WriteLine("Database connection failed in GetAllMessages");
                    return new List<object>();
                }
                
                var allMessages = SaifPortFoliio.Db.GetAllMessages();
                System.Diagnostics.Debug.WriteLine($"GetAllMessages: Found {allMessages.Count} messages");
                
                var result = allMessages.Select(m => new {
                    id = m.Id,
                    email = m.Email,
                    message = m.MessageText,
                    isRead = m.IsRead,
                    createdAt = m.CreatedAt.ToString("MMM dd, yyyy HH:mm")
                }).ToList();
                
                System.Diagnostics.Debug.WriteLine($"GetAllMessages: Returning {result.Count} formatted messages");
                return result;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error getting all messages: " + ex.Message);
                System.Diagnostics.Debug.WriteLine("Stack trace: " + ex.StackTrace);
                return new List<object>();
            }
        }
    }
}