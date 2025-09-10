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

            if (!IsPostBack)
            {
                LoadUnreadMessages();
            }
        }

        private void LoadUnreadMessages()
        {
            try
            {
                // Get unread messages from database (IsRead = 0)
                var unreadMessages = SaifPortFoliio.Db.GetUnreadMessages();
                
                // Pass only the actual table attributes to JavaScript
                var jsMessages = unreadMessages.Select(m => new {
                    id = m.Id,
                    email = m.Email,
                    message = m.MessageText,
                    isRead = m.IsRead,
                    createdAt = m.CreatedAt.ToString("MMM dd, yyyy HH:mm")
                }).ToList();

                // Inject data into JavaScript - ensure it loads immediately
                string script = $@"
                    window.serverMessages = {Newtonsoft.Json.JsonConvert.SerializeObject(jsMessages)};
                    console.log('Server messages loaded:', window.serverMessages);
                    
                    // Load messages immediately if DOM is ready
                    if (document.readyState === 'loading') {{
                        document.addEventListener('DOMContentLoaded', function() {{
                            if (window.serverMessages && window.serverMessages.length > 0) {{
                                unreadMessages = window.serverMessages;
                                displayMessages();
                            }}
                        }});
                    }} else {{
                        if (window.serverMessages && window.serverMessages.length > 0) {{
                            setTimeout(function() {{
                                if (typeof unreadMessages !== 'undefined') {{
                                    unreadMessages = window.serverMessages;
                                    displayMessages();
                                }}
                            }}, 100);
                        }}
                    }}
                ";
                
                ClientScript.RegisterStartupScript(this.GetType(), "serverMessages", script, true);
            }
            catch (Exception ex)
            {
                // Log error
                System.Diagnostics.Debug.WriteLine("Error loading messages: " + ex.Message);
                
                // Inject error message to JavaScript
                string errorScript = $@"
                    console.error('Error loading messages from server:', '{ex.Message}');
                    window.serverMessagesError = true;
                ";
                ClientScript.RegisterStartupScript(this.GetType(), "serverMessagesError", errorScript, true);
            }
        }

        // Web method to mark message as read (sets IsRead = 1)
        [WebMethod]
        public static bool MarkMessageAsRead(int messageId)
        {
            try
            {
                return SaifPortFoliio.Db.MarkMessageAsRead(messageId);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error marking message as read: " + ex.Message);
                return false;
            }
        }

        // Web method to delete message
        [WebMethod]
        public static bool DeleteMessage(int messageId)
        {
            try
            {
                return SaifPortFoliio.Db.DeleteMessage(messageId);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error deleting message: " + ex.Message);
                return false;
            }
        }

        // Web method to mark all messages as read (sets IsRead = 1 for all unread)
        [WebMethod]
        public static bool MarkAllMessagesAsRead()
        {
            try
            {
                return SaifPortFoliio.Db.MarkAllMessagesAsRead();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error marking all messages as read: " + ex.Message);
                return false;
            }
        }

        // Web method to get fresh unread messages (IsRead = 0)
        [WebMethod]
        public static object GetUnreadMessages()
        {
            try
            {
                var unreadMessages = SaifPortFoliio.Db.GetUnreadMessages();
                return unreadMessages.Select(m => new {
                    id = m.Id,
                    email = m.Email,
                    message = m.MessageText,
                    isRead = m.IsRead,
                    createdAt = m.CreatedAt.ToString("MMM dd, yyyy HH:mm")
                }).ToList();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error getting unread messages: " + ex.Message);
                return new List<object>();
            }
        }
    }
}