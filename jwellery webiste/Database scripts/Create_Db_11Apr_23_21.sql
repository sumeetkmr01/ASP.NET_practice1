USE [BhavyaDiamonds]
GO
/****** Object:  Table [dbo].[ProductReg]    Script Date: 05/11/2016 23:18:09 ******/
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
INSERT [dbo].[ProductReg] ([ID], [PName], [PDesc], [PCategoryID], [PPIC]) VALUES (1, N'neck', N'bgjgh', N'Cat1', NULL)
INSERT [dbo].[ProductReg] ([ID], [PName], [PDesc], [PCategoryID], [PPIC]) VALUES (2, N'ear', N'gsgj', N'Cat2', NULL)
INSERT [dbo].[ProductReg] ([ID], [PName], [PDesc], [PCategoryID], [PPIC]) VALUES (3, N'diamond', N'mv v', N'Cat3', NULL)
INSERT [dbo].[ProductReg] ([ID], [PName], [PDesc], [PCategoryID], [PPIC]) VALUES (4, N'anklets', N'kdbvk', N'Cat4', NULL)
INSERT [dbo].[ProductReg] ([ID], [PName], [PDesc], [PCategoryID], [PPIC]) VALUES (5, N'brace', N'1wufh', N'Cat6', NULL)
INSERT [dbo].[ProductReg] ([ID], [PName], [PDesc], [PCategoryID], [PPIC]) VALUES (6, N'bang', N'hfkeghk', N'Cat7', NULL)
INSERT [dbo].[ProductReg] ([ID], [PName], [PDesc], [PCategoryID], [PPIC]) VALUES (7, N'neclan', N'tgjj', N'Cat1', NULL)
INSERT [dbo].[ProductReg] ([ID], [PName], [PDesc], [PCategoryID], [PPIC]) VALUES (8, N'kangh', N'hsk', N'Cat8', NULL)
INSERT [dbo].[ProductReg] ([ID], [PName], [PDesc], [PCategoryID], [PPIC]) VALUES (9, N'carbj', N'guhg', N'Cat9', NULL)
INSERT [dbo].[ProductReg] ([ID], [PName], [PDesc], [PCategoryID], [PPIC]) VALUES (10, N'nb', N'nm', N'Cat16', NULL)
INSERT [dbo].[ProductReg] ([ID], [PName], [PDesc], [PCategoryID], [PPIC]) VALUES (11, N'cate', N'fy', N'Cat1', NULL)
INSERT [dbo].[ProductReg] ([ID], [PName], [PDesc], [PCategoryID], [PPIC]) VALUES (12, N'nb', N'n', N'Cat20', NULL)
INSERT [dbo].[ProductReg] ([ID], [PName], [PDesc], [PCategoryID], [PPIC]) VALUES (13, N'n', N'', N'Cat1', NULL)
INSERT [dbo].[ProductReg] ([ID], [PName], [PDesc], [PCategoryID], [PPIC]) VALUES (16, N'nm', N'jj', N'Cat1', NULL)
INSERT [dbo].[ProductReg] ([ID], [PName], [PDesc], [PCategoryID], [PPIC]) VALUES (17, N'g', N'n', N'Cat5', N'12.jpg')
INSERT [dbo].[ProductReg] ([ID], [PName], [PDesc], [PCategoryID], [PPIC]) VALUES (18, N'uH', N'ui', N'Cat4', N'12.jpg')
INSERT [dbo].[ProductReg] ([ID], [PName], [PDesc], [PCategoryID], [PPIC]) VALUES (19, N'j', N'h', N'Cat19', N'Amazing Drawings (30).jpg')
INSERT [dbo].[ProductReg] ([ID], [PName], [PDesc], [PCategoryID], [PPIC]) VALUES (14, N'h', N'', N'Cat1', NULL)
INSERT [dbo].[ProductReg] ([ID], [PName], [PDesc], [PCategoryID], [PPIC]) VALUES (15, N'b', N'', N'Cat6', NULL)
SET IDENTITY_INSERT [dbo].[ProductReg] OFF
/****** Object:  Table [dbo].[Login]    Script Date: 05/11/2016 23:18:09 ******/
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
	[Password] [varchar](max) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Login] ON
INSERT [dbo].[Login] ([ID], [Name], [UserName], [Password]) VALUES (1, N'madhvi', N'madhvi', N'm')
INSERT [dbo].[Login] ([ID], [Name], [UserName], [Password]) VALUES (2, N'check', N'c', N'c')
INSERT [dbo].[Login] ([ID], [Name], [UserName], [Password]) VALUES (8, N'dsw', N'890', N'tet')
INSERT [dbo].[Login] ([ID], [Name], [UserName], [Password]) VALUES (5, N'dsw', N'345', N'tet')
INSERT [dbo].[Login] ([ID], [Name], [UserName], [Password]) VALUES (6, N'dsw', N'34', N'tet')
INSERT [dbo].[Login] ([ID], [Name], [UserName], [Password]) VALUES (3, N'3ii4', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Login] OFF
/****** Object:  Table [dbo].[Category]    Script Date: 05/11/2016 23:18:09 ******/
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
SET IDENTITY_INSERT [dbo].[Category] OFF
