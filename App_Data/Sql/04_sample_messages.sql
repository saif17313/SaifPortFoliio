-- Enhanced sample data with more projects and photos for testing thumbnails
USE SaifPortFolio;
GO

-- Clear existing data for fresh start
DELETE FROM dbo.Messages;
DELETE FROM dbo.Photography;
DELETE FROM dbo.Projects;
DELETE FROM dbo.Skills;
DELETE FROM dbo.Roles;
GO

-- Insert sample roles for typewriter effect
INSERT INTO dbo.Roles (RoleText) VALUES 
('Full Stack Developer'),
('Software Engineer'),
('Graphics Designer'),
('Problem Solver'),
('Web Developer'),
('UI/UX Designer');

-- Insert sample skills
INSERT INTO dbo.Skills (Name, LevelPercent, Category) VALUES 
('Java', 95, 'Programming'),
('C++', 100, 'Programming'),
('C', 100, 'Programming'),
('JavaScript', 85, 'Web Development'),
('HTML/CSS', 90, 'Web Development'),
('ASP.NET', 80, 'Web Development'),
('Graphics Design', 88, 'Design'),
('Photoshop', 85, 'Design'),
('Problem Solving', 95, 'Soft Skills'),
('Team Leadership', 80, 'Soft Skills');

-- Insert sample projects with proper thumbnail images
INSERT INTO dbo.Projects (Title, Slug, ShortDescription, CoverImagePath, LiveUrl, RepoUrl) VALUES 
('Portfolio Website', 'portfolio-website', 'A responsive portfolio website built with ASP.NET and Bootstrap showcasing my projects and skills.', '/Content/img/projects/portfolio.jpg', 'https://saif-portfolio.com', 'https://github.com/saif17313/SaifPortFoliio'),
('E-Commerce Platform', 'ecommerce-platform', 'A full-featured e-commerce platform with shopping cart, payment integration, and admin panel.', '/Content/img/projects/ecommerce.jpg', 'https://demo-shop.com', 'https://github.com/saif17313/ecommerce-platform'),
('Task Management App', 'task-management-app', 'A collaborative task management application with real-time updates and team collaboration features.', '/Content/img/projects/taskapp.jpg', 'https://task-manager-demo.com', 'https://github.com/saif17313/task-manager'),
('Weather Dashboard', 'weather-dashboard', 'A beautiful weather dashboard with location-based forecasts and interactive charts.', '/Content/img/projects/weather.jpg', 'https://weather-dash.com', 'https://github.com/saif17313/weather-dashboard'),
('Social Media App', 'social-media-app', 'A social networking application with posts, comments, likes, and real-time messaging.', '/Content/img/projects/social.jpg', 'https://social-demo.com', 'https://github.com/saif17313/social-app'),
('Restaurant Website', 'restaurant-website', 'A modern restaurant website with online ordering, menu management, and reservation system.', '/Content/img/projects/restaurant.jpg', 'https://restaurant-demo.com', 'https://github.com/saif17313/restaurant-site');

-- Insert sample photography
INSERT INTO dbo.Photography (Name, [Description], ImagePath) VALUES 
('Sunset Landscape', 'A breathtaking sunset captured during the golden hour with stunning color gradients.', '/Content/img/photography/sunset.jpg'),
('Urban Architecture', 'Modern architectural photography showcasing the beauty of urban design and structures.', '/Content/img/photography/architecture.jpg'),
('Nature Portrait', 'A serene nature scene capturing the tranquility and beauty of the natural world.', '/Content/img/photography/nature.jpg'),
('Street Photography', 'Candid moments from everyday life captured through the lens of street photography.', '/Content/img/photography/street.jpg'),
('Abstract Art', 'Creative abstract photography exploring patterns, textures, and visual compositions.', '/Content/img/photography/abstract.jpg'),
('Mountain Vista', 'Majestic mountain landscape photography showcasing the grandeur of natural peaks.', '/Content/img/photography/mountain.jpg'),
('City Lights', 'Night photography capturing the vibrant energy and lights of the urban landscape.', '/Content/img/photography/citynight.jpg'),
('Macro Details', 'Close-up macro photography revealing intricate details often overlooked by the naked eye.', '/Content/img/photography/macro.jpg');

-- Insert sample messages (simulating session/cookie data)
INSERT INTO dbo.Messages (Email, Message, IsRead, CreatedAt) VALUES 
('john.doe@example.com', 'Hi Abdullah, I saw your portfolio and I''m interested in discussing a web development project. Please contact me when you have a chance.', 0, DATEADD(hour, -2, GETDATE())),
('sarah.smith@company.com', 'Great work on your portfolio! We have a position that might interest you. Would you be available for a call this week?', 1, DATEADD(day, -1, GETDATE())),
('mike.johnson@startup.io', 'Love your photography section! Are you available for freelance photo work? We need someone for our product launch.', 0, DATEADD(hour, -5, GETDATE())),
('contact@webagency.com', 'Your skills in ASP.NET caught our attention. We''re looking for a developer to join our team. Let''s discuss!', 0, DATEADD(day, -3, GETDATE())),
('user@example.org', 'Session data: User browsed projects section for 5 minutes, viewed 3 project details, clicked on GitHub links.', 1, DATEADD(hour, -1, GETDATE())),
('visitor@domain.com', 'Cookie data: Returning visitor, 3rd visit this month, primarily interested in photography and skills sections.', 0, DATEADD(hour, -8, GETDATE())),
('developer@freelance.net', 'I noticed your work on GitHub. Would you be interested in collaborating on an open-source project?', 0, DATEADD(hour, -12, GETDATE())),
('hr@techcompany.com', 'We''re impressed by your technical skills. Could we schedule a technical interview next week?', 1, DATEADD(day, -2, GETDATE()));

-- Verify the data
PRINT 'Data Summary:';
SELECT 'Roles' as TableName, COUNT(*) as RecordCount FROM dbo.Roles
UNION ALL
SELECT 'Skills', COUNT(*) FROM dbo.Skills
UNION ALL
SELECT 'Projects', COUNT(*) FROM dbo.Projects
UNION ALL
SELECT 'Photography', COUNT(*) FROM dbo.Photography
UNION ALL
SELECT 'Messages', COUNT(*) FROM dbo.Messages;

PRINT 'Enhanced sample data loaded successfully for admin panel testing!';