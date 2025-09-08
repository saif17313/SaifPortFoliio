using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;

namespace SaifPortFoliio   // ← IMPORTANT
{
    /// <summary>Database access layer for Portfolio</summary>
    public static class Db
    {
        private static string ConnectionString
        {
            get
            {
                var cs = ConfigurationManager.ConnectionStrings["DefaultConnection"];
                if (cs == null || string.IsNullOrWhiteSpace(cs.ConnectionString))
                    throw new InvalidOperationException("Connection string 'DefaultConnection' is missing or empty in Web.config.");
                return cs.ConnectionString;
            }
        }

        // ========================= PROJECTS =========================
        public class Project
        {
            public int Id { get; set; }
            public string Title { get; set; }
            public string Slug { get; set; }
            public string ShortDescription { get; set; }
            public string CoverImagePath { get; set; }
            public string LiveUrl { get; set; }
            public string RepoUrl { get; set; }
        }

        public static List<Project> GetAllProjects()
        {
            var list = new List<Project>();
            try
            {
                using (var cn = new SqlConnection(ConnectionString))
                using (var cmd = new SqlCommand(
                    "SELECT Id, Title, Slug, ShortDescription, CoverImagePath, LiveUrl, RepoUrl FROM dbo.Projects ORDER BY Id DESC", cn))
                {
                    cn.Open();
                    using (var r = cmd.ExecuteReader())
                    {
                        while (r.Read())
                        {
                            list.Add(new Project
                            {
                                Id = r.GetInt32(0),
                                Title = r.GetString(1),
                                Slug = r.GetString(2),
                                ShortDescription = r.IsDBNull(3) ? "" : r.GetString(3),
                                CoverImagePath = r.IsDBNull(4) ? "" : r.GetString(4),
                                LiveUrl = r.IsDBNull(5) ? "" : r.GetString(5),
                                RepoUrl = r.IsDBNull(6) ? "" : r.GetString(6)
                            });
                        }
                    }
                }
            }
            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("GetAllProjects: " + ex.Message); }
            return list;
        }

