USE [master]
GO
/****** Object:  Database [blog]    Script Date: 6/18/2021 10:22:36 PM ******/
CREATE DATABASE [blog]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'blog', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\blog.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'blog_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\blog_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [blog] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [blog].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [blog] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [blog] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [blog] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [blog] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [blog] SET ARITHABORT OFF 
GO
ALTER DATABASE [blog] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [blog] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [blog] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [blog] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [blog] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [blog] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [blog] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [blog] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [blog] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [blog] SET  DISABLE_BROKER 
GO
ALTER DATABASE [blog] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [blog] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [blog] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [blog] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [blog] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [blog] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [blog] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [blog] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [blog] SET  MULTI_USER 
GO
ALTER DATABASE [blog] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [blog] SET DB_CHAINING OFF 
GO
ALTER DATABASE [blog] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [blog] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [blog] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [blog] SET QUERY_STORE = OFF
GO
USE [blog]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/18/2021 10:22:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuditLogs]    Script Date: 6/18/2021 10:22:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[Actor] [nvarchar](max) NOT NULL,
	[UseCaseName] [nvarchar](max) NOT NULL,
	[Data] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_AuditLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/18/2021 10:22:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 6/18/2021 10:22:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[UserId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostComments]    Script Date: 6/18/2021 10:22:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostComments](
	[PostId] [int] NOT NULL,
	[CommentId] [int] NOT NULL,
 CONSTRAINT [PK_PostComments] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC,
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 6/18/2021 10:22:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Cover] [nvarchar](255) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/18/2021 10:22:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[Username] [nvarchar](30) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUseCases]    Script Date: 6/18/2021 10:22:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUseCases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_UserUseCases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Votes]    Script Date: 6/18/2021 10:22:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Votes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Mark] [int] NULL,
	[CommentId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Votes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210615160621_initial', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210618114822_change entities', N'5.0.7')
SET IDENTITY_INSERT [dbo].[AuditLogs] ON 

INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (1, CAST(N'2021-06-15T16:19:40.7002257' AS DateTime2), N'Anonymous User', N'Category Search', N'{"Name":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (2, CAST(N'2021-06-15T16:20:13.2351233' AS DateTime2), N'Anonymous User', N'Create New Category', N'{"Id":0,"Name":"technology"}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (3, CAST(N'2021-06-15T16:20:24.3811963' AS DateTime2), N'Anonymous User', N'Create New Category', N'{"Id":0,"Name":"food"}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (4, CAST(N'2021-06-15T16:20:59.7255655' AS DateTime2), N'Anonymous User', N'Create New Category', N'{"Id":0,"Name":"fashion"}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (5, CAST(N'2021-06-15T16:21:18.7565824' AS DateTime2), N'Anonymous User', N'Create New Category', N'{"Id":0,"Name":"fashion"}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (6, CAST(N'2021-06-15T16:22:15.7855343' AS DateTime2), N'Anonymous User', N'Create New Category', N'{"Id":0,"Name":"travel"}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (7, CAST(N'2021-06-15T16:22:21.7107583' AS DateTime2), N'Anonymous User', N'Create New Category', N'{"Id":0,"Name":"lifestyle"}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (8, CAST(N'2021-06-15T16:22:40.4569484' AS DateTime2), N'Anonymous User', N'Create New Category', N'{"Id":0,"Name":"photograph"}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (9, CAST(N'2021-06-15T16:22:48.8040336' AS DateTime2), N'Anonymous User', N'Create New Category', N'{"Id":0,"Name":"inspiration"}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (10, CAST(N'2021-06-15T16:23:04.8978686' AS DateTime2), N'Anonymous User', N'Category Search', N'{"Name":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (11, CAST(N'2021-06-15T16:23:13.9586572' AS DateTime2), N'Anonymous User', N'Category Search', N'{"Name":"f","PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (12, CAST(N'2021-06-15T16:23:19.5539206' AS DateTime2), N'Anonymous User', N'Category Search', N'{"Name":"fe","PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (13, CAST(N'2021-06-15T16:23:40.4943527' AS DateTime2), N'Anonymous User', N'Updating Existing Category', N'{"Id":50,"Name":null}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (14, CAST(N'2021-06-15T16:24:15.1098811' AS DateTime2), N'Anonymous User', N'Updating Existing Category', N'{"Id":50,"Name":"new"}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (15, CAST(N'2021-06-15T16:24:39.8241098' AS DateTime2), N'Anonymous User', N'Updating Existing Category', N'{"Id":5,"Name":"new"}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (16, CAST(N'2021-06-15T16:24:45.9740908' AS DateTime2), N'Anonymous User', N'Category Search', N'{"Name":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (17, CAST(N'2021-06-15T16:24:56.3054055' AS DateTime2), N'Anonymous User', N'Single Category', N'5')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (18, CAST(N'2021-06-15T16:25:52.2164109' AS DateTime2), N'Anonymous User', N'Deleting Existing Category', N'5')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (19, CAST(N'2021-06-15T16:25:56.3435262' AS DateTime2), N'Anonymous User', N'Category Search', N'{"Name":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (20, CAST(N'2021-06-16T17:22:11.0571055' AS DateTime2), N'Anonymous User', N'Post Search', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (21, CAST(N'2021-06-16T17:23:00.8929208' AS DateTime2), N'Anonymous User', N'Single Post', N'1')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (22, CAST(N'2021-06-16T17:28:48.0051077' AS DateTime2), N'Anonymous User', N'Create New Post', N'{"Id":0,"Cover":{"ContentDisposition":"form-data; name=\"cover\"; filename=\"db_blog_diagram.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"cover\"; filename=\"db_blog_diagram.png\""],"Content-Type":["image/png"]},"Length":27055,"Name":"cover","FileName":"db_blog_diagram.png"},"Title":"\"Title\"","Description":"\"This is something like description\"","CreatedAt":"0001-01-01T00:00:00","IsPublished":false,"PublishedAt":null,"CategoryId":2,"UserId":0}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (23, CAST(N'2021-06-16T17:35:18.5768662' AS DateTime2), N'Anonymous User', N'Create New Post', N'{"Id":0,"Cover":{"ContentDisposition":"form-data; name=\"cover\"; filename=\"db_blog_diagram.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"cover\"; filename=\"db_blog_diagram.png\""],"Content-Type":["image/png"]},"Length":27055,"Name":"cover","FileName":"db_blog_diagram.png"},"Title":"\"Title\"","Description":"\"This is something like description\"","CategoryId":2,"UserId":0}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (24, CAST(N'2021-06-16T17:41:47.8423679' AS DateTime2), N'Anonymous User', N'Create New Post', N'{"Id":0,"Cover":{"ContentDisposition":"form-data; name=\"cover\"; filename=\"db_blog_diagram.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"cover\"; filename=\"db_blog_diagram.png\""],"Content-Type":["image/png"]},"Length":27055,"Name":"cover","FileName":"db_blog_diagram.png"},"Title":"\"Title\"","Description":"\"This is something like description\"","CategoryId":2,"UserId":0}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (25, CAST(N'2021-06-16T17:44:44.4561779' AS DateTime2), N'Anonymous User', N'Create New Post', N'{"Id":0,"Cover":{"ContentDisposition":"form-data; name=\"cover\"; filename=\"db_blog_diagram.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"cover\"; filename=\"db_blog_diagram.png\""],"Content-Type":["image/png"]},"Length":27055,"Name":"cover","FileName":"db_blog_diagram.png"},"Title":"\"Title\"","Description":"\"This is something like description\"","CategoryId":2,"UserId":0}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (26, CAST(N'2021-06-16T17:45:57.3561260' AS DateTime2), N'Anonymous User', N'Create New Post', N'{"Id":0,"Cover":{"ContentDisposition":"form-data; name=\"cover\"; filename=\"db_blog_diagram.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"cover\"; filename=\"db_blog_diagram.png\""],"Content-Type":["image/png"]},"Length":27055,"Name":"cover","FileName":"db_blog_diagram.png"},"Title":"\"Title\"","Description":"\"This is something like description\"","CategoryId":2,"UserId":0}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (27, CAST(N'2021-06-16T20:38:52.9152801' AS DateTime2), N'Anonymous User', N'Create New Post', N'{"Id":0,"Cover":null,"Title":"\"Title\"","Description":"\"This is something like description\"","CategoryId":2,"UserId":0}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (28, CAST(N'2021-06-16T20:43:39.8694907' AS DateTime2), N'Anonymous User', N'Create New Post', N'{"Id":0,"Cover":{"ContentDisposition":"form-data; name=\"cover\"; filename=\"databaseSchema.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"cover\"; filename=\"databaseSchema.png\""],"Content-Type":["image/png"]},"Length":29190,"Name":"cover","FileName":"databaseSchema.png"},"Title":"\"Title\"","Description":"\"This is something like description\"","CategoryId":2,"UserId":0}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (29, CAST(N'2021-06-16T20:49:58.2173772' AS DateTime2), N'Anonymous User', N'User Registration', N'{"FirstName":"Pera","LastName":"Peric","Username":"pera","Email":"pera@gmail.com","Password":"sifra123!"}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (30, CAST(N'2021-06-16T20:54:06.0716764' AS DateTime2), N'Anonymous User', N'User Registration', N'{"FirstName":"Pera","LastName":"Peric","Username":"pera","Email":"pera@gmail.com","Password":"sifra123!"}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (31, CAST(N'2021-06-16T20:58:13.2082881' AS DateTime2), N'Anonymous User', N'User Registration', N'{"FirstName":"Pera","LastName":"Peric","Username":"pera","Email":"pera@gmail.com","Password":"sifra123!"}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (32, CAST(N'2021-06-16T21:00:42.1923084' AS DateTime2), N'Anonymous User', N'Create New Post', N'{"Id":0,"Cover":{"ContentDisposition":"form-data; name=\"cover\"; filename=\"databaseSchema.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"cover\"; filename=\"databaseSchema.png\""],"Content-Type":["image/png"]},"Length":29190,"Name":"cover","FileName":"databaseSchema.png"},"Title":"\"Title\"","Description":"\"This is something like description\"","CategoryId":2,"UserId":0}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (33, CAST(N'2021-06-16T21:01:43.8145361' AS DateTime2), N'Anonymous User', N'Create New Post', N'{"Id":0,"Cover":{"ContentDisposition":"form-data; name=\"cover\"; filename=\"databaseSchema.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"cover\"; filename=\"databaseSchema.png\""],"Content-Type":["image/png"]},"Length":29190,"Name":"cover","FileName":"databaseSchema.png"},"Title":"\"Title\"","Description":"\"This is something like description\"","CategoryId":2,"UserId":0}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (34, CAST(N'2021-06-16T21:05:56.5230071' AS DateTime2), N'Anonymous User', N'Create New Post', N'{"Id":0,"Cover":{"ContentDisposition":"form-data; name=\"cover\"; filename=\"databaseSchema.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"cover\"; filename=\"databaseSchema.png\""],"Content-Type":["image/png"]},"Length":29190,"Name":"cover","FileName":"databaseSchema.png"},"Title":"\"Title\"","Description":"\"This is something like description\"","CategoryId":2,"UserId":0}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (35, CAST(N'2021-06-16T21:07:21.8436768' AS DateTime2), N'Anonymous User', N'Category Search', N'{"Name":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (36, CAST(N'2021-06-16T21:16:15.6325513' AS DateTime2), N'Anonymous User', N'Category Search', N'{"Name":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (37, CAST(N'2021-06-16T21:16:57.2852844' AS DateTime2), N'Anonymous User', N'Category Search', N'{"Name":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (38, CAST(N'2021-06-16T21:17:08.7496346' AS DateTime2), N'Anonymous User', N'Single Category', N'5')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (39, CAST(N'2021-06-16T21:17:43.1918947' AS DateTime2), N'Anonymous User', N'Create New Post', N'{"Id":0,"Cover":{"ContentDisposition":"form-data; name=\"cover\"; filename=\"databaseSchema.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"cover\"; filename=\"databaseSchema.png\""],"Content-Type":["image/png"]},"Length":29190,"Name":"cover","FileName":"databaseSchema.png"},"Title":"\"Title\"","Description":"\"This is something like description\"","CategoryId":2,"UserId":0}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (40, CAST(N'2021-06-16T21:18:44.3805165' AS DateTime2), N'pera', N'Create New Post', N'{"Id":0,"Cover":{"ContentDisposition":"form-data; name=\"cover\"; filename=\"databaseSchema.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"cover\"; filename=\"databaseSchema.png\""],"Content-Type":["image/png"]},"Length":29190,"Name":"cover","FileName":"databaseSchema.png"},"Title":"\"Title\"","Description":"\"This is something like description\"","CategoryId":2,"UserId":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (41, CAST(N'2021-06-16T21:18:56.0397923' AS DateTime2), N'Anonymous User', N'Post Search', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (42, CAST(N'2021-06-16T21:22:17.2930119' AS DateTime2), N'Anonymous User', N'Category Search', N'{"Name":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (43, CAST(N'2021-06-16T21:23:37.9244957' AS DateTime2), N'pera', N'Category Search', N'{"Name":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (44, CAST(N'2021-06-16T21:24:05.5192374' AS DateTime2), N'Anonymous User', N'Single Category', N'4')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (45, CAST(N'2021-06-16T21:24:15.1190305' AS DateTime2), N'Anonymous User', N'Single Category', N'2')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (46, CAST(N'2021-06-16T21:26:30.6416902' AS DateTime2), N'pera', N'Single Category', N'2')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (47, CAST(N'2021-06-16T21:26:41.3710004' AS DateTime2), N'pera', N'Single Category', N'3')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (48, CAST(N'2021-06-16T21:29:27.7799947' AS DateTime2), N'Anonymous User', N'Updating Existing Post', N'{"Id":1,"Cover":null,"Title":"\"New title\"","Description":null,"CategoryId":1,"UserId":0}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (49, CAST(N'2021-06-16T21:30:40.7969249' AS DateTime2), N'pera', N'Updating Existing Post', N'{"Id":1,"Cover":null,"Title":"\"New title\"","Description":null,"CategoryId":1,"UserId":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (50, CAST(N'2021-06-16T21:35:03.1078004' AS DateTime2), N'pera', N'Updating Existing Post', N'{"Id":1,"Cover":null,"Title":"\"New title\"","Description":null,"CategoryId":1,"UserId":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (51, CAST(N'2021-06-16T21:39:01.6842732' AS DateTime2), N'pera', N'Updating Existing Post', N'{"Id":1,"Cover":null,"Title":"\"New title\"","Description":null,"CategoryId":1,"UserId":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (52, CAST(N'2021-06-16T23:27:15.9569535' AS DateTime2), N'Anonymous User', N'User Registration', N'{"FirstName":"Jova","LastName":"Jovic","Username":"user1","Email":"projectblog4asp@gmail.com","Password":"sifra123!"}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (53, CAST(N'2021-06-16T23:30:25.5211886' AS DateTime2), N'Anonymous User', N'User Registration', N'{"FirstName":"Proba","LastName":"Proba","Username":"proba1","Email":"svetlana013.tomic@gmail.com","Password":"sifra123!"}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (54, CAST(N'2021-06-16T23:33:26.4812155' AS DateTime2), N'proba1', N'Create New Post', N'{"Id":0,"Cover":{"ContentDisposition":"form-data; name=\"cover\"; filename=\"call-center.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"cover\"; filename=\"call-center.png\""],"Content-Type":["image/png"]},"Length":2839,"Name":"cover","FileName":"call-center.png"},"Title":"\"Title1\"","Description":"\"That is something like description 1\"","CategoryId":2,"UserId":3}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (55, CAST(N'2021-06-16T23:33:52.8729013' AS DateTime2), N'proba1', N'Post Search', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (56, CAST(N'2021-06-16T23:35:33.6703899' AS DateTime2), N'proba1', N'Create New Post', N'{"Id":0,"Cover":{"ContentDisposition":"form-data; name=\"cover\"; filename=\"hero.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"cover\"; filename=\"hero.jpg\""],"Content-Type":["image/jpeg"]},"Length":22329,"Name":"cover","FileName":"hero.jpg"},"Title":"\"Title 2\"","Description":"\"Why is something like that description 2\"","CategoryId":1,"UserId":3}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (57, CAST(N'2021-06-16T23:35:40.5064958' AS DateTime2), N'proba1', N'Post Search', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (58, CAST(N'2021-06-16T23:45:40.0410494' AS DateTime2), N'proba1', N'Create New Comment', N'{"Message":null,"UserId":3,"PostId":null}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (59, CAST(N'2021-06-16T23:47:16.7530318' AS DateTime2), N'proba1', N'Create New Comment', N'{"Message":null,"UserId":3,"PostId":null}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (60, CAST(N'2021-06-16T23:48:12.1888206' AS DateTime2), N'proba1', N'Create New Comment', N'{"Message":null,"UserId":3,"PostId":null}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (61, CAST(N'2021-06-17T15:11:55.8813783' AS DateTime2), N'Anonymous User', N'Search Users', N'{"FirstName":null,"LastName":null,"Username":null,"Email":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (62, CAST(N'2021-06-17T15:13:42.0119840' AS DateTime2), N'Anonymous User', N'Search Users', N'{"FirstName":null,"LastName":null,"Username":null,"Email":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (63, CAST(N'2021-06-17T15:14:00.2467803' AS DateTime2), N'Anonymous User', N'Read Single User', N'1')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (64, CAST(N'2021-06-17T15:31:26.8580713' AS DateTime2), N'Anonymous User', N'Read Single User', N'1')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (65, CAST(N'2021-06-17T15:46:57.9454156' AS DateTime2), N'Anonymous User', N'Read Single User', N'1')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (66, CAST(N'2021-06-17T15:49:27.8045585' AS DateTime2), N'Anonymous User', N'Single Category', N'3')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (67, CAST(N'2021-06-17T15:49:48.4273501' AS DateTime2), N'Anonymous User', N'Single Category', N'2')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (68, CAST(N'2021-06-17T15:52:00.3825017' AS DateTime2), N'Anonymous User', N'Single Category', N'2')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (69, CAST(N'2021-06-17T15:52:09.9160800' AS DateTime2), N'Anonymous User', N'Single Category', N'5')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (70, CAST(N'2021-06-17T15:52:28.0708458' AS DateTime2), N'Anonymous User', N'Read Single User', N'1')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (71, CAST(N'2021-06-17T15:52:36.8616468' AS DateTime2), N'Anonymous User', N'Read Single User', N'3')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (72, CAST(N'2021-06-17T15:54:34.9139701' AS DateTime2), N'Anonymous User', N'Read Single User', N'3')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (73, CAST(N'2021-06-17T15:54:46.2397837' AS DateTime2), N'Anonymous User', N'Read Single User', N'2')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (74, CAST(N'2021-06-17T15:55:39.5422439' AS DateTime2), N'Anonymous User', N'Read Single User', N'2')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (75, CAST(N'2021-06-17T15:57:35.6448205' AS DateTime2), N'Anonymous User', N'Search Users', N'{"FirstName":null,"LastName":null,"Username":null,"Email":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (76, CAST(N'2021-06-17T15:59:00.1602613' AS DateTime2), N'Anonymous User', N'Search Users', N'{"FirstName":null,"LastName":null,"Username":null,"Email":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (77, CAST(N'2021-06-17T15:59:19.4646968' AS DateTime2), N'Anonymous User', N'Read Single User', N'2')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (78, CAST(N'2021-06-17T16:02:19.6168740' AS DateTime2), N'proba1', N'Create New Comment', N'{"Message":null,"UserId":3,"PostId":null}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (79, CAST(N'2021-06-17T16:06:29.1272215' AS DateTime2), N'proba1', N'Create New Comment', N'{"Message":"THIS IS SOME COMMENT","UserId":3,"PostId":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (80, CAST(N'2021-06-17T16:07:43.0600061' AS DateTime2), N'proba1', N'Post Search', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (81, CAST(N'2021-06-17T16:07:43.0585680' AS DateTime2), N'Anonymous User', N'Post Search', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (82, CAST(N'2021-06-17T16:09:15.0451720' AS DateTime2), N'proba1', N'Post Search', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (83, CAST(N'2021-06-17T16:12:30.7379615' AS DateTime2), N'proba1', N'Post Search', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (84, CAST(N'2021-06-17T16:14:01.1048610' AS DateTime2), N'proba1', N'Post Search', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (85, CAST(N'2021-06-17T16:18:36.4925095' AS DateTime2), N'proba1', N'Post Search', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (86, CAST(N'2021-06-17T16:20:29.6451639' AS DateTime2), N'proba1', N'Post Search', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (87, CAST(N'2021-06-17T16:26:18.9144550' AS DateTime2), N'Anonymous User', N'Post Search', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (88, CAST(N'2021-06-17T16:28:44.6562314' AS DateTime2), N'Anonymous User', N'Post Search', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (89, CAST(N'2021-06-17T16:33:01.8776491' AS DateTime2), N'Anonymous User', N'Single Post', N'2')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (90, CAST(N'2021-06-17T16:33:25.2296558' AS DateTime2), N'Anonymous User', N'Single Post', N'1')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (91, CAST(N'2021-06-17T16:34:03.4343578' AS DateTime2), N'Anonymous User', N'Single Post', N'8')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (92, CAST(N'2021-06-17T16:49:29.9644324' AS DateTime2), N'proba1', N'Post Search', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (93, CAST(N'2021-06-17T16:58:03.6838189' AS DateTime2), N'proba1', N'Post Search', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (94, CAST(N'2021-06-17T17:16:18.3981108' AS DateTime2), N'Anonymous User', N'Post Search', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (95, CAST(N'2021-06-17T17:22:33.9467215' AS DateTime2), N'Anonymous User', N'Post Search', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (96, CAST(N'2021-06-17T17:25:00.9170823' AS DateTime2), N'Anonymous User', N'Post Search', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (97, CAST(N'2021-06-17T17:27:51.8878793' AS DateTime2), N'Anonymous User', N'Post Search', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (98, CAST(N'2021-06-17T19:01:52.6001601' AS DateTime2), N'Anonymous User', N'Post Search', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (99, CAST(N'2021-06-17T19:21:39.3436331' AS DateTime2), N'Anonymous User', N'Create New Comment', N'{"Message":"This is new comment","UserId":0,"PostId":8}')
GO
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (100, CAST(N'2021-06-17T19:23:39.1928849' AS DateTime2), N'proba1', N'Create New Comment', N'{"Message":"This is new comment","UserId":3,"PostId":8}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (101, CAST(N'2021-06-17T19:24:43.2009839' AS DateTime2), N'proba1', N'Single Comment', N'1')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (102, CAST(N'2021-06-17T19:26:30.1510270' AS DateTime2), N'proba1', N'Single Comment', N'2')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (103, CAST(N'2021-06-17T19:33:13.4189855' AS DateTime2), N'proba1', N'Create Vote for Comment', N'{"Mark":5,"UserId":3,"CommentId":2}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (104, CAST(N'2021-06-17T19:34:08.7832126' AS DateTime2), N'proba1', N'Create Vote for Comment', N'{"Mark":3,"UserId":3,"CommentId":2}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (105, CAST(N'2021-06-17T19:49:44.5528911' AS DateTime2), N'proba1', N'Create New Comment', N'{"Message":"Something like message","UserId":3,"PostId":9}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (106, CAST(N'2021-06-17T19:55:28.3942829' AS DateTime2), N'Anonymous User', N'Create Vote for Comment', N'{"Mark":3,"UserId":0,"CommentId":2}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (107, CAST(N'2021-06-17T19:56:37.5056472' AS DateTime2), N'Anonymous User', N'Create Vote for Comment', N'{"Mark":3,"UserId":0,"CommentId":2}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (108, CAST(N'2021-06-17T19:59:15.4950030' AS DateTime2), N'Anonymous User', N'Create Vote for Comment', N'{"Mark":3,"UserId":0,"CommentId":2}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (109, CAST(N'2021-06-17T20:01:46.0066858' AS DateTime2), N'proba1', N'Create Vote for Comment', N'{"Mark":3,"UserId":3,"CommentId":2}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (110, CAST(N'2021-06-17T20:07:17.2113920' AS DateTime2), N'proba1', N'Create Vote for Comment', N'{"Mark":3,"UserId":3,"CommentId":2}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (111, CAST(N'2021-06-17T20:10:10.5603058' AS DateTime2), N'proba1', N'AuditLogs Search', N'{"Actor":null,"UseCaseName":null,"DateFrom":null,"DateTo":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (112, CAST(N'2021-06-17T20:12:40.4941688' AS DateTime2), N'proba1', N'AuditLogs Search', N'{"Actor":null,"UseCaseName":null,"DateFrom":null,"DateTo":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (113, CAST(N'2021-06-17T20:13:29.3482798' AS DateTime2), N'proba1', N'AuditLogs Search', N'{"Actor":null,"UseCaseName":null,"DateFrom":null,"DateTo":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (114, CAST(N'2021-06-17T20:16:26.1017995' AS DateTime2), N'Anonymous User', N'Add UseCases To User', N'{"Id":0,"UserId":3,"UseCaseId":25}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (115, CAST(N'2021-06-17T20:18:30.6455073' AS DateTime2), N'Anonymous User', N'Add UseCases To User', N'{"Id":0,"UserId":3,"UseCaseId":22}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (116, CAST(N'2021-06-17T20:19:14.1159129' AS DateTime2), N'proba1', N'AuditLogs Search', N'{"Actor":null,"UseCaseName":null,"DateFrom":null,"DateTo":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (117, CAST(N'2021-06-17T20:20:06.7807032' AS DateTime2), N'proba1', N'AuditLogs Search', N'{"Actor":null,"UseCaseName":null,"DateFrom":null,"DateTo":null,"PerPage":10,"Page":3}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (118, CAST(N'2021-06-17T20:24:07.9611659' AS DateTime2), N'proba1', N'Post Search', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (119, CAST(N'2021-06-17T20:31:37.8808575' AS DateTime2), N'proba1', N'Post Search', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":2,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (120, CAST(N'2021-06-17T20:31:51.5796504' AS DateTime2), N'proba1', N'Post Search', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":2,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (121, CAST(N'2021-06-17T20:34:49.4111359' AS DateTime2), N'proba1', N'Create New Post', N'{"Id":0,"Cover":{"ContentDisposition":"form-data; name=\"cover\"; filename=\"oznaka.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"cover\"; filename=\"oznaka.png\""],"Content-Type":["image/png"]},"Length":4555,"Name":"cover","FileName":"oznaka.png"},"Title":"\"Title 1331\" ","Description":"\"This is something like description\"","CategoryId":3,"UserId":3}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (122, CAST(N'2021-06-17T20:37:35.6136697' AS DateTime2), N'Anonymous User', N'Updating Existing Post', N'{"Id":11,"Cover":null,"Title":"\"New title 1515\"","Description":null,"CategoryId":null,"UserId":0}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (123, CAST(N'2021-06-17T20:40:42.9449228' AS DateTime2), N'proba1', N'Updating Existing Post', N'{"Id":11,"Cover":{"ContentDisposition":"form-data; name=\"cover\"; filename=\"offer.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"cover\"; filename=\"offer.png\""],"Content-Type":["image/png"]},"Length":2912,"Name":"cover","FileName":"offer.png"},"Title":"\"New title 1515\"","Description":"\"News description\"","CategoryId":3,"UserId":3}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (124, CAST(N'2021-06-17T20:49:45.2665043' AS DateTime2), N'proba1', N'Updating Existing Post', N'{"Id":11,"Cover":{"ContentDisposition":"form-data; name=\"cover\"; filename=\"offer.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"cover\"; filename=\"offer.png\""],"Content-Type":["image/png"]},"Length":2912,"Name":"cover","FileName":"offer.png"},"Title":"\"New title 1515\"","Description":"\"News description\"","CategoryId":3,"UserId":3}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (125, CAST(N'2021-06-18T08:16:56.8286052' AS DateTime2), N'Anonymous User', N'Search of posts', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (126, CAST(N'2021-06-18T08:21:41.9611801' AS DateTime2), N'Anonymous User', N'Search of posts', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (127, CAST(N'2021-06-18T08:30:24.0079881' AS DateTime2), N'Anonymous User', N'Search of posts', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (128, CAST(N'2021-06-18T08:34:36.2780081' AS DateTime2), N'Anonymous User', N'Search of posts', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (129, CAST(N'2021-06-18T09:04:51.4954890' AS DateTime2), N'Anonymous User', N'Search of posts', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (130, CAST(N'2021-06-18T09:12:31.7704287' AS DateTime2), N'Anonymous User', N'Search of posts', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (131, CAST(N'2021-06-18T09:20:14.6482544' AS DateTime2), N'Anonymous User', N'Search of posts', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (132, CAST(N'2021-06-18T09:22:38.1141254' AS DateTime2), N'Anonymous User', N'Search of posts', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (133, CAST(N'2021-06-18T09:25:55.0351166' AS DateTime2), N'Anonymous User', N'Search of posts', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (134, CAST(N'2021-06-18T09:28:29.7552074' AS DateTime2), N'Anonymous User', N'Search of posts', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (135, CAST(N'2021-06-18T09:29:38.0318905' AS DateTime2), N'Anonymous User', N'Search of posts', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (136, CAST(N'2021-06-18T09:32:33.2881993' AS DateTime2), N'Anonymous User', N'Search of posts', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (137, CAST(N'2021-06-18T09:58:09.0661405' AS DateTime2), N'Anonymous User', N'Search of posts', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (138, CAST(N'2021-06-18T10:34:10.6011619' AS DateTime2), N'Anonymous User', N'Search of posts', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (139, CAST(N'2021-06-18T10:37:32.6944713' AS DateTime2), N'Anonymous User', N'Search of posts', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (140, CAST(N'2021-06-18T10:38:22.2896325' AS DateTime2), N'Anonymous User', N'Single Post', N'8')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (141, CAST(N'2021-06-18T10:41:54.1432406' AS DateTime2), N'Anonymous User', N'Single Post', N'8')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (142, CAST(N'2021-06-18T10:44:18.9936711' AS DateTime2), N'Anonymous User', N'Single Post', N'8')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (143, CAST(N'2021-06-18T10:51:06.1664817' AS DateTime2), N'Anonymous User', N'Single Post', N'8')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (144, CAST(N'2021-06-18T10:57:32.3949507' AS DateTime2), N'Anonymous User', N'Single Post', N'8')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (145, CAST(N'2021-06-18T11:00:07.9872165' AS DateTime2), N'Anonymous User', N'Single Post', N'8')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (146, CAST(N'2021-06-18T11:02:20.2569542' AS DateTime2), N'Anonymous User', N'Single Post', N'8')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (147, CAST(N'2021-06-18T11:04:32.5806959' AS DateTime2), N'Anonymous User', N'Single Post', N'8')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (148, CAST(N'2021-06-18T11:04:59.5349038' AS DateTime2), N'Anonymous User', N'Single Post', N'8')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (149, CAST(N'2021-06-18T11:12:17.9989433' AS DateTime2), N'Anonymous User', N'Single Post', N'8')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (150, CAST(N'2021-06-18T11:31:11.3652457' AS DateTime2), N'Anonymous User', N'Single Post', N'8')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (151, CAST(N'2021-06-18T11:53:41.4043846' AS DateTime2), N'Anonymous User', N'Search of posts', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (152, CAST(N'2021-06-18T11:54:05.2601501' AS DateTime2), N'Anonymous User', N'Single Post', N'8')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (153, CAST(N'2021-06-18T11:55:14.9523075' AS DateTime2), N'Anonymous User', N'Single Post', N'9')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (154, CAST(N'2021-06-18T11:57:33.1240569' AS DateTime2), N'Anonymous User', N'Single Post', N'9')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (155, CAST(N'2021-06-18T11:59:50.5503067' AS DateTime2), N'Anonymous User', N'Single Post', N'9')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (156, CAST(N'2021-06-18T12:01:21.3879843' AS DateTime2), N'Anonymous User', N'Single Post', N'9')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (157, CAST(N'2021-06-18T12:04:13.4414061' AS DateTime2), N'Anonymous User', N'Single Post', N'9')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (158, CAST(N'2021-06-18T12:14:25.4230770' AS DateTime2), N'proba1', N'Updating Existing Post', N'{"Id":9,"Cover":{"ContentDisposition":"form-data; name=\"cover\"; filename=\"intro.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"cover\"; filename=\"intro.jpg\""],"Content-Type":["image/jpeg"]},"Length":24439,"Name":"cover","FileName":"intro.jpg"},"Title":"\"New title\"","Description":"\"New description\"","CategoryId":3,"UserId":3}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (159, CAST(N'2021-06-18T12:15:05.0903852' AS DateTime2), N'Anonymous User', N'Single Post', N'9')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (160, CAST(N'2021-06-18T12:16:24.8967037' AS DateTime2), N'proba1', N'Create New Post', N'{"Id":0,"Cover":{"ContentDisposition":"form-data; name=\"cover\"; filename=\"logo1.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"cover\"; filename=\"logo1.png\""],"Content-Type":["image/png"]},"Length":10746,"Name":"cover","FileName":"logo1.png"},"Title":"\"Proba Title 1331\" ","Description":"\"This is something like description 5\"","CategoryId":2,"UserId":3}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (161, CAST(N'2021-06-18T12:17:03.2181934' AS DateTime2), N'proba1', N'Search of posts', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (162, CAST(N'2021-06-18T12:18:20.9309204' AS DateTime2), N'proba1', N'Deleting Existing Post', N'12')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (163, CAST(N'2021-06-18T12:18:35.5215196' AS DateTime2), N'proba1', N'Search of posts', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (164, CAST(N'2021-06-18T12:18:54.7722115' AS DateTime2), N'Anonymous User', N'Search of posts', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (165, CAST(N'2021-06-18T12:22:08.3893557' AS DateTime2), N'Anonymous User', N'Category Search', N'{"Name":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (166, CAST(N'2021-06-18T12:22:28.7679543' AS DateTime2), N'Anonymous User', N'Single Category', N'3')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (167, CAST(N'2021-06-18T12:48:06.4027216' AS DateTime2), N'Anonymous User', N'User Registration', N'{"FirstName":"Anja","LastName":"Tomic","Username":"admin123","Email":"admin@gmail.com","Password":"sifra4admin"}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (168, CAST(N'2021-06-18T12:56:39.0773160' AS DateTime2), N'Anonymous User', N'User Registration', N'{"FirstName":"Test","LastName":"Admin","Username":"admintest1","Email":"admintest@gmail.com","Password":"sifra4admin"}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (169, CAST(N'2021-06-18T13:03:03.0920951' AS DateTime2), N'admintest1', N'Updating Existing User', N'{"Id":4,"FirstName":null,"LastName":null,"Email":null,"Username":null,"UserUseCases":[]}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (170, CAST(N'2021-06-18T13:04:55.1660629' AS DateTime2), N'admintest1', N'Updating Existing User', N'{"Id":4,"FirstName":null,"LastName":null,"Email":null,"Username":null,"UserUseCases":[]}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (171, CAST(N'2021-06-18T13:10:07.4422997' AS DateTime2), N'admintest1', N'Updating Existing User', N'{"Id":4,"FirstName":null,"LastName":null,"Email":null,"Username":null,"UserUseCases":[]}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (172, CAST(N'2021-06-18T13:12:46.7052382' AS DateTime2), N'admintest1', N'Updating Existing User', N'{"Id":4,"FirstName":null,"LastName":null,"Email":null,"Username":null,"UserUseCases":[]}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (173, CAST(N'2021-06-18T13:15:56.9729615' AS DateTime2), N'admintest1', N'Updating Existing User', N'{"Id":4,"FirstName":null,"LastName":null,"Email":null,"Username":null,"UserUseCases":[]}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (174, CAST(N'2021-06-18T13:18:18.0876553' AS DateTime2), N'admintest1', N'Updating Existing User', N'{"Id":4,"FirstName":"Anja","LastName":"Tomic","Email":"admin@gmail.com","Username":"admin123","UserUseCases":[1,2,3,11,15,18,19,20,21,22,23,24,25,26]}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (175, CAST(N'2021-06-18T13:32:26.3566255' AS DateTime2), N'Anonymous User', N'Updating Existing User', N'{"Id":4,"FirstName":"Anja","LastName":"Tomic","Email":"admin@gmail.com","Username":"admin123","UserUseCases":[1,2,3,11,15,18,19,20,21,22,23,24,25,26]}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (176, CAST(N'2021-06-18T13:33:52.1581580' AS DateTime2), N'admintest1', N'Updating Existing User', N'{"Id":4,"FirstName":"Anja","LastName":"Tomic","Email":"admin@gmail.com","Username":"admin123","UserUseCases":[1,2,3,11,15,18,19,20,21,22,23,24,25,26]}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (177, CAST(N'2021-06-18T13:34:30.0066803' AS DateTime2), N'admintest1', N'Search Users', N'{"FirstName":null,"LastName":null,"Username":null,"Email":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (178, CAST(N'2021-06-18T13:36:50.0413163' AS DateTime2), N'admintest1', N'Read Single User', N'1')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (179, CAST(N'2021-06-18T13:38:13.0837999' AS DateTime2), N'admin123', N'Search Users', N'{"FirstName":null,"LastName":null,"Username":null,"Email":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (180, CAST(N'2021-06-18T13:38:47.2718401' AS DateTime2), N'admin123', N'Read Single User', N'5')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (181, CAST(N'2021-06-18T13:38:54.5060395' AS DateTime2), N'admin123', N'Read Single User', N'3')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (182, CAST(N'2021-06-18T13:46:57.9456602' AS DateTime2), N'admin123', N'Deleting Existing User', N'2')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (183, CAST(N'2021-06-18T13:47:03.0879817' AS DateTime2), N'admin123', N'Deleting Existing User', N'5')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (184, CAST(N'2021-06-18T13:47:10.5240366' AS DateTime2), N'Anonymous User', N'Search Users', N'{"FirstName":null,"LastName":null,"Username":null,"Email":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (185, CAST(N'2021-06-18T13:47:46.8360975' AS DateTime2), N'admin123', N'Search Users', N'{"FirstName":null,"LastName":null,"Username":null,"Email":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (186, CAST(N'2021-06-18T13:51:21.9780086' AS DateTime2), N'Anonymous User', N'User Registration', N'{"FirstName":"Fake","LastName":"User","Username":"fakeuser1","Email":"user@gmail.com","Password":"sifra123"}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (187, CAST(N'2021-06-18T13:55:34.6426178' AS DateTime2), N'admin123', N'Deleting Existing User', N'6')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (188, CAST(N'2021-06-18T13:55:47.1397264' AS DateTime2), N'Anonymous User', N'User Registration', N'{"FirstName":"Fake","LastName":"User","Username":"fakeuser1","Email":"user@gmail.com","Password":"sifra123"}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (189, CAST(N'2021-06-18T13:56:55.5108432' AS DateTime2), N'Anonymous User', N'User Registration', N'{"FirstName":"Fake","LastName":"User","Username":"fakeuser","Email":"fakeuser@gmail.com","Password":"sifra123"}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (190, CAST(N'2021-06-18T13:57:37.2052299' AS DateTime2), N'admin123', N'Search Users', N'{"FirstName":null,"LastName":null,"Username":null,"Email":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (191, CAST(N'2021-06-18T13:58:28.8961786' AS DateTime2), N'Anonymous User', N'User Registration', N'{"FirstName":"New","LastName":"User","Username":"user123","Email":"newuser@gmail.com","Password":"sifra123"}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (192, CAST(N'2021-06-18T13:59:08.8137417' AS DateTime2), N'Anonymous User', N'User Registration', N'{"FirstName":"Ana","LastName":"Petrovic","Username":"ana123","Email":"anapetrovic@gmail.com","Password":"sifra123"}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (193, CAST(N'2021-06-18T13:59:34.0723862' AS DateTime2), N'Anonymous User', N'User Registration', N'{"FirstName":"Mika","LastName":"Mikic","Username":"mika123","Email":"mikamikic@gmail.com","Password":"sifra123"}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (194, CAST(N'2021-06-18T14:04:13.0758312' AS DateTime2), N'admin123', N'Search of posts', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (195, CAST(N'2021-06-18T14:04:40.5878108' AS DateTime2), N'admin123', N'Single Post', N'1')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (196, CAST(N'2021-06-18T14:06:38.6888816' AS DateTime2), N'admin123', N'Single Post', N'9')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (197, CAST(N'2021-06-18T14:13:47.1344525' AS DateTime2), N'mika123', N'Create New Post', N'{"Id":0,"Cover":{"ContentDisposition":"form-data; name=\"cover\"; filename=\"1._cheatah-photographed-in-side-lighting.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"cover\"; filename=\"1._cheatah-photographed-in-side-lighting.jpg\""],"Content-Type":["image/jpeg"]},"Length":49746,"Name":"cover","FileName":"1._cheatah-photographed-in-side-lighting.jpg"},"Title":"Photography Ideas to Improve Your Photography","Description":"Are you stuck in a photographic rut? Are you looking to boost your creativity with new photography ideas?\\r\\nThere are so many different photography techniques out there. Where do you start?\\r\\nLook no further. We have compiled a list of  the most interesting photography ideas, ranging from simple post-production edits to day-long projects.\\r\\n\\r\\n1. Reflections\\r\\nThe use of reflections in your photography can add gorgeous depth and structure to your images.\\r\\nThey can turn average landscapes and cityscapes into something extraordinary. Use a wide-angle lens to capture a wider field of view, for full effect.\\r\\nBut don’t limit yourself to photographing lakes or rivers; puddles in city streets, fountains or even small ponds can give great reflection results.\\r\\n\\r\\n2. Look for Shadows\\r\\nShadow photography is a great way to add drama, mystery, and emotion to your portrait photography.\\r\\nYou can add anonymity to an image if you isolate the shadow alone, without showing the subject. You can use shadows of any subject to create this kind of effect.\\r\\n\\r\\n3. Shoot during the Golden Hour\\r\\nThe golden hour is the hour after sunrise or before sunset.\\r\\nTaking photos during this time adds a beautiful diffused warm hue to your images. It also extends shadows as the sun is at a lower point in the sky.\\r\\nIn addition, the golden hour allows a more even exposure, which enhances depth and detail in your subjects.\\r\\n\\r\\n4. Catch a Sunset\\r\\nFollowing on from the golden hour, a sunset offers some of the most beautiful photography. It works particularly well when dark silhouettes are in the foreground, such as a skyline, mountain or trees in a forest. This photography idea enhances the overall structure of your image, as well as creating a stunning distinction between a vivid, colorful background and a darker, shadowy foreground.  \\r\\n\\r\\n5. Shoot Wide Angle\\r\\nUsing a wide-angle lens for photography is particularly useful if you are shooting interiors, architecture, or vast landscapes. Make sure you have a clear subject in your framing to draw the viewer’s eye. Otherwise, you will be getting a dull photo.","CategoryId":6,"UserId":11}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (198, CAST(N'2021-06-18T14:16:02.9522768' AS DateTime2), N'mika123', N'Create New Post', N'{"Id":0,"Cover":{"ContentDisposition":"form-data; name=\"cover\"; filename=\"2._wide-angle-reflections.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"cover\"; filename=\"2._wide-angle-reflections.jpg\""],"Content-Type":["image/jpeg"]},"Length":103843,"Name":"cover","FileName":"2._wide-angle-reflections.jpg"},"Title":"Is it Ethical to Travel Now? With that Freedom Comes Responsibility","Description":"Is it ethical to travel now?” The relationship between freedom and responsibility might provide you the answer.\\r\\n\\r\\nPopular question these days. The temptation to answer “yes” or “no” misses the opportunity to separate the issues facing travelers, including that our freedom to travel carries with it a \\r\\npersonal responsibility — just as it always has.\\r\\n\\r\\nFreedom, Responsibility and Meaning: The Travel Payoff\\r\\n“Freedom, however, is not the last word. Freedom is only part of the story and half of the truth. Freedom is but the negative aspect of the whole phenomenon whose positive aspect is \\r\\nresponsibleness. In fact, freedom is in danger of degenerating into mere arbitrariness unless it is lived in terms of responsibleness.”\\r\\n—Victor E Frankl, Man\\''s Search for Meaning\\r\\n\\r\\nWhen we go out into the world – whether across the globe or around the block – we exercise a freedom. That freedom is paired with a responsibility to ourselves and to others. We can \\r\\nchoose to ignore that responsibility. If we do, we slowly — and usually imperceptibly — erode those freedoms.\\r\\n\\r\\nFor example, at home we have a responsibility to pick up after ourselves. If we throw trash on our streets and everyone follows suit, we live in garbage together. If we walk down the \\r\\nsidewalk as if the sidewalk is ours alone, and others do the same, we collide.\\r\\n\\r\\nWhen we travel, similar forces are at work, only the playing field is a bit larger.\\r\\n\\r\\nThe greater lesson in Frankl’s quote as it applies to travel: as we exercise our freedom, the care we take and the responsibility we choose to bear actually lends shape, meaning and value \\r\\nto our lived experience. As the frame of our travels expands from #whatismine to #whatisours, effort is required.\\r\\n\\r\\nShould You Travel Now?\\r\\n“Should I travel now?”\\r\\n\\r\\nIt’s a personal decision. That redirect is not just diplomatic avoidance. Instead, it implies that your answer ought to depend on the choices you make, how you intend to travel and \\r\\nwhether and how you care about the well-being of others along the way.\\r\\n\\r\\nIt applies whether you journey just outside your front door or halfway around the world.\\r\\nIt has always applied.\\r\\nAnd its truth remains with each of us until we take our last trip.","CategoryId":4,"UserId":11}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (199, CAST(N'2021-06-18T14:17:20.3401768' AS DateTime2), N'mika123', N'Create New Post', N'{"Id":0,"Cover":{"ContentDisposition":"form-data; name=\"cover\"; filename=\"healthy-skin-foods-avocado.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"cover\"; filename=\"healthy-skin-foods-avocado.jpg\""],"Content-Type":["image/jpeg"]},"Length":79008,"Name":"cover","FileName":"healthy-skin-foods-avocado.jpg"},"Title":"Essential tips to have fabulous skin","Description":"Everyone has a favourite face cream or treatment, but beautiful skin starts with nourishment from within. Older cells are constantly shed and replaced by younger ones and a steady \\r\\nsupply of key nutrients is essential to support this rapid growth. Eat the correct balance of foods and you’ll feed your skin the vital nutrients it needs to help it stay soft, supple and \\r\\nblemish-free. \\r\\n\\r\\nThat said, as much as we may try to resist it, our skin does naturally age. Wrinkles and age spots are the inevitable result of time, but skin ageing may be sped up by overexposure to the \\r\\nsun and tanning beds, strong soaps, chemicals and poor nutrition. With this in mind, a holistic approach is best. Treat your skin kindly and optimise your nutrition by eating antioxidant-\\r\\nrich fruit and vegetables, healthy fats from oily fish and nuts, and a varied and balanced diet. This should give optimal levels of the nutrients that are crucial for radiant skin, including \\r\\nbeta carotene, vitamins C and E, zinc and selenium.\\r\\n\\r\\n1) Eat a minimum of five portions of fruit and vegetables every day\\r\\nFruit and vegetables contain powerful antioxidants that help to protect skin from the cellular damage caused by free radicals. Free radicals, smoking, pollution and sunlight can cause \\r\\nwrinkling and age spots. Eat a rainbow of colourful fruit and vegetables and aim for at least five portions a day. Betacarotene, found in carrots, sweet potatoes and pumpkin, and lutein, \\r\\nfound in kale, papaya and spinach are potent antioxidants, important for normal skin cell development and healthy skin tone.\\r\\n\\r\\n2) Eat enough vitamin C/E\\r\\nVitamin C is also a super antioxidant. It is needed to support the immune system, promote radiant skin and help blemishes heal properly. The best sources are blackcurrants, blueberries, \\r\\nbroccoli, guava, kiwi fruits, oranges, papaya, strawberries and sweet potatoes. Vitamin C is needed to produce collagen that strengthens the capillaries that supply the skin.\\r\\n\\r\\nVitamin E protects skin from oxidative (cell) damage and supports healthy skin growth. Foods high in vitamin E include almonds, avocado, hazelnuts, pine nuts and sunflower and corn \\r\\noils.\\r\\n\\r\\n3)Drink six to eight glasses of water a day\\r\\nSkin needs moisture to stay flexible. Even mild dehydration will cause your skin to look dry, tired and slightly grey. Drink six to eight glasses of water a day – all fluids count towards your \\r\\ndaily allowance, but water is the best. If you work in an office, keep a large bottle of water on your desk to remind you to drink. Herbal, caffeine-free teas are good too. Don’t forget that \\r\\nsome fruit and vegetables, such as watermelon, courgette and cucumber, also contribute fluids – the added benefit is that the minerals they contain will increase the rate you hydrate your \\r\\nbody and skin","CategoryId":2,"UserId":11}')
GO
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (200, CAST(N'2021-06-18T14:19:28.5214358' AS DateTime2), N'ana123', N'Create New Post', N'{"Id":0,"Cover":{"ContentDisposition":"form-data; name=\"cover\"; filename=\"Solange-vogue-courtesy-Solange-8.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"cover\"; filename=\"Solange-vogue-courtesy-Solange-8.jpg\""],"Content-Type":["image/jpeg"]},"Length":771128,"Name":"cover","FileName":"Solange-vogue-courtesy-Solange-8.jpg"},"Title":"Holly Willoughby nails summer chic in £199 high-street dress","Description":"The model is talking about booking her latest gig, modeling WordPress underwear in the brand latest Perfectly Fit campaign, which was shot by Lachian Bailey. It was such a surreal moment cried she admitted.\\r\\n\\r\\nSo simple, yet so essential, the white shirt is the foundation of any wardrobe. It’s also the most multi-functional item, taking you from work to play with just the quick unfastening of a couple of buttons.\\r\\n\\r\\nThere was a time in the industry not too long ago, when it seemed that the high fashion world was using plus size models as a headline-grabbing gimmick see the groundbreaking cover.\\r\\nThe main thing that you have to remember on this journey is just be nice to everyone and always smile. Refreshingly, what was expected of her was the same thing that was expected of Lara Stone: to take a beautiful picture. We woke reasonably late following the feast and free flowing wine the night before. After gathering ourselves and our packs, we headed down to our homestay family’s small dining room for breakfast, where we enjoyed scrambled eggs, toast, mekitsi (fried dough), local jam and peppermint tea. We were making our way to the Rila Mountains, where we were visiting the Rila Monastery.\\r\\n\\r\\nThere was a time in the industry not too long ago, when it seemed that the high fashion world was using plus size models as a headline-grabbing gimmick see the groundbreaking Italian Vogue cover featuring Tara Lynn, Candice Huffine, and Robyn Lawley in June 2016.","CategoryId":7,"UserId":10}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (201, CAST(N'2021-06-18T14:20:44.7739410' AS DateTime2), N'ana123', N'Create New Post', N'{"Id":0,"Cover":{"ContentDisposition":"form-data; name=\"cover\"; filename=\"MaxPixel.net-Woman-Lake-Female-Forest-River-Trees-Girl-Hat-1839426-1024x680.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"cover\"; filename=\"MaxPixel.net-Woman-Lake-Female-Forest-River-Trees-Girl-Hat-1839426-1024x680.jpg\""],"Content-Type":["image/jpeg"]},"Length":97266,"Name":"cover","FileName":"MaxPixel.net-Woman-Lake-Female-Forest-River-Trees-Girl-Hat-1839426-1024x680.jpg"},"Title":"The Climate Crisis in Travel: Are We Missing the Bigger Picture?","Description":"As we respond to the climate crisis and consider tourism’s role in it, we wonder if we might be missing a bigger picture – and a greater opportunity — by focusing so squarely on flights. We offer some research and tools to travelers and the tourism industry to help season and expand our thinking on the topic.\\r\\n\\r\\nAs we read about the climate crisis and the role that travel and tourism plays, we’ve noticed a prevailing theme: carbon emissions from flights and aviation are the problem.\\r\\n\\r\\nSure, this is a central issue. The reality is that flights do contribute considerably to global carbon emissions and this is only expected to rise as passenger numbers increase. In recognition of that, we’ve examined our own thinking and committed to the Tourism Declares framework in an effort to reduce the number of flights we take per year for professional and personal reasons.\\r\\n\\r\\nHowever, flights aren’t the only problem at the intersection of tourism, carbon emissions and the climate crisis. In fact, even if we stopped flying altogether, we’d miss some of the travel industry’s greatest environmental impact and carbon emissions reduction opportunities of all. We\\''d also lose out on many of the potential socio-economic and conservation-oriented benefits that travel and tourism deliver to the places we fly to and the people who live there. \\r\\n\\r\\nClimate Crisis and Travel\\r\\nTo date, carbon offsets have served as the tourism industry’s form of penitent indulgence or get-out-of-jail-free for flight-based carbon emissions. However many experts argue it doesn\\''t really solve the problem. We tend to agree.\\r\\n\\r\\nFortunately, the actions that travelers and tourism companies take on the ground once the plane has landed and their holidays begin has gained greater attention and scrutiny.\\r\\n\\r\\nFor example, recent research from Responsible Travel regarding carbon emissions from holidays found a surprising result: that the carbon footprint from food — or foodprint —  can sometimes be greater than that of the transport used to reach the holiday destination","CategoryId":4,"UserId":10}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (202, CAST(N'2021-06-18T14:21:48.1310096' AS DateTime2), N'ana123', N'Create New Post', N'{"Id":0,"Cover":{"ContentDisposition":"form-data; name=\"cover\"; filename=\"photo-1556306581-8414c673753c-1024x700.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"cover\"; filename=\"photo-1556306581-8414c673753c-1024x700.jpg\""],"Content-Type":["image/jpeg"]},"Length":114148,"Name":"cover","FileName":"photo-1556306581-8414c673753c-1024x700.jpg"},"Title":"How Americans Became Convinced Their Halloween Candy was Poisoned","Description":"Rumors of tainted, poisoned or otherwise murderous Halloween candy handed out to unsuspecting youngsters are as much a part of the Halloween tradition as costumes and sing-song pleas for sweets. The myth goes like this—no kid is safe on October 31 because psychotic murderers may hand out tainted treats to trick-or-treating children.\\r\\n\\r\\nBut is poisoned Halloween candy a terrifying threat or an urban legend?\\r\\n\\r\\n“Many, if not most, reports of Halloween sadism are of questionable authenticity,” write sociologists and criminal justice experts Joel Best and Gerald T. Horiuchi.\\r\\n\\r\\nWhen they conducted an extensive study on so-called “Halloween sadism,”\\r\\n\\r\\nor crimes specifically committed using Halloween treats or customs, they concluded that the threat is greatly exaggerated. Though both parents and kids are taught to be on the alert for tampered-with sweets, most of the cases the researchers analyzed were either overstated or could not be linked to Halloween itself.\\r\\n\\r\\nBest and Horiuchi suggest that fears of Halloween sadism rise during fearful times. For example, paranoia about tainted candy spiked in the early 1980s after a rash of Tylenol poisonings in which cyanide-laced acetaminophen was placed on store shelves and sold. The high-profile crime led to the introduction of childproof containers and tough federal laws aimed at punishing those who tamper with drugs. After the Tylenol murders, which are still unsolved, warnings about adulterated Halloween candy increased.\\r\\n\\r\\nWhile the fears may be overblown, Halloween crimes involving poison have occurred.\\r\\n\\r\\nIn 1964, for example, a New York woman named Helen Pfeil was arrested for handing out things like ant poison and dog biscuits to kids. When questioned, the housewife said that she was joking and that she gave the items to kids she felt were too old to be trick-or-treating. Though no children were poisoned during the incident, law enforcement didn’t find her actions funny.\\r\\n\\r\\nThe most infamous Halloween poisoning took place on October 31, 1974. That’s when a Texas man named Ronald O’Bryan gave cyanide-laced pixie sticks to five children, including his son. The other children never ate the candy, but his eight-year-old son, Timothy, did—and died soon after.\\r\\n\\r\\nThough nobody saw O’Bryan put the cyanide in the candy, investigators learned that O’Bryan had recently taken life insurance policies out on his children. He was convicted of murder and executed via lethal injection in 1984. Though it’s been decades since the crime, the “Candyman” murder still looms large in the memories of many parents on Halloween.","CategoryId":3,"UserId":10}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (203, CAST(N'2021-06-18T14:23:19.3309164' AS DateTime2), N'ana123', N'Create New Post', N'{"Id":0,"Cover":{"ContentDisposition":"form-data; name=\"cover\"; filename=\"swedish_chef.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"cover\"; filename=\"swedish_chef.jpg\""],"Content-Type":["image/jpeg"]},"Length":228292,"Name":"cover","FileName":"swedish_chef.jpg"},"Title":"The Swedish chef who cooks solely with fire","Description":"Evoking a deep a sense of nostalgia, chef Niklas Ekstedt has taken traditional Swedish food to a new level – by cooking fine cuisine over fire without gas or electricity.\\r\\nAt his Michelin-starred restaurant, Ekstedt, located in downtown Stockholm, chef Niklas Ekstedt brings the natural world indoors. Considered one of Sweden\\''s most famous chefs, he transforms raw ingredients into fine cuisine solely through the use of fire, ash, soot and smoke – no gas or electricity allowed.\\r\\n\\r\\nTo Ekstedt, this method brings Swedish cooking back to its roots. \\\"Fire for me, it\\''s like the history of humans. It is the way that we cooked the majority of the time,\\\" he said. Ekstedt conjured his childhood memories of being out in the woods with his parents – in the small town of Järpen in northern Sweden – and brought them into a modern restaurant setting to evoke a sense of nostalgia, a sentiment which he believes is shared with and appreciated by his diners.\\r\\n\\r\\nOnce part of a Scandinavian cuisine revolution back in the 1990s that focused on contemporary molecular cooking techniques, Ekstedt has become a national and international celebrity, hosting a Swedish cooking show called Niklas Mat, authoring several books (his latest being Happy Food, a deep dive into plant-focused diets) and serving as a judge on Netflix\\''s Crazy Delicious alongside American chef Carla Hall and Britain\\''s Heston Blumenthal.\\r\\n\\r\\nHowever, despite all his success and feeling a bit uncertain about what he wanted in a new restaurant venture, in 2011 Ekstedt decided to take a break from the limelight and live in a wooden cabin in the forest with his family, without any electricity or gas, and learn the ancestral techniques of cooking with open fire.\\r\\n\\r\\nAccording to his restaurant\\''s website, Ekstedt said, \\\"I roamed the land around our summer cottage on Ingarö in the Stockholm archipelago, musing like some melancholic character in a black and white Ingmar Bergman film.\\\"\\r\\nAfter some deep soul-searching, he became inspired by the birch trees and the qualities that their smouldering wood lent to cooked food, which sent him on a new mission to bring wood-fired cooking techniques to the city. Once back in Stockholm, he researched ancient Swedish recipes, but discovered that they left out one practical ingredient: directions on how to actually cook the food.\\r\\n\\r\\n\\\"What was interesting was that the techniques were not written down,\\\" he said. \\\"The recipes were written down but the techniques they took for granted, because they just assumed people knew how to put up a fire, how to smoke, how to use the coal and the stove.","CategoryId":7,"UserId":10}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (204, CAST(N'2021-06-18T14:24:03.3342650' AS DateTime2), N'user123', N'Create New Post', N'{"Id":0,"Cover":{"ContentDisposition":"form-data; name=\"cover\"; filename=\"swedish_chef.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"cover\"; filename=\"swedish_chef.jpg\""],"Content-Type":["image/jpeg"]},"Length":228292,"Name":"cover","FileName":"swedish_chef.jpg"},"Title":"The Swedish chef who cooks solely with fire","Description":"Evoking a deep a sense of nostalgia, chef Niklas Ekstedt has taken traditional Swedish food to a new level – by cooking fine cuisine over fire without gas or electricity.\\r\\nAt his Michelin-starred restaurant, Ekstedt, located in downtown Stockholm, chef Niklas Ekstedt brings the natural world indoors. Considered one of Sweden\\''s most famous chefs, he transforms raw ingredients into fine cuisine solely through the use of fire, ash, soot and smoke – no gas or electricity allowed.\\r\\n\\r\\nTo Ekstedt, this method brings Swedish cooking back to its roots. \\\"Fire for me, it\\''s like the history of humans. It is the way that we cooked the majority of the time,\\\" he said. Ekstedt conjured his childhood memories of being out in the woods with his parents – in the small town of Järpen in northern Sweden – and brought them into a modern restaurant setting to evoke a sense of nostalgia, a sentiment which he believes is shared with and appreciated by his diners.\\r\\n\\r\\nOnce part of a Scandinavian cuisine revolution back in the 1990s that focused on contemporary molecular cooking techniques, Ekstedt has become a national and international celebrity, hosting a Swedish cooking show called Niklas Mat, authoring several books (his latest being Happy Food, a deep dive into plant-focused diets) and serving as a judge on Netflix\\''s Crazy Delicious alongside American chef Carla Hall and Britain\\''s Heston Blumenthal.\\r\\n\\r\\nHowever, despite all his success and feeling a bit uncertain about what he wanted in a new restaurant venture, in 2011 Ekstedt decided to take a break from the limelight and live in a wooden cabin in the forest with his family, without any electricity or gas, and learn the ancestral techniques of cooking with open fire.\\r\\n\\r\\nAccording to his restaurant\\''s website, Ekstedt said, \\\"I roamed the land around our summer cottage on Ingarö in the Stockholm archipelago, musing like some melancholic character in a black and white Ingmar Bergman film.\\\"\\r\\nAfter some deep soul-searching, he became inspired by the birch trees and the qualities that their smouldering wood lent to cooked food, which sent him on a new mission to bring wood-fired cooking techniques to the city. Once back in Stockholm, he researched ancient Swedish recipes, but discovered that they left out one practical ingredient: directions on how to actually cook the food.\\r\\n\\r\\n\\\"What was interesting was that the techniques were not written down,\\\" he said. \\\"The recipes were written down but the techniques they took for granted, because they just assumed people knew how to put up a fire, how to smoke, how to use the coal and the stove.","CategoryId":7,"UserId":9}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (205, CAST(N'2021-06-18T14:25:36.0991122' AS DateTime2), N'user123', N'Create New Post', N'{"Id":0,"Cover":{"ContentDisposition":"form-data; name=\"cover\"; filename=\"jaggery.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"cover\"; filename=\"jaggery.jpg\""],"Content-Type":["image/jpeg"]},"Length":4651,"Name":"cover","FileName":"jaggery.jpg"},"Title":"Jaggery: South Asia\\''s sweet, sentimental cure-all","Description":"Jaggery is more than an indigenous medicinal food or a delectable dessert; it\\''s the concentrated essence of millennia-old tradition.\\r\\nA staunch follower of the unwritten manifesto of South Asian mothers and grandmothers everywhere, my mother thinks there are few ailments she can’t treat at home with food. One ingredient in particular features regularly in her remedy arsenal. And unlike many of the peculiar poultices she applies and acrid concoctions she brews, this one is an easy pill – or lump – to swallow.\\r\\n\\r\\nThe first time I tasted jaggery, I dubiously watched the slowly liquifying lump of molten-gold cane sugar ooze into flaky crevices of a layered paratha. It had been \\\"prescribed\\\" to me by my mother in Pakistan’s Khyber Pakhtunkhwa province because I had a bone-chilling cold. Against the rugged landscape of imposing mountains fencing the Karakoram Highway, I wondered how something that looked so decadent could be considered healthy. But soon after I bit into the complex sweetness, I felt a rush of energy and warmth. As I would soon find out, this was more than an indigenous medicinal food or a delectable dessert. It was the concentrated essence of millennia-old tradition.\\r\\n\\r\\nJaggery (called gud in Pakistan) is an unrefined sugar that’s made by evaporating freshly pressed sugarcane juice (and, in some regions, Palmyrah palm, coconut-palm or date-palm sap extracted via tapping techniques) and cooling the thickened liquid in moulds. Its many monikers across South Asia and close parallels beyond, such as panela in Colombia and much of the Caribbean, kokuto in Japan and rapadura in Brazil – just to name a few – attest to its ubiquity.","CategoryId":2,"UserId":9}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (206, CAST(N'2021-06-18T14:27:05.7162552' AS DateTime2), N'user123', N'Search of posts', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (207, CAST(N'2021-06-18T14:27:30.4493345' AS DateTime2), N'user123', N'Single Post', N'15')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (208, CAST(N'2021-06-18T14:30:03.5261887' AS DateTime2), N'admin123', N'AuditLogs Search', N'{"Actor":null,"UseCaseName":null,"DateFrom":null,"DateTo":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (209, CAST(N'2021-06-18T14:30:15.8562326' AS DateTime2), N'admin123', N'AuditLogs Search', N'{"Actor":null,"UseCaseName":null,"DateFrom":null,"DateTo":null,"PerPage":10,"Page":2}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (210, CAST(N'2021-06-18T14:30:56.2887198' AS DateTime2), N'admin123', N'AuditLogs Search', N'{"Actor":null,"UseCaseName":"create","DateFrom":null,"DateTo":null,"PerPage":10,"Page":2}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (211, CAST(N'2021-06-18T14:31:07.4989359' AS DateTime2), N'admin123', N'AuditLogs Search', N'{"Actor":null,"UseCaseName":"create","DateFrom":null,"DateTo":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (212, CAST(N'2021-06-18T14:31:17.6698676' AS DateTime2), N'admin123', N'AuditLogs Search', N'{"Actor":null,"UseCaseName":"create new","DateFrom":null,"DateTo":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (213, CAST(N'2021-06-18T14:31:22.3359381' AS DateTime2), N'admin123', N'AuditLogs Search', N'{"Actor":null,"UseCaseName":"create new post","DateFrom":null,"DateTo":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (214, CAST(N'2021-06-18T14:31:33.9150965' AS DateTime2), N'admin123', N'AuditLogs Search', N'{"Actor":null,"UseCaseName":"create new comment","DateFrom":null,"DateTo":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (215, CAST(N'2021-06-18T14:47:18.2449698' AS DateTime2), N'admin123', N'AuditLogs Search', N'{"Actor":null,"UseCaseName":"create new comment","DateFrom":null,"DateTo":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (216, CAST(N'2021-06-18T14:48:41.7960481' AS DateTime2), N'admin123', N'AuditLogs Search', N'{"Actor":null,"UseCaseName":"create new comment","DateFrom":"2021-06-17","DateTo":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (217, CAST(N'2021-06-18T14:49:03.0577365' AS DateTime2), N'admin123', N'AuditLogs Search', N'{"Actor":null,"UseCaseName":"create new comment","DateFrom":"2021-06-17","DateTo":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (218, CAST(N'2021-06-18T14:49:07.7001149' AS DateTime2), N'admin123', N'AuditLogs Search', N'{"Actor":null,"UseCaseName":"create new comment","DateFrom":null,"DateTo":"2021-06-17","PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (219, CAST(N'2021-06-18T14:49:24.7806468' AS DateTime2), N'admin123', N'AuditLogs Search', N'{"Actor":null,"UseCaseName":null,"DateFrom":null,"DateTo":"2021-06-17","PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (220, CAST(N'2021-06-18T14:49:43.8524153' AS DateTime2), N'admin123', N'AuditLogs Search', N'{"Actor":null,"UseCaseName":null,"DateFrom":null,"DateTo":"2021-06-17","PerPage":10,"Page":2}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (221, CAST(N'2021-06-18T14:49:53.6454569' AS DateTime2), N'Anonymous User', N'AuditLogs Search', N'{"Actor":null,"UseCaseName":null,"DateFrom":null,"DateTo":"2021-06-17","PerPage":10,"Page":3}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (222, CAST(N'2021-06-18T14:52:55.3520104' AS DateTime2), N'Anonymous User', N'AuditLogs Search', N'{"Actor":null,"UseCaseName":null,"DateFrom":null,"DateTo":"2021-06-17","PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (223, CAST(N'2021-06-18T14:53:24.6307072' AS DateTime2), N'admin123', N'AuditLogs Search', N'{"Actor":null,"UseCaseName":null,"DateFrom":null,"DateTo":"2021-06-17","PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (224, CAST(N'2021-06-18T14:53:46.7465269' AS DateTime2), N'admin123', N'AuditLogs Search', N'{"Actor":null,"UseCaseName":null,"DateFrom":"2021-06-17","DateTo":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (225, CAST(N'2021-06-18T14:54:06.5190318' AS DateTime2), N'admin123', N'AuditLogs Search', N'{"Actor":null,"UseCaseName":null,"DateFrom":"2021-06-15","DateTo":"2021-06-17","PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (226, CAST(N'2021-06-18T14:54:23.7933208' AS DateTime2), N'admin123', N'AuditLogs Search', N'{"Actor":null,"UseCaseName":null,"DateFrom":"2021-06-15","DateTo":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (227, CAST(N'2021-06-18T14:57:07.6497194' AS DateTime2), N'admin123', N'AuditLogs Search', N'{"Actor":null,"UseCaseName":null,"DateFrom":"2021-06-16","DateTo":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (228, CAST(N'2021-06-18T15:01:42.9623318' AS DateTime2), N'admin123', N'AuditLogs Search', N'{"Actor":null,"UseCaseName":null,"DateFrom":"2021-06-16","DateTo":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (229, CAST(N'2021-06-18T15:02:41.5322210' AS DateTime2), N'admin123', N'AuditLogs Search', N'{"Actor":null,"UseCaseName":null,"DateFrom":"2021-06-16","DateTo":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (230, CAST(N'2021-06-18T15:02:52.7947159' AS DateTime2), N'admin123', N'AuditLogs Search', N'{"Actor":null,"UseCaseName":null,"DateFrom":null,"DateTo":"2021-06-16","PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (231, CAST(N'2021-06-18T15:03:18.7091357' AS DateTime2), N'admin123', N'AuditLogs Search', N'{"Actor":null,"UseCaseName":null,"DateFrom":"2021-06-16","DateTo":"2021-06-18","PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (232, CAST(N'2021-06-18T15:03:39.9528877' AS DateTime2), N'admin123', N'AuditLogs Search', N'{"Actor":null,"UseCaseName":null,"DateFrom":"2021-06-16","DateTo":"2021-06-18","PerPage":10,"Page":3}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (233, CAST(N'2021-06-18T15:03:55.4875084' AS DateTime2), N'admin123', N'AuditLogs Search', N'{"Actor":"pera","UseCaseName":null,"DateFrom":"2021-06-16","DateTo":"2021-06-18","PerPage":10,"Page":3}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (234, CAST(N'2021-06-18T15:04:02.0852471' AS DateTime2), N'admin123', N'AuditLogs Search', N'{"Actor":"p","UseCaseName":null,"DateFrom":"2021-06-16","DateTo":"2021-06-18","PerPage":10,"Page":3}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (235, CAST(N'2021-06-18T15:14:42.1147182' AS DateTime2), N'user123', N'Create New Comment', N'{"Message":"So lovely post. I like it","UserId":9,"PostId":12}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (236, CAST(N'2021-06-18T15:16:10.4447853' AS DateTime2), N'user123', N'Create New Comment', N'{"Message":"So lovely post. I like it","UserId":9,"PostId":15}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (237, CAST(N'2021-06-18T15:17:55.6278693' AS DateTime2), N'user123', N'Create New Comment', N'{"Message":"So good post. I love photography so I really enjoyed reading it.","UserId":9,"PostId":13}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (238, CAST(N'2021-06-18T15:20:44.5661227' AS DateTime2), N'user123', N'Create New Comment', N'{"Message":"I really like to travel around the world. I want to reccommend everyone to read this article","UserId":9,"PostId":14}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (239, CAST(N'2021-06-18T15:22:52.1345657' AS DateTime2), N'admin123', N'Search Users', N'{"FirstName":null,"LastName":null,"Username":null,"Email":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (240, CAST(N'2021-06-18T15:23:03.7556898' AS DateTime2), N'admin123', N'Read Single User', N'1')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (241, CAST(N'2021-06-18T15:46:53.1867895' AS DateTime2), N'Anonymous User', N'Search of posts', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (242, CAST(N'2021-06-18T15:51:42.1000751' AS DateTime2), N'Anonymous User', N'Search of posts', N'{"Keyword":null,"DateFrom":null,"DateTo":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (243, CAST(N'2021-06-18T15:52:39.9596626' AS DateTime2), N'Anonymous User', N'Single Post', N'15')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (244, CAST(N'2021-06-18T15:52:58.5678343' AS DateTime2), N'Anonymous User', N'Single Post', N'13')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (245, CAST(N'2021-06-18T15:59:52.9176770' AS DateTime2), N'Anonymous User', N'Single Post', N'13')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (246, CAST(N'2021-06-18T16:00:21.0556036' AS DateTime2), N'Anonymous User', N'Single Post', N'14')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (247, CAST(N'2021-06-18T16:04:35.9746791' AS DateTime2), N'Anonymous User', N'Single Post', N'14')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (248, CAST(N'2021-06-18T16:22:14.2726715' AS DateTime2), N'Anonymous User', N'Single Post', N'14')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (249, CAST(N'2021-06-18T16:22:58.7240467' AS DateTime2), N'Anonymous User', N'Single Post', N'13')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (250, CAST(N'2021-06-18T16:23:15.9846218' AS DateTime2), N'Anonymous User', N'Single Post', N'15')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (251, CAST(N'2021-06-18T16:27:56.8124373' AS DateTime2), N'ana123', N'Create New Comment', N'{"Message":"I really enjoyed reading this article.","UserId":10,"PostId":15}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (252, CAST(N'2021-06-18T16:28:06.8431671' AS DateTime2), N'ana123', N'Create New Comment', N'{"Message":"I really enjoyed reading this article.","UserId":10,"PostId":13}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (253, CAST(N'2021-06-18T16:28:22.9696171' AS DateTime2), N'Anonymous User', N'Single Post', N'15')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (254, CAST(N'2021-06-18T16:29:46.8863914' AS DateTime2), N'mika123', N'Create New Comment', N'{"Message":"I love photography so much. I learn much reading this article","UserId":11,"PostId":15}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (255, CAST(N'2021-06-18T16:30:21.5459695' AS DateTime2), N'mika123', N'Create New Comment', N'{"Message":"I love to travel so much. I learn much reading this article","UserId":11,"PostId":14}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (256, CAST(N'2021-06-18T16:30:36.6291963' AS DateTime2), N'Anonymous User', N'Single Post', N'15')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (257, CAST(N'2021-06-18T16:30:43.2953272' AS DateTime2), N'Anonymous User', N'Single Post', N'14')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (258, CAST(N'2021-06-18T16:30:49.4164984' AS DateTime2), N'Anonymous User', N'Single Post', N'13')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (259, CAST(N'2021-06-18T16:32:07.3766800' AS DateTime2), N'Anonymous User', N'Single Post', N'16')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (260, CAST(N'2021-06-18T20:10:05.3806322' AS DateTime2), N'admin123', N'Updating Existing User', N'{"Id":4,"FirstName":"Anja","LastName":"Tomic","Email":"admin@gmail.com","Username":"admin123","UserUseCases":[1,2,3,4,5,11,15,18,19,20,21,22,23,24,25,26]}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (261, CAST(N'2021-06-18T20:14:11.5819473' AS DateTime2), N'admin123', N'Updating Existing User', N'{"Id":11,"FirstName":"Mika","LastName":"Mikic","Email":"mikamikic@gmail.com","Username":"mika123","UserUseCases":[4,5,7,8,9,11,12,13,14,15,16,17,26]}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (262, CAST(N'2021-06-18T20:15:07.5105353' AS DateTime2), N'admin123', N'Updating Existing User', N'{"Id":10,"FirstName":"Ana","LastName":"Petrovic","Email":"anapetrovic@gmail.com","Username":"ana123","UserUseCases":[4,5,7,8,9,11,12,13,14,15,16,17,26]}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (263, CAST(N'2021-06-18T20:17:05.9416954' AS DateTime2), N'admin123', N'Updating Existing User', N'{"Id":9,"FirstName":"New","LastName":"User","Email":"newuser@gmail.com","Username":"user123","UserUseCases":[4,5,7,8,9,11,12,13,14,15,16,17,26]}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (264, CAST(N'2021-06-18T20:18:04.6004827' AS DateTime2), N'admin123', N'Updating Existing User', N'{"Id":8,"FirstName":"Fake","LastName":"User","Email":"fakeuser@gmail.com","Username":"fakeuser","UserUseCases":[4,5,7,8,9,11,12,13,14,15,16,17,26]}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (265, CAST(N'2021-06-18T20:18:57.7643985' AS DateTime2), N'admin123', N'Updating Existing User', N'{"Id":8,"FirstName":"Proba","LastName":"Proba","Email":"svetlana013.tomic@gmail.com","Username":"proba1","UserUseCases":[4,5,7,8,9,11,12,13,14,15,16,17,26]}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (266, CAST(N'2021-06-18T20:19:22.7685770' AS DateTime2), N'admin123', N'Updating Existing User', N'{"Id":3,"FirstName":"Proba","LastName":"Proba","Email":"svetlana013.tomic@gmail.com","Username":"proba1","UserUseCases":[4,5,7,8,9,11,12,13,14,15,16,17,26]}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (267, CAST(N'2021-06-18T20:19:58.7167805' AS DateTime2), N'admin123', N'Updating Existing User', N'{"Id":3,"FirstName":"Pera","LastName":"Peric","Email":"pera@gmail.com","Username":"pera","UserUseCases":[4,5,7,8,9,11,12,13,14,15,16,17,26]}')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Actor], [UseCaseName], [Data]) VALUES (268, CAST(N'2021-06-18T20:20:15.3016448' AS DateTime2), N'admin123', N'Updating Existing User', N'{"Id":1,"FirstName":"Pera","LastName":"Peric","Email":"pera@gmail.com","Username":"pera","UserUseCases":[4,5,7,8,9,11,12,13,14,15,16,17,26]}')
SET IDENTITY_INSERT [dbo].[AuditLogs] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1, N'technology', CAST(N'2021-06-15T16:20:13.5437025' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (2, N'food', CAST(N'2021-06-15T16:20:24.4374032' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (3, N'fashion', CAST(N'2021-06-15T16:20:59.7507902' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (4, N'travel', CAST(N'2021-06-15T16:22:15.7999477' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (5, N'new', CAST(N'2021-06-15T16:22:21.7455540' AS DateTime2), CAST(N'2021-06-15T16:25:52.2516640' AS DateTime2), 1, CAST(N'2021-06-15T16:25:52.2515225' AS DateTime2), 0)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (6, N'photograph', CAST(N'2021-06-15T16:22:40.4717809' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (7, N'inspiration', CAST(N'2021-06-15T16:22:48.8199588' AS DateTime2), NULL, 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [Message], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (2, N'This is new comment', 3, CAST(N'2021-06-17T19:23:39.2847394' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Message], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (3, N'Something like message', 3, CAST(N'2021-06-17T19:49:47.2924036' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Message], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (4, N'So lovely post. I like it', 9, CAST(N'2021-06-18T15:16:10.7497173' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Message], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (5, N'So good post. I love photography so I really enjoyed reading it.', 9, CAST(N'2021-06-18T15:17:55.6597603' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Message], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (6, N'I really like to travel around the world. I want to reccommend everyone to read this article', 9, CAST(N'2021-06-18T15:20:44.5891528' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Message], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (7, N'I really enjoyed reading this article.', 10, CAST(N'2021-06-18T16:27:57.0780517' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Message], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (8, N'I really enjoyed reading this article.', 10, CAST(N'2021-06-18T16:28:06.9053440' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Message], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (9, N'I love photography so much. I learn much reading this article', 11, CAST(N'2021-06-18T16:29:46.9416009' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Message], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (10, N'I love to travel so much. I learn much reading this article', 11, CAST(N'2021-06-18T16:30:21.6429976' AS DateTime2), NULL, 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[Comments] OFF
INSERT [dbo].[PostComments] ([PostId], [CommentId]) VALUES (9, 3)
INSERT [dbo].[PostComments] ([PostId], [CommentId]) VALUES (15, 4)
INSERT [dbo].[PostComments] ([PostId], [CommentId]) VALUES (13, 5)
INSERT [dbo].[PostComments] ([PostId], [CommentId]) VALUES (14, 6)
INSERT [dbo].[PostComments] ([PostId], [CommentId]) VALUES (15, 7)
INSERT [dbo].[PostComments] ([PostId], [CommentId]) VALUES (13, 8)
INSERT [dbo].[PostComments] ([PostId], [CommentId]) VALUES (15, 9)
INSERT [dbo].[PostComments] ([PostId], [CommentId]) VALUES (14, 10)
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([Id], [Cover], [Title], [Description], [CategoryId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (8, N'f8325a79-6236-4916-9202-60ec077acd14.png', N'"Title"', N'"This is something like description"', 2, 1, CAST(N'2021-06-16T21:18:44.4441430' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Posts] ([Id], [Cover], [Title], [Description], [CategoryId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (9, N'76809af8-a630-411f-88ff-d2ec49d2fad8.jpg', N'"New title"', N'"New description"', 3, 3, CAST(N'2021-06-16T23:33:27.1628813' AS DateTime2), CAST(N'2021-06-18T12:14:33.7250642' AS DateTime2), 0, NULL, 1)
INSERT [dbo].[Posts] ([Id], [Cover], [Title], [Description], [CategoryId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (10, N'2d587302-2b8d-4974-8254-6d7578b441db.jpg', N'"Title 2"', N'"Why is something like that description 2"', 1, 3, CAST(N'2021-06-16T23:35:33.7800177' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Posts] ([Id], [Cover], [Title], [Description], [CategoryId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (11, N'756af39a-266e-4773-aff7-f8666126af24.png', N'"Title 1331" ', N'"This is something like description"', 3, 3, CAST(N'2021-06-17T20:34:50.6276337' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Posts] ([Id], [Cover], [Title], [Description], [CategoryId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (12, N'3ec507f7-5649-464e-acfe-a11d7909af46.png', N'"Proba Title 1331" ', N'"This is something like description 5"', 2, 3, CAST(N'2021-06-18T12:16:25.0734818' AS DateTime2), CAST(N'2021-06-18T12:18:21.0853244' AS DateTime2), 1, CAST(N'2021-06-18T12:18:21.0848007' AS DateTime2), 0)
INSERT [dbo].[Posts] ([Id], [Cover], [Title], [Description], [CategoryId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (13, N'5bab5fba-7a59-4121-9c0f-65fe09ea87f0.jpg', N'Photography Ideas to Improve Your Photography', N'Are you stuck in a photographic rut? Are you looking to boost your creativity with new photography ideas?\r\nThere are so many different photography techniques out there. Where do you start?\r\nLook no further. We have compiled a list of  the most interesting photography ideas, ranging from simple post-production edits to day-long projects.\r\n\r\n1. Reflections\r\nThe use of reflections in your photography can add gorgeous depth and structure to your images.\r\nThey can turn average landscapes and cityscapes into something extraordinary. Use a wide-angle lens to capture a wider field of view, for full effect.\r\nBut don’t limit yourself to photographing lakes or rivers; puddles in city streets, fountains or even small ponds can give great reflection results.\r\n\r\n2. Look for Shadows\r\nShadow photography is a great way to add drama, mystery, and emotion to your portrait photography.\r\nYou can add anonymity to an image if you isolate the shadow alone, without showing the subject. You can use shadows of any subject to create this kind of effect.\r\n\r\n3. Shoot during the Golden Hour\r\nThe golden hour is the hour after sunrise or before sunset.\r\nTaking photos during this time adds a beautiful diffused warm hue to your images. It also extends shadows as the sun is at a lower point in the sky.\r\nIn addition, the golden hour allows a more even exposure, which enhances depth and detail in your subjects.\r\n\r\n4. Catch a Sunset\r\nFollowing on from the golden hour, a sunset offers some of the most beautiful photography. It works particularly well when dark silhouettes are in the foreground, such as a skyline, mountain or trees in a forest. This photography idea enhances the overall structure of your image, as well as creating a stunning distinction between a vivid, colorful background and a darker, shadowy foreground.  \r\n\r\n5. Shoot Wide Angle\r\nUsing a wide-angle lens for photography is particularly useful if you are shooting interiors, architecture, or vast landscapes. Make sure you have a clear subject in your framing to draw the viewer’s eye. Otherwise, you will be getting a dull photo.', 6, 11, CAST(N'2021-06-18T14:13:47.2785856' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Posts] ([Id], [Cover], [Title], [Description], [CategoryId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (14, N'a704debb-d42a-4955-9982-89786847a897.jpg', N'Is it Ethical to Travel Now? With that Freedom Comes Responsibility', N'Is it ethical to travel now?” The relationship between freedom and responsibility might provide you the answer.\r\n\r\nPopular question these days. The temptation to answer “yes” or “no” misses the opportunity to separate the issues facing travelers, including that our freedom to travel carries with it a \r\npersonal responsibility — just as it always has.\r\n\r\nFreedom, Responsibility and Meaning: The Travel Payoff\r\n“Freedom, however, is not the last word. Freedom is only part of the story and half of the truth. Freedom is but the negative aspect of the whole phenomenon whose positive aspect is \r\nresponsibleness. In fact, freedom is in danger of degenerating into mere arbitrariness unless it is lived in terms of responsibleness.”\r\n—Victor E Frankl, Man\''s Search for Meaning\r\n\r\nWhen we go out into the world – whether across the globe or around the block – we exercise a freedom. That freedom is paired with a responsibility to ourselves and to others. We can \r\nchoose to ignore that responsibility. If we do, we slowly — and usually imperceptibly — erode those freedoms.\r\n\r\nFor example, at home we have a responsibility to pick up after ourselves. If we throw trash on our streets and everyone follows suit, we live in garbage together. If we walk down the \r\nsidewalk as if the sidewalk is ours alone, and others do the same, we collide.\r\n\r\nWhen we travel, similar forces are at work, only the playing field is a bit larger.\r\n\r\nThe greater lesson in Frankl’s quote as it applies to travel: as we exercise our freedom, the care we take and the responsibility we choose to bear actually lends shape, meaning and value \r\nto our lived experience. As the frame of our travels expands from #whatismine to #whatisours, effort is required.\r\n\r\nShould You Travel Now?\r\n“Should I travel now?”\r\n\r\nIt’s a personal decision. That redirect is not just diplomatic avoidance. Instead, it implies that your answer ought to depend on the choices you make, how you intend to travel and \r\nwhether and how you care about the well-being of others along the way.\r\n\r\nIt applies whether you journey just outside your front door or halfway around the world.\r\nIt has always applied.\r\nAnd its truth remains with each of us until we take our last trip.', 4, 11, CAST(N'2021-06-18T14:16:03.1789842' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Posts] ([Id], [Cover], [Title], [Description], [CategoryId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (15, N'ca0f3ad6-5fd6-47c8-a326-8eb46058317c.jpg', N'Essential tips to have fabulous skin', N'Everyone has a favourite face cream or treatment, but beautiful skin starts with nourishment from within. Older cells are constantly shed and replaced by younger ones and a steady \r\nsupply of key nutrients is essential to support this rapid growth. Eat the correct balance of foods and you’ll feed your skin the vital nutrients it needs to help it stay soft, supple and \r\nblemish-free. \r\n\r\nThat said, as much as we may try to resist it, our skin does naturally age. Wrinkles and age spots are the inevitable result of time, but skin ageing may be sped up by overexposure to the \r\nsun and tanning beds, strong soaps, chemicals and poor nutrition. With this in mind, a holistic approach is best. Treat your skin kindly and optimise your nutrition by eating antioxidant-\r\nrich fruit and vegetables, healthy fats from oily fish and nuts, and a varied and balanced diet. This should give optimal levels of the nutrients that are crucial for radiant skin, including \r\nbeta carotene, vitamins C and E, zinc and selenium.\r\n\r\n1) Eat a minimum of five portions of fruit and vegetables every day\r\nFruit and vegetables contain powerful antioxidants that help to protect skin from the cellular damage caused by free radicals. Free radicals, smoking, pollution and sunlight can cause \r\nwrinkling and age spots. Eat a rainbow of colourful fruit and vegetables and aim for at least five portions a day. Betacarotene, found in carrots, sweet potatoes and pumpkin, and lutein, \r\nfound in kale, papaya and spinach are potent antioxidants, important for normal skin cell development and healthy skin tone.\r\n\r\n2) Eat enough vitamin C/E\r\nVitamin C is also a super antioxidant. It is needed to support the immune system, promote radiant skin and help blemishes heal properly. The best sources are blackcurrants, blueberries, \r\nbroccoli, guava, kiwi fruits, oranges, papaya, strawberries and sweet potatoes. Vitamin C is needed to produce collagen that strengthens the capillaries that supply the skin.\r\n\r\nVitamin E protects skin from oxidative (cell) damage and supports healthy skin growth. Foods high in vitamin E include almonds, avocado, hazelnuts, pine nuts and sunflower and corn \r\noils.\r\n\r\n3)Drink six to eight glasses of water a day\r\nSkin needs moisture to stay flexible. Even mild dehydration will cause your skin to look dry, tired and slightly grey. Drink six to eight glasses of water a day – all fluids count towards your \r\ndaily allowance, but water is the best. If you work in an office, keep a large bottle of water on your desk to remind you to drink. Herbal, caffeine-free teas are good too. Don’t forget that \r\nsome fruit and vegetables, such as watermelon, courgette and cucumber, also contribute fluids – the added benefit is that the minerals they contain will increase the rate you hydrate your \r\nbody and skin', 2, 11, CAST(N'2021-06-18T14:17:20.6676276' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Posts] ([Id], [Cover], [Title], [Description], [CategoryId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (16, N'cff9bad9-adb2-472a-829e-7c271e0db00f.jpg', N'Holly Willoughby nails summer chic in £199 high-street dress', N'The model is talking about booking her latest gig, modeling WordPress underwear in the brand latest Perfectly Fit campaign, which was shot by Lachian Bailey. It was such a surreal moment cried she admitted.\r\n\r\nSo simple, yet so essential, the white shirt is the foundation of any wardrobe. It’s also the most multi-functional item, taking you from work to play with just the quick unfastening of a couple of buttons.\r\n\r\nThere was a time in the industry not too long ago, when it seemed that the high fashion world was using plus size models as a headline-grabbing gimmick see the groundbreaking cover.\r\nThe main thing that you have to remember on this journey is just be nice to everyone and always smile. Refreshingly, what was expected of her was the same thing that was expected of Lara Stone: to take a beautiful picture. We woke reasonably late following the feast and free flowing wine the night before. After gathering ourselves and our packs, we headed down to our homestay family’s small dining room for breakfast, where we enjoyed scrambled eggs, toast, mekitsi (fried dough), local jam and peppermint tea. We were making our way to the Rila Mountains, where we were visiting the Rila Monastery.\r\n\r\nThere was a time in the industry not too long ago, when it seemed that the high fashion world was using plus size models as a headline-grabbing gimmick see the groundbreaking Italian Vogue cover featuring Tara Lynn, Candice Huffine, and Robyn Lawley in June 2016.', 7, 10, CAST(N'2021-06-18T14:19:28.6166273' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Posts] ([Id], [Cover], [Title], [Description], [CategoryId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (17, N'b0e3e799-6ba2-461c-b788-585cb0d9d6c0.jpg', N'The Climate Crisis in Travel: Are We Missing the Bigger Picture?', N'As we respond to the climate crisis and consider tourism’s role in it, we wonder if we might be missing a bigger picture – and a greater opportunity — by focusing so squarely on flights. We offer some research and tools to travelers and the tourism industry to help season and expand our thinking on the topic.\r\n\r\nAs we read about the climate crisis and the role that travel and tourism plays, we’ve noticed a prevailing theme: carbon emissions from flights and aviation are the problem.\r\n\r\nSure, this is a central issue. The reality is that flights do contribute considerably to global carbon emissions and this is only expected to rise as passenger numbers increase. In recognition of that, we’ve examined our own thinking and committed to the Tourism Declares framework in an effort to reduce the number of flights we take per year for professional and personal reasons.\r\n\r\nHowever, flights aren’t the only problem at the intersection of tourism, carbon emissions and the climate crisis. In fact, even if we stopped flying altogether, we’d miss some of the travel industry’s greatest environmental impact and carbon emissions reduction opportunities of all. We\''d also lose out on many of the potential socio-economic and conservation-oriented benefits that travel and tourism deliver to the places we fly to and the people who live there. \r\n\r\nClimate Crisis and Travel\r\nTo date, carbon offsets have served as the tourism industry’s form of penitent indulgence or get-out-of-jail-free for flight-based carbon emissions. However many experts argue it doesn\''t really solve the problem. We tend to agree.\r\n\r\nFortunately, the actions that travelers and tourism companies take on the ground once the plane has landed and their holidays begin has gained greater attention and scrutiny.\r\n\r\nFor example, recent research from Responsible Travel regarding carbon emissions from holidays found a surprising result: that the carbon footprint from food — or foodprint —  can sometimes be greater than that of the transport used to reach the holiday destination', 4, 10, CAST(N'2021-06-18T14:20:44.9202635' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Posts] ([Id], [Cover], [Title], [Description], [CategoryId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (18, N'2445aac4-8249-41db-9d6b-0acc86e544e2.jpg', N'How Americans Became Convinced Their Halloween Candy was Poisoned', N'Rumors of tainted, poisoned or otherwise murderous Halloween candy handed out to unsuspecting youngsters are as much a part of the Halloween tradition as costumes and sing-song pleas for sweets. The myth goes like this—no kid is safe on October 31 because psychotic murderers may hand out tainted treats to trick-or-treating children.\r\n\r\nBut is poisoned Halloween candy a terrifying threat or an urban legend?\r\n\r\n“Many, if not most, reports of Halloween sadism are of questionable authenticity,” write sociologists and criminal justice experts Joel Best and Gerald T. Horiuchi.\r\n\r\nWhen they conducted an extensive study on so-called “Halloween sadism,”\r\n\r\nor crimes specifically committed using Halloween treats or customs, they concluded that the threat is greatly exaggerated. Though both parents and kids are taught to be on the alert for tampered-with sweets, most of the cases the researchers analyzed were either overstated or could not be linked to Halloween itself.\r\n\r\nBest and Horiuchi suggest that fears of Halloween sadism rise during fearful times. For example, paranoia about tainted candy spiked in the early 1980s after a rash of Tylenol poisonings in which cyanide-laced acetaminophen was placed on store shelves and sold. The high-profile crime led to the introduction of childproof containers and tough federal laws aimed at punishing those who tamper with drugs. After the Tylenol murders, which are still unsolved, warnings about adulterated Halloween candy increased.\r\n\r\nWhile the fears may be overblown, Halloween crimes involving poison have occurred.\r\n\r\nIn 1964, for example, a New York woman named Helen Pfeil was arrested for handing out things like ant poison and dog biscuits to kids. When questioned, the housewife said that she was joking and that she gave the items to kids she felt were too old to be trick-or-treating. Though no children were poisoned during the incident, law enforcement didn’t find her actions funny.\r\n\r\nThe most infamous Halloween poisoning took place on October 31, 1974. That’s when a Texas man named Ronald O’Bryan gave cyanide-laced pixie sticks to five children, including his son. The other children never ate the candy, but his eight-year-old son, Timothy, did—and died soon after.\r\n\r\nThough nobody saw O’Bryan put the cyanide in the candy, investigators learned that O’Bryan had recently taken life insurance policies out on his children. He was convicted of murder and executed via lethal injection in 1984. Though it’s been decades since the crime, the “Candyman” murder still looms large in the memories of many parents on Halloween.', 3, 10, CAST(N'2021-06-18T14:21:48.2455074' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Posts] ([Id], [Cover], [Title], [Description], [CategoryId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (19, N'035b05c4-6a54-4877-ae10-e11d94a8f90d.jpg', N'The Swedish chef who cooks solely with fire', N'Evoking a deep a sense of nostalgia, chef Niklas Ekstedt has taken traditional Swedish food to a new level – by cooking fine cuisine over fire without gas or electricity.\r\nAt his Michelin-starred restaurant, Ekstedt, located in downtown Stockholm, chef Niklas Ekstedt brings the natural world indoors. Considered one of Sweden\''s most famous chefs, he transforms raw ingredients into fine cuisine solely through the use of fire, ash, soot and smoke – no gas or electricity allowed.\r\n\r\nTo Ekstedt, this method brings Swedish cooking back to its roots. \"Fire for me, it\''s like the history of humans. It is the way that we cooked the majority of the time,\" he said. Ekstedt conjured his childhood memories of being out in the woods with his parents – in the small town of Järpen in northern Sweden – and brought them into a modern restaurant setting to evoke a sense of nostalgia, a sentiment which he believes is shared with and appreciated by his diners.\r\n\r\nOnce part of a Scandinavian cuisine revolution back in the 1990s that focused on contemporary molecular cooking techniques, Ekstedt has become a national and international celebrity, hosting a Swedish cooking show called Niklas Mat, authoring several books (his latest being Happy Food, a deep dive into plant-focused diets) and serving as a judge on Netflix\''s Crazy Delicious alongside American chef Carla Hall and Britain\''s Heston Blumenthal.\r\n\r\nHowever, despite all his success and feeling a bit uncertain about what he wanted in a new restaurant venture, in 2011 Ekstedt decided to take a break from the limelight and live in a wooden cabin in the forest with his family, without any electricity or gas, and learn the ancestral techniques of cooking with open fire.\r\n\r\nAccording to his restaurant\''s website, Ekstedt said, \"I roamed the land around our summer cottage on Ingarö in the Stockholm archipelago, musing like some melancholic character in a black and white Ingmar Bergman film.\"\r\nAfter some deep soul-searching, he became inspired by the birch trees and the qualities that their smouldering wood lent to cooked food, which sent him on a new mission to bring wood-fired cooking techniques to the city. Once back in Stockholm, he researched ancient Swedish recipes, but discovered that they left out one practical ingredient: directions on how to actually cook the food.\r\n\r\n\"What was interesting was that the techniques were not written down,\" he said. \"The recipes were written down but the techniques they took for granted, because they just assumed people knew how to put up a fire, how to smoke, how to use the coal and the stove.', 7, 10, CAST(N'2021-06-18T14:23:19.4075325' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Posts] ([Id], [Cover], [Title], [Description], [CategoryId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (20, N'c89d4169-4233-475e-a2b4-cf5698f5e076.jpg', N'Jaggery: South Asia\''s sweet, sentimental cure-all', N'Jaggery is more than an indigenous medicinal food or a delectable dessert; it\''s the concentrated essence of millennia-old tradition.\r\nA staunch follower of the unwritten manifesto of South Asian mothers and grandmothers everywhere, my mother thinks there are few ailments she can’t treat at home with food. One ingredient in particular features regularly in her remedy arsenal. And unlike many of the peculiar poultices she applies and acrid concoctions she brews, this one is an easy pill – or lump – to swallow.\r\n\r\nThe first time I tasted jaggery, I dubiously watched the slowly liquifying lump of molten-gold cane sugar ooze into flaky crevices of a layered paratha. It had been \"prescribed\" to me by my mother in Pakistan’s Khyber Pakhtunkhwa province because I had a bone-chilling cold. Against the rugged landscape of imposing mountains fencing the Karakoram Highway, I wondered how something that looked so decadent could be considered healthy. But soon after I bit into the complex sweetness, I felt a rush of energy and warmth. As I would soon find out, this was more than an indigenous medicinal food or a delectable dessert. It was the concentrated essence of millennia-old tradition.\r\n\r\nJaggery (called gud in Pakistan) is an unrefined sugar that’s made by evaporating freshly pressed sugarcane juice (and, in some regions, Palmyrah palm, coconut-palm or date-palm sap extracted via tapping techniques) and cooling the thickened liquid in moulds. Its many monikers across South Asia and close parallels beyond, such as panela in Colombia and much of the Caribbean, kokuto in Japan and rapadura in Brazil – just to name a few – attest to its ubiquity.', 2, 9, CAST(N'2021-06-18T14:25:36.3563728' AS DateTime2), NULL, 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[Posts] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1, N'Pera', N'Peric', N'pera', N'pera@gmail.com', N'Ikftn8JpuGDfhEIIX882LPog6Vg=', CAST(N'2021-06-16T20:58:29.1705245' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (2, N'Jova', N'Jovic', N'user1', N'projectblog4asp@gmail.com', N'Ikftn8JpuGDfhEIIX882LPog6Vg=', CAST(N'2021-06-16T23:27:27.4282886' AS DateTime2), CAST(N'2021-06-18T13:46:57.9893719' AS DateTime2), 1, CAST(N'2021-06-18T13:46:57.9889840' AS DateTime2), 0)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (3, N'Proba', N'Proba', N'proba1', N'svetlana013.tomic@gmail.com', N'Ikftn8JpuGDfhEIIX882LPog6Vg=', CAST(N'2021-06-16T23:30:28.9867735' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (4, N'Anja', N'Tomic', N'admin123', N'admin@gmail.com', N'E9idV7Ekf+rXOzfHJqjhKs2q+IA=', CAST(N'2021-06-18T12:48:16.7457262' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (5, N'Test', N'Admin', N'admintest1', N'admintest@gmail.com', N'E9idV7Ekf+rXOzfHJqjhKs2q+IA=', CAST(N'2021-06-18T12:56:51.7168423' AS DateTime2), CAST(N'2021-06-18T13:47:03.1599940' AS DateTime2), 1, CAST(N'2021-06-18T13:47:03.1597585' AS DateTime2), 0)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (6, N'Fake', N'User', N'fakeuser1', N'user@gmail.com', N'Z41ljrQCWXVNc0a20uulefZ30X0=', CAST(N'2021-06-18T13:51:26.3952834' AS DateTime2), CAST(N'2021-06-18T13:55:35.4580484' AS DateTime2), 1, CAST(N'2021-06-18T13:55:35.2848213' AS DateTime2), 0)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (8, N'Fake', N'User', N'fakeuser', N'fakeuser@gmail.com', N'Z41ljrQCWXVNc0a20uulefZ30X0=', CAST(N'2021-06-18T13:56:55.5362885' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (9, N'New', N'User', N'user123', N'newuser@gmail.com', N'Z41ljrQCWXVNc0a20uulefZ30X0=', CAST(N'2021-06-18T13:58:28.9986190' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (10, N'Ana', N'Petrovic', N'ana123', N'anapetrovic@gmail.com', N'Z41ljrQCWXVNc0a20uulefZ30X0=', CAST(N'2021-06-18T13:59:08.9241682' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (11, N'Mika', N'Mikic', N'mika123', N'mikamikic@gmail.com', N'Z41ljrQCWXVNc0a20uulefZ30X0=', CAST(N'2021-06-18T13:59:34.1222717' AS DateTime2), NULL, 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[UserUseCases] ON 

INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (11, 2, 1, CAST(N'2021-06-16T23:27:27.4286807' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (12, 2, 2, CAST(N'2021-06-16T23:27:27.4286817' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (13, 2, 3, CAST(N'2021-06-16T23:27:27.4286821' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (14, 2, 4, CAST(N'2021-06-16T23:27:27.4286825' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (15, 2, 5, CAST(N'2021-06-16T23:27:27.4286829' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (16, 2, 7, CAST(N'2021-06-16T23:27:27.4286832' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (17, 2, 8, CAST(N'2021-06-16T23:27:27.4286835' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (18, 2, 9, CAST(N'2021-06-16T23:27:27.4286838' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (19, 2, 10, CAST(N'2021-06-16T23:27:27.4286842' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (20, 2, 11, CAST(N'2021-06-16T23:27:27.4286845' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (21, 2, 12, CAST(N'2021-06-16T23:27:27.4286848' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (22, 2, 13, CAST(N'2021-06-16T23:27:27.4286852' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (23, 2, 14, CAST(N'2021-06-16T23:27:27.4286855' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (24, 2, 15, CAST(N'2021-06-16T23:27:27.4286858' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (25, 2, 16, CAST(N'2021-06-16T23:27:27.4286861' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (26, 2, 17, CAST(N'2021-06-16T23:27:27.4286864' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (59, 5, 4, CAST(N'2021-06-18T12:56:51.7174011' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (60, 5, 23, CAST(N'2021-06-18T12:56:51.7174086' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (61, 5, 19, CAST(N'2021-06-18T12:56:51.7174082' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (62, 5, 26, CAST(N'2021-06-18T12:56:51.7174078' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (63, 5, 17, CAST(N'2021-06-18T12:56:51.7174074' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (64, 5, 16, CAST(N'2021-06-18T12:56:51.7174070' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (65, 5, 14, CAST(N'2021-06-18T12:56:51.7174066' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (66, 5, 13, CAST(N'2021-06-18T12:56:51.7174062' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (67, 5, 12, CAST(N'2021-06-18T12:56:51.7174058' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (68, 5, 9, CAST(N'2021-06-18T12:56:51.7174055' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (69, 5, 8, CAST(N'2021-06-18T12:56:51.7174051' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (70, 5, 7, CAST(N'2021-06-18T12:56:51.7174047' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (71, 5, 15, CAST(N'2021-06-18T12:56:51.7174043' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (72, 5, 11, CAST(N'2021-06-18T12:56:51.7174040' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (73, 5, 6, CAST(N'2021-06-18T12:56:51.7174036' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (74, 5, 5, CAST(N'2021-06-18T12:56:51.7174032' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (75, 5, 24, CAST(N'2021-06-18T12:56:51.7174090' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (76, 5, 25, CAST(N'2021-06-18T12:56:51.7174097' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (91, 6, 4, CAST(N'2021-06-18T13:51:26.3959738' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (92, 6, 23, CAST(N'2021-06-18T13:51:26.3959856' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (93, 6, 19, CAST(N'2021-06-18T13:51:26.3959851' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (94, 6, 26, CAST(N'2021-06-18T13:51:26.3959846' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (95, 6, 17, CAST(N'2021-06-18T13:51:26.3959841' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (96, 6, 16, CAST(N'2021-06-18T13:51:26.3959832' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (97, 6, 14, CAST(N'2021-06-18T13:51:26.3959827' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (98, 6, 13, CAST(N'2021-06-18T13:51:26.3959821' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (99, 6, 12, CAST(N'2021-06-18T13:51:26.3959815' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (100, 6, 9, CAST(N'2021-06-18T13:51:26.3959809' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (101, 6, 8, CAST(N'2021-06-18T13:51:26.3959801' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (102, 6, 7, CAST(N'2021-06-18T13:51:26.3959795' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (103, 6, 15, CAST(N'2021-06-18T13:51:26.3959788' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (104, 6, 11, CAST(N'2021-06-18T13:51:26.3959783' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (105, 6, 6, CAST(N'2021-06-18T13:51:26.3959778' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (106, 6, 5, CAST(N'2021-06-18T13:51:26.3959771' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (107, 6, 24, CAST(N'2021-06-18T13:51:26.3959861' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (108, 6, 25, CAST(N'2021-06-18T13:51:26.3959866' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (165, 4, 26, CAST(N'2021-06-18T20:12:08.0315939' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (166, 4, 25, CAST(N'2021-06-18T20:12:08.0315930' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (167, 4, 23, CAST(N'2021-06-18T20:12:08.0315921' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (168, 4, 22, CAST(N'2021-06-18T20:12:08.0315915' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (169, 4, 21, CAST(N'2021-06-18T20:12:08.0315909' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (170, 4, 20, CAST(N'2021-06-18T20:12:08.0315865' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (171, 4, 19, CAST(N'2021-06-18T20:12:08.0315855' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (172, 4, 18, CAST(N'2021-06-18T20:12:08.0315844' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (173, 4, 15, CAST(N'2021-06-18T20:12:08.0315832' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (174, 4, 11, CAST(N'2021-06-18T20:12:08.0315825' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (175, 4, 5, CAST(N'2021-06-18T20:12:08.0315820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (176, 4, 4, CAST(N'2021-06-18T20:12:08.0315814' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (177, 4, 3, CAST(N'2021-06-18T20:12:08.0315807' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (178, 4, 2, CAST(N'2021-06-18T20:12:08.0315779' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (179, 4, 24, CAST(N'2021-06-18T20:12:08.0315926' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (180, 4, 1, CAST(N'2021-06-18T20:12:08.0309417' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (181, 11, 17, CAST(N'2021-06-18T20:14:14.8216288' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (182, 11, 16, CAST(N'2021-06-18T20:14:14.8216240' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (183, 11, 15, CAST(N'2021-06-18T20:14:14.8216235' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (184, 11, 14, CAST(N'2021-06-18T20:14:14.8216231' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (185, 11, 13, CAST(N'2021-06-18T20:14:14.8216225' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (186, 11, 12, CAST(N'2021-06-18T20:14:14.8216197' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (187, 11, 11, CAST(N'2021-06-18T20:14:14.8216192' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (188, 11, 9, CAST(N'2021-06-18T20:14:14.8216186' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (189, 11, 8, CAST(N'2021-06-18T20:14:14.8216178' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (190, 11, 7, CAST(N'2021-06-18T20:14:14.8216172' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (191, 11, 5, CAST(N'2021-06-18T20:14:14.8216167' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (192, 11, 26, CAST(N'2021-06-18T20:14:14.8216293' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (193, 11, 4, CAST(N'2021-06-18T20:14:14.8216134' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (194, 10, 17, CAST(N'2021-06-18T20:15:11.8297139' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (195, 10, 16, CAST(N'2021-06-18T20:15:11.8297112' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (196, 10, 15, CAST(N'2021-06-18T20:15:11.8297066' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (197, 10, 14, CAST(N'2021-06-18T20:15:11.8297019' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (198, 10, 13, CAST(N'2021-06-18T20:15:11.8296902' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (199, 10, 12, CAST(N'2021-06-18T20:15:11.8296844' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (200, 10, 11, CAST(N'2021-06-18T20:15:11.8296787' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (201, 10, 9, CAST(N'2021-06-18T20:15:11.8296725' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (202, 10, 8, CAST(N'2021-06-18T20:15:11.8296666' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (203, 10, 7, CAST(N'2021-06-18T20:15:11.8296605' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (204, 10, 5, CAST(N'2021-06-18T20:15:11.8296562' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (205, 10, 26, CAST(N'2021-06-18T20:15:11.8297168' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (206, 10, 4, CAST(N'2021-06-18T20:15:11.8296492' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (207, 9, 17, CAST(N'2021-06-18T20:17:08.2201504' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (208, 9, 16, CAST(N'2021-06-18T20:17:08.2201497' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (209, 9, 15, CAST(N'2021-06-18T20:17:08.2201486' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (210, 9, 14, CAST(N'2021-06-18T20:17:08.2201482' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (211, 9, 13, CAST(N'2021-06-18T20:17:08.2201473' AS DateTime2), NULL, 0, NULL, 1)
GO
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (212, 9, 12, CAST(N'2021-06-18T20:17:08.2201466' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (213, 9, 11, CAST(N'2021-06-18T20:17:08.2201462' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (214, 9, 9, CAST(N'2021-06-18T20:17:08.2201450' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (215, 9, 8, CAST(N'2021-06-18T20:17:08.2201443' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (216, 9, 7, CAST(N'2021-06-18T20:17:08.2201438' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (217, 9, 5, CAST(N'2021-06-18T20:17:08.2201425' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (218, 9, 26, CAST(N'2021-06-18T20:17:08.2201510' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (219, 9, 4, CAST(N'2021-06-18T20:17:08.2201385' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (220, 8, 17, CAST(N'2021-06-18T20:18:06.1674656' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (221, 8, 16, CAST(N'2021-06-18T20:18:06.1674650' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (222, 8, 15, CAST(N'2021-06-18T20:18:06.1674645' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (223, 8, 14, CAST(N'2021-06-18T20:18:06.1674640' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (224, 8, 13, CAST(N'2021-06-18T20:18:06.1674635' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (225, 8, 12, CAST(N'2021-06-18T20:18:06.1674630' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (226, 8, 11, CAST(N'2021-06-18T20:18:06.1674626' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (227, 8, 9, CAST(N'2021-06-18T20:18:06.1674621' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (228, 8, 8, CAST(N'2021-06-18T20:18:06.1674616' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (229, 8, 7, CAST(N'2021-06-18T20:18:06.1674610' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (230, 8, 5, CAST(N'2021-06-18T20:18:06.1674605' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (231, 8, 26, CAST(N'2021-06-18T20:18:06.1674660' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (232, 8, 4, CAST(N'2021-06-18T20:18:06.1674572' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (233, 3, 17, CAST(N'2021-06-18T20:19:24.7957941' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (234, 3, 16, CAST(N'2021-06-18T20:19:24.7957933' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (235, 3, 15, CAST(N'2021-06-18T20:19:24.7957926' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (236, 3, 14, CAST(N'2021-06-18T20:19:24.7957917' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (237, 3, 13, CAST(N'2021-06-18T20:19:24.7957908' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (238, 3, 12, CAST(N'2021-06-18T20:19:24.7957901' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (239, 3, 11, CAST(N'2021-06-18T20:19:24.7957894' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (240, 3, 9, CAST(N'2021-06-18T20:19:24.7957886' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (241, 3, 8, CAST(N'2021-06-18T20:19:24.7957876' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (242, 3, 7, CAST(N'2021-06-18T20:19:24.7957871' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (243, 3, 5, CAST(N'2021-06-18T20:19:24.7957861' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (244, 3, 26, CAST(N'2021-06-18T20:19:24.7958789' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (245, 3, 4, CAST(N'2021-06-18T20:19:24.7957818' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (246, 1, 26, CAST(N'2021-06-18T20:20:17.3504368' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (247, 1, 17, CAST(N'2021-06-18T20:20:17.3504354' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (248, 1, 15, CAST(N'2021-06-18T20:20:17.3504344' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (249, 1, 14, CAST(N'2021-06-18T20:20:17.3504331' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (250, 1, 13, CAST(N'2021-06-18T20:20:17.3504327' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (251, 1, 12, CAST(N'2021-06-18T20:20:17.3504319' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (252, 1, 11, CAST(N'2021-06-18T20:20:17.3504314' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (253, 1, 9, CAST(N'2021-06-18T20:20:17.3504301' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (254, 1, 8, CAST(N'2021-06-18T20:20:17.3504293' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (255, 1, 7, CAST(N'2021-06-18T20:20:17.3504285' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (256, 1, 5, CAST(N'2021-06-18T20:20:17.3504276' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (257, 1, 16, CAST(N'2021-06-18T20:20:17.3504348' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (258, 1, 4, CAST(N'2021-06-18T20:20:17.3504175' AS DateTime2), NULL, 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[UserUseCases] OFF
SET IDENTITY_INSERT [dbo].[Votes] ON 

INSERT [dbo].[Votes] ([Id], [Mark], [CommentId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1, 3, 2, 3, CAST(N'2021-06-17T20:07:19.3185522' AS DateTime2), NULL, 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[Votes] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Categories_Name]    Script Date: 6/18/2021 10:22:38 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Categories_Name] ON [dbo].[Categories]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_UserId]    Script Date: 6/18/2021 10:22:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_UserId] ON [dbo].[Comments]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PostComments_CommentId]    Script Date: 6/18/2021 10:22:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_PostComments_CommentId] ON [dbo].[PostComments]
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Posts_CategoryId]    Script Date: 6/18/2021 10:22:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_Posts_CategoryId] ON [dbo].[Posts]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Posts_UserId]    Script Date: 6/18/2021 10:22:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_Posts_UserId] ON [dbo].[Posts]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Email]    Script Date: 6/18/2021 10:22:38 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Email] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Username]    Script Date: 6/18/2021 10:22:38 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Username] ON [dbo].[Users]
(
	[Username] ASC
)
WHERE ([Username] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserUseCases_UserId]    Script Date: 6/18/2021 10:22:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserUseCases_UserId] ON [dbo].[UserUseCases]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Votes_CommentId]    Script Date: 6/18/2021 10:22:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_Votes_CommentId] ON [dbo].[Votes]
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Votes_UserId]    Script Date: 6/18/2021 10:22:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_Votes_UserId] ON [dbo].[Votes]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT ((0)) FOR [UserId]
GO
ALTER TABLE [dbo].[Posts] ADD  DEFAULT ((0)) FOR [CategoryId]
GO
ALTER TABLE [dbo].[Posts] ADD  DEFAULT ((0)) FOR [UserId]
GO
ALTER TABLE [dbo].[Votes] ADD  DEFAULT ((0)) FOR [CommentId]
GO
ALTER TABLE [dbo].[Votes] ADD  DEFAULT ((0)) FOR [UserId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users_UserId]
GO
ALTER TABLE [dbo].[PostComments]  WITH CHECK ADD  CONSTRAINT [FK_PostComments_Comments_CommentId] FOREIGN KEY([CommentId])
REFERENCES [dbo].[Comments] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PostComments] CHECK CONSTRAINT [FK_PostComments_Comments_CommentId]
GO
ALTER TABLE [dbo].[PostComments]  WITH CHECK ADD  CONSTRAINT [FK_PostComments_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PostComments] CHECK CONSTRAINT [FK_PostComments_Posts_PostId]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Users_UserId]
GO
ALTER TABLE [dbo].[UserUseCases]  WITH CHECK ADD  CONSTRAINT [FK_UserUseCases_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserUseCases] CHECK CONSTRAINT [FK_UserUseCases_Users_UserId]
GO
ALTER TABLE [dbo].[Votes]  WITH CHECK ADD  CONSTRAINT [FK_Votes_Comments_CommentId] FOREIGN KEY([CommentId])
REFERENCES [dbo].[Comments] ([Id])
GO
ALTER TABLE [dbo].[Votes] CHECK CONSTRAINT [FK_Votes_Comments_CommentId]
GO
ALTER TABLE [dbo].[Votes]  WITH CHECK ADD  CONSTRAINT [FK_Votes_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Votes] CHECK CONSTRAINT [FK_Votes_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [blog] SET  READ_WRITE 
GO
