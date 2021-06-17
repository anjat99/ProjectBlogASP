USE [master]
GO
/****** Object:  Database [blog]    Script Date: 6/17/2021 8:30:40 PM ******/
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/17/2021 8:30:41 PM ******/
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
/****** Object:  Table [dbo].[AuditLogs]    Script Date: 6/17/2021 8:30:41 PM ******/
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
/****** Object:  Table [dbo].[Categories]    Script Date: 6/17/2021 8:30:41 PM ******/
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
/****** Object:  Table [dbo].[Comments]    Script Date: 6/17/2021 8:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[UserId] [int] NULL,
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
/****** Object:  Table [dbo].[PostComments]    Script Date: 6/17/2021 8:30:41 PM ******/
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
/****** Object:  Table [dbo].[Posts]    Script Date: 6/17/2021 8:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Cover] [nvarchar](255) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[IsPublished] [bit] NOT NULL,
	[PublishedAt] [datetime2](7) NULL,
	[CategoryId] [int] NULL,
	[UserId] [int] NULL,
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
/****** Object:  Table [dbo].[Users]    Script Date: 6/17/2021 8:30:41 PM ******/
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
/****** Object:  Table [dbo].[UserUseCases]    Script Date: 6/17/2021 8:30:41 PM ******/
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
/****** Object:  Table [dbo].[Votes]    Script Date: 6/17/2021 8:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Votes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Mark] [int] NULL,
	[CommentId] [int] NULL,
	[UserId] [int] NULL,
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
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([Id], [Cover], [Title], [Description], [IsPublished], [PublishedAt], [CategoryId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (8, N'f8325a79-6236-4916-9202-60ec077acd14.png', N'"Title"', N'"This is something like description"', 0, NULL, 2, 1, CAST(N'2021-06-16T21:18:44.4441430' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Posts] ([Id], [Cover], [Title], [Description], [IsPublished], [PublishedAt], [CategoryId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (9, N'a7ff4042-a628-4e56-b517-8755a77e259f.png', N'"Title1"', N'"That is something like description 1"', 0, NULL, 2, 3, CAST(N'2021-06-16T23:33:27.1628813' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Posts] ([Id], [Cover], [Title], [Description], [IsPublished], [PublishedAt], [CategoryId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (10, N'2d587302-2b8d-4974-8254-6d7578b441db.jpg', N'"Title 2"', N'"Why is something like that description 2"', 0, NULL, 1, 3, CAST(N'2021-06-16T23:35:33.7800177' AS DateTime2), NULL, 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[Posts] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1, N'Pera', N'Peric', N'pera', N'pera@gmail.com', N'Ikftn8JpuGDfhEIIX882LPog6Vg=', CAST(N'2021-06-16T20:58:29.1705245' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (2, N'Jova', N'Jovic', N'user1', N'projectblog4asp@gmail.com', N'Ikftn8JpuGDfhEIIX882LPog6Vg=', CAST(N'2021-06-16T23:27:27.4282886' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (3, N'Proba', N'Proba', N'proba1', N'svetlana013.tomic@gmail.com', N'Ikftn8JpuGDfhEIIX882LPog6Vg=', CAST(N'2021-06-16T23:30:28.9867735' AS DateTime2), NULL, 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[UserUseCases] ON 

INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1, 1, 1, CAST(N'2021-06-16T20:58:29.1712199' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (2, 1, 2, CAST(N'2021-06-16T20:58:29.1712226' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (3, 1, 3, CAST(N'2021-06-16T20:58:29.1712232' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (4, 1, 4, CAST(N'2021-06-16T20:58:29.1712246' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (5, 1, 5, CAST(N'2021-06-16T20:58:29.1712251' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (6, 1, 7, CAST(N'2021-06-16T20:58:29.1712264' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (7, 1, 8, CAST(N'2021-06-16T20:58:29.1712271' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (8, 1, 9, CAST(N'2021-06-16T20:58:29.1712280' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (9, 1, 10, CAST(N'2021-06-16T20:58:29.1712290' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (10, 1, 11, CAST(N'2021-06-16T20:58:29.1712296' AS DateTime2), NULL, 0, NULL, 1)
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
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (27, 3, 1, CAST(N'2021-06-16T23:30:28.9871695' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (28, 3, 2, CAST(N'2021-06-16T23:30:28.9871706' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (29, 3, 3, CAST(N'2021-06-16T23:30:28.9871709' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (30, 3, 4, CAST(N'2021-06-16T23:30:28.9871713' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (31, 3, 5, CAST(N'2021-06-16T23:30:28.9871716' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (32, 3, 7, CAST(N'2021-06-16T23:30:28.9871719' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (33, 3, 8, CAST(N'2021-06-16T23:30:28.9871722' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (34, 3, 9, CAST(N'2021-06-16T23:30:28.9871726' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (35, 3, 10, CAST(N'2021-06-16T23:30:28.9871729' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (36, 3, 11, CAST(N'2021-06-16T23:30:28.9871732' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (37, 3, 12, CAST(N'2021-06-16T23:30:28.9871736' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (38, 3, 13, CAST(N'2021-06-16T23:30:28.9871739' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (39, 3, 14, CAST(N'2021-06-16T23:30:28.9871743' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (40, 3, 15, CAST(N'2021-06-16T23:30:28.9871746' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (41, 3, 16, CAST(N'2021-06-16T23:30:28.9871749' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (42, 3, 17, CAST(N'2021-06-16T23:30:28.9871752' AS DateTime2), NULL, 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[UserUseCases] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Categories_Name]    Script Date: 6/17/2021 8:30:42 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Categories_Name] ON [dbo].[Categories]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_UserId]    Script Date: 6/17/2021 8:30:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_UserId] ON [dbo].[Comments]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PostComments_CommentId]    Script Date: 6/17/2021 8:30:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_PostComments_CommentId] ON [dbo].[PostComments]
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Posts_CategoryId]    Script Date: 6/17/2021 8:30:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_Posts_CategoryId] ON [dbo].[Posts]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Posts_UserId]    Script Date: 6/17/2021 8:30:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_Posts_UserId] ON [dbo].[Posts]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Email]    Script Date: 6/17/2021 8:30:42 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Email] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Username]    Script Date: 6/17/2021 8:30:42 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Username] ON [dbo].[Users]
(
	[Username] ASC
)
WHERE ([Username] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserUseCases_UserId]    Script Date: 6/17/2021 8:30:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserUseCases_UserId] ON [dbo].[UserUseCases]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Votes_CommentId]    Script Date: 6/17/2021 8:30:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_Votes_CommentId] ON [dbo].[Votes]
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Votes_UserId]    Script Date: 6/17/2021 8:30:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_Votes_UserId] ON [dbo].[Votes]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Posts] ADD  CONSTRAINT [DF__Posts__IsPublish__4222D4EF]  DEFAULT (CONVERT([bit],(0))) FOR [IsPublished]
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
