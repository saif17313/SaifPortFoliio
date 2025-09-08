USE SaifPortFolio;
GO

BEGIN TRAN;

-- =========================
-- Projects
-- =========================
INSERT INTO dbo.Projects
    (Title, Slug, ShortDescription, CoverImagePath, LiveUrl, RepoUrl)
VALUES
    (N'Unified Class Co-ordination App',
     N'unified-class-co-ordination-app',
     N'Unified class coordination app for managing classroom announcements, schedules, and collaboration.',
     N'/Content/img/projects/project1.jpg', 
     NULL,                                   
     N'https://github.com/saif17313/Unified-Class-Co-ordination-App');

-- =========================
-- Roles (typewriter line)
-- =========================
INSERT INTO dbo.Roles (RoleText) VALUES 
('Full Stack Developer'),
('Software Engineer'),
('Graphics Designer'),
('Problem Solver'),
('Web Developer'),
('UI/UX Designer');

-- =========================
-- Skills
-- =========================
INSERT INTO dbo.Skills (Name, LevelPercent, Category)
VALUES
(N'C',   100, N'Programming'),
(N'C++', 100, N'Programming'),
(N'Java', 95,  N'Programming');

-- =========================
-- Photography
-- =========================
INSERT INTO dbo.Photography (Name, [Description], ImagePath)
VALUES
(N'Sunlit Ground',
 N'A low-angle golden-hour scene where sharp grass blades lead to palm silhouettes and a hazy urban skyline—contrasting intimate ground detail with a soft city backdrop.',
 N'/Content/img/photography/pic1.jpg'),
(N'Crimson Core',
 N'A dramatic macro of a hibiscus, its velvety petals and upright stigma glowing in late-afternoon light against a calm, dark-green background.',
 N'/Content/img/photography/pic2.jpg');

COMMIT TRAN;
GO

-- Quick checks
SELECT * FROM dbo.Projects ORDER BY Id DESC;
SELECT * FROM dbo.Roles ORDER BY Id;
SELECT * FROM dbo.Skills ORDER BY Id;
SELECT * FROM dbo.Photography ORDER BY Id DESC;
