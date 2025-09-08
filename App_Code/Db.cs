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