        public static Project GetProjectById(int id)
        {
            try
            {
                using (var cn = new SqlConnection(ConnectionString))
                using (var cmd = new SqlCommand(
                    "SELECT Id, Title, Slug, ShortDescription, CoverImagePath, LiveUrl, RepoUrl FROM dbo.Projects WHERE Id = @id", cn))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    cn.Open();
                    using (var r = cmd.ExecuteReader())
                    {
                        if (r.Read())
                        {
                            return new Project
                            {
                                Id = r.GetInt32(0),
                                Title = r.GetString(1),
                                Slug = r.GetString(2),
                                ShortDescription = r.IsDBNull(3) ? "" : r.GetString(3),
                                CoverImagePath = r.IsDBNull(4) ? "" : r.GetString(4),
                                LiveUrl = r.IsDBNull(5) ? "" : r.GetString(5),
                                RepoUrl = r.IsDBNull(6) ? "" : r.GetString(6)
                            };
                        }
                    }
                }
            }
            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("GetProjectById: " + ex.Message); }
            return null;
        }

        public static int InsertProject(Project project)
        {
            try
            {
                using (var cn = new SqlConnection(ConnectionString))
                using (var cmd = new SqlCommand(
                    "INSERT INTO dbo.Projects (Title, Slug, ShortDescription, CoverImagePath, LiveUrl, RepoUrl) " +
                    "VALUES (@title, @slug, @desc, @cover, @live, @repo); SELECT SCOPE_IDENTITY();", cn))
                {
                    cmd.Parameters.AddWithValue("@title", project.Title);
                    cmd.Parameters.AddWithValue("@slug", project.Slug);
                    cmd.Parameters.AddWithValue("@desc", project.ShortDescription ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@cover", project.CoverImagePath ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@live", project.LiveUrl ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@repo", project.RepoUrl ?? (object)DBNull.Value);
                    cn.Open();
                    return Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("InsertProject: " + ex.Message); }
            return -1;
        }

        public static bool UpdateProject(Project project)
        {
            try
            {
                using (var cn = new SqlConnection(ConnectionString))
                using (var cmd = new SqlCommand(
                    "UPDATE dbo.Projects SET Title=@title, Slug=@slug, ShortDescription=@desc, CoverImagePath=@cover, LiveUrl=@live, RepoUrl=@repo WHERE Id=@id", cn))
                {
                    cmd.Parameters.AddWithValue("@id", project.Id);
                    cmd.Parameters.AddWithValue("@title", project.Title);
                    cmd.Parameters.AddWithValue("@slug", project.Slug);
                    cmd.Parameters.AddWithValue("@desc", project.ShortDescription ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@cover", project.CoverImagePath ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@live", project.LiveUrl ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@repo", project.RepoUrl ?? (object)DBNull.Value);
                    cn.Open();
                    return cmd.ExecuteNonQuery() > 0;
                }
            }
            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("UpdateProject: " + ex.Message); }
            return false;
        }

        public static bool DeleteProject(int id)
        {
            try
            {
                using (var cn = new SqlConnection(ConnectionString))
                using (var cmd = new SqlCommand("DELETE FROM dbo.Projects WHERE Id = @id", cn))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    cn.Open();
                    return cmd.ExecuteNonQuery() > 0;
                }
            }
            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("DeleteProject: " + ex.Message); }
            return false;
        }

        // ========================= ROLES =========================
        public class Role
        {
            public int Id { get; set; }
            public string RoleText { get; set; }
        }

        public static List<Role> GetAllRoles()
        {
            var list = new List<Role>();
            try
            {
                using (var cn = new SqlConnection(ConnectionString))
                using (var cmd = new SqlCommand("SELECT Id, RoleText FROM dbo.Roles ORDER BY Id", cn))
                {
                    cn.Open();
                    using (var r = cmd.ExecuteReader())
                    {
                        while (r.Read())
                        {
                            list.Add(new Role { Id = r.GetInt32(0), RoleText = r.GetString(1) });
                        }
                    }
                }
            }
            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("GetAllRoles: " + ex.Message); }
            return list;
        }

        public static int InsertRole(string roleText)
        {
            try
            {
                using (var cn = new SqlConnection(ConnectionString))
                using (var cmd = new SqlCommand("INSERT INTO dbo.Roles (RoleText) VALUES (@role); SELECT SCOPE_IDENTITY();", cn))
                {
                    cmd.Parameters.AddWithValue("@role", roleText);
                    cn.Open();
                    return Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("InsertRole: " + ex.Message); }
            return -1;
        }

        public static bool UpdateRole(int id, string roleText)
        {
            try
            {
                using (var cn = new SqlConnection(ConnectionString))
                using (var cmd = new SqlCommand("UPDATE dbo.Roles SET RoleText=@role WHERE Id=@id", cn))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@role", roleText);
                    cn.Open();
                    return cmd.ExecuteNonQuery() > 0;
                }
            }
            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("UpdateRole: " + ex.Message); }
            return false;
        }

        public static bool DeleteRole(int id)
        {
            try
            {
                using (var cn = new SqlConnection(ConnectionString))
                using (var cmd = new SqlCommand("DELETE FROM dbo.Roles WHERE Id = @id", cn))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    cn.Open();
                    return cmd.ExecuteNonQuery() > 0;
                }
            }
            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("DeleteRole: " + ex.Message); }
            return false;
        }

        // ========================= SKILLS =========================
        public class Skill
        {
            public int Id { get; set; }
            public string Name { get; set; }
            public int? LevelPercent { get; set; }
            public string Category { get; set; }
        }

        public static List<Skill> GetAllSkills()
        {
            var list = new List<Skill>();
            try
            {
                using (var cn = new SqlConnection(ConnectionString))
                using (var cmd = new SqlCommand(
                    "SELECT Id, Name, LevelPercent, Category FROM dbo.Skills ORDER BY LevelPercent DESC, Name", cn))
                {
                    cn.Open();
                    using (var r = cmd.ExecuteReader())
                    {
                        while (r.Read())
                        {
                            list.Add(new Skill
                            {
                                Id = r.GetInt32(0),
                                Name = r.GetString(1),
                                LevelPercent = r.IsDBNull(2) ? (int?)null : r.GetInt32(2),
                                Category = r.IsDBNull(3) ? "" : r.GetString(3)
                            });
                        }
                    }
                }
            }
            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("GetAllSkills: " + ex.Message); }
            return list;
        }

        public static int InsertSkill(Skill skill)
        {
            try
            {
                using (var cn = new SqlConnection(ConnectionString))
                using (var cmd = new SqlCommand(
                    "INSERT INTO dbo.Skills (Name, LevelPercent, Category) VALUES (@name, @level, @category); SELECT SCOPE_IDENTITY();", cn))
                {
                    cmd.Parameters.AddWithValue("@name", skill.Name);
                    cmd.Parameters.AddWithValue("@level", skill.LevelPercent ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@category", skill.Category ?? (object)DBNull.Value);
                    cn.Open();
                    return Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("InsertSkill: " + ex.Message); }
            return -1;
        }

        public static bool UpdateSkill(Skill skill)
        {
            try
            {
                using (var cn = new SqlConnection(ConnectionString))
                using (var cmd = new SqlCommand(
                    "UPDATE dbo.Skills SET Name=@name, LevelPercent=@level, Category=@category WHERE Id=@id", cn))
                {
                    cmd.Parameters.AddWithValue("@id", skill.Id);
                    cmd.Parameters.AddWithValue("@name", skill.Name);
                    cmd.Parameters.AddWithValue("@level", skill.LevelPercent ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@category", skill.Category ?? (object)DBNull.Value);
                    cn.Open();
                    return cmd.ExecuteNonQuery() > 0;
                }
            }
            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("UpdateSkill: " + ex.Message); }
            return false;
        }

        public static bool DeleteSkill(int id)
        {
            try
            {
                using (var cn = new SqlConnection(ConnectionString))
                using (var cmd = new SqlCommand("DELETE FROM dbo.Skills WHERE Id = @id", cn))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    cn.Open();
                    return cmd.ExecuteNonQuery() > 0;
                }
            }
            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("DeleteSkill: " + ex.Message); }
            return false;
        }

        // ========================= PHOTOGRAPHY =========================
        public class Photo
        {
            public int Id { get; set; }
            public string Name { get; set; }
            public string Description { get; set; }
            public string ImagePath { get; set; }
        }

        public static List<Photo> GetAllPhotos()
        {
            var list = new List<Photo>();
            try
            {
                using (var cn = new SqlConnection(ConnectionString))
                using (var cmd = new SqlCommand(
                    "SELECT Id, Name, [Description], ImagePath FROM dbo.Photography ORDER BY Id DESC", cn))
                {
                    cn.Open();
                    using (var r = cmd.ExecuteReader())
                    {
                        while (r.Read())
                        {
                            list.Add(new Photo
                            {
                                Id = r.GetInt32(0),
                                Name = r.GetString(1),
                                Description = r.IsDBNull(2) ? "" : r.GetString(2),
                                ImagePath = r.GetString(3)
                            });
                        }
                    }
                }
            }
            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("GetAllPhotos: " + ex.Message); }
            return list;
        }

        public static int InsertPhoto(Photo photo)
        {
            try
            {
                using (var cn = new SqlConnection(ConnectionString))
                using (var cmd = new SqlCommand(
                    "INSERT INTO dbo.Photography (Name, [Description], ImagePath) VALUES (@name, @desc, @path); SELECT SCOPE_IDENTITY();", cn))
                {
                    cmd.Parameters.AddWithValue("@name", photo.Name);
                    cmd.Parameters.AddWithValue("@desc", photo.Description ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@path", photo.ImagePath);
                    cn.Open();
                    return Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("InsertPhoto: " + ex.Message); }
            return -1;
        }

        public static bool UpdatePhoto(Photo photo)
        {
            try
            {
                using (var cn = new SqlConnection(ConnectionString))
                using (var cmd = new SqlCommand(
                    "UPDATE dbo.Photography SET Name=@name, [Description]=@desc, ImagePath=@path WHERE Id=@id", cn))
                {
                    cmd.Parameters.AddWithValue("@id", photo.Id);
                    cmd.Parameters.AddWithValue("@name", photo.Name);
                    cmd.Parameters.AddWithValue("@desc", photo.Description ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@path", photo.ImagePath);
                    cn.Open();
                    return cmd.ExecuteNonQuery() > 0;
                }
            }
            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("UpdatePhoto: " + ex.Message); }
            return false;
        }

        public static bool DeletePhoto(int id)
        {
            try
            {
                using (var cn = new SqlConnection(ConnectionString))
                using (var cmd = new SqlCommand("DELETE FROM dbo.Photography WHERE Id = @id", cn))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    cn.Open();
                    return cmd.ExecuteNonQuery() > 0;
                }
            }
            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("DeletePhoto: " + ex.Message); }
            return false;
        }

        // ========================= MESSAGES (Session/Cookie Data) =========================
        public class Message
        {
            public int Id { get; set; }
            public string Email { get; set; }
            public string MessageText { get; set; }
            public bool IsRead { get; set; }
            public DateTime CreatedAt { get; set; }
        }

        public static List<Message> GetAllMessages()
        {
            var list = new List<Message>();
            try
            {
                using (var cn = new SqlConnection(ConnectionString))
                using (var cmd = new SqlCommand(
                    "SELECT Id, Email, Message, IsRead, CreatedAt FROM dbo.Messages ORDER BY CreatedAt DESC", cn))
                {
                    cn.Open();
                    using (var r = cmd.ExecuteReader())
                    {
                        while (r.Read())
                        {
                            list.Add(new Message
                            {
                                Id = r.GetInt32(0),
                                Email = r.GetString(1),
                                MessageText = r.GetString(2),
                                IsRead = r.GetBoolean(3),
                                CreatedAt = r.GetDateTime(4)
                            });
                        }
                    }
                }
            }
            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("GetAllMessages: " + ex.Message); }
            return list;
        }

        public static List<Message> GetUnreadMessages()
        {
            var list = new List<Message>();
            try
            {
                using (var cn = new SqlConnection(ConnectionString))
                using (var cmd = new SqlCommand(
                    "SELECT Id, Email, Message, IsRead, CreatedAt FROM dbo.Messages WHERE IsRead = 0 ORDER BY CreatedAt DESC", cn))
                {
                    cn.Open();
                    using (var r = cmd.ExecuteReader())
                    {
                        while (r.Read())
                        {
                            list.Add(new Message
                            {
                                Id = r.GetInt32(0),
                                Email = r.GetString(1),
                                MessageText = r.GetString(2),
                                IsRead = r.GetBoolean(3),
                                CreatedAt = r.GetDateTime(4)
                            });
                        }
                    }
                }
            }
            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("GetUnreadMessages: " + ex.Message); }
            return list;
        }

        public static bool MarkMessageAsRead(int id)
        {
            try
            {
                using (var cn = new SqlConnection(ConnectionString))
                using (var cmd = new SqlCommand("UPDATE dbo.Messages SET IsRead = 1 WHERE Id = @id", cn))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    cn.Open();
                    return cmd.ExecuteNonQuery() > 0;
                }
            }
            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("MarkMessageAsRead: " + ex.Message); }
            return false;
        }

        public static bool MarkAllMessagesAsRead()
        {
            try
            {
                using (var cn = new SqlConnection(ConnectionString))
                using (var cmd = new SqlCommand("UPDATE dbo.Messages SET IsRead = 1 WHERE IsRead = 0", cn))
                {
                    cn.Open();
                    return cmd.ExecuteNonQuery() > 0;
                }
            }
            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("MarkAllMessagesAsRead: " + ex.Message); }
            return false;
        }

        public static int InsertMessage(string email, string message)
        {
            try
            {
                using (var cn = new SqlConnection(ConnectionString))
                using (var cmd = new SqlCommand(
                    "INSERT INTO dbo.Messages (Email, Message, IsRead, CreatedAt) VALUES (@email, @message, 0, GETDATE()); SELECT SCOPE_IDENTITY();", cn))
                {
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@message", message);
                    cn.Open();
                    return Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("InsertMessage: " + ex.Message); }
            return -1;
        }

        public static int GetUnreadMessageCount()
        {
            try
            {
                using (var cn = new SqlConnection(ConnectionString))
                using (var cmd = new SqlCommand("SELECT COUNT(*) FROM dbo.Messages WHERE IsRead = 0", cn))
                {
                    cn.Open();
                    return Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("GetUnreadMessageCount: " + ex.Message); }
            return 0;
        }

        public static bool DeleteMessage(int id)
        {
            try
            {
                using (var cn = new SqlConnection(ConnectionString))
                using (var cmd = new SqlCommand("DELETE FROM dbo.Messages WHERE Id = @id", cn))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    cn.Open();
                    return cmd.ExecuteNonQuery() > 0;
                }
            }
            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("DeleteMessage: " + ex.Message); }
            return false;
        }

        // ========================= UTILITY =========================
        public static bool TestConnection()
        {
            try
            {
                using (var cn = new SqlConnection(ConnectionString))
                {
                    cn.Open();
                    return true;
                }
            }
            catch { return false; }
        }
    }
}
