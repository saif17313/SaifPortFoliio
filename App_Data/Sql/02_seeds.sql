USE SaifPortFolio;
GO

BEGIN TRAN;

-- =========================
-- Projects (3:2 aspect ratio - 600x400px thumbnails)
-- =========================
INSERT INTO dbo.Projects
    (Title, Slug, ShortDescription, CoverImagePath, LiveUrl, RepoUrl)
VALUES
    -- Unified Class Co-ordination App
    (N'Unified Class Co-ordination App',
     N'unified-class-co-ordination-app',
     N'Unified class coordination app for managing classroom announcements, schedules, and collaboration.',
     N'/Content/img/projects/unifiedclass.png',
     N'https://github.com/saif17313/Unified-Class-Co-ordination-App',
     N'https://github.com/saif17313/Unified-Class-Co-ordination-App'),

    -- KUET Vending Machine
    (N'KUET Vending Machine',
     N'kuet-vending-machine',
     N'A C++ Object-Oriented Programming project that simulates a vending machine system with product selection, balance management, and dispensing logic.',
     N'/Content/img/projects/vendingmachine.png',
     N'https://github.com/saif17313/KUET-Vending-Machine',
     N'https://github.com/saif17313/KUET-Vending-Machine'),

    -- National Emergency Helpline System
    (N'National Emergency Helpline System',
     N'national-emergency-helpline-system',
     N'A C++ Object-Oriented Programming project simulating a national emergency helpline with call intake, categorization, priority queuing, and dispatcher assignment.',
     N'/Content/img/projects/emergencyhelpline.png',
     N'https://github.com/saif17313/National-Emergency-Helpline-System',
     N'https://github.com/saif17313/National-Emergency-Helpline-System'),

    -- Portfolio (your personal portfolio project)
    (N'Personal Portfolio Website',
     N'portfolio',
     N'A personal portfolio website showcasing my projects, skills, and achievements.',
     N'/Content/img/projects/portfolio.png',
     N'https://saif17313.github.io',  -- Replace with your live portfolio URL if available
     N'https://github.com/saif17313/SaifPortFoliio');


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
(N'Java', 95,  N'Programming'),
(N'Java', 95,  N'Programming'),
(N'JavaScript', 85, N'Programming'),
(N'Python', 80, N'Programming'),
(N'HTML5', 85, N'Web Development'),
(N'CSS3', 90, N'Web Development'),
(N'jQuery', 60, N'Web Development'),
(N'ASP.NET', 80, N'Web Development'),
(N'Bootstrap', 75, N'Web Development'),
(N'Photoshop', 75, N'Design'),
(N'WordPress', 70, N'CMS'),
(N'SEO', 80, N'Marketing'),
(N'Git', 85, N'Tools'),
(N'Database Design', 88, N'Database');

-- =========================
-- Photography (1:1 aspect ratio - 400x400px thumbnails)
-- =========================
INSERT INTO dbo.Photography (Name, [Description], ImagePath)
VALUES
(N'Sunlit Ground',
 N'A low-angle golden-hour scene where sharp grass blades lead to palm silhouettes and a hazy urban skyline—contrasting intimate ground detail with a soft city backdrop.',
 N'/Content/img/photography/pic1-400x400.jpg'),  -- Updated with dimension hint
(N'Crimson Core',
 N'A dramatic macro of a hibiscus, its velvety petals and upright stigma glowing in late-afternoon light against a calm, dark-green background.',
 N'/Content/img/photography/pic2-400x400.jpg');  -- Updated with dimension hint

COMMIT TRAN;
GO

-- Quick checks
SELECT * FROM dbo.Projects ORDER BY Id DESC;
SELECT * FROM dbo.Roles ORDER BY Id;
SELECT * FROM dbo.Skills ORDER BY Id;
SELECT * FROM dbo.Photography ORDER BY Id DESC;
