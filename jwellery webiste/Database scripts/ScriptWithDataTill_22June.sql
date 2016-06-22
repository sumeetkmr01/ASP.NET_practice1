USE [BhavyaDiamonds]
GO
/****** Object:  Table [dbo].[ProductReg]    Script Date: 06/22/2016 23:16:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductReg](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PName] [varchar](max) NULL,
	[PDesc] [varchar](max) NULL,
	[PCategoryID] [varchar](max) NULL,
	[PProdID]  AS ('Prod'+CONVERT([varchar](10),[ID],(0))),
	[Date]  AS (dateadd(minute,(330),getutcdate())),
	[PPIC] [varchar](max) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ProductReg] ON
INSERT [dbo].[ProductReg] ([ID], [PName], [PDesc], [PCategoryID], [PPIC]) VALUES (1, N'FIRST', N'FDFD', N'Cat1', N'~/Uploads/ne.jpg')
INSERT [dbo].[ProductReg] ([ID], [PName], [PDesc], [PCategoryID], [PPIC]) VALUES (2, N'FGF', N'JGFHDG', N'Cat8', N'unnamed (3).jpg')
INSERT [dbo].[ProductReg] ([ID], [PName], [PDesc], [PCategoryID], [PPIC]) VALUES (3, N'FIRST', N'FDFD', N'Cat7', N'~/Uploads/ne.jpg')
SET IDENTITY_INSERT [dbo].[ProductReg] OFF
/****** Object:  Table [dbo].[Login]    Script Date: 06/22/2016 23:16:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Login](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NULL,
	[UserName] [varchar](max) NULL,
	[Password] [varchar](max) NULL,
	[UpdateColumn] [varchar](max) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Login] ON
INSERT [dbo].[Login] ([ID], [Name], [UserName], [Password], [UpdateColumn]) VALUES (1, N'madhvi', N'madhvi', N'm', NULL)
INSERT [dbo].[Login] ([ID], [Name], [UserName], [Password], [UpdateColumn]) VALUES (2, N'check', N'c', N'c', NULL)
INSERT [dbo].[Login] ([ID], [Name], [UserName], [Password], [UpdateColumn]) VALUES (8, N'dsw', N'890', N'tet', NULL)
INSERT [dbo].[Login] ([ID], [Name], [UserName], [Password], [UpdateColumn]) VALUES (5, N'dsw', N'345', N'tet', NULL)
INSERT [dbo].[Login] ([ID], [Name], [UserName], [Password], [UpdateColumn]) VALUES (6, N'dsw', N'34', N'tet', NULL)
INSERT [dbo].[Login] ([ID], [Name], [UserName], [Password], [UpdateColumn]) VALUES (3, N'3ii4', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Login] OFF
/****** Object:  Table [dbo].[Category]    Script Date: 06/22/2016 23:16:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Category] [varchar](800) NULL,
	[Description] [varchar](max) NULL,
	[CatID]  AS ('Cat'+CONVERT([varchar](10),[ID],(0))),
	[Date]  AS (dateadd(minute,(330),getutcdate())),
 CONSTRAINT [IX_Category] UNIQUE NONCLUSTERED 
(
	[Category] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON
INSERT [dbo].[Category] ([ID], [Category], [Description]) VALUES (1, N'necklace', N'jk')
INSERT [dbo].[Category] ([ID], [Category], [Description]) VALUES (2, N'earning', N'lkjlhgf')
INSERT [dbo].[Category] ([ID], [Category], [Description]) VALUES (3, N'diamond necklace', N'uitur')
INSERT [dbo].[Category] ([ID], [Category], [Description]) VALUES (4, N'anklets', N'uitur')
INSERT [dbo].[Category] ([ID], [Category], [Description]) VALUES (5, N'nose pin', N'bhjnmj')
INSERT [dbo].[Category] ([ID], [Category], [Description]) VALUES (6, N'bracelets ', N'hkhjkj')
INSERT [dbo].[Category] ([ID], [Category], [Description]) VALUES (7, N'bangles', N'hkhfkfl')
INSERT [dbo].[Category] ([ID], [Category], [Description]) VALUES (8, N'Kangan', N',kigwj')
INSERT [dbo].[Category] ([ID], [Category], [Description]) VALUES (9, N'cate', N'hjl')
INSERT [dbo].[Category] ([ID], [Category], [Description]) VALUES (16, N'category', N'bjgj')
INSERT [dbo].[Category] ([ID], [Category], [Description]) VALUES (17, N'cat', N'hkhj')
INSERT [dbo].[Category] ([ID], [Category], [Description]) VALUES (19, N'csytu', N'nlk')
INSERT [dbo].[Category] ([ID], [Category], [Description]) VALUES (20, N'fhhi', N'vjg')
INSERT [dbo].[Category] ([ID], [Category], [Description]) VALUES (23, N'NECKLACE1', N'JKHHYGH')
INSERT [dbo].[Category] ([ID], [Category], [Description]) VALUES (24, N'EARNINGQQ', N'UPDFATYE')
SET IDENTITY_INSERT [dbo].[Category] OFF
