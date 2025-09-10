using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Services;

namespace SaifPortFoliio
{
    public partial class AdminDashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is authenticated
            if (Session["IsAdminLoggedIn"] == null || !(bool)Session["IsAdminLoggedIn"])
            {
                // Redirect to login page if not authenticated
                Response.Redirect("AdminLogin.aspx");
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
                // Get unread messages from database
                var unreadMessages = Db.GetUnreadMessages();
                
                // You can pass this data to JavaScript if needed
                var jsMessages = unreadMessages.Select(m => new {
                    id = m.Id,
                    email = m.Email,
                    senderName = GetSenderName(m.Email),
                    message = m.MessageText,
                    createdAt = GetTimeAgo(m.CreatedAt),
                    isUrgent = IsUrgentMessage(m.MessageText)
                }).ToList();

                // Inject data into JavaScript (optional)
                string script = $"window.serverMessages = {Newtonsoft.Json.JsonConvert.SerializeObject(jsMessages)};";
                ClientScript.RegisterStartupScript(this.GetType(), "serverMessages", script, true);
            }
            catch (Exception ex)
            {
                // Log error
                System.Diagnostics.Debug.WriteLine("Error loading messages: " + ex.Message);
            }
        }

        private string GetSenderName(string email)
        {
            // Extract name from email or return email
            if (email.Contains("@"))
            {
                var localPart = email.Split('@')[0];
                return System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(
                    localPart.Replace(".", " ").Replace("_", " "));
            }
            return email;
        }

        private string GetTimeAgo(DateTime createdAt)
        {
            var timeSpan = DateTime.Now - createdAt;
            
            if (timeSpan.TotalMinutes < 60)
                return $"{(int)timeSpan.TotalMinutes} minutes ago";
            else if (timeSpan.TotalHours < 24)
                return $"{(int)timeSpan.TotalHours} hours ago";
            else if (timeSpan.TotalDays < 7)
                return $"{(int)timeSpan.TotalDays} days ago";
            else
                return createdAt.ToString("MMM dd, yyyy");
        }

        private bool IsUrgentMessage(string message)
        {
            // Simple urgency detection based on keywords
            var urgentKeywords = new[] { "urgent", "asap", "immediately", "emergency", "important", "deadline" };
            return urgentKeywords.Any(keyword => message.ToLower().Contains(keyword));
        }

        // Web method to mark message as read
        [WebMethod]
        public static bool MarkMessageAsRead(int messageId)
        {
            try
            {
                return Db.MarkMessageAsRead(messageId);
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
                return Db.DeleteMessage(messageId);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error deleting message: " + ex.Message);
                return false;
            }
        }

        // Web method to mark all messages as read
        [WebMethod]
        public static bool MarkAllMessagesAsRead()
        {
            try
            {
                return Db.MarkAllMessagesAsRead();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error marking all messages as read: " + ex.Message);
                return false;
            }
        }

        // Web method to get fresh unread messages
        [WebMethod]
        public static object GetUnreadMessages()
        {
            try
            {
                var unreadMessages = Db.GetUnreadMessages();
                return unreadMessages.Select(m => new {
                    id = m.Id,
                    email = m.Email,
                    senderName = GetSenderNameStatic(m.Email),
                    message = m.MessageText,
                    createdAt = GetTimeAgoStatic(m.CreatedAt),
                    isUrgent = IsUrgentMessageStatic(m.MessageText)
                }).ToList();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error getting unread messages: " + ex.Message);
                return new List<object>();
            }
        }

        // Web method to get skills
        [WebMethod]
        public static object GetSkills()
        {
            try
            {
                var skills = Db.GetAllSkills();
                return skills.Select(s => new {
                    id = s.Id,
                    name = s.Name,
                    level = s.LevelPercent ?? 0,
                    category = s.Category
                }).ToList();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error getting skills: " + ex.Message);
                return new List<object>();
            }
        }

        // Web method to delete skill
        [WebMethod]
        public static bool DeleteSkill(int skillId)
        {
            try
            {
                return Db.DeleteSkill(skillId);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error deleting skill: " + ex.Message);
                return false;
            }
        }

        // Static helper methods for web methods
        private static string GetSenderNameStatic(string email)
        {
            if (email.Contains("@"))
            {
                var localPart = email.Split('@')[0];
                return System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(
                    localPart.Replace(".", " ").Replace("_", " "));
            }
            return email;
        }

        private static string GetTimeAgoStatic(DateTime createdAt)
        {
            var timeSpan = DateTime.Now - createdAt;
            
            if (timeSpan.TotalMinutes < 60)
                return $"{(int)timeSpan.TotalMinutes} minutes ago";
            else if (timeSpan.TotalHours < 24)
                return $"{(int)timeSpan.TotalHours} hours ago";
            else if (timeSpan.TotalDays < 7)
                return $"{(int)timeSpan.TotalDays} days ago";
            else
                return createdAt.ToString("MMM dd, yyyy");
        }

        private static bool IsUrgentMessageStatic(string message)
        {
            var urgentKeywords = new[] { "urgent", "asap", "immediately", "emergency", "important", "deadline" };
            return urgentKeywords.Any(keyword => message.ToLower().Contains(keyword));
        }

        protected void btnSignOut_Click(object sender, EventArgs e)
        {
            try
            {
                // Clear all session data
                Session.Clear();
                Session.Abandon();

                // Clear any authentication cookies
                if (Request.Cookies["AdminAuth"] != null)
                {
                    HttpCookie cookie = new HttpCookie("AdminAuth")
                    {
                        Expires = DateTime.Now.AddDays(-1) // Expire the cookie
                    };
                    Response.Cookies.Add(cookie);
                }

                // Redirect to login page
                Response.Redirect("AdminLogin.aspx");
            }
            catch (Exception ex)
            {
                // Log error and redirect anyway
                System.Diagnostics.Debug.WriteLine("Error during sign out: " + ex.Message);
                Response.Redirect("AdminLogin.aspx");
            }
        }
    }
}