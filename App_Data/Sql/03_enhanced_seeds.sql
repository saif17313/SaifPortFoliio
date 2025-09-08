-- Enhanced seed data for a more complete portfolio
USE SaifPortFolio;
GO

-- Add more roles for typewriter effect
INSERT INTO dbo.Roles (RoleText) VALUES 
('Full Stack Developer'),
('UI/UX Designer'),
('Mobile App Developer'),
('Database Developer');

-- Add more skills
INSERT INTO dbo.Skills (Name, LevelPercent, Category) VALUES 
('JavaScript', 85, 'Programming'),
('HTML/CSS', 90, 'Frontend'),
('ASP.NET', 80, 'Backend'),
('SQL Server', 85, 'Database'),
('Bootstrap', 75, 'Frontend'),
('Photoshop', 88, 'Design'),
('Git', 80, 'Tools');

-- Add more projects
INSERT INTO dbo.Projects (Title, Slug, ShortDescription, CoverImagePath, LiveUrl, RepoUrl) VALUES 
('Personal Portfolio Website', 'portfolio-website', 'A responsive portfolio website built with ASP.NET showcasing my skills and projects.', '/Content/img/projects/project2.jpg', NULL, 'https://github.com/saif17313/SaifPortFoliio'),
('Student Management System', 'student-management', 'A comprehensive student management system with grade tracking and reporting features.', '/Content/img/projects/project3.jpg', NULL, 'https://github.com/saif17313/student-management'),
('Weather App', 'weather-app', 'A mobile-friendly weather application with real-time weather data and forecasts.', '/Content/img/projects/project4.jpg', NULL, 'https://github.com/saif17313/weather-app');

-- Add more photography
INSERT INTO dbo.Photography (Name, [Description], ImagePath) VALUES 
('Urban Reflections', 'City lights reflecting on glass surfaces during the golden hour, capturing the dynamic energy of urban life.', '/Content/img/photography/pic3.jpg'),
('Portrait Study', 'A contemplative portrait showcasing natural lighting and emotional depth in photography.', '/Content/img/photography/pic4.jpg'),
('Nature''s Canvas', 'A vibrant landscape capturing the raw beauty of nature with rich colors and textures.', '/Content/img/photography/pic5.jpg'),
('Street Photography', 'Candid moments from everyday life, telling stories through spontaneous captures.', '/Content/img/photography/pic6.jpg');

-- Verify the additions
SELECT 'Roles' as TableName, COUNT(*) as Count FROM dbo.Roles
UNION ALL
SELECT 'Skills', COUNT(*) FROM dbo.Skills  
UNION ALL
SELECT 'Projects', COUNT(*) FROM dbo.Projects
UNION ALL
SELECT 'Photography', COUNT(*) FROM dbo.Photography;

-- Show recent additions
SELECT 'Recent Projects:' as Info;
SELECT TOP 3 Title, Slug FROM dbo.Projects ORDER BY Id DESC;

SELECT 'Recent Photos:' as Info;
SELECT TOP 3 Name FROM dbo.Photography ORDER BY Id DESC;