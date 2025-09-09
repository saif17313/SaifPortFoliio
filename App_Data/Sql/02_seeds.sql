SUSE SaifPortFolio;
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
(N'Blossom in Focus',
 N'A hibiscus bloom captured in warm light, its delicate textures and vibrant center standing out against a dark background.',
 N'/Content/img/photography/pic1.png'),  -- Updated with dimension hint
(N'Twilight Reflections',
 N'A calm river at dusk, where fading sunlight meets the stillness of silhouetted boats and deep blue skies.',
 N'/Content/img/photography/pic2.png'),
 (N'Evening in Violet Hues',
 N'Beneath a fading sky brushed with lavender and rose, the pavilion rests in silence — a gentle pause between day and night.',
 N'/Content/img/photography/pic3.png'),
 (N'Moon Veiled in Clouds',
 N'A night sky textured with drifting clouds, softly illuminated by the hidden glow of the moon.',
 N'/Content/img/photography/pic4.png'),
 (N'Golden Horizon',
 N'The sun sets over calm waters, its golden light reflecting gently across rippling waves.',
 N'/Content/img/photography/pic5.png'),
 (N'Flames of Serenity',
 N'A night sky textured with drifting clouds, softly illuminated by the hidden glow of the moon.',
 N'/Content/img/photography/pic6.png');

COMMIT TRAN;
GO

-- Quick checks
SELECT * FROM dbo.Projects ORDER BY Id DESC;
SELECT * FROM dbo.Roles ORDER BY Id;
SELECT * FROM dbo.Skills ORDER BY Id;
SELECT * FROM dbo.Photography ORDER BY Id DESC;
