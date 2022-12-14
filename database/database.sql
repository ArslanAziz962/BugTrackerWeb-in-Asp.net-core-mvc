USE [master]
GO
/****** Object:  Database [BugTracker]    Script Date: 04/08/2022 3:27:10 pm ******/
CREATE DATABASE [BugTracker]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BugTracker', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BugTracker.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BugTracker_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BugTracker_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BugTracker] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BugTracker].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BugTracker] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BugTracker] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BugTracker] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BugTracker] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BugTracker] SET ARITHABORT OFF 
GO
ALTER DATABASE [BugTracker] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BugTracker] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BugTracker] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BugTracker] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BugTracker] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BugTracker] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BugTracker] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BugTracker] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BugTracker] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BugTracker] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BugTracker] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BugTracker] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BugTracker] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BugTracker] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BugTracker] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BugTracker] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BugTracker] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BugTracker] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BugTracker] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BugTracker] SET  MULTI_USER 
GO
ALTER DATABASE [BugTracker] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BugTracker] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BugTracker] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BugTracker] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [BugTracker]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 04/08/2022 3:27:10 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[comment] [varchar](300) NOT NULL,
	[TicketId] [varchar](30) NOT NULL,
	[UserId] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Comment__3214EC07AEC5BEC1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project]    Script Date: 04/08/2022 3:27:10 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProjectAssignment]    Script Date: 04/08/2022 3:27:10 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProjectAssignment](
	[ProjectId] [int] NOT NULL,
	[UserId] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 04/08/2022 3:27:10 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ticket](
	[Id] [varchar](30) NOT NULL,
	[title] [varchar](100) NOT NULL,
	[description] [varchar](200) NOT NULL,
	[priority] [varchar](50) NOT NULL,
	[type] [varchar](50) NOT NULL,
	[status] [varchar](50) NOT NULL,
	[ImagePath] [varchar](60) NULL,
	[projectId] [int] NOT NULL,
	[submitter] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Ticket__3214EC07F0EED4CC] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 04/08/2022 3:27:10 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[email] [varchar](50) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[role] [varchar](15) NOT NULL,
 CONSTRAINT [PK__Users__AB6E6165AFF9AB6E] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([Id], [comment], [TicketId], [UserId]) VALUES (2, N'delete comment  feature is under consideration also', N'30072022010936pm', N'pManager@gmail.com')
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[Project] ON 

INSERT [dbo].[Project] ([Id], [title]) VALUES (1, N'BugTracker/IssueTracker')
INSERT [dbo].[Project] ([Id], [title]) VALUES (2, N'Demo')
SET IDENTITY_INSERT [dbo].[Project] OFF
INSERT [dbo].[ProjectAssignment] ([ProjectId], [UserId]) VALUES (1, N'pManager@gmail.com')
INSERT [dbo].[ProjectAssignment] ([ProjectId], [UserId]) VALUES (1, N'ali123@gmail.com')
INSERT [dbo].[ProjectAssignment] ([ProjectId], [UserId]) VALUES (1, N'developer@gmail.com')
INSERT [dbo].[Ticket] ([Id], [title], [description], [priority], [type], [status], [ImagePath], [projectId], [submitter]) VALUES (N'30072022010936pm', N'comment feature', N'add feature of posting comments in tickets', N'High', N'Feature Request', N'New', N'', 1, N'user@gmail.com')
INSERT [dbo].[Users] ([email], [password], [name], [role]) VALUES (N'ali123@gmail.com', N'ali123', N'Ali', N'Admin')
INSERT [dbo].[Users] ([email], [password], [name], [role]) VALUES (N'developer@gmail.com', N'developer', N'Developer', N'Developer')
INSERT [dbo].[Users] ([email], [password], [name], [role]) VALUES (N'pManager@gmail.com', N'pManager', N'Project Manager', N'ProjectManager')
INSERT [dbo].[Users] ([email], [password], [name], [role]) VALUES (N'user@gmail.com', N'user', N'User', N'User')
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK__Comment__TicketI__1CF15040] FOREIGN KEY([TicketId])
REFERENCES [dbo].[Ticket] ([Id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK__Comment__TicketI__1CF15040]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK__Comment__UserId__1DE57479] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([email])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK__Comment__UserId__1DE57479]
GO
ALTER TABLE [dbo].[ProjectAssignment]  WITH CHECK ADD FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[ProjectAssignment]  WITH CHECK ADD  CONSTRAINT [FK__ProjectAs__UserI__1A14E395] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([email])
GO
ALTER TABLE [dbo].[ProjectAssignment] CHECK CONSTRAINT [FK__ProjectAs__UserI__1A14E395]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK__Ticket__projectI__164452B1] FOREIGN KEY([projectId])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK__Ticket__projectI__164452B1]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK__Ticket__submitte__173876EA] FOREIGN KEY([submitter])
REFERENCES [dbo].[Users] ([email])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK__Ticket__submitte__173876EA]
GO
USE [master]
GO
ALTER DATABASE [BugTracker] SET  READ_WRITE 
GO
