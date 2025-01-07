USE [DSC]
GO
/****** Object:  Table [dbo].[Activities]    Script Date: 1/7/2025 4:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activities](
	[ActivityID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[LevelID] [int] NULL,
	[ActivityName] [nvarchar](255) NULL,
	[StartDate] [datetime] NULL,
	[Location] [nvarchar](255) NULL,
	[NumberOfTeams] [int] NULL,
	[Expense] [decimal](10, 2) NULL,
	[Description] [nvarchar](max) NULL,
	[Avatar] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActivitiesClub]    Script Date: 1/7/2025 4:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivitiesClub](
	[ActivityClubID] [int] IDENTITY(1,1) NOT NULL,
	[ClubID] [int] NULL,
	[LevelID] [int] NULL,
	[ActivityName] [nvarchar](255) NULL,
	[StartDate] [datetime] NULL,
	[Location] [nvarchar](255) NULL,
	[NumberOfTeams] [int] NULL,
	[Expense] [decimal](10, 2) NULL,
	[Description] [nvarchar](max) NULL,
	[Avatar] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ActivityClubID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 1/7/2025 4:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Fund] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Club]    Script Date: 1/7/2025 4:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Club](
	[ClubID] [int] IDENTITY(1,1) NOT NULL,
	[SportID] [int] NULL,
	[LevelID] [int] NULL,
	[ClubName] [nvarchar](255) NULL,
	[Status] [nvarchar](50) NULL,
	[Rules] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[Fund] [decimal](18, 0) NULL,
	[Avatar] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClubID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 1/7/2025 4:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ActivityID] [int] NULL,
	[TournamentID] [int] NULL,
	[Comment] [nvarchar](max) NULL,
	[Star] [int] NULL,
	[Level] [int] NULL,
	[Image] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fee]    Script Date: 1/7/2025 4:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fee](
	[FeeID] [int] IDENTITY(1,1) NOT NULL,
	[TournamentID] [int] NULL,
	[RequestFee] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[FeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Level]    Script Date: 1/7/2025 4:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Level](
	[LevelID] [int] IDENTITY(1,1) NOT NULL,
	[LevelName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[LevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Match]    Script Date: 1/7/2025 4:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Match](
	[MatchID] [int] IDENTITY(1,1) NOT NULL,
	[RoundID] [int] NULL,
	[Team1ID] [int] NULL,
	[Team2ID] [int] NULL,
	[MatchNumber] [int] NULL,
	[TournamentId] [int] NULL,
	[Location] [nvarchar](255) NULL,
	[Time] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MatchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 1/7/2025 4:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[NotificationID] [int] IDENTITY(1,1) NOT NULL,
	[ActivityID] [int] NULL,
	[TournamentID] [int] NULL,
	[Content] [nvarchar](max) NULL,
	[UserID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 1/7/2025 4:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ClubID] [int] NULL,
	[TournamentID] [int] NULL,
	[Price] [decimal](18, 0) NULL,
	[PaymentDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[requestJoinActivity]    Script Date: 1/7/2025 4:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[requestJoinActivity](
	[requestJoinActivityID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ActivitiesID] [int] NOT NULL,
	[Status] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[requestJoinActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestJoinClub]    Script Date: 1/7/2025 4:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestJoinClub](
	[RequestClubId] [int] IDENTITY(1,1) NOT NULL,
	[User_id] [int] NOT NULL,
	[Club_id] [int] NOT NULL,
	[Status] [varchar](50) NULL,
	[Createdate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RequestClubId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Result]    Script Date: 1/7/2025 4:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[ResultID] [int] IDENTITY(1,1) NOT NULL,
	[MatchID] [int] NULL,
	[ScoreTeam1] [int] NULL,
	[ScoreTeam2] [int] NULL,
	[PenaltyTeam1] [int] NULL,
	[PenaltyTeam2] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ResultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResultOfActivities]    Script Date: 1/7/2025 4:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResultOfActivities](
	[ResultID] [int] IDENTITY(1,1) NOT NULL,
	[ActivityID] [int] NULL,
	[Team1Score] [int] NULL,
	[Team2Score] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ResultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResultOfActivitiesClub]    Script Date: 1/7/2025 4:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResultOfActivitiesClub](
	[ResultID] [int] IDENTITY(1,1) NOT NULL,
	[ActivityClubID] [int] NULL,
	[Team1Score] [int] NULL,
	[Team2Score] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ResultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 1/7/2025 4:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Round]    Script Date: 1/7/2025 4:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Round](
	[RoundID] [int] IDENTITY(1,1) NOT NULL,
	[TournamentID] [int] NULL,
	[RoundNumber] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoundID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sport]    Script Date: 1/7/2025 4:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sport](
	[SportID] [int] IDENTITY(1,1) NOT NULL,
	[SportName] [nvarchar](100) NULL,
	[Avatar] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[SportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 1/7/2025 4:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[TeamID] [int] IDENTITY(1,1) NOT NULL,
	[TournamentID] [int] NULL,
	[TeamName] [nvarchar](255) NULL,
	[UserId] [int] NULL,
	[Avatar] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[TeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeamTournament]    Script Date: 1/7/2025 4:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamTournament](
	[TeamTournamentID] [int] IDENTITY(1,1) NOT NULL,
	[TeamID] [int] NULL,
	[NamePlayer] [nvarchar](100) NOT NULL,
	[NumberPlayer] [int] NOT NULL,
 CONSTRAINT [PK_TeamTournament] PRIMARY KEY CLUSTERED 
(
	[TeamTournamentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tournaments]    Script Date: 1/7/2025 4:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tournaments](
	[TournamentID] [int] IDENTITY(1,1) NOT NULL,
	[LevelID] [int] NULL,
	[Name] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Location] [nvarchar](255) NULL,
	[NumberOfTeams] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UserID] [int] NULL,
	[Avatar] [nvarchar](255) NULL,
	[MemberOfTeams] [int] NULL,
	[LimitRegister] [datetime] NULL,
	[TournamentType] [nvarchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[TournamentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransferHistory]    Script Date: 1/7/2025 4:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransferHistory](
	[TransferID] [int] IDENTITY(1,1) NOT NULL,
	[SenderClubID] [int] NULL,
	[ReceiverClubID] [int] NULL,
	[SenderAdminID] [int] NULL,
	[ReceiverAdminID] [int] NULL,
	[TransferAmount] [decimal](18, 0) NULL,
	[TransferDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[TransferID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 1/7/2025 4:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NULL,
	[UserTeamID] [int] NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[FullName] [nvarchar](255) NULL,
	[Phone] [nvarchar](20) NULL,
	[Address] [nvarchar](255) NULL,
	[Gender] [nvarchar](10) NULL,
	[Age] [int] NULL,
	[Height] [decimal](5, 2) NULL,
	[Weight] [decimal](5, 2) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserActivities]    Script Date: 1/7/2025 4:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserActivities](
	[UserActivityID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ActivityID] [int] NULL,
	[JoinDate] [datetime] NULL,
	[RoleInActivity] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserActivityClub]    Script Date: 1/7/2025 4:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserActivityClub](
	[UserActivityClubID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ActivityID] [int] NOT NULL,
	[ClubID] [int] NOT NULL,
	[JoinDate] [datetime] NULL,
	[Role] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserActivityClubID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserClub]    Script Date: 1/7/2025 4:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserClub](
	[UserClubID] [int] IDENTITY(1,1) NOT NULL,
	[ClubID] [int] NULL,
	[UserID] [int] NULL,
	[Role] [nvarchar](50) NULL,
	[JoinDate] [datetime] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserClubID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserSport]    Script Date: 1/7/2025 4:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSport](
	[UserSportID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[SportID] [int] NULL,
	[LevelID] [int] NULL,
	[Achievement] [nvarchar](max) NULL,
	[Position] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserSportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTeam]    Script Date: 1/7/2025 4:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTeam](
	[UserTeamID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[TeamID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserTeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Activities] ON 

INSERT [dbo].[Activities] ([ActivityID], [UserID], [LevelID], [ActivityName], [StartDate], [Location], [NumberOfTeams], [Expense], [Description], [Avatar]) VALUES (1, 1, 2, N'Kèo đá bóng', CAST(N'2024-10-12T18:00:00.000' AS DateTime), N'Stadium A', 2, CAST(50000.00 AS Decimal(10, 2)), N'Friendly match', NULL)
INSERT [dbo].[Activities] ([ActivityID], [UserID], [LevelID], [ActivityName], [StartDate], [Location], [NumberOfTeams], [Expense], [Description], [Avatar]) VALUES (2, 2, 3, N'Kèo cầu lông', CAST(N'2024-11-11T17:00:00.000' AS DateTime), N'Gym B', 2, CAST(40000.00 AS Decimal(10, 2)), N'Local tournament', NULL)
INSERT [dbo].[Activities] ([ActivityID], [UserID], [LevelID], [ActivityName], [StartDate], [Location], [NumberOfTeams], [Expense], [Description], [Avatar]) VALUES (3, 2, 2, N'Kèo bóng bàn', CAST(N'2024-11-11T16:00:00.000' AS DateTime), N'Stadium C', 4, CAST(4000000.00 AS Decimal(10, 2)), N'Local tournament', NULL)
INSERT [dbo].[Activities] ([ActivityID], [UserID], [LevelID], [ActivityName], [StartDate], [Location], [NumberOfTeams], [Expense], [Description], [Avatar]) VALUES (4, 2, 3, N'Kèo Bóng Rổ', CAST(N'2024-11-02T18:00:00.000' AS DateTime), N'Khu C', 5, CAST(400000.00 AS Decimal(10, 2)), N'hoge', NULL)
INSERT [dbo].[Activities] ([ActivityID], [UserID], [LevelID], [ActivityName], [StartDate], [Location], [NumberOfTeams], [Expense], [Description], [Avatar]) VALUES (13, 1, 1, N'Kèo Bóng Đá Vui Vẻ', CAST(N'2024-11-06T22:38:00.000' AS DateTime), N'statiumn', 10, CAST(10000.00 AS Decimal(10, 2)), N'100000', NULL)
INSERT [dbo].[Activities] ([ActivityID], [UserID], [LevelID], [ActivityName], [StartDate], [Location], [NumberOfTeams], [Expense], [Description], [Avatar]) VALUES (14, 1, 1, N'Bóng Đá Giao Hữu', CAST(N'2024-11-15T22:52:00.000' AS DateTime), N'Stadium FPT', 8, CAST(0.00 AS Decimal(10, 2)), N'Bóng đá giao hữu không tốn tiền', NULL)
INSERT [dbo].[Activities] ([ActivityID], [UserID], [LevelID], [ActivityName], [StartDate], [Location], [NumberOfTeams], [Expense], [Description], [Avatar]) VALUES (15, 1, 1, N'Tập Bóng Chuyền Nè', CAST(N'2024-11-30T22:54:00.000' AS DateTime), N'FPT', 13, CAST(0.00 AS Decimal(10, 2)), N'Tập Bóng Chuyền Ngày 7/11', NULL)
INSERT [dbo].[Activities] ([ActivityID], [UserID], [LevelID], [ActivityName], [StartDate], [Location], [NumberOfTeams], [Expense], [Description], [Avatar]) VALUES (16, 1, 2, N'Đấu giải bóng rổ', CAST(N'2024-12-06T22:56:00.000' AS DateTime), N'FPT', 17, CAST(50000.00 AS Decimal(10, 2)), N'Thi đấu bóng rổ giữa các câu lạc bộ', NULL)
INSERT [dbo].[Activities] ([ActivityID], [UserID], [LevelID], [ActivityName], [StartDate], [Location], [NumberOfTeams], [Expense], [Description], [Avatar]) VALUES (17, 1009, 1, N'Tập Bóng Chuyền 1', CAST(N'2024-11-14T22:14:00.000' AS DateTime), N'FPT', 1, CAST(0.00 AS Decimal(10, 2)), N'aaaa', NULL)
INSERT [dbo].[Activities] ([ActivityID], [UserID], [LevelID], [ActivityName], [StartDate], [Location], [NumberOfTeams], [Expense], [Description], [Avatar]) VALUES (18, 1009, 1, N'Tập Bóng Chuyền 1', CAST(N'2024-12-08T20:20:00.000' AS DateTime), N'FPT', 5, CAST(50000.00 AS Decimal(10, 2)), N'q', NULL)
INSERT [dbo].[Activities] ([ActivityID], [UserID], [LevelID], [ActivityName], [StartDate], [Location], [NumberOfTeams], [Expense], [Description], [Avatar]) VALUES (19, 1011, 1, N'buổi tập ', CAST(N'2024-12-13T20:53:00.000' AS DateTime), N'Đà Nẵng', 2, CAST(0.00 AS Decimal(10, 2)), N'buổi tập ', NULL)
INSERT [dbo].[Activities] ([ActivityID], [UserID], [LevelID], [ActivityName], [StartDate], [Location], [NumberOfTeams], [Expense], [Description], [Avatar]) VALUES (20, 1011, 1, N'kèo bóng rổ', CAST(N'2024-12-12T21:18:00.000' AS DateTime), N'Đà Nẵng', 2, CAST(0.00 AS Decimal(10, 2)), N'kèo bóng rổ', NULL)
INSERT [dbo].[Activities] ([ActivityID], [UserID], [LevelID], [ActivityName], [StartDate], [Location], [NumberOfTeams], [Expense], [Description], [Avatar]) VALUES (21, 1015, 1, N'kèo bóng đá', CAST(N'2024-12-27T23:14:00.000' AS DateTime), N'Đà Nẵng', 2, CAST(0.00 AS Decimal(10, 2)), N'dg', N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1734711304/qeucrkpwrupnxsxnl81a.jpg')
INSERT [dbo].[Activities] ([ActivityID], [UserID], [LevelID], [ActivityName], [StartDate], [Location], [NumberOfTeams], [Expense], [Description], [Avatar]) VALUES (22, 1016, 1, N'kèo bóng chuyền', CAST(N'2024-12-02T17:01:00.000' AS DateTime), N'Đà Nẵng', 2, CAST(0.00 AS Decimal(10, 2)), N'kèo bóng chuyền', N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1734948081/kxxtdayudhbcuteokbn5.jpg')
INSERT [dbo].[Activities] ([ActivityID], [UserID], [LevelID], [ActivityName], [StartDate], [Location], [NumberOfTeams], [Expense], [Description], [Avatar]) VALUES (1021, 1012, 1, N'giao lưu ngày 21/11', CAST(N'2025-01-02T21:14:00.000' AS DateTime), N'Đà Nẵng', 4, CAST(0.00 AS Decimal(10, 2)), N'ưf', N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1735568056/nzsssnmcptmk6jth4ynx.jpg')
INSERT [dbo].[Activities] ([ActivityID], [UserID], [LevelID], [ActivityName], [StartDate], [Location], [NumberOfTeams], [Expense], [Description], [Avatar]) VALUES (1022, 1012, 1, N'giao lưu ngày 21/11', CAST(N'2025-01-02T21:14:00.000' AS DateTime), N'Đà Nẵng', 4, CAST(0.00 AS Decimal(10, 2)), N'ưf', N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1735568059/k30jbwc5ykvpkmve0cew.jpg')
INSERT [dbo].[Activities] ([ActivityID], [UserID], [LevelID], [ActivityName], [StartDate], [Location], [NumberOfTeams], [Expense], [Description], [Avatar]) VALUES (1023, 1011, 1, N'giao lưu ngày 16.1', CAST(N'2025-01-16T08:58:00.000' AS DateTime), N'Đà Nẵng', 4, CAST(0.00 AS Decimal(10, 2)), N'giao lưu ngày 16.1', N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1736128716/qy4u7sdtbgpwj5pfjmub.jpg')
INSERT [dbo].[Activities] ([ActivityID], [UserID], [LevelID], [ActivityName], [StartDate], [Location], [NumberOfTeams], [Expense], [Description], [Avatar]) VALUES (1024, 1012, 1, N'giao lưu ngày 10.1', CAST(N'2025-01-10T09:01:00.000' AS DateTime), N'Đà Nẵng', 4, CAST(55555.00 AS Decimal(10, 2)), N'giao lưu ngày 10.1', N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1736129884/q8ocnmjc9wfvx7np4bgd.jpg')
SET IDENTITY_INSERT [dbo].[Activities] OFF
GO
SET IDENTITY_INSERT [dbo].[ActivitiesClub] ON 

INSERT [dbo].[ActivitiesClub] ([ActivityClubID], [ClubID], [LevelID], [ActivityName], [StartDate], [Location], [NumberOfTeams], [Expense], [Description], [Avatar]) VALUES (1, 7, 2, N'Kèo Club Đat', CAST(N'2024-12-08T14:29:50.000' AS DateTime), N'FPT', 7, CAST(200000.00 AS Decimal(10, 2)), N'AAAAAA', NULL)
INSERT [dbo].[ActivitiesClub] ([ActivityClubID], [ClubID], [LevelID], [ActivityName], [StartDate], [Location], [NumberOfTeams], [Expense], [Description], [Avatar]) VALUES (2, 7, 1, N'Kèo Club Đat 1', CAST(N'2024-12-21T20:22:00.000' AS DateTime), N'FPT', 2, CAST(0.00 AS Decimal(10, 2)), N'aa', NULL)
INSERT [dbo].[ActivitiesClub] ([ActivityClubID], [ClubID], [LevelID], [ActivityName], [StartDate], [Location], [NumberOfTeams], [Expense], [Description], [Avatar]) VALUES (3, 7, 1, N'Tập Bóng Chuyền đạt', CAST(N'2024-12-28T20:25:00.000' AS DateTime), N'FPT', 1, CAST(2222.00 AS Decimal(10, 2)), N'2', NULL)
INSERT [dbo].[ActivitiesClub] ([ActivityClubID], [ClubID], [LevelID], [ActivityName], [StartDate], [Location], [NumberOfTeams], [Expense], [Description], [Avatar]) VALUES (4, 1, 1, N'Kèo Club Hưng', CAST(N'2024-12-22T20:39:00.000' AS DateTime), N'FPT', 6, CAST(0.00 AS Decimal(10, 2)), N'1111', NULL)
INSERT [dbo].[ActivitiesClub] ([ActivityClubID], [ClubID], [LevelID], [ActivityName], [StartDate], [Location], [NumberOfTeams], [Expense], [Description], [Avatar]) VALUES (5, 8, 1, N'kèo bóng đá', CAST(N'2024-12-19T21:21:00.000' AS DateTime), N'Đà Nẵng', 2, CAST(0.00 AS Decimal(10, 2)), N'kèo bóng đá', NULL)
INSERT [dbo].[ActivitiesClub] ([ActivityClubID], [ClubID], [LevelID], [ActivityName], [StartDate], [Location], [NumberOfTeams], [Expense], [Description], [Avatar]) VALUES (6, 10, 1, N'giao lưu ngày 11.1', CAST(N'2025-01-11T09:21:00.000' AS DateTime), N'Đà Nẵng', 4, CAST(0.00 AS Decimal(10, 2)), N'giao lưu ngày 11.1', N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1736130076/sfbzitspwspwrfwqw49w.jpg')
INSERT [dbo].[ActivitiesClub] ([ActivityClubID], [ClubID], [LevelID], [ActivityName], [StartDate], [Location], [NumberOfTeams], [Expense], [Description], [Avatar]) VALUES (7, 9, 1, N'giao lưu ngày 23/1', CAST(N'2025-01-23T16:19:00.000' AS DateTime), N'Đà Nẵng', 4, CAST(0.00 AS Decimal(10, 2)), N'giao lưu ngày 23/1', N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1736241588/po0m7sxpqumhhm6ydqfl.jpg')
SET IDENTITY_INSERT [dbo].[ActivitiesClub] OFF
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([AdminID], [RoleID], [Email], [Password], [Fund]) VALUES (1, 1, N'admin@gmail.com', N'admin123', CAST(900000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Club] ON 

INSERT [dbo].[Club] ([ClubID], [SportID], [LevelID], [ClubName], [Status], [Rules], [CreateDate], [Fund], [Avatar]) VALUES (1, 1, 3, N'CLB Bóng đá Ngũ Hành Sơn', N'Active', N'Sân chơi pickleball có kích thước 6m x 13,5m gần giống với sân đôi cầu lông.Vợt pickleball được làm từ các loại vật liệu tổng hợp và polymer.', CAST(N'2024-01-15T00:00:00.000' AS DateTime), CAST(50000 AS Decimal(18, 0)), N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1717604807/zrjsyzwnqnwdwqgpmowd.jpg')
INSERT [dbo].[Club] ([ClubID], [SportID], [LevelID], [ClubName], [Status], [Rules], [CreateDate], [Fund], [Avatar]) VALUES (2, 2, 2, N'CLB Cầu lông ĐN', N'Active', NULL, CAST(N'2024-04-03T00:00:00.000' AS DateTime), CAST(50000 AS Decimal(18, 0)), N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1717601890/samples/imagecon-group.jpg')
INSERT [dbo].[Club] ([ClubID], [SportID], [LevelID], [ClubName], [Status], [Rules], [CreateDate], [Fund], [Avatar]) VALUES (3, 3, 1, N'CLB Bóng rổ', N'Active', N'Sân chơi pickleball có kích thước 6m x 13,5m gần giống với sân đôi cầu lông.Vợt pickleball được làm từ các loại vật liệu tổng hợp và polymer.', CAST(N'2024-08-15T00:00:00.000' AS DateTime), CAST(50000 AS Decimal(18, 0)), N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1717601886/samples/animals/three-dogs.jpg')
INSERT [dbo].[Club] ([ClubID], [SportID], [LevelID], [ClubName], [Status], [Rules], [CreateDate], [Fund], [Avatar]) VALUES (4, 1, 2, N'Clb Khánh Hưng', N'1', N'<p>aaaaaaaaaaaaaa</p>', CAST(N'2024-12-06T00:06:43.397' AS DateTime), NULL, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1733418406/v8kijyuzdicpdqe1tvfj.jpg')
INSERT [dbo].[Club] ([ClubID], [SportID], [LevelID], [ClubName], [Status], [Rules], [CreateDate], [Fund], [Avatar]) VALUES (5, 2, 1, N'Clb Đạt Nguyễn', N'1', N'<p><strong>Đây là clb của đạt<span class="ql-cursor">﻿</span></strong></p>', CAST(N'2024-12-06T00:09:44.063' AS DateTime), NULL, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1733418586/wymt07gsnozobkeyuqdf.jpg')
INSERT [dbo].[Club] ([ClubID], [SportID], [LevelID], [ClubName], [Status], [Rules], [CreateDate], [Fund], [Avatar]) VALUES (6, 1, 1, N'Clb Đạt Nguyễn 1', N'Active', N'<p>aaaaaaaaaaaa</p>', CAST(N'2024-12-06T00:11:44.177' AS DateTime), NULL, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1733418706/htb8mal1g7leemqa31is.jpg')
INSERT [dbo].[Club] ([ClubID], [SportID], [LevelID], [ClubName], [Status], [Rules], [CreateDate], [Fund], [Avatar]) VALUES (7, 3, 2, N'Clb Đạt Nguyễn 2', N'Active', N'<p>aaaaaaaaaaaa1</p>', CAST(N'2024-12-06T00:31:45.670' AS DateTime), NULL, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1733419907/jzgu6bjanhof6zpn6gpc.jpg')
INSERT [dbo].[Club] ([ClubID], [SportID], [LevelID], [ClubName], [Status], [Rules], [CreateDate], [Fund], [Avatar]) VALUES (8, 1, 2, N'CLB Bóng đá New ĐN', N'Active', N'<p>18+</p>', CAST(N'2024-12-10T20:33:52.237' AS DateTime), NULL, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1733837632/fcgs9k0ocu56fcmcbade.jpg')
INSERT [dbo].[Club] ([ClubID], [SportID], [LevelID], [ClubName], [Status], [Rules], [CreateDate], [Fund], [Avatar]) VALUES (9, 2, 2, N'CLB Bida mới ĐN', N'Active', N'<p>18+</p>', CAST(N'2024-12-10T20:52:48.170' AS DateTime), NULL, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1733838768/behpzaey2ardohk4jusw.jpg')
INSERT [dbo].[Club] ([ClubID], [SportID], [LevelID], [ClubName], [Status], [Rules], [CreateDate], [Fund], [Avatar]) VALUES (10, 1, 2, N'CLB Bida mới ĐN 2', N'Active', N'<p>18</p>', CAST(N'2025-01-06T09:19:30.413' AS DateTime), NULL, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1736129967/eomsuboccrhzyyeyb626.jpg')
SET IDENTITY_INSERT [dbo].[Club] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([CommentID], [UserID], [ActivityID], [TournamentID], [Comment], [Star], [Level], [Image]) VALUES (1, 1, NULL, 2, N'hay!!!!!', 5, NULL, NULL)
INSERT [dbo].[Comment] ([CommentID], [UserID], [ActivityID], [TournamentID], [Comment], [Star], [Level], [Image]) VALUES (2, 2, NULL, 2, N'Giải đấu rất vui', 4, NULL, NULL)
INSERT [dbo].[Comment] ([CommentID], [UserID], [ActivityID], [TournamentID], [Comment], [Star], [Level], [Image]) VALUES (3, 3, 1, NULL, N'Exciting', 5, NULL, NULL)
INSERT [dbo].[Comment] ([CommentID], [UserID], [ActivityID], [TournamentID], [Comment], [Star], [Level], [Image]) VALUES (4, 1016, 21, NULL, N'hayyyyyyyy', NULL, NULL, NULL)
INSERT [dbo].[Comment] ([CommentID], [UserID], [ActivityID], [TournamentID], [Comment], [Star], [Level], [Image]) VALUES (5, 1016, 21, NULL, N'hayyyyyyyy', NULL, NULL, NULL)
INSERT [dbo].[Comment] ([CommentID], [UserID], [ActivityID], [TournamentID], [Comment], [Star], [Level], [Image]) VALUES (6, 1016, 21, NULL, N'hayyyyyyyy', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Fee] ON 

INSERT [dbo].[Fee] ([FeeID], [TournamentID], [RequestFee]) VALUES (1, 2, CAST(150000 AS Decimal(18, 0)))
INSERT [dbo].[Fee] ([FeeID], [TournamentID], [RequestFee]) VALUES (2, 1, CAST(100000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Fee] OFF
GO
SET IDENTITY_INSERT [dbo].[Level] ON 

INSERT [dbo].[Level] ([LevelID], [LevelName]) VALUES (1, N'Mới biết chơi')
INSERT [dbo].[Level] ([LevelID], [LevelName]) VALUES (2, N'Trung bình - Khá')
INSERT [dbo].[Level] ([LevelID], [LevelName]) VALUES (3, N'Chuyên nghiệp')
SET IDENTITY_INSERT [dbo].[Level] OFF
GO
SET IDENTITY_INSERT [dbo].[Match] ON 

INSERT [dbo].[Match] ([MatchID], [RoundID], [Team1ID], [Team2ID], [MatchNumber], [TournamentId], [Location], [Time]) VALUES (8, 3, 1, 2, 1, 1, NULL, NULL)
INSERT [dbo].[Match] ([MatchID], [RoundID], [Team1ID], [Team2ID], [MatchNumber], [TournamentId], [Location], [Time]) VALUES (9, 3, 3, 4, 2, 1, NULL, NULL)
INSERT [dbo].[Match] ([MatchID], [RoundID], [Team1ID], [Team2ID], [MatchNumber], [TournamentId], [Location], [Time]) VALUES (10, 3, 9, 10, 3, 1, NULL, NULL)
INSERT [dbo].[Match] ([MatchID], [RoundID], [Team1ID], [Team2ID], [MatchNumber], [TournamentId], [Location], [Time]) VALUES (11, 3, 11, 12, 4, 1, NULL, NULL)
INSERT [dbo].[Match] ([MatchID], [RoundID], [Team1ID], [Team2ID], [MatchNumber], [TournamentId], [Location], [Time]) VALUES (13, 2, 2, 1, 5, 2, NULL, NULL)
INSERT [dbo].[Match] ([MatchID], [RoundID], [Team1ID], [Team2ID], [MatchNumber], [TournamentId], [Location], [Time]) VALUES (22, 17, 14, 15, 1, 1032, N'FPT Stadium1', CAST(N'2024-12-11T00:38:00.000' AS DateTime))
INSERT [dbo].[Match] ([MatchID], [RoundID], [Team1ID], [Team2ID], [MatchNumber], [TournamentId], [Location], [Time]) VALUES (23, 17, 17, 18, 2, 1032, NULL, NULL)
INSERT [dbo].[Match] ([MatchID], [RoundID], [Team1ID], [Team2ID], [MatchNumber], [TournamentId], [Location], [Time]) VALUES (25, 2, 1, 4, 1, 1, NULL, NULL)
INSERT [dbo].[Match] ([MatchID], [RoundID], [Team1ID], [Team2ID], [MatchNumber], [TournamentId], [Location], [Time]) VALUES (26, 2, 9, 12, 2, 1, NULL, NULL)
INSERT [dbo].[Match] ([MatchID], [RoundID], [Team1ID], [Team2ID], [MatchNumber], [TournamentId], [Location], [Time]) VALUES (27, 1, 4, 9, 1, 1, NULL, NULL)
INSERT [dbo].[Match] ([MatchID], [RoundID], [Team1ID], [Team2ID], [MatchNumber], [TournamentId], [Location], [Time]) VALUES (28, 16, 14, 17, 1, 1032, NULL, NULL)
INSERT [dbo].[Match] ([MatchID], [RoundID], [Team1ID], [Team2ID], [MatchNumber], [TournamentId], [Location], [Time]) VALUES (29, 17, 19, 20, 3, 1032, NULL, NULL)
INSERT [dbo].[Match] ([MatchID], [RoundID], [Team1ID], [Team2ID], [MatchNumber], [TournamentId], [Location], [Time]) VALUES (30, 17, 21, 22, 4, 1032, NULL, NULL)
INSERT [dbo].[Match] ([MatchID], [RoundID], [Team1ID], [Team2ID], [MatchNumber], [TournamentId], [Location], [Time]) VALUES (31, 17, 23, 24, 5, 1032, NULL, NULL)
INSERT [dbo].[Match] ([MatchID], [RoundID], [Team1ID], [Team2ID], [MatchNumber], [TournamentId], [Location], [Time]) VALUES (32, 17, 25, 26, 6, 1032, NULL, NULL)
INSERT [dbo].[Match] ([MatchID], [RoundID], [Team1ID], [Team2ID], [MatchNumber], [TournamentId], [Location], [Time]) VALUES (33, 17, 27, 29, 7, 1032, NULL, NULL)
INSERT [dbo].[Match] ([MatchID], [RoundID], [Team1ID], [Team2ID], [MatchNumber], [TournamentId], [Location], [Time]) VALUES (34, 17, 30, 31, 8, 1032, NULL, NULL)
INSERT [dbo].[Match] ([MatchID], [RoundID], [Team1ID], [Team2ID], [MatchNumber], [TournamentId], [Location], [Time]) VALUES (35, 18, 32, 33, 1, 1033, N'fpt', CAST(N'2025-02-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Match] ([MatchID], [RoundID], [Team1ID], [Team2ID], [MatchNumber], [TournamentId], [Location], [Time]) VALUES (36, 18, 34, 35, 2, 1033, N'fpt', CAST(N'2024-09-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Match] ([MatchID], [RoundID], [Team1ID], [Team2ID], [MatchNumber], [TournamentId], [Location], [Time]) VALUES (37, 19, 32, 34, 1, 1033, NULL, NULL)
INSERT [dbo].[Match] ([MatchID], [RoundID], [Team1ID], [Team2ID], [MatchNumber], [TournamentId], [Location], [Time]) VALUES (38, 20, 36, 37, 1, 1034, N'sân fpt', CAST(N'2024-12-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Match] ([MatchID], [RoundID], [Team1ID], [Team2ID], [MatchNumber], [TournamentId], [Location], [Time]) VALUES (39, 20, 38, 39, 2, 1034, N'san fpt', CAST(N'2024-12-12T09:05:00.000' AS DateTime))
INSERT [dbo].[Match] ([MatchID], [RoundID], [Team1ID], [Team2ID], [MatchNumber], [TournamentId], [Location], [Time]) VALUES (40, 21, 37, 39, 1, 1034, NULL, NULL)
INSERT [dbo].[Match] ([MatchID], [RoundID], [Team1ID], [Team2ID], [MatchNumber], [TournamentId], [Location], [Time]) VALUES (41, 22, 45, 48, 1, 2039, NULL, NULL)
INSERT [dbo].[Match] ([MatchID], [RoundID], [Team1ID], [Team2ID], [MatchNumber], [TournamentId], [Location], [Time]) VALUES (42, 22, 46, 47, 2, 2039, NULL, NULL)
INSERT [dbo].[Match] ([MatchID], [RoundID], [Team1ID], [Team2ID], [MatchNumber], [TournamentId], [Location], [Time]) VALUES (43, 23, 45, 47, 1, 2039, NULL, NULL)
INSERT [dbo].[Match] ([MatchID], [RoundID], [Team1ID], [Team2ID], [MatchNumber], [TournamentId], [Location], [Time]) VALUES (44, 23, 48, 46, 2, 2039, NULL, NULL)
INSERT [dbo].[Match] ([MatchID], [RoundID], [Team1ID], [Team2ID], [MatchNumber], [TournamentId], [Location], [Time]) VALUES (45, 24, 45, 46, 1, 2039, NULL, NULL)
INSERT [dbo].[Match] ([MatchID], [RoundID], [Team1ID], [Team2ID], [MatchNumber], [TournamentId], [Location], [Time]) VALUES (46, 24, 47, 48, 2, 2039, NULL, NULL)
INSERT [dbo].[Match] ([MatchID], [RoundID], [Team1ID], [Team2ID], [MatchNumber], [TournamentId], [Location], [Time]) VALUES (47, 25, 48, 45, 1, 2039, NULL, NULL)
INSERT [dbo].[Match] ([MatchID], [RoundID], [Team1ID], [Team2ID], [MatchNumber], [TournamentId], [Location], [Time]) VALUES (48, 25, 47, 46, 2, 2039, NULL, NULL)
INSERT [dbo].[Match] ([MatchID], [RoundID], [Team1ID], [Team2ID], [MatchNumber], [TournamentId], [Location], [Time]) VALUES (49, 26, 47, 45, 1, 2039, NULL, NULL)
INSERT [dbo].[Match] ([MatchID], [RoundID], [Team1ID], [Team2ID], [MatchNumber], [TournamentId], [Location], [Time]) VALUES (50, 26, 46, 48, 2, 2039, NULL, NULL)
INSERT [dbo].[Match] ([MatchID], [RoundID], [Team1ID], [Team2ID], [MatchNumber], [TournamentId], [Location], [Time]) VALUES (51, 27, 46, 45, 1, 2039, NULL, NULL)
INSERT [dbo].[Match] ([MatchID], [RoundID], [Team1ID], [Team2ID], [MatchNumber], [TournamentId], [Location], [Time]) VALUES (52, 27, 48, 47, 2, 2039, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Match] OFF
GO
SET IDENTITY_INSERT [dbo].[requestJoinActivity] ON 

INSERT [dbo].[requestJoinActivity] ([requestJoinActivityID], [UserID], [ActivitiesID], [Status], [CreateDate]) VALUES (6, 7, 4, N'2', CAST(N'2024-10-25T01:01:47.487' AS DateTime))
INSERT [dbo].[requestJoinActivity] ([requestJoinActivityID], [UserID], [ActivitiesID], [Status], [CreateDate]) VALUES (7, 8, 4, N'2', CAST(N'2024-10-25T01:01:47.487' AS DateTime))
INSERT [dbo].[requestJoinActivity] ([requestJoinActivityID], [UserID], [ActivitiesID], [Status], [CreateDate]) VALUES (10, 9, 4, N'3', CAST(N'2024-11-06T01:36:19.173' AS DateTime))
INSERT [dbo].[requestJoinActivity] ([requestJoinActivityID], [UserID], [ActivitiesID], [Status], [CreateDate]) VALUES (11, 10, 4, N'3', CAST(N'2024-10-25T01:01:47.487' AS DateTime))
INSERT [dbo].[requestJoinActivity] ([requestJoinActivityID], [UserID], [ActivitiesID], [Status], [CreateDate]) VALUES (12, 1, 2, N'1', CAST(N'2024-11-07T23:13:49.597' AS DateTime))
INSERT [dbo].[requestJoinActivity] ([requestJoinActivityID], [UserID], [ActivitiesID], [Status], [CreateDate]) VALUES (13, 1, 3, N'1', CAST(N'2024-11-07T23:16:09.410' AS DateTime))
INSERT [dbo].[requestJoinActivity] ([requestJoinActivityID], [UserID], [ActivitiesID], [Status], [CreateDate]) VALUES (14, 1009, 16, N'1', CAST(N'2024-11-14T22:14:09.897' AS DateTime))
INSERT [dbo].[requestJoinActivity] ([requestJoinActivityID], [UserID], [ActivitiesID], [Status], [CreateDate]) VALUES (15, 6, 15, N'1', CAST(N'2024-11-14T23:29:11.763' AS DateTime))
INSERT [dbo].[requestJoinActivity] ([requestJoinActivityID], [UserID], [ActivitiesID], [Status], [CreateDate]) VALUES (16, 6, 17, N'2', CAST(N'2024-11-14T23:29:59.440' AS DateTime))
INSERT [dbo].[requestJoinActivity] ([requestJoinActivityID], [UserID], [ActivitiesID], [Status], [CreateDate]) VALUES (17, 1016, 21, N'2', CAST(N'2024-12-20T23:17:48.727' AS DateTime))
INSERT [dbo].[requestJoinActivity] ([requestJoinActivityID], [UserID], [ActivitiesID], [Status], [CreateDate]) VALUES (18, 1017, 21, N'2', CAST(N'2024-12-23T16:59:21.230' AS DateTime))
INSERT [dbo].[requestJoinActivity] ([requestJoinActivityID], [UserID], [ActivitiesID], [Status], [CreateDate]) VALUES (19, 1017, 22, N'2', CAST(N'2024-12-23T17:01:56.663' AS DateTime))
INSERT [dbo].[requestJoinActivity] ([requestJoinActivityID], [UserID], [ActivitiesID], [Status], [CreateDate]) VALUES (20, 1015, 22, N'2', CAST(N'2024-12-23T17:16:42.387' AS DateTime))
INSERT [dbo].[requestJoinActivity] ([requestJoinActivityID], [UserID], [ActivitiesID], [Status], [CreateDate]) VALUES (21, 1014, 22, N'2', CAST(N'2024-12-23T17:19:59.273' AS DateTime))
INSERT [dbo].[requestJoinActivity] ([requestJoinActivityID], [UserID], [ActivitiesID], [Status], [CreateDate]) VALUES (22, 1013, 22, N'2', CAST(N'2024-12-23T17:20:16.863' AS DateTime))
INSERT [dbo].[requestJoinActivity] ([requestJoinActivityID], [UserID], [ActivitiesID], [Status], [CreateDate]) VALUES (1017, 1011, 1024, N'2', CAST(N'2025-01-06T09:01:53.650' AS DateTime))
INSERT [dbo].[requestJoinActivity] ([requestJoinActivityID], [UserID], [ActivitiesID], [Status], [CreateDate]) VALUES (1018, 1011, 1022, N'2', CAST(N'2025-01-06T09:07:23.583' AS DateTime))
SET IDENTITY_INSERT [dbo].[requestJoinActivity] OFF
GO
SET IDENTITY_INSERT [dbo].[RequestJoinClub] ON 

INSERT [dbo].[RequestJoinClub] ([RequestClubId], [User_id], [Club_id], [Status], [Createdate]) VALUES (1, 5, 1, N'3', CAST(N'2024-10-25T01:01:47.487' AS DateTime))
INSERT [dbo].[RequestJoinClub] ([RequestClubId], [User_id], [Club_id], [Status], [Createdate]) VALUES (2, 5, 1, N'3', CAST(N'2024-10-25T01:37:16.947' AS DateTime))
INSERT [dbo].[RequestJoinClub] ([RequestClubId], [User_id], [Club_id], [Status], [Createdate]) VALUES (3, 1, 3, N'1', CAST(N'2024-11-14T01:52:08.577' AS DateTime))
INSERT [dbo].[RequestJoinClub] ([RequestClubId], [User_id], [Club_id], [Status], [Createdate]) VALUES (4, 1009, 3, N'1', CAST(N'2024-11-14T23:37:59.463' AS DateTime))
INSERT [dbo].[RequestJoinClub] ([RequestClubId], [User_id], [Club_id], [Status], [Createdate]) VALUES (6, 1, 1, N'3', CAST(N'2024-11-20T20:21:14.597' AS DateTime))
INSERT [dbo].[RequestJoinClub] ([RequestClubId], [User_id], [Club_id], [Status], [Createdate]) VALUES (1006, 1009, 4, N'1', CAST(N'2024-12-07T14:21:59.040' AS DateTime))
INSERT [dbo].[RequestJoinClub] ([RequestClubId], [User_id], [Club_id], [Status], [Createdate]) VALUES (1007, 1009, 2, N'1', CAST(N'2024-12-07T14:22:20.877' AS DateTime))
INSERT [dbo].[RequestJoinClub] ([RequestClubId], [User_id], [Club_id], [Status], [Createdate]) VALUES (1009, 1009, 1, N'2', CAST(N'2024-12-08T20:38:38.550' AS DateTime))
INSERT [dbo].[RequestJoinClub] ([RequestClubId], [User_id], [Club_id], [Status], [Createdate]) VALUES (1011, 1011, 8, N'2', CAST(N'2024-12-10T20:35:17.750' AS DateTime))
INSERT [dbo].[RequestJoinClub] ([RequestClubId], [User_id], [Club_id], [Status], [Createdate]) VALUES (1013, 1011, 1, N'1', CAST(N'2024-12-10T21:16:53.490' AS DateTime))
INSERT [dbo].[RequestJoinClub] ([RequestClubId], [User_id], [Club_id], [Status], [Createdate]) VALUES (1014, 1010, 9, N'1', CAST(N'2024-12-10T21:17:15.067' AS DateTime))
INSERT [dbo].[RequestJoinClub] ([RequestClubId], [User_id], [Club_id], [Status], [Createdate]) VALUES (1015, 1017, 8, N'2', CAST(N'2024-12-27T20:42:58.057' AS DateTime))
INSERT [dbo].[RequestJoinClub] ([RequestClubId], [User_id], [Club_id], [Status], [Createdate]) VALUES (1016, 1013, 8, N'2', CAST(N'2024-12-27T20:46:18.737' AS DateTime))
INSERT [dbo].[RequestJoinClub] ([RequestClubId], [User_id], [Club_id], [Status], [Createdate]) VALUES (1017, 1012, 8, N'2', CAST(N'2024-12-27T20:48:30.470' AS DateTime))
INSERT [dbo].[RequestJoinClub] ([RequestClubId], [User_id], [Club_id], [Status], [Createdate]) VALUES (1018, 1011, 10, N'2', CAST(N'2025-01-06T09:20:05.640' AS DateTime))
INSERT [dbo].[RequestJoinClub] ([RequestClubId], [User_id], [Club_id], [Status], [Createdate]) VALUES (1019, 1012, 9, N'2', CAST(N'2025-01-07T16:20:25.567' AS DateTime))
SET IDENTITY_INSERT [dbo].[RequestJoinClub] OFF
GO
SET IDENTITY_INSERT [dbo].[Result] ON 

INSERT [dbo].[Result] ([ResultID], [MatchID], [ScoreTeam1], [ScoreTeam2], [PenaltyTeam1], [PenaltyTeam2]) VALUES (8, 8, 4, 2, NULL, NULL)
INSERT [dbo].[Result] ([ResultID], [MatchID], [ScoreTeam1], [ScoreTeam2], [PenaltyTeam1], [PenaltyTeam2]) VALUES (9, 9, 3, 4, NULL, NULL)
INSERT [dbo].[Result] ([ResultID], [MatchID], [ScoreTeam1], [ScoreTeam2], [PenaltyTeam1], [PenaltyTeam2]) VALUES (10, 10, 5, 1, NULL, NULL)
INSERT [dbo].[Result] ([ResultID], [MatchID], [ScoreTeam1], [ScoreTeam2], [PenaltyTeam1], [PenaltyTeam2]) VALUES (11, 11, 0, 1, NULL, NULL)
INSERT [dbo].[Result] ([ResultID], [MatchID], [ScoreTeam1], [ScoreTeam2], [PenaltyTeam1], [PenaltyTeam2]) VALUES (14, 13, 2, 3, NULL, NULL)
INSERT [dbo].[Result] ([ResultID], [MatchID], [ScoreTeam1], [ScoreTeam2], [PenaltyTeam1], [PenaltyTeam2]) VALUES (23, 22, 3, 0, NULL, NULL)
INSERT [dbo].[Result] ([ResultID], [MatchID], [ScoreTeam1], [ScoreTeam2], [PenaltyTeam1], [PenaltyTeam2]) VALUES (24, 23, 1, 0, NULL, NULL)
INSERT [dbo].[Result] ([ResultID], [MatchID], [ScoreTeam1], [ScoreTeam2], [PenaltyTeam1], [PenaltyTeam2]) VALUES (26, 25, 3, 4, NULL, NULL)
INSERT [dbo].[Result] ([ResultID], [MatchID], [ScoreTeam1], [ScoreTeam2], [PenaltyTeam1], [PenaltyTeam2]) VALUES (27, 26, 4, 2, NULL, NULL)
INSERT [dbo].[Result] ([ResultID], [MatchID], [ScoreTeam1], [ScoreTeam2], [PenaltyTeam1], [PenaltyTeam2]) VALUES (28, 27, 2, 1, NULL, NULL)
INSERT [dbo].[Result] ([ResultID], [MatchID], [ScoreTeam1], [ScoreTeam2], [PenaltyTeam1], [PenaltyTeam2]) VALUES (29, 29, 0, 1, NULL, NULL)
INSERT [dbo].[Result] ([ResultID], [MatchID], [ScoreTeam1], [ScoreTeam2], [PenaltyTeam1], [PenaltyTeam2]) VALUES (30, 35, 4, 3, NULL, NULL)
INSERT [dbo].[Result] ([ResultID], [MatchID], [ScoreTeam1], [ScoreTeam2], [PenaltyTeam1], [PenaltyTeam2]) VALUES (31, 36, 6, 5, NULL, NULL)
INSERT [dbo].[Result] ([ResultID], [MatchID], [ScoreTeam1], [ScoreTeam2], [PenaltyTeam1], [PenaltyTeam2]) VALUES (32, 37, 4, 7, NULL, NULL)
INSERT [dbo].[Result] ([ResultID], [MatchID], [ScoreTeam1], [ScoreTeam2], [PenaltyTeam1], [PenaltyTeam2]) VALUES (33, 40, 3, 4, NULL, NULL)
INSERT [dbo].[Result] ([ResultID], [MatchID], [ScoreTeam1], [ScoreTeam2], [PenaltyTeam1], [PenaltyTeam2]) VALUES (34, 38, 3, 5, NULL, NULL)
INSERT [dbo].[Result] ([ResultID], [MatchID], [ScoreTeam1], [ScoreTeam2], [PenaltyTeam1], [PenaltyTeam2]) VALUES (35, 39, 4, 5, NULL, NULL)
INSERT [dbo].[Result] ([ResultID], [MatchID], [ScoreTeam1], [ScoreTeam2], [PenaltyTeam1], [PenaltyTeam2]) VALUES (36, 41, 3, 5, NULL, NULL)
INSERT [dbo].[Result] ([ResultID], [MatchID], [ScoreTeam1], [ScoreTeam2], [PenaltyTeam1], [PenaltyTeam2]) VALUES (37, 42, 4, 1, NULL, NULL)
INSERT [dbo].[Result] ([ResultID], [MatchID], [ScoreTeam1], [ScoreTeam2], [PenaltyTeam1], [PenaltyTeam2]) VALUES (38, 43, 2, 1, NULL, NULL)
INSERT [dbo].[Result] ([ResultID], [MatchID], [ScoreTeam1], [ScoreTeam2], [PenaltyTeam1], [PenaltyTeam2]) VALUES (39, 44, 3, 0, NULL, NULL)
INSERT [dbo].[Result] ([ResultID], [MatchID], [ScoreTeam1], [ScoreTeam2], [PenaltyTeam1], [PenaltyTeam2]) VALUES (40, 45, 3, 5, NULL, NULL)
INSERT [dbo].[Result] ([ResultID], [MatchID], [ScoreTeam1], [ScoreTeam2], [PenaltyTeam1], [PenaltyTeam2]) VALUES (41, 46, 2, 3, NULL, NULL)
INSERT [dbo].[Result] ([ResultID], [MatchID], [ScoreTeam1], [ScoreTeam2], [PenaltyTeam1], [PenaltyTeam2]) VALUES (42, 47, 1, 4, NULL, NULL)
INSERT [dbo].[Result] ([ResultID], [MatchID], [ScoreTeam1], [ScoreTeam2], [PenaltyTeam1], [PenaltyTeam2]) VALUES (43, 48, 5, 5, NULL, NULL)
INSERT [dbo].[Result] ([ResultID], [MatchID], [ScoreTeam1], [ScoreTeam2], [PenaltyTeam1], [PenaltyTeam2]) VALUES (44, 49, 3, 3, NULL, NULL)
INSERT [dbo].[Result] ([ResultID], [MatchID], [ScoreTeam1], [ScoreTeam2], [PenaltyTeam1], [PenaltyTeam2]) VALUES (45, 50, 1, 5, NULL, NULL)
INSERT [dbo].[Result] ([ResultID], [MatchID], [ScoreTeam1], [ScoreTeam2], [PenaltyTeam1], [PenaltyTeam2]) VALUES (46, 51, 2, 4, NULL, NULL)
INSERT [dbo].[Result] ([ResultID], [MatchID], [ScoreTeam1], [ScoreTeam2], [PenaltyTeam1], [PenaltyTeam2]) VALUES (47, 52, 5, 5, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Result] OFF
GO
SET IDENTITY_INSERT [dbo].[ResultOfActivities] ON 

INSERT [dbo].[ResultOfActivities] ([ResultID], [ActivityID], [Team1Score], [Team2Score]) VALUES (1, 1, 5, 4)
INSERT [dbo].[ResultOfActivities] ([ResultID], [ActivityID], [Team1Score], [Team2Score]) VALUES (2, 21, 7, 12)
SET IDENTITY_INSERT [dbo].[ResultOfActivities] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'User')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Organizer')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Round] ON 

INSERT [dbo].[Round] ([RoundID], [TournamentID], [RoundNumber]) VALUES (1, 1, 1)
INSERT [dbo].[Round] ([RoundID], [TournamentID], [RoundNumber]) VALUES (2, 1, 2)
INSERT [dbo].[Round] ([RoundID], [TournamentID], [RoundNumber]) VALUES (3, 1, 3)
INSERT [dbo].[Round] ([RoundID], [TournamentID], [RoundNumber]) VALUES (4, 2, 1)
INSERT [dbo].[Round] ([RoundID], [TournamentID], [RoundNumber]) VALUES (5, 2, 2)
INSERT [dbo].[Round] ([RoundID], [TournamentID], [RoundNumber]) VALUES (6, 2, 3)
INSERT [dbo].[Round] ([RoundID], [TournamentID], [RoundNumber]) VALUES (16, 1032, 3)
INSERT [dbo].[Round] ([RoundID], [TournamentID], [RoundNumber]) VALUES (17, 1032, 4)
INSERT [dbo].[Round] ([RoundID], [TournamentID], [RoundNumber]) VALUES (18, 1033, 2)
INSERT [dbo].[Round] ([RoundID], [TournamentID], [RoundNumber]) VALUES (19, 1033, 1)
INSERT [dbo].[Round] ([RoundID], [TournamentID], [RoundNumber]) VALUES (20, 1034, 2)
INSERT [dbo].[Round] ([RoundID], [TournamentID], [RoundNumber]) VALUES (21, 1034, 1)
INSERT [dbo].[Round] ([RoundID], [TournamentID], [RoundNumber]) VALUES (22, 2039, 1)
INSERT [dbo].[Round] ([RoundID], [TournamentID], [RoundNumber]) VALUES (23, 2039, 2)
INSERT [dbo].[Round] ([RoundID], [TournamentID], [RoundNumber]) VALUES (24, 2039, 3)
INSERT [dbo].[Round] ([RoundID], [TournamentID], [RoundNumber]) VALUES (25, 2039, 4)
INSERT [dbo].[Round] ([RoundID], [TournamentID], [RoundNumber]) VALUES (26, 2039, 5)
INSERT [dbo].[Round] ([RoundID], [TournamentID], [RoundNumber]) VALUES (27, 2039, 6)
SET IDENTITY_INSERT [dbo].[Round] OFF
GO
SET IDENTITY_INSERT [dbo].[Sport] ON 

INSERT [dbo].[Sport] ([SportID], [SportName], [Avatar]) VALUES (1, N'Bóng dá', NULL)
INSERT [dbo].[Sport] ([SportID], [SportName], [Avatar]) VALUES (2, N'Bóng chuyền', NULL)
INSERT [dbo].[Sport] ([SportID], [SportName], [Avatar]) VALUES (3, N'Bóng rổ', NULL)
INSERT [dbo].[Sport] ([SportID], [SportName], [Avatar]) VALUES (4, N'Cầu lông ', NULL)
INSERT [dbo].[Sport] ([SportID], [SportName], [Avatar]) VALUES (5, N'Pickleball', NULL)
INSERT [dbo].[Sport] ([SportID], [SportName], [Avatar]) VALUES (6, N'Bida', NULL)
SET IDENTITY_INSERT [dbo].[Sport] OFF
GO
SET IDENTITY_INSERT [dbo].[Team] ON 

INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (1, 1, N'Team A', NULL, NULL)
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (2, 1, N'Team B', NULL, NULL)
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (3, 1, N'Team C', NULL, NULL)
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (4, 1, N'Team D', NULL, NULL)
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (9, 1, N'Đội của Đạt', 1009, NULL)
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (10, 1, N'DAt ne', 1009, NULL)
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (11, 1, N'1', 1009, NULL)
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (12, 1, N'2', 1009, NULL)
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (14, 1032, N'Dat', 1009, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1733680364/yscbkyloubfzbasplxu7.jpg')
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (15, 1032, N'Dat 2', 2, NULL)
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (17, 1032, N'Dat 3', 3, NULL)
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (18, 1032, N'DAt 4', 4, NULL)
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (19, 1032, N'5', 5, NULL)
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (20, 1032, N'6', 6, NULL)
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (21, 1032, N'7', 7, NULL)
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (22, 1032, N'8', 8, NULL)
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (23, 1032, N'9', 9, NULL)
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (24, 1032, N'10', NULL, NULL)
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (25, 1032, N'11', NULL, NULL)
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (26, 1032, N'12', NULL, NULL)
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (27, 1032, N'13', NULL, NULL)
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (29, 1032, N'14', NULL, NULL)
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (30, 1032, N'15', NULL, NULL)
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (31, 1032, N'16', NULL, NULL)
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (32, 1033, N'team 1', 1011, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1733808686/iwekshbis4go3yawox3f.jpg')
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (33, 1033, N'team 2', 1012, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1733808765/gvepaniiw0uawkpvyygq.png')
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (34, 1033, N'team 3', 1013, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1733808881/xtc9baxnwq9updxsyli7.jpg')
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (35, 1033, N'team 4', 1014, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1733809048/jyjmtfu0v9g6vp2jw4hk.jpg')
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (36, 1034, N'team a', 1011, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1733837361/wmgtnk3edfdtzy5gohka.jpg')
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (37, 1034, N'team b', 1012, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1733837524/rpdgqhpvrhrnqer6ossr.jpg')
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (38, 1034, N'team c', 1013, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1733837586/qzpetki467odktewhokl.png')
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (39, 1034, N'team c', 1013, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1733837589/pmzw41yliaqznjdh4vbh.png')
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (44, 1036, N'team abc', 1010, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1733839718/qzgil3dvrn4ci5lpzogn.jpg')
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (45, 2039, N'team a', 1011, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1735787445/ktkmeh8us078kxzdwr3x.jpg')
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (46, 2039, N'team b', 1012, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1735787497/rrojuh2djhvuhvd9clj5.jpg')
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (47, 2039, N'team c', 1013, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1735787558/trbe2ryzkcdzsjj3ut6z.jpg')
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (48, 2039, N'team d', 1014, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1735787607/ox8irja9u2rrsnutd1ms.jpg')
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (49, 2040, N'team a', 1011, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1735907757/jkw7gz2smh6nc1fstrbn.jpg')
INSERT [dbo].[Team] ([TeamID], [TournamentID], [TeamName], [UserId], [Avatar]) VALUES (50, 2040, N'team 2', 1012, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1735907798/m30hsakucy9zoqr8yhuo.jpg')
SET IDENTITY_INSERT [dbo].[Team] OFF
GO
SET IDENTITY_INSERT [dbo].[TeamTournament] ON 

INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (3, 9, N'Đạt', 1)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (4, 9, N'Hưng', 2)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (5, 10, N'1', 1)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (6, 10, N'2', 2)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (7, 10, N'3', 3)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (8, 10, N'4', 4)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (9, 10, N'5', 5)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (10, 11, N'1', 1)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (11, 11, N'2', 2)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (12, 11, N'3', 3)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (13, 11, N'4', 4)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (14, 11, N'5', 5)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (15, 11, N'6', 6)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (21, 14, N'dat 1', 1)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (22, 14, N'dat 2', 2)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (23, 14, N'dat 3', 3)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (24, 32, N'nguyen van a', 1)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (25, 32, N'nguyen van b', 2)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (26, 33, N'nguyen van a', 3)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (27, 33, N'nguyen van a', 4)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (28, 34, N'nguyen van a', 5)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (29, 34, N'nguyen van a', 6)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (30, 35, N'tran van a', 7)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (31, 35, N'pham van b', 8)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (32, 36, N'tran van a', 1)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (33, 36, N'nguyen van b', 2)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (34, 37, N'tran van c', 1)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (35, 37, N'nguyen van a', 2)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (36, 38, N'tran van a', 1)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (37, 38, N'nguyen van b', 2)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (38, 39, N'tran van a', 1)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (39, 39, N'nguyen van b', 2)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (48, 44, N'tran van a', 1)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (49, 45, N'nguyen van a', 1)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (50, 45, N'tran van b', 2)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (51, 46, N'nguyen van  a', 1)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (52, 46, N'tran van b', 2)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (53, 47, N'tran van a', 1)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (54, 47, N'nguyen van v', 2)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (55, 48, N'tran van a', 1)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (56, 48, N'nguyen van b  ', 2)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (57, 49, N'nguyen van a', 1)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (58, 49, N'nguyen van b', 2)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (59, 50, N'tran van a', 1)
INSERT [dbo].[TeamTournament] ([TeamTournamentID], [TeamID], [NamePlayer], [NumberPlayer]) VALUES (60, 50, N'nguyen van b', 2)
SET IDENTITY_INSERT [dbo].[TeamTournament] OFF
GO
SET IDENTITY_INSERT [dbo].[Tournaments] ON 

INSERT [dbo].[Tournaments] ([TournamentID], [LevelID], [Name], [Description], [StartDate], [EndDate], [Location], [NumberOfTeams], [Status], [CreatedDate], [UserID], [Avatar], [MemberOfTeams], [LimitRegister], [TournamentType]) VALUES (1, 2, N'Giải bóng đá', N'Chỉ dành cho trung bình khá', CAST(N'2024-12-10T00:00:00.000' AS DateTime), CAST(N'2024-12-15T00:00:00.000' AS DateTime), N'Sân A', 8, N'Sắp diễn ra', CAST(N'2024-12-10T00:00:00.000' AS DateTime), 1, NULL, 2, CAST(N'2024-11-25T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Tournaments] ([TournamentID], [LevelID], [Name], [Description], [StartDate], [EndDate], [Location], [NumberOfTeams], [Status], [CreatedDate], [UserID], [Avatar], [MemberOfTeams], [LimitRegister], [TournamentType]) VALUES (2, 3, N'Giải cầu lông', N'Giải chuyên nghiệp', CAST(N'2024-09-15T00:00:00.000' AS DateTime), CAST(N'2024-09-22T00:00:00.000' AS DateTime), N'Nhà thi đấu B', 4, N'Kết thúc', CAST(N'2024-08-15T00:00:00.000' AS DateTime), 2, NULL, 6, CAST(N'2024-11-25T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Tournaments] ([TournamentID], [LevelID], [Name], [Description], [StartDate], [EndDate], [Location], [NumberOfTeams], [Status], [CreatedDate], [UserID], [Avatar], [MemberOfTeams], [LimitRegister], [TournamentType]) VALUES (1006, 1, N'Giải 5', N'I want go to Hue early', CAST(N'2024-11-10T00:00:00.000' AS DateTime), CAST(N'2024-11-10T00:00:00.000' AS DateTime), N'da nang', 2, NULL, CAST(N'2024-11-10T19:56:00.000' AS DateTime), 1009, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1733808453/ors4kuhizjtajn6yf6br.jpg', 8, CAST(N'2024-12-10T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Tournaments] ([TournamentID], [LevelID], [Name], [Description], [StartDate], [EndDate], [Location], [NumberOfTeams], [Status], [CreatedDate], [UserID], [Avatar], [MemberOfTeams], [LimitRegister], [TournamentType]) VALUES (1007, 2, N'Giải 6', N'I want go to Hue early', CAST(N'2024-11-11T00:00:00.000' AS DateTime), CAST(N'2024-12-12T00:00:00.000' AS DateTime), N'Đà Nẵng', 8, NULL, CAST(N'2024-11-11T21:38:00.000' AS DateTime), 1009, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1733808453/ors4kuhizjtajn6yf6br.jpg', 3, CAST(N'2024-11-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Tournaments] ([TournamentID], [LevelID], [Name], [Description], [StartDate], [EndDate], [Location], [NumberOfTeams], [Status], [CreatedDate], [UserID], [Avatar], [MemberOfTeams], [LimitRegister], [TournamentType]) VALUES (1008, 2, N'Giải 7', N'Quyen', CAST(N'2024-11-20T00:00:00.000' AS DateTime), CAST(N'2024-11-30T00:00:00.000' AS DateTime), N'Đà Nẵng', 8, NULL, CAST(N'2024-11-20T21:18:00.000' AS DateTime), 1009, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1733808453/ors4kuhizjtajn6yf6br.jpg', 2, CAST(N'2025-11-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Tournaments] ([TournamentID], [LevelID], [Name], [Description], [StartDate], [EndDate], [Location], [NumberOfTeams], [Status], [CreatedDate], [UserID], [Avatar], [MemberOfTeams], [LimitRegister], [TournamentType]) VALUES (1021, 3, N'Cầu Lông', N'I want go to Hue early', CAST(N'2024-12-04T00:00:00.000' AS DateTime), CAST(N'2024-12-06T00:00:00.000' AS DateTime), N'Đà Nẵng', 8, NULL, CAST(N'2024-12-04T01:36:00.000' AS DateTime), 1, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1733808453/ors4kuhizjtajn6yf6br.jpg', 4, CAST(N'2024-11-29T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Tournaments] ([TournamentID], [LevelID], [Name], [Description], [StartDate], [EndDate], [Location], [NumberOfTeams], [Status], [CreatedDate], [UserID], [Avatar], [MemberOfTeams], [LimitRegister], [TournamentType]) VALUES (1032, 1, N'Giải 8', N'I want go to Hue early', CAST(N'2024-12-11T00:00:00.000' AS DateTime), CAST(N'2024-12-13T00:00:00.000' AS DateTime), N'Đà Nẵng', 16, NULL, CAST(N'2024-12-11T02:02:00.000' AS DateTime), 1, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1733808453/ors4kuhizjtajn6yf6br.jpg', 3, CAST(N'2024-12-06T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Tournaments] ([TournamentID], [LevelID], [Name], [Description], [StartDate], [EndDate], [Location], [NumberOfTeams], [Status], [CreatedDate], [UserID], [Avatar], [MemberOfTeams], [LimitRegister], [TournamentType]) VALUES (1033, 2, N'Giải đá bóng', N'Đầy đủ số đội tham gia.', CAST(N'2024-11-27T00:00:00.000' AS DateTime), CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'Sân FPT', 4, NULL, CAST(N'2024-11-27T12:29:00.000' AS DateTime), 1010, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1733808453/ors4kuhizjtajn6yf6br.jpg', 2, CAST(N'2024-12-02T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Tournaments] ([TournamentID], [LevelID], [Name], [Description], [StartDate], [EndDate], [Location], [NumberOfTeams], [Status], [CreatedDate], [UserID], [Avatar], [MemberOfTeams], [LimitRegister], [TournamentType]) VALUES (1034, 2, N'Giải cầu lông cuối năm', N'Đầy đủ số đội tham gia.', CAST(N'2024-12-12T00:00:00.000' AS DateTime), CAST(N'2024-12-19T00:00:00.000' AS DateTime), N'Sân FPT', 4, NULL, CAST(N'2024-12-12T20:27:00.000' AS DateTime), 1010, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1733837183/rt4aoqt7osjlp4hmbpdy.jpg', 2, CAST(N'2024-12-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Tournaments] ([TournamentID], [LevelID], [Name], [Description], [StartDate], [EndDate], [Location], [NumberOfTeams], [Status], [CreatedDate], [UserID], [Avatar], [MemberOfTeams], [LimitRegister], [TournamentType]) VALUES (1036, 2, N'Giải bida 2', N'Đầy đủ số đội tham gia.', CAST(N'2024-12-13T00:00:00.000' AS DateTime), CAST(N'2024-12-20T00:00:00.000' AS DateTime), N'Sân FPT', 4, NULL, CAST(N'2024-12-13T21:10:00.000' AS DateTime), 1011, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1733839627/z1xhx8ztpuw7bcfsgejk.png', 1, CAST(N'2024-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Tournaments] ([TournamentID], [LevelID], [Name], [Description], [StartDate], [EndDate], [Location], [NumberOfTeams], [Status], [CreatedDate], [UserID], [Avatar], [MemberOfTeams], [LimitRegister], [TournamentType]) VALUES (1037, 2, N'Giải bida 3c-đồng đội', N'Đầy đủ số đội tham gia.', CAST(N'2024-12-14T00:00:00.000' AS DateTime), CAST(N'2024-12-21T00:00:00.000' AS DateTime), N'Sân FPT', 8, NULL, CAST(N'2024-12-14T21:11:00.000' AS DateTime), 1010, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1733839797/hy8nesn8a37zwcylqx6f.jpg', 2, CAST(N'2024-12-13T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Tournaments] ([TournamentID], [LevelID], [Name], [Description], [StartDate], [EndDate], [Location], [NumberOfTeams], [Status], [CreatedDate], [UserID], [Avatar], [MemberOfTeams], [LimitRegister], [TournamentType]) VALUES (1038, 3, N'Giải bida 32', N'Đầy đủ số đội tham gia.', CAST(N'2024-12-26T00:00:00.000' AS DateTime), CAST(N'2025-01-02T00:00:00.000' AS DateTime), N'Sân FPT', 4, NULL, CAST(N'2024-12-26T16:23:00.000' AS DateTime), 1015, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1734513654/aswzmxadrcsumsxh63qm.png', 2, CAST(N'2024-12-24T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Tournaments] ([TournamentID], [LevelID], [Name], [Description], [StartDate], [EndDate], [Location], [NumberOfTeams], [Status], [CreatedDate], [UserID], [Avatar], [MemberOfTeams], [LimitRegister], [TournamentType]) VALUES (2038, 2, N'Giải bida ', N'Đầy đủ số đội tham gia.', CAST(N'2025-01-01T00:00:00.000' AS DateTime), CAST(N'2025-01-03T00:00:00.000' AS DateTime), N'Sân FPT', 4, NULL, CAST(N'2025-01-01T19:30:00.000' AS DateTime), 1016, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1735302475/b9zymwqzcwmxiblf178u.jpg', 2, CAST(N'2024-12-31T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Tournaments] ([TournamentID], [LevelID], [Name], [Description], [StartDate], [EndDate], [Location], [NumberOfTeams], [Status], [CreatedDate], [UserID], [Avatar], [MemberOfTeams], [LimitRegister], [TournamentType]) VALUES (2039, 2, N'Giải bóng đá 2025', N'Đầy đủ số đội tham gia.', CAST(N'2025-01-09T00:00:00.000' AS DateTime), CAST(N'2025-01-16T00:00:00.000' AS DateTime), N'Sân FPT', 4, NULL, CAST(N'2025-01-09T10:03:00.000' AS DateTime), 1017, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1735787303/gxdmf43uajrpfzfinpqt.jpg', 2, CAST(N'2025-01-08T00:00:00.000' AS DateTime), N'roundRobin')
INSERT [dbo].[Tournaments] ([TournamentID], [LevelID], [Name], [Description], [StartDate], [EndDate], [Location], [NumberOfTeams], [Status], [CreatedDate], [UserID], [Avatar], [MemberOfTeams], [LimitRegister], [TournamentType]) VALUES (2040, 2, N'Giải bóng đá đầu năm', N'Đầy đủ số đội tham gia.', CAST(N'2025-01-10T00:00:00.000' AS DateTime), CAST(N'2025-01-17T00:00:00.000' AS DateTime), N'Sân FPT', 4, NULL, CAST(N'2025-01-10T19:35:00.000' AS DateTime), 1017, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1735907688/kxgmnszfkjjlusml27ud.jpg', 2, CAST(N'2025-01-09T00:00:00.000' AS DateTime), N'roundRobin')
SET IDENTITY_INSERT [dbo].[Tournaments] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [RoleID], [UserTeamID], [Email], [Password], [FullName], [Phone], [Address], [Gender], [Age], [Height], [Weight], [Avatar], [Status]) VALUES (1, 2, NULL, N'khanhhung@gmail.com', N'25d55ad283aa400af464c76d713c07ad', N'Khánh Hưng', N'0912345678', N'Đà Nẵng', N'Nam', 25, CAST(180.00 AS Decimal(5, 2)), CAST(80.00 AS Decimal(5, 2)), N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1731605673/eop3ihnl3mkyzcvvrtmp.jpg', N'Active')
INSERT [dbo].[User] ([UserID], [RoleID], [UserTeamID], [Email], [Password], [FullName], [Phone], [Address], [Gender], [Age], [Height], [Weight], [Avatar], [Status]) VALUES (2, 2, NULL, N'tiendat@gmail.com', N'tiendat123', N'Tiến Đạt', N'0987654321', N'Đà Nẵng', N'Nam', 23, CAST(170.00 AS Decimal(5, 2)), CAST(60.00 AS Decimal(5, 2)), NULL, N'Active')
INSERT [dbo].[User] ([UserID], [RoleID], [UserTeamID], [Email], [Password], [FullName], [Phone], [Address], [Gender], [Age], [Height], [Weight], [Avatar], [Status]) VALUES (3, 2, NULL, N'hoangvu@gmail.com', N'hoangvu123', N'Hoàng Vũ', N'0912345678', N'Đà Nẵng', N'Nam', 23, CAST(170.00 AS Decimal(5, 2)), CAST(65.00 AS Decimal(5, 2)), NULL, N'Active')
INSERT [dbo].[User] ([UserID], [RoleID], [UserTeamID], [Email], [Password], [FullName], [Phone], [Address], [Gender], [Age], [Height], [Weight], [Avatar], [Status]) VALUES (4, 2, NULL, N'thanhtung@gmail.com', N'thanhtung123', N'Thanh Tùng', N'0987654321', N'Đà Nẵng', N'Nam', 23, CAST(173.00 AS Decimal(5, 2)), CAST(70.00 AS Decimal(5, 2)), NULL, N'Active')
INSERT [dbo].[User] ([UserID], [RoleID], [UserTeamID], [Email], [Password], [FullName], [Phone], [Address], [Gender], [Age], [Height], [Weight], [Avatar], [Status]) VALUES (5, 2, NULL, N'dat1@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [RoleID], [UserTeamID], [Email], [Password], [FullName], [Phone], [Address], [Gender], [Age], [Height], [Weight], [Avatar], [Status]) VALUES (6, 2, NULL, N'datnguyen1@gmail.com', N'25d55ad283aa400af464c76d713c07ad', N'Đạt Nè', NULL, NULL, NULL, NULL, NULL, NULL, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1731610028/mevpwraqhk39n7zqcqou.png', NULL)
INSERT [dbo].[User] ([UserID], [RoleID], [UserTeamID], [Email], [Password], [FullName], [Phone], [Address], [Gender], [Age], [Height], [Weight], [Avatar], [Status]) VALUES (7, 2, NULL, N'datnguyen2@gmail.com', N'25d55ad283aa400af464c76d713c07ad', N'Nguyen Van A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Active')
INSERT [dbo].[User] ([UserID], [RoleID], [UserTeamID], [Email], [Password], [FullName], [Phone], [Address], [Gender], [Age], [Height], [Weight], [Avatar], [Status]) VALUES (8, 2, NULL, N'datnguyen3@gmail.com', N'25d55ad283aa400af464c76d713c07ad', N'Nguyen Van B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Active')
INSERT [dbo].[User] ([UserID], [RoleID], [UserTeamID], [Email], [Password], [FullName], [Phone], [Address], [Gender], [Age], [Height], [Weight], [Avatar], [Status]) VALUES (9, 2, NULL, N'datnguyen4@gmail.com', N'25d55ad283aa400af464c76d713c07ad', N'Nguyen Van C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [RoleID], [UserTeamID], [Email], [Password], [FullName], [Phone], [Address], [Gender], [Age], [Height], [Weight], [Avatar], [Status]) VALUES (10, 2, NULL, N'datnguyen5@gmail.com', N'25d55ad283aa400af464c76d713c07ad', N'Tran Van D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [RoleID], [UserTeamID], [Email], [Password], [FullName], [Phone], [Address], [Gender], [Age], [Height], [Weight], [Avatar], [Status]) VALUES (11, 2, NULL, N'datnguyen6@gmail.com', N'25d55ad283aa400af464c76d713c07ad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [RoleID], [UserTeamID], [Email], [Password], [FullName], [Phone], [Address], [Gender], [Age], [Height], [Weight], [Avatar], [Status]) VALUES (12, 2, NULL, N'datnguyen7@gmail.com', N'25d55ad283aa400af464c76d713c07ad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [RoleID], [UserTeamID], [Email], [Password], [FullName], [Phone], [Address], [Gender], [Age], [Height], [Weight], [Avatar], [Status]) VALUES (13, 2, NULL, N'datnguyen9@gmail.com', N'25d55ad283aa400af464c76d713c07ad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [RoleID], [UserTeamID], [Email], [Password], [FullName], [Phone], [Address], [Gender], [Age], [Height], [Weight], [Avatar], [Status]) VALUES (14, 2, NULL, N'datnguyen10@gmail.com', N'25d55ad283aa400af464c76d713c07ad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [RoleID], [UserTeamID], [Email], [Password], [FullName], [Phone], [Address], [Gender], [Age], [Height], [Weight], [Avatar], [Status]) VALUES (1006, 2, NULL, N'datnguye1@gmail.com', N'25d55ad283aa400af464c76d713c07ad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [RoleID], [UserTeamID], [Email], [Password], [FullName], [Phone], [Address], [Gender], [Age], [Height], [Weight], [Avatar], [Status]) VALUES (1007, 2, NULL, N'datnguyen123@gmail.com', N'25d55ad283aa400af464c76d713c07ad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [RoleID], [UserTeamID], [Email], [Password], [FullName], [Phone], [Address], [Gender], [Age], [Height], [Weight], [Avatar], [Status]) VALUES (1008, 2, NULL, N'test1@gmail.com', N'25d55ad283aa400af464c76d713c07ad', N'Đạt Nguyễn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [RoleID], [UserTeamID], [Email], [Password], [FullName], [Phone], [Address], [Gender], [Age], [Height], [Weight], [Avatar], [Status]) VALUES (1009, 2, NULL, N'datnguyennn@gmail.com', N'25d55ad283aa400af464c76d713c07ad', N'Đạt Nguyễn', NULL, NULL, NULL, NULL, NULL, NULL, N'https://res.cloudinary.com/di6k4wpxl/image/upload/v1732880711/yjcirlu7mgw9tokesdpz.jpg', NULL)
INSERT [dbo].[User] ([UserID], [RoleID], [UserTeamID], [Email], [Password], [FullName], [Phone], [Address], [Gender], [Age], [Height], [Weight], [Avatar], [Status]) VALUES (1010, 2, NULL, N'tvkhung2002@gmail.com', N'25f9e794323b453885f5181f1b624d0b', N'Khánh Hưng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Active')
INSERT [dbo].[User] ([UserID], [RoleID], [UserTeamID], [Email], [Password], [FullName], [Phone], [Address], [Gender], [Age], [Height], [Weight], [Avatar], [Status]) VALUES (1011, 2, NULL, N'gaulubu1@gmail.com', N'25f9e794323b453885f5181f1b624d0b', N'Gau lubu1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Active')
INSERT [dbo].[User] ([UserID], [RoleID], [UserTeamID], [Email], [Password], [FullName], [Phone], [Address], [Gender], [Age], [Height], [Weight], [Avatar], [Status]) VALUES (1012, 2, NULL, N'gaulubu2@gmail.com', N'25f9e794323b453885f5181f1b624d0b', N'Gau lubu2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Active')
INSERT [dbo].[User] ([UserID], [RoleID], [UserTeamID], [Email], [Password], [FullName], [Phone], [Address], [Gender], [Age], [Height], [Weight], [Avatar], [Status]) VALUES (1013, 2, NULL, N'gaulubu3@gmail.com', N'25f9e794323b453885f5181f1b624d0b', N'Gau lubu 3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Active')
INSERT [dbo].[User] ([UserID], [RoleID], [UserTeamID], [Email], [Password], [FullName], [Phone], [Address], [Gender], [Age], [Height], [Weight], [Avatar], [Status]) VALUES (1014, 2, NULL, N'gaulubu4@gmail.com', N'25f9e794323b453885f5181f1b624d0b', N'Gau lubu 4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Active')
INSERT [dbo].[User] ([UserID], [RoleID], [UserTeamID], [Email], [Password], [FullName], [Phone], [Address], [Gender], [Age], [Height], [Weight], [Avatar], [Status]) VALUES (1015, 2, NULL, N'gaulubu5@gmail.com', N'25f9e794323b453885f5181f1b624d0b', N'gau lubu 5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Active')
INSERT [dbo].[User] ([UserID], [RoleID], [UserTeamID], [Email], [Password], [FullName], [Phone], [Address], [Gender], [Age], [Height], [Weight], [Avatar], [Status]) VALUES (1016, 2, NULL, N'gaulubu6@gmail.com', N'25f9e794323b453885f5181f1b624d0b', N'Khánh Hưng', N'234444444', N'rgger', NULL, 21, CAST(322.00 AS Decimal(5, 2)), CAST(77.00 AS Decimal(5, 2)), NULL, N'Active')
INSERT [dbo].[User] ([UserID], [RoleID], [UserTeamID], [Email], [Password], [FullName], [Phone], [Address], [Gender], [Age], [Height], [Weight], [Avatar], [Status]) VALUES (1017, 2, NULL, N'gaulubu7@gmail.com', N'25f9e794323b453885f5181f1b624d0b', N'Gau lubu7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Active')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[UserActivities] ON 

INSERT [dbo].[UserActivities] ([UserActivityID], [UserID], [ActivityID], [JoinDate], [RoleInActivity]) VALUES (1, 1, 4, CAST(N'2024-10-12T00:00:00.000' AS DateTime), N'Admin')
INSERT [dbo].[UserActivities] ([UserActivityID], [UserID], [ActivityID], [JoinDate], [RoleInActivity]) VALUES (2, 3, 4, CAST(N'2024-10-12T00:00:00.000' AS DateTime), N'Player')
INSERT [dbo].[UserActivities] ([UserActivityID], [UserID], [ActivityID], [JoinDate], [RoleInActivity]) VALUES (15, 7, 4, CAST(N'2024-11-05T18:50:02.407' AS DateTime), N'Player')
INSERT [dbo].[UserActivities] ([UserActivityID], [UserID], [ActivityID], [JoinDate], [RoleInActivity]) VALUES (16, 8, 4, CAST(N'2024-11-05T18:50:09.167' AS DateTime), N'Player')
INSERT [dbo].[UserActivities] ([UserActivityID], [UserID], [ActivityID], [JoinDate], [RoleInActivity]) VALUES (17, 1, 13, CAST(N'2024-11-06T22:46:20.610' AS DateTime), N'Admin')
INSERT [dbo].[UserActivities] ([UserActivityID], [UserID], [ActivityID], [JoinDate], [RoleInActivity]) VALUES (18, 1, 14, CAST(N'2024-11-06T22:53:23.673' AS DateTime), N'Admin')
INSERT [dbo].[UserActivities] ([UserActivityID], [UserID], [ActivityID], [JoinDate], [RoleInActivity]) VALUES (19, 1, 15, CAST(N'2024-11-06T22:55:09.680' AS DateTime), N'Admin')
INSERT [dbo].[UserActivities] ([UserActivityID], [UserID], [ActivityID], [JoinDate], [RoleInActivity]) VALUES (20, 1, 16, CAST(N'2024-11-06T22:57:27.053' AS DateTime), N'Admin')
INSERT [dbo].[UserActivities] ([UserActivityID], [UserID], [ActivityID], [JoinDate], [RoleInActivity]) VALUES (21, 1009, 17, CAST(N'2024-11-14T22:14:52.563' AS DateTime), N'Admin')
INSERT [dbo].[UserActivities] ([UserActivityID], [UserID], [ActivityID], [JoinDate], [RoleInActivity]) VALUES (22, 6, 17, CAST(N'2024-11-14T16:30:08.497' AS DateTime), N'Player')
INSERT [dbo].[UserActivities] ([UserActivityID], [UserID], [ActivityID], [JoinDate], [RoleInActivity]) VALUES (23, 1009, 18, CAST(N'2024-12-08T20:21:17.253' AS DateTime), N'Admin')
INSERT [dbo].[UserActivities] ([UserActivityID], [UserID], [ActivityID], [JoinDate], [RoleInActivity]) VALUES (24, 1011, 19, CAST(N'2024-12-10T20:53:55.847' AS DateTime), N'Admin')
INSERT [dbo].[UserActivities] ([UserActivityID], [UserID], [ActivityID], [JoinDate], [RoleInActivity]) VALUES (25, 1011, 20, CAST(N'2024-12-10T21:19:02.337' AS DateTime), N'Admin')
INSERT [dbo].[UserActivities] ([UserActivityID], [UserID], [ActivityID], [JoinDate], [RoleInActivity]) VALUES (26, 1015, 21, CAST(N'2024-12-20T23:15:11.740' AS DateTime), N'Admin')
INSERT [dbo].[UserActivities] ([UserActivityID], [UserID], [ActivityID], [JoinDate], [RoleInActivity]) VALUES (27, 1016, 21, CAST(N'2024-12-20T16:18:13.030' AS DateTime), N'Player')
INSERT [dbo].[UserActivities] ([UserActivityID], [UserID], [ActivityID], [JoinDate], [RoleInActivity]) VALUES (28, 1017, 21, CAST(N'2024-12-23T09:59:49.803' AS DateTime), N'Player')
INSERT [dbo].[UserActivities] ([UserActivityID], [UserID], [ActivityID], [JoinDate], [RoleInActivity]) VALUES (29, 1016, 22, CAST(N'2024-12-23T17:01:32.097' AS DateTime), N'Admin')
INSERT [dbo].[UserActivities] ([UserActivityID], [UserID], [ActivityID], [JoinDate], [RoleInActivity]) VALUES (30, 1017, 22, CAST(N'2024-12-23T10:02:17.937' AS DateTime), N'Player')
INSERT [dbo].[UserActivities] ([UserActivityID], [UserID], [ActivityID], [JoinDate], [RoleInActivity]) VALUES (31, 1015, 22, CAST(N'2024-12-23T10:20:37.570' AS DateTime), N'Player')
INSERT [dbo].[UserActivities] ([UserActivityID], [UserID], [ActivityID], [JoinDate], [RoleInActivity]) VALUES (32, 1014, 22, CAST(N'2024-12-23T10:20:40.740' AS DateTime), N'Player')
INSERT [dbo].[UserActivities] ([UserActivityID], [UserID], [ActivityID], [JoinDate], [RoleInActivity]) VALUES (33, 1013, 22, CAST(N'2024-12-23T10:20:45.397' AS DateTime), N'Player')
INSERT [dbo].[UserActivities] ([UserActivityID], [UserID], [ActivityID], [JoinDate], [RoleInActivity]) VALUES (1026, 1012, 1021, CAST(N'2024-12-30T21:14:18.827' AS DateTime), N'Admin')
INSERT [dbo].[UserActivities] ([UserActivityID], [UserID], [ActivityID], [JoinDate], [RoleInActivity]) VALUES (1027, 1012, 1022, CAST(N'2024-12-30T21:14:21.580' AS DateTime), N'Admin')
INSERT [dbo].[UserActivities] ([UserActivityID], [UserID], [ActivityID], [JoinDate], [RoleInActivity]) VALUES (1028, 1011, 1023, CAST(N'2025-01-06T08:58:47.403' AS DateTime), N'Admin')
INSERT [dbo].[UserActivities] ([UserActivityID], [UserID], [ActivityID], [JoinDate], [RoleInActivity]) VALUES (1029, 1012, 1024, CAST(N'2025-01-06T09:01:31.993' AS DateTime), N'Admin')
INSERT [dbo].[UserActivities] ([UserActivityID], [UserID], [ActivityID], [JoinDate], [RoleInActivity]) VALUES (1030, 1011, 1024, CAST(N'2025-01-06T02:02:23.177' AS DateTime), N'Player')
INSERT [dbo].[UserActivities] ([UserActivityID], [UserID], [ActivityID], [JoinDate], [RoleInActivity]) VALUES (1031, 1011, 1022, CAST(N'2025-01-06T02:07:43.737' AS DateTime), N'Player')
SET IDENTITY_INSERT [dbo].[UserActivities] OFF
GO
SET IDENTITY_INSERT [dbo].[UserActivityClub] ON 

INSERT [dbo].[UserActivityClub] ([UserActivityClubID], [UserID], [ActivityID], [ClubID], [JoinDate], [Role], [Status]) VALUES (1, 1, 1, 7, CAST(N'2024-12-06T14:29:50.000' AS DateTime), N'Player', N'1')
INSERT [dbo].[UserActivityClub] ([UserActivityClubID], [UserID], [ActivityID], [ClubID], [JoinDate], [Role], [Status]) VALUES (2, 1009, 2, 7, CAST(N'2024-12-08T20:23:59.847' AS DateTime), N'Admin', NULL)
INSERT [dbo].[UserActivityClub] ([UserActivityClubID], [UserID], [ActivityID], [ClubID], [JoinDate], [Role], [Status]) VALUES (3, 1009, 3, 7, CAST(N'2024-12-08T20:25:20.067' AS DateTime), N'Admin', NULL)
INSERT [dbo].[UserActivityClub] ([UserActivityClubID], [UserID], [ActivityID], [ClubID], [JoinDate], [Role], [Status]) VALUES (4, 1, 4, 1, CAST(N'2024-12-08T20:40:10.420' AS DateTime), N'Admin', N'Active')
INSERT [dbo].[UserActivityClub] ([UserActivityClubID], [UserID], [ActivityID], [ClubID], [JoinDate], [Role], [Status]) VALUES (5, 1009, 4, 1, CAST(N'2024-12-08T21:06:25.760' AS DateTime), N'Player', N'Active')
INSERT [dbo].[UserActivityClub] ([UserActivityClubID], [UserID], [ActivityID], [ClubID], [JoinDate], [Role], [Status]) VALUES (6, 1010, 5, 8, CAST(N'2024-12-10T21:22:17.920' AS DateTime), N'Admin', N'Active')
INSERT [dbo].[UserActivityClub] ([UserActivityClubID], [UserID], [ActivityID], [ClubID], [JoinDate], [Role], [Status]) VALUES (7, 1017, 5, 8, CAST(N'2024-12-27T20:44:26.620' AS DateTime), N'Player', N'Active')
INSERT [dbo].[UserActivityClub] ([UserActivityClubID], [UserID], [ActivityID], [ClubID], [JoinDate], [Role], [Status]) VALUES (8, 1013, 5, 8, CAST(N'2024-12-27T20:46:55.367' AS DateTime), N'Player', N'Active')
INSERT [dbo].[UserActivityClub] ([UserActivityClubID], [UserID], [ActivityID], [ClubID], [JoinDate], [Role], [Status]) VALUES (9, 1012, 5, 8, CAST(N'2024-12-27T20:49:02.690' AS DateTime), N'Player', N'Active')
INSERT [dbo].[UserActivityClub] ([UserActivityClubID], [UserID], [ActivityID], [ClubID], [JoinDate], [Role], [Status]) VALUES (10, 1012, 6, 10, CAST(N'2025-01-06T09:21:25.820' AS DateTime), N'Admin', N'Active')
INSERT [dbo].[UserActivityClub] ([UserActivityClubID], [UserID], [ActivityID], [ClubID], [JoinDate], [Role], [Status]) VALUES (11, 1011, 6, 10, CAST(N'2025-01-06T09:23:59.030' AS DateTime), N'Player', N'Active')
INSERT [dbo].[UserActivityClub] ([UserActivityClubID], [UserID], [ActivityID], [ClubID], [JoinDate], [Role], [Status]) VALUES (12, 1011, 7, 9, CAST(N'2025-01-07T16:19:58.900' AS DateTime), N'Admin', N'Active')
SET IDENTITY_INSERT [dbo].[UserActivityClub] OFF
GO
SET IDENTITY_INSERT [dbo].[UserClub] ON 

INSERT [dbo].[UserClub] ([UserClubID], [ClubID], [UserID], [Role], [JoinDate], [Status]) VALUES (1, 1, 1, N'Leader', CAST(N'2024-01-15T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[UserClub] ([UserClubID], [ClubID], [UserID], [Role], [JoinDate], [Status]) VALUES (2, 2, 3, N'Leader', CAST(N'2024-04-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[UserClub] ([UserClubID], [ClubID], [UserID], [Role], [JoinDate], [Status]) VALUES (3, 3, 4, N'Leader', CAST(N'2024-08-15T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[UserClub] ([UserClubID], [ClubID], [UserID], [Role], [JoinDate], [Status]) VALUES (4, 1, 2, N'Player', CAST(N'2024-02-10T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[UserClub] ([UserClubID], [ClubID], [UserID], [Role], [JoinDate], [Status]) VALUES (8, 2, 2, N'Player', CAST(N'2024-05-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[UserClub] ([UserClubID], [ClubID], [UserID], [Role], [JoinDate], [Status]) VALUES (9, 2, 4, N'Player', CAST(N'2024-05-11T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[UserClub] ([UserClubID], [ClubID], [UserID], [Role], [JoinDate], [Status]) VALUES (11, 4, 1, N'Leader', CAST(N'2024-12-06T00:07:01.323' AS DateTime), 1)
INSERT [dbo].[UserClub] ([UserClubID], [ClubID], [UserID], [Role], [JoinDate], [Status]) VALUES (12, 5, 1009, N'Leader', CAST(N'2024-12-06T00:09:47.157' AS DateTime), 1)
INSERT [dbo].[UserClub] ([UserClubID], [ClubID], [UserID], [Role], [JoinDate], [Status]) VALUES (13, 6, 1009, N'Leader', CAST(N'2024-12-06T00:11:47.817' AS DateTime), 1)
INSERT [dbo].[UserClub] ([UserClubID], [ClubID], [UserID], [Role], [JoinDate], [Status]) VALUES (14, 7, 1009, N'Leader', CAST(N'2024-12-06T00:31:47.503' AS DateTime), 1)
INSERT [dbo].[UserClub] ([UserClubID], [ClubID], [UserID], [Role], [JoinDate], [Status]) VALUES (1012, 1, 1009, N'Player', CAST(N'2024-12-08T20:39:05.650' AS DateTime), 1)
INSERT [dbo].[UserClub] ([UserClubID], [ClubID], [UserID], [Role], [JoinDate], [Status]) VALUES (1013, 8, 1010, N'Leader', CAST(N'2024-12-10T20:33:55.047' AS DateTime), 1)
INSERT [dbo].[UserClub] ([UserClubID], [ClubID], [UserID], [Role], [JoinDate], [Status]) VALUES (1015, 8, 1011, N'Player', CAST(N'2024-12-10T20:35:47.403' AS DateTime), 1)
INSERT [dbo].[UserClub] ([UserClubID], [ClubID], [UserID], [Role], [JoinDate], [Status]) VALUES (1017, 9, 1011, N'Leader', CAST(N'2024-12-10T20:52:51.603' AS DateTime), 1)
INSERT [dbo].[UserClub] ([UserClubID], [ClubID], [UserID], [Role], [JoinDate], [Status]) VALUES (1018, 8, 1017, N'Player', CAST(N'2024-12-27T20:43:17.673' AS DateTime), 1)
INSERT [dbo].[UserClub] ([UserClubID], [ClubID], [UserID], [Role], [JoinDate], [Status]) VALUES (1019, 8, 1013, N'Player', CAST(N'2024-12-27T20:46:35.073' AS DateTime), 1)
INSERT [dbo].[UserClub] ([UserClubID], [ClubID], [UserID], [Role], [JoinDate], [Status]) VALUES (1020, 8, 1012, N'Player', CAST(N'2024-12-27T20:48:46.063' AS DateTime), 1)
INSERT [dbo].[UserClub] ([UserClubID], [ClubID], [UserID], [Role], [JoinDate], [Status]) VALUES (1021, 10, 1012, N'Leader', CAST(N'2025-01-06T09:19:37.570' AS DateTime), 1)
INSERT [dbo].[UserClub] ([UserClubID], [ClubID], [UserID], [Role], [JoinDate], [Status]) VALUES (1022, 10, 1011, N'Player', CAST(N'2025-01-06T09:20:28.753' AS DateTime), 1)
INSERT [dbo].[UserClub] ([UserClubID], [ClubID], [UserID], [Role], [JoinDate], [Status]) VALUES (1023, 9, 1012, N'Player', CAST(N'2025-01-07T16:20:49.500' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[UserClub] OFF
GO
SET IDENTITY_INSERT [dbo].[UserSport] ON 

INSERT [dbo].[UserSport] ([UserSportID], [UserID], [SportID], [LevelID], [Achievement], [Position]) VALUES (1, 1, 1, 2, NULL, NULL)
INSERT [dbo].[UserSport] ([UserSportID], [UserID], [SportID], [LevelID], [Achievement], [Position]) VALUES (2, 2, 1, 2, NULL, NULL)
INSERT [dbo].[UserSport] ([UserSportID], [UserID], [SportID], [LevelID], [Achievement], [Position]) VALUES (3, 3, 1, 2, NULL, NULL)
INSERT [dbo].[UserSport] ([UserSportID], [UserID], [SportID], [LevelID], [Achievement], [Position]) VALUES (4, 4, 1, 2, NULL, NULL)
INSERT [dbo].[UserSport] ([UserSportID], [UserID], [SportID], [LevelID], [Achievement], [Position]) VALUES (6, 7, 1, 2, NULL, NULL)
INSERT [dbo].[UserSport] ([UserSportID], [UserID], [SportID], [LevelID], [Achievement], [Position]) VALUES (7, 8, 1, 3, NULL, NULL)
INSERT [dbo].[UserSport] ([UserSportID], [UserID], [SportID], [LevelID], [Achievement], [Position]) VALUES (8, 1009, 2, 2, NULL, NULL)
INSERT [dbo].[UserSport] ([UserSportID], [UserID], [SportID], [LevelID], [Achievement], [Position]) VALUES (9, 1009, 1, 1, NULL, NULL)
INSERT [dbo].[UserSport] ([UserSportID], [UserID], [SportID], [LevelID], [Achievement], [Position]) VALUES (10, 6, 3, 3, NULL, NULL)
INSERT [dbo].[UserSport] ([UserSportID], [UserID], [SportID], [LevelID], [Achievement], [Position]) VALUES (11, 1009, 6, 2, NULL, NULL)
INSERT [dbo].[UserSport] ([UserSportID], [UserID], [SportID], [LevelID], [Achievement], [Position]) VALUES (12, 1017, 1, 2, NULL, NULL)
INSERT [dbo].[UserSport] ([UserSportID], [UserID], [SportID], [LevelID], [Achievement], [Position]) VALUES (13, 1011, 2, 2, NULL, NULL)
INSERT [dbo].[UserSport] ([UserSportID], [UserID], [SportID], [LevelID], [Achievement], [Position]) VALUES (14, 1011, 1, 2, NULL, NULL)
INSERT [dbo].[UserSport] ([UserSportID], [UserID], [SportID], [LevelID], [Achievement], [Position]) VALUES (15, 1011, 3, 2, NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserSport] OFF
GO
SET IDENTITY_INSERT [dbo].[UserTeam] ON 

INSERT [dbo].[UserTeam] ([UserTeamID], [UserID], [TeamID]) VALUES (1, 1, 1)
INSERT [dbo].[UserTeam] ([UserTeamID], [UserID], [TeamID]) VALUES (2, 2, 2)
INSERT [dbo].[UserTeam] ([UserTeamID], [UserID], [TeamID]) VALUES (3, 3, 3)
INSERT [dbo].[UserTeam] ([UserTeamID], [UserID], [TeamID]) VALUES (4, 4, 4)
SET IDENTITY_INSERT [dbo].[UserTeam] OFF
GO
ALTER TABLE [dbo].[requestJoinActivity] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[RequestJoinClub] ADD  DEFAULT (getdate()) FOR [Createdate]
GO
ALTER TABLE [dbo].[UserClub] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Activities]  WITH CHECK ADD  CONSTRAINT [FK_Activities_Level] FOREIGN KEY([LevelID])
REFERENCES [dbo].[Level] ([LevelID])
GO
ALTER TABLE [dbo].[Activities] CHECK CONSTRAINT [FK_Activities_Level]
GO
ALTER TABLE [dbo].[Activities]  WITH CHECK ADD  CONSTRAINT [FK_Activities_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Activities] CHECK CONSTRAINT [FK_Activities_User]
GO
ALTER TABLE [dbo].[ActivitiesClub]  WITH CHECK ADD  CONSTRAINT [FK_Activities_Club] FOREIGN KEY([ClubID])
REFERENCES [dbo].[Club] ([ClubID])
GO
ALTER TABLE [dbo].[ActivitiesClub] CHECK CONSTRAINT [FK_Activities_Club]
GO
ALTER TABLE [dbo].[ActivitiesClub]  WITH CHECK ADD  CONSTRAINT [FK_Activities_Level_Club] FOREIGN KEY([LevelID])
REFERENCES [dbo].[Level] ([LevelID])
GO
ALTER TABLE [dbo].[ActivitiesClub] CHECK CONSTRAINT [FK_Activities_Level_Club]
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [FK_Admin_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Admin_Role]
GO
ALTER TABLE [dbo].[Club]  WITH CHECK ADD  CONSTRAINT [FK_Club_Level] FOREIGN KEY([LevelID])
REFERENCES [dbo].[Level] ([LevelID])
GO
ALTER TABLE [dbo].[Club] CHECK CONSTRAINT [FK_Club_Level]
GO
ALTER TABLE [dbo].[Club]  WITH CHECK ADD  CONSTRAINT [FK_Club_Sport] FOREIGN KEY([SportID])
REFERENCES [dbo].[Sport] ([SportID])
GO
ALTER TABLE [dbo].[Club] CHECK CONSTRAINT [FK_Club_Sport]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Activity] FOREIGN KEY([ActivityID])
REFERENCES [dbo].[Activities] ([ActivityID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Activity]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Tournament] FOREIGN KEY([TournamentID])
REFERENCES [dbo].[Tournaments] ([TournamentID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Tournament]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
ALTER TABLE [dbo].[Fee]  WITH CHECK ADD  CONSTRAINT [FK_Fee_Tournament] FOREIGN KEY([TournamentID])
REFERENCES [dbo].[Tournaments] ([TournamentID])
GO
ALTER TABLE [dbo].[Fee] CHECK CONSTRAINT [FK_Fee_Tournament]
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK_Match_Round] FOREIGN KEY([RoundID])
REFERENCES [dbo].[Round] ([RoundID])
GO
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK_Match_Round]
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK_Match_Team1] FOREIGN KEY([Team1ID])
REFERENCES [dbo].[Team] ([TeamID])
GO
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK_Match_Team1]
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK_Match_Team2] FOREIGN KEY([Team2ID])
REFERENCES [dbo].[Team] ([TeamID])
GO
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK_Match_Team2]
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK_Match_Tournaments] FOREIGN KEY([TournamentId])
REFERENCES [dbo].[Tournaments] ([TournamentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK_Match_Tournaments]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Activity] FOREIGN KEY([ActivityID])
REFERENCES [dbo].[Activities] ([ActivityID])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_Activity]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Tournament] FOREIGN KEY([TournamentID])
REFERENCES [dbo].[Tournaments] ([TournamentID])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_Tournament]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_User]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Club] FOREIGN KEY([ClubID])
REFERENCES [dbo].[Club] ([ClubID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Club]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Tournament] FOREIGN KEY([TournamentID])
REFERENCES [dbo].[Tournaments] ([TournamentID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Tournament]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_User]
GO
ALTER TABLE [dbo].[requestJoinActivity]  WITH CHECK ADD  CONSTRAINT [FK_requestJoinActivity_Activity] FOREIGN KEY([ActivitiesID])
REFERENCES [dbo].[Activities] ([ActivityID])
GO
ALTER TABLE [dbo].[requestJoinActivity] CHECK CONSTRAINT [FK_requestJoinActivity_Activity]
GO
ALTER TABLE [dbo].[requestJoinActivity]  WITH CHECK ADD  CONSTRAINT [FK_requestJoinActivity_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[requestJoinActivity] CHECK CONSTRAINT [FK_requestJoinActivity_User]
GO
ALTER TABLE [dbo].[RequestJoinClub]  WITH CHECK ADD  CONSTRAINT [FK_RequestJoinClub_Club] FOREIGN KEY([Club_id])
REFERENCES [dbo].[Club] ([ClubID])
GO
ALTER TABLE [dbo].[RequestJoinClub] CHECK CONSTRAINT [FK_RequestJoinClub_Club]
GO
ALTER TABLE [dbo].[RequestJoinClub]  WITH CHECK ADD  CONSTRAINT [FK_RequestJoinClub_User] FOREIGN KEY([User_id])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[RequestJoinClub] CHECK CONSTRAINT [FK_RequestJoinClub_User]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_Match] FOREIGN KEY([MatchID])
REFERENCES [dbo].[Match] ([MatchID])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_Match]
GO
ALTER TABLE [dbo].[ResultOfActivities]  WITH CHECK ADD  CONSTRAINT [FK_ResultOfActivities_Activity] FOREIGN KEY([ActivityID])
REFERENCES [dbo].[Activities] ([ActivityID])
GO
ALTER TABLE [dbo].[ResultOfActivities] CHECK CONSTRAINT [FK_ResultOfActivities_Activity]
GO
ALTER TABLE [dbo].[ResultOfActivitiesClub]  WITH CHECK ADD  CONSTRAINT [FK_ResultOfActivities_ActivityClub] FOREIGN KEY([ActivityClubID])
REFERENCES [dbo].[ActivitiesClub] ([ActivityClubID])
GO
ALTER TABLE [dbo].[ResultOfActivitiesClub] CHECK CONSTRAINT [FK_ResultOfActivities_ActivityClub]
GO
ALTER TABLE [dbo].[Round]  WITH CHECK ADD  CONSTRAINT [FK_Round_Tournament] FOREIGN KEY([TournamentID])
REFERENCES [dbo].[Tournaments] ([TournamentID])
GO
ALTER TABLE [dbo].[Round] CHECK CONSTRAINT [FK_Round_Tournament]
GO
ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [FK_Team_Tournament] FOREIGN KEY([TournamentID])
REFERENCES [dbo].[Tournaments] ([TournamentID])
GO
ALTER TABLE [dbo].[Team] CHECK CONSTRAINT [FK_Team_Tournament]
GO
ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [FK_Team_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Team] CHECK CONSTRAINT [FK_Team_User]
GO
ALTER TABLE [dbo].[TeamTournament]  WITH CHECK ADD  CONSTRAINT [FK_TeamTournament_Team] FOREIGN KEY([TeamID])
REFERENCES [dbo].[Team] ([TeamID])
GO
ALTER TABLE [dbo].[TeamTournament] CHECK CONSTRAINT [FK_TeamTournament_Team]
GO
ALTER TABLE [dbo].[Tournaments]  WITH CHECK ADD  CONSTRAINT [FK_Tournaments_Level] FOREIGN KEY([LevelID])
REFERENCES [dbo].[Level] ([LevelID])
GO
ALTER TABLE [dbo].[Tournaments] CHECK CONSTRAINT [FK_Tournaments_Level]
GO
ALTER TABLE [dbo].[Tournaments]  WITH CHECK ADD  CONSTRAINT [FK_Tournaments_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Tournaments] CHECK CONSTRAINT [FK_Tournaments_User]
GO
ALTER TABLE [dbo].[TransferHistory]  WITH CHECK ADD  CONSTRAINT [FK_ReceiverAdmin] FOREIGN KEY([ReceiverAdminID])
REFERENCES [dbo].[Admin] ([AdminID])
GO
ALTER TABLE [dbo].[TransferHistory] CHECK CONSTRAINT [FK_ReceiverAdmin]
GO
ALTER TABLE [dbo].[TransferHistory]  WITH CHECK ADD  CONSTRAINT [FK_ReceiverClub] FOREIGN KEY([ReceiverClubID])
REFERENCES [dbo].[Club] ([ClubID])
GO
ALTER TABLE [dbo].[TransferHistory] CHECK CONSTRAINT [FK_ReceiverClub]
GO
ALTER TABLE [dbo].[TransferHistory]  WITH CHECK ADD  CONSTRAINT [FK_SenderAdmin] FOREIGN KEY([SenderAdminID])
REFERENCES [dbo].[Admin] ([AdminID])
GO
ALTER TABLE [dbo].[TransferHistory] CHECK CONSTRAINT [FK_SenderAdmin]
GO
ALTER TABLE [dbo].[TransferHistory]  WITH CHECK ADD  CONSTRAINT [FK_SenderClub] FOREIGN KEY([SenderClubID])
REFERENCES [dbo].[Club] ([ClubID])
GO
ALTER TABLE [dbo].[TransferHistory] CHECK CONSTRAINT [FK_SenderClub]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[UserActivities]  WITH CHECK ADD  CONSTRAINT [FK_UserActivities_Activity] FOREIGN KEY([ActivityID])
REFERENCES [dbo].[Activities] ([ActivityID])
GO
ALTER TABLE [dbo].[UserActivities] CHECK CONSTRAINT [FK_UserActivities_Activity]
GO
ALTER TABLE [dbo].[UserActivities]  WITH CHECK ADD  CONSTRAINT [FK_UserActivities_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[UserActivities] CHECK CONSTRAINT [FK_UserActivities_User]
GO
ALTER TABLE [dbo].[UserActivityClub]  WITH CHECK ADD  CONSTRAINT [FK_UserActivityClub_ActivityClub] FOREIGN KEY([ActivityID])
REFERENCES [dbo].[ActivitiesClub] ([ActivityClubID])
GO
ALTER TABLE [dbo].[UserActivityClub] CHECK CONSTRAINT [FK_UserActivityClub_ActivityClub]
GO
ALTER TABLE [dbo].[UserActivityClub]  WITH CHECK ADD  CONSTRAINT [FK_UserActivityClub_Club] FOREIGN KEY([ClubID])
REFERENCES [dbo].[Club] ([ClubID])
GO
ALTER TABLE [dbo].[UserActivityClub] CHECK CONSTRAINT [FK_UserActivityClub_Club]
GO
ALTER TABLE [dbo].[UserActivityClub]  WITH CHECK ADD  CONSTRAINT [FK_UserActivityClub_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[UserActivityClub] CHECK CONSTRAINT [FK_UserActivityClub_User]
GO
ALTER TABLE [dbo].[UserClub]  WITH CHECK ADD  CONSTRAINT [FK_UserClub_Club] FOREIGN KEY([ClubID])
REFERENCES [dbo].[Club] ([ClubID])
GO
ALTER TABLE [dbo].[UserClub] CHECK CONSTRAINT [FK_UserClub_Club]
GO
ALTER TABLE [dbo].[UserClub]  WITH CHECK ADD  CONSTRAINT [FK_UserClub_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[UserClub] CHECK CONSTRAINT [FK_UserClub_User]
GO
ALTER TABLE [dbo].[UserSport]  WITH CHECK ADD  CONSTRAINT [FK_UserSport_Level] FOREIGN KEY([LevelID])
REFERENCES [dbo].[Level] ([LevelID])
GO
ALTER TABLE [dbo].[UserSport] CHECK CONSTRAINT [FK_UserSport_Level]
GO
ALTER TABLE [dbo].[UserSport]  WITH CHECK ADD  CONSTRAINT [FK_UserSport_Sport] FOREIGN KEY([SportID])
REFERENCES [dbo].[Sport] ([SportID])
GO
ALTER TABLE [dbo].[UserSport] CHECK CONSTRAINT [FK_UserSport_Sport]
GO
ALTER TABLE [dbo].[UserSport]  WITH CHECK ADD  CONSTRAINT [FK_UserSport_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[UserSport] CHECK CONSTRAINT [FK_UserSport_User]
GO
ALTER TABLE [dbo].[UserTeam]  WITH CHECK ADD  CONSTRAINT [FK_UserTeam_Team] FOREIGN KEY([TeamID])
REFERENCES [dbo].[Team] ([TeamID])
GO
ALTER TABLE [dbo].[UserTeam] CHECK CONSTRAINT [FK_UserTeam_Team]
GO
ALTER TABLE [dbo].[UserTeam]  WITH CHECK ADD  CONSTRAINT [FK_UserTeam_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[UserTeam] CHECK CONSTRAINT [FK_UserTeam_User]
GO
