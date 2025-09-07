-- Create DB
IF DB_ID(N'SaifPortFolio') IS NULL
BEGIN
    CREATE DATABASE SaifPortFolio;
END
GO
USE SaifPortFolio;
GO

-- Projects
IF OBJECT_ID('dbo.Projects','U') IS NOT NULL DROP TABLE dbo.Projects;
GO
CREATE TABLE dbo.Projects
(
    Id               INT IDENTITY(1,1) PRIMARY KEY,
    Title            NVARCHAR(140) NOT NULL,
    Slug             NVARCHAR(160) NOT NULL UNIQUE,   -- e.g., mp3-player
    ShortDescription NVARCHAR(300) NULL,
    CoverImagePath   NVARCHAR(260) NULL,              -- /Content/img/projects/...
    LiveUrl          NVARCHAR(260) NULL,
    RepoUrl          NVARCHAR(260) NULL
);
GO

-- Roles (for the typewriter line)
IF OBJECT_ID('dbo.Roles','U') IS NOT NULL DROP TABLE dbo.Roles;
GO
CREATE TABLE dbo.Roles
(
    Id       INT IDENTITY(1,1) PRIMARY KEY,
    RoleText NVARCHAR(100) NOT NULL
);
GO

-- Skills
IF OBJECT_ID('dbo.Skills','U') IS NOT NULL DROP TABLE dbo.Skills;
GO
CREATE TABLE dbo.Skills
(
    Id            INT IDENTITY(1,1) PRIMARY KEY,
    Name          NVARCHAR(100) NOT NULL,
    LevelPercent  INT NULL,                          -- 0..100
    Category      NVARCHAR(80) NULL,
    CONSTRAINT CK_Skills_Level CHECK (LevelPercent BETWEEN 0 AND 100 OR LevelPercent IS NULL)
);
GO

-- Photography (simple gallery)
IF OBJECT_ID('dbo.Photography','U') IS NOT NULL DROP TABLE dbo.Photography;
GO
CREATE TABLE dbo.Photography
(
    Id          INT IDENTITY(1,1) PRIMARY KEY,
    Name        NVARCHAR(140) NOT NULL,
    [Description] NVARCHAR(MAX) NULL,
    ImagePath   NVARCHAR(260) NOT NULL               -- /Content/img/photography/...
);
GO
