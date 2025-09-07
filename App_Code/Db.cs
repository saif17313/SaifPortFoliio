using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace SaifPortFoliio.App_Code
{
    public class Db
    {
        private static readonly string ConnectionString =
            ConfigurationManager.ConnectionStrings["SaifDb"].ConnectionString;

        #region Projects CRUD Operations

        public static List<Project> GetAllProjects()
        {
            var projects = new List<Project>();
            using (var conn = new SqlConnection(ConnectionString))
            {
                conn.Open();
                using (var cmd = new SqlCommand(
                    "SELECT Id, Title, Slug, ShortDescription, CoverImagePath, LiveUrl, RepoUrl FROM Projects ORDER BY Id DESC",
                    conn))
                using (var reader = cmd.ExecuteReader())
                {
                    // ordinals
                    int iId = reader.GetOrdinal("Id");
                    int iTitle = reader.GetOrdinal("Title");
                    int iSlug = reader.GetOrdinal("Slug");
                    int iShort = reader.GetOrdinal("ShortDescription");
                    int iCover = reader.GetOrdinal("CoverImagePath");
                    int iLive = reader.GetOrdinal("LiveUrl");
                    int iRepo = reader.GetOrdinal("RepoUrl");

                    while (reader.Read())
                    {
                        projects.Add(new Project
                        {
                            Id = reader.GetInt32(iId),
                            Title = reader.GetString(iTitle),
                            Slug = reader.GetString(iSlug),
                            ShortDescription = reader.IsDBNull(iShort) ? null : reader.GetString(iShort),
                            CoverImagePath = reader.IsDBNull(iCover) ? null : reader.GetString(iCover),
                            LiveUrl = reader.IsDBNull(iLive) ? null : reader.GetString(iLive),
                            RepoUrl = reader.IsDBNull(iRepo) ? null : reader.GetString(iRepo)
                        });
                    }
                }
            }
            return projects;
        }

        public static Project GetProjectById(int id)
        {
            using (var conn = new SqlConnection(ConnectionString))
            {
                conn.Open();
                using (var cmd = new SqlCommand(
                    "SELECT Id, Title, Slug, ShortDescription, CoverImagePath, LiveUrl, RepoUrl FROM Projects WHERE Id = @Id",
                    conn))
                {
                    cmd.Parameters.AddWithValue("@Id", id);
                    using (var reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            int iId = reader.GetOrdinal("Id");
                            int iTitle = reader.GetOrdinal("Title");
                            int iSlug = reader.GetOrdinal("Slug");
                            int iShort = reader.GetOrdinal("ShortDescription");
                            int iCover = reader.GetOrdinal("CoverImagePath");
                            int iLive = reader.GetOrdinal("LiveUrl");
                            int iRepo = reader.GetOrdinal("RepoUrl");

                            return new Project
                            {
                                Id = reader.GetInt32(iId),
                                Title = reader.GetString(iTitle),
                                Slug = reader.GetString(iSlug),
                                ShortDescription = reader.IsDBNull(iShort) ? null : reader.GetString(iShort),
                                CoverImagePath = reader.IsDBNull(iCover) ? null : reader.GetString(iCover),
                                LiveUrl = reader.IsDBNull(iLive) ? null : reader.GetString(iLive),
                                RepoUrl = reader.IsDBNull(iRepo) ? null : reader.GetString(iRepo)
                            };
                        }
                    }
                }
            }
            return null;
        }

        public static bool InsertProject(Project project)
        {
            try
            {
                using (var conn = new SqlConnection(ConnectionString))
                {
                    conn.Open();
                    using (var cmd = new SqlCommand(
                        @"INSERT INTO Projects (Title, Slug, ShortDescription, CoverImagePath, LiveUrl, RepoUrl) 
                          VALUES (@Title, @Slug, @ShortDescription, @CoverImagePath, @LiveUrl, @RepoUrl)", conn))
                    {
                        cmd.Parameters.AddWithValue("@Title", project.Title);
                        cmd.Parameters.AddWithValue("@Slug", project.Slug);
                        cmd.Parameters.AddWithValue("@ShortDescription", (object)project.ShortDescription ?? DBNull.Value);
                        cmd.Parameters.AddWithValue("@CoverImagePath", (object)project.CoverImagePath ?? DBNull.Value);
                        cmd.Parameters.AddWithValue("@LiveUrl", (object)project.LiveUrl ?? DBNull.Value);
                        cmd.Parameters.AddWithValue("@RepoUrl", (object)project.RepoUrl ?? DBNull.Value);
                        return cmd.ExecuteNonQuery() > 0;
                    }
                }
            }
            catch { return false; }
        }

        public static bool UpdateProject(Project project)
        {
            try
            {
                using (var conn = new SqlConnection(ConnectionString))
                {
                    conn.Open();
                    using (var cmd = new SqlCommand(
                        @"UPDATE Projects SET Title = @Title, Slug = @Slug, 
                          ShortDescription = @ShortDescription, CoverImagePath = @CoverImagePath, 
                          LiveUrl = @LiveUrl, RepoUrl = @RepoUrl WHERE Id = @Id", conn))
                    {
                        cmd.Parameters.AddWithValue("@Id", project.Id);
                        cmd.Parameters.AddWithValue("@Title", project.Title);
                        cmd.Parameters.AddWithValue("@Slug", project.Slug);
                        cmd.Parameters.AddWithValue("@ShortDescription", (object)project.ShortDescription ?? DBNull.Value);
                        cmd.Parameters.AddWithValue("@CoverImagePath", (object)project.CoverImagePath ?? DBNull.Value);
                        cmd.Parameters.AddWithValue("@LiveUrl", (object)project.LiveUrl ?? DBNull.Value);
                        cmd.Parameters.AddWithValue("@RepoUrl", (object)project.RepoUrl ?? DBNull.Value);
                        return cmd.ExecuteNonQuery() > 0;
                    }
                }
            }
            catch { return false; }
        }

        public static bool DeleteProject(int id)
        {
            try
            {
                using (var conn = new SqlConnection(ConnectionString))
                {
                    conn.Open();
                    using (var cmd = new SqlCommand("DELETE FROM Projects WHERE Id = @Id", conn))
                    {
                        cmd.Parameters.AddWithValue("@Id", id);
                        return cmd.ExecuteNonQuery() > 0;
                    }
                }
            }
            catch { return false; }
        }

        #endregion

        #region Skills CRUD Operations

        public static List<Skill> GetAllSkills()
        {
            var skills = new List<Skill>();
            using (var conn = new SqlConnection(ConnectionString))
            {
                conn.Open();
                using (var cmd = new SqlCommand(
                    "SELECT Id, Name, LevelPercent, Category FROM Skills ORDER BY Category, Name", conn))
                using (var reader = cmd.ExecuteReader())
                {
                    int iId = reader.GetOrdinal("Id");
                    int iName = reader.GetOrdinal("Name");
                    int iLevel = reader.GetOrdinal("LevelPercent");
                    int iCat = reader.GetOrdinal("Category");

                    while (reader.Read())
                    {
                        skills.Add(new Skill
                        {
                            Id = reader.GetInt32(iId),
                            Name = reader.GetString(iName),
                            LevelPercent = reader.IsDBNull(iLevel) ? (int?)null : reader.GetInt32(iLevel),
                            Category = reader.IsDBNull(iCat) ? null : reader.GetString(iCat)
                        });
                    }
                }
            }
            return skills;
        }

        public static bool InsertSkill(Skill skill)
        {
            try
            {
                using (var conn = new SqlConnection(ConnectionString))
                {
                    conn.Open();
                    using (var cmd = new SqlCommand(
                        @"INSERT INTO Skills (Name, LevelPercent, Category) 
                          VALUES (@Name, @LevelPercent, @Category)", conn))
                    {
                        cmd.Parameters.AddWithValue("@Name", skill.Name);
                        cmd.Parameters.AddWithValue("@LevelPercent", (object)skill.LevelPercent ?? DBNull.Value);
                        cmd.Parameters.AddWithValue("@Category", (object)skill.Category ?? DBNull.Value);
                        return cmd.ExecuteNonQuery() > 0;
                    }
                }
            }
            catch { return false; }
        }

        public static bool UpdateSkill(Skill skill)
        {
            try
            {
                using (var conn = new SqlConnection(ConnectionString))
                {
                    conn.Open();
                    using (var cmd = new SqlCommand(
                        @"UPDATE Skills SET Name = @Name, LevelPercent = @LevelPercent, 
                          Category = @Category WHERE Id = @Id", conn))
                    {
                        cmd.Parameters.AddWithValue("@Id", skill.Id);
                        cmd.Parameters.AddWithValue("@Name", skill.Name);
                        cmd.Parameters.AddWithValue("@LevelPercent", (object)skill.LevelPercent ?? DBNull.Value);
                        cmd.Parameters.AddWithValue("@Category", (object)skill.Category ?? DBNull.Value);
                        return cmd.ExecuteNonQuery() > 0;
                    }
                }
            }
            catch { return false; }
        }

        public static bool DeleteSkill(int id)
        {
            try
            {
                using (var conn = new SqlConnection(ConnectionString))
                {
                    conn.Open();
                    using (var cmd = new SqlCommand("DELETE FROM Skills WHERE Id = @Id", conn))
                    {
                        cmd.Parameters.AddWithValue("@Id", id);
                        return cmd.ExecuteNonQuery() > 0;
                    }
                }
            }
            catch { return false; }
        }

        #endregion

        #region Roles CRUD Operations

        public static List<Role> GetAllRoles()
        {
            var roles = new List<Role>();
            using (var conn = new SqlConnection(ConnectionString))
            {
                conn.Open();
                using (var cmd = new SqlCommand("SELECT Id, RoleText FROM Roles ORDER BY Id", conn))
                using (var reader = cmd.ExecuteReader())
                {
                    int iId = reader.GetOrdinal("Id");
                    int iText = reader.GetOrdinal("RoleText");

                    while (reader.Read())
                    {
                        roles.Add(new Role
                        {
                            Id = reader.GetInt32(iId),
                            RoleText = reader.GetString(iText)
                        });
                    }
                }
            }
            return roles;
        }

        public static bool InsertRole(Role role)
        {
            try
            {
                using (var conn = new SqlConnection(ConnectionString))
                {
                    conn.Open();
                    using (var cmd = new SqlCommand("INSERT INTO Roles (RoleText) VALUES (@RoleText)", conn))
                    {
                        cmd.Parameters.AddWithValue("@RoleText", role.RoleText);
                        return cmd.ExecuteNonQuery() > 0;
                    }
                }
            }
            catch { return false; }
        }

        public static bool DeleteRole(int id)
        {
            try
            {
                using (var conn = new SqlConnection(ConnectionString))
                {
                    conn.Open();
                    using (var cmd = new SqlCommand("DELETE FROM Roles WHERE Id = @Id", conn))
                    {
                        cmd.Parameters.AddWithValue("@Id", id);
                        return cmd.ExecuteNonQuery() > 0;
                    }
                }
            }
            catch { return false; }
        }

        #endregion

        #region Photography CRUD Operations

        public static List<Photography> GetAllPhotography()
        {
            var photos = new List<Photography>();
            using (var conn = new SqlConnection(ConnectionString))
            {
                conn.Open();
                using (var cmd = new SqlCommand(
                    "SELECT Id, Name, [Description], ImagePath FROM Photography ORDER BY Id DESC", conn))
                using (var reader = cmd.ExecuteReader())
                {
                    int iId = reader.GetOrdinal("Id");
                    int iName = reader.GetOrdinal("Name");
                    int iDesc = reader.GetOrdinal("Description");
                    int iPath = reader.GetOrdinal("ImagePath");

                    while (reader.Read())
                    {
                        photos.Add(new Photography
                        {
                            Id = reader.GetInt32(iId),
                            Name = reader.GetString(iName),
                            Description = reader.IsDBNull(iDesc) ? null : reader.GetString(iDesc),
                            ImagePath = reader.GetString(iPath)
                        });
                    }
                }
            }
            return photos;
        }

        public static bool InsertPhotography(Photography photo)
        {
            try
            {
                using (var conn = new SqlConnection(ConnectionString))
                {
                    conn.Open();
                    using (var cmd = new SqlCommand(
                        @"INSERT INTO Photography (Name, [Description], ImagePath) 
                          VALUES (@Name, @Description, @ImagePath)", conn))
                    {
                        cmd.Parameters.AddWithValue("@Name", photo.Name);
                        cmd.Parameters.AddWithValue("@Description", (object)photo.Description ?? DBNull.Value);
                        cmd.Parameters.AddWithValue("@ImagePath", photo.ImagePath);
                        return cmd.ExecuteNonQuery() > 0;
                    }
                }
            }
            catch { return false; }
        }

        public static bool DeletePhotography(int id)
        {
            try
            {
                using (var conn = new SqlConnection(ConnectionString))
                {
                    conn.Open();
                    using (var cmd = new SqlCommand("DELETE FROM Photography WHERE Id = @Id", conn))
                    {
                        cmd.Parameters.AddWithValue("@Id", id);
                        return cmd.ExecuteNonQuery() > 0;
                    }
                }
            }
            catch { return false; }
        }

        #endregion

        #region Admin Authentication

        public static bool ValidateAdmin(string username, string password)
        {
            var adminUser = ConfigurationManager.AppSettings["AdminUser"];
            var adminPass = ConfigurationManager.AppSettings["AdminPass"];
            return username == adminUser && password == adminPass;
        }

        #endregion
    }

    #region Model Classes

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

    public class Skill
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int? LevelPercent { get; set; }
        public string Category { get; set; }
    }

    public class Role
    {
        public int Id { get; set; }
        public string RoleText { get; set; }
    }

    public class Photography
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string ImagePath { get; set; }
    }

    #endregion
}
