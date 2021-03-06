USE [master]
GO
/****** Object:  Database [bac_checker]    Script Date: 6/22/2017 3:00:31 PM ******/
CREATE DATABASE [bac_checker]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bac_checker', FILENAME = N'C:\Users\epicodus\bac_checker.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bac_checker_log', FILENAME = N'C:\Users\epicodus\bac_checker_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [bac_checker] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bac_checker].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bac_checker] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bac_checker] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bac_checker] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bac_checker] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bac_checker] SET ARITHABORT OFF 
GO
ALTER DATABASE [bac_checker] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [bac_checker] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bac_checker] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bac_checker] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bac_checker] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bac_checker] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bac_checker] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bac_checker] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bac_checker] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bac_checker] SET  ENABLE_BROKER 
GO
ALTER DATABASE [bac_checker] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bac_checker] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bac_checker] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bac_checker] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bac_checker] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bac_checker] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bac_checker] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bac_checker] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [bac_checker] SET  MULTI_USER 
GO
ALTER DATABASE [bac_checker] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bac_checker] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bac_checker] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bac_checker] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bac_checker] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [bac_checker] SET QUERY_STORE = OFF
GO
USE [bac_checker]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [bac_checker]
GO
/****** Object:  Table [dbo].[bartenders]    Script Date: 6/22/2017 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bartenders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[drinks]    Script Date: 6/22/2017 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[drinks](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[drink_type] [varchar](50) NULL,
	[abv] [decimal](3, 1) NULL,
	[cost] [decimal](4, 2) NULL,
	[instances] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[foods]    Script Date: 6/22/2017 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[foods](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[food_type] [varchar](50) NULL,
	[description] [text] NULL,
	[cost] [decimal](4, 2) NULL,
	[bac_removal] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orders]    Script Date: 6/22/2017 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[patrons_id] [int] NULL,
	[drinks_id] [int] NULL,
	[foods_id] [int] NULL,
	[bartenders_id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[patrons]    Script Date: 6/22/2017 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patrons](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[gender] [varchar](25) NULL,
	[weight] [int] NULL,
	[height] [int] NULL,
	[bmi] [decimal](4, 2) NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[bartenders] ON 

INSERT [dbo].[bartenders] ([id], [name]) VALUES (1, N'Bud Wiser')
INSERT [dbo].[bartenders] ([id], [name]) VALUES (2, N'Sharon Needles')
INSERT [dbo].[bartenders] ([id], [name]) VALUES (3, N'Georgie Santorelli')
INSERT [dbo].[bartenders] ([id], [name]) VALUES (4, N'Horace')
INSERT [dbo].[bartenders] ([id], [name]) VALUES (5, N'Anita Phylis Glass')
SET IDENTITY_INSERT [dbo].[bartenders] OFF
SET IDENTITY_INSERT [dbo].[drinks] ON 

INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (1, N'Water', N'N.A.', CAST(0.0 AS Decimal(3, 1)), CAST(0.00 AS Decimal(4, 2)), 16)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (2, N'Reverend Nat’s Tassajara Peach Book', N'Cider Oaked w/Peaches', CAST(8.5 AS Decimal(3, 1)), CAST(5.00 AS Decimal(4, 2)), 12)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (3, N'Magnolia New Speedway Bitter', N'Special Bitter ', CAST(4.0 AS Decimal(3, 1)), CAST(6.00 AS Decimal(4, 2)), 20)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (4, N'54° 40'' Mama Tried', N'Pre Prohibition Lager ', CAST(5.0 AS Decimal(3, 1)), CAST(5.00 AS Decimal(4, 2)), 20)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (5, N'Georgetown L.A. Woman', N'Crystal Kölsch', CAST(5.2 AS Decimal(3, 1)), CAST(5.00 AS Decimal(4, 2)), 20)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (6, N'Upright Wit', N'Witbier', CAST(5.3 AS Decimal(3, 1)), CAST(6.00 AS Decimal(4, 2)), 20)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (7, N'Founders Sumatra Mountain Brown', N'Imperial Brown Ale w/ Sumatra Coffee ', CAST(9.0 AS Decimal(3, 1)), CAST(6.00 AS Decimal(4, 2)), 12)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (8, N'Ruse Translator', N'IPA', CAST(6.6 AS Decimal(3, 1)), CAST(6.00 AS Decimal(4, 2)), 20)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (9, N'Common Block Rogue Runner', N'IPA', CAST(6.7 AS Decimal(3, 1)), CAST(5.00 AS Decimal(4, 2)), 20)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (10, N'Baerlic Lightweight', N'Imperial IPA', CAST(8.5 AS Decimal(3, 1)), CAST(7.00 AS Decimal(4, 2)), 20)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (11, N'Gigantic Ginormous – MK1', N'Imperial IPA', CAST(8.8 AS Decimal(3, 1)), CAST(7.00 AS Decimal(4, 2)), 20)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (12, N'Flat Tail/Bailey’s Taproom Hausbier: Solo Dolo', N'Session IPA ', CAST(5.0 AS Decimal(3, 1)), CAST(5.00 AS Decimal(4, 2)), 20)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (13, N'Sunriver India Summer Ale', N'Pale Ale', CAST(6.0 AS Decimal(3, 1)), CAST(6.00 AS Decimal(4, 2)), 20)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (14, N'ColdFire/Flat Tail Tribal Knowledge', N'Dry-Hopped Kettle Sour Ale w/ guava ', CAST(6.0 AS Decimal(3, 1)), CAST(7.00 AS Decimal(4, 2)), 20)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (15, N'New Belgium Transatlantique Kriek', N'Lambic w/ Cherries', CAST(7.0 AS Decimal(3, 1)), CAST(11.00 AS Decimal(4, 2)), 12)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (16, N'pFriem Lemon Saison', N'Saison w/ lemon zest', CAST(6.2 AS Decimal(3, 1)), CAST(6.00 AS Decimal(4, 2)), 20)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (17, N'Crooked Stave Surette', N'Wild Saison – Barrel Aged (Oak)', CAST(6.2 AS Decimal(3, 1)), CAST(7.00 AS Decimal(4, 2)), 12)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (18, N'Mazama Belgian-Style Blonde', N'Belgian Blonde', CAST(7.7 AS Decimal(3, 1)), CAST(5.00 AS Decimal(4, 2)), 20)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (19, N'Aslan FIFA', N'French Indian Farmhouse Ale', CAST(7.0 AS Decimal(3, 1)), CAST(6.00 AS Decimal(4, 2)), 20)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (20, N'Common Block Brick & Mortar', N'Porter', CAST(5.8 AS Decimal(3, 1)), CAST(5.00 AS Decimal(4, 2)), 20)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (21, N'Side A Copper & Gold', N'Strong Pale', CAST(7.0 AS Decimal(3, 1)), CAST(6.00 AS Decimal(4, 2)), 20)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (22, N'Boneyard Femur', N'Barleywine', CAST(11.0 AS Decimal(3, 1)), CAST(6.00 AS Decimal(4, 2)), 12)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (23, N'The Bruery/Funky Buddha ¡Guava Libre!', N'Imperial Cream Ale w/ vanilla & guava ', CAST(7.9 AS Decimal(3, 1)), CAST(10.00 AS Decimal(4, 2)), 12)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (24, N'Little Beast Bes', N'Tart Wheat Ale w/ chamomile', CAST(6.0 AS Decimal(3, 1)), CAST(5.00 AS Decimal(4, 2)), 12)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (25, N'Pabst Blue Ribbon', N'American Lager', CAST(4.7 AS Decimal(3, 1)), CAST(2.00 AS Decimal(4, 2)), 12)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (26, N'Coors', N'Pale Lager', CAST(5.0 AS Decimal(3, 1)), CAST(2.00 AS Decimal(4, 2)), 12)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (27, N'Ranier', N'North American Lager', CAST(4.7 AS Decimal(3, 1)), CAST(2.00 AS Decimal(4, 2)), 12)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (28, N'Blue Moon Belgian White', N'Wit Wheat Beer', CAST(5.4 AS Decimal(3, 1)), CAST(3.00 AS Decimal(4, 2)), 12)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (29, N'Bud Light', N'Pale Lager', CAST(4.2 AS Decimal(3, 1)), CAST(2.00 AS Decimal(4, 2)), 12)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (30, N'Pisco sour', N'Mixed Drink: Pisco', CAST(40.0 AS Decimal(3, 1)), CAST(7.00 AS Decimal(4, 2)), 2)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (31, N'Sidecar', N'Mixed Drink: Cognac', CAST(40.0 AS Decimal(3, 1)), CAST(7.00 AS Decimal(4, 2)), 2)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (32, N'Bramble', N'Mixed Drink: Gin', CAST(40.0 AS Decimal(3, 1)), CAST(7.00 AS Decimal(4, 2)), 2)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (33, N'Bee''s Knees ', N'Mixed Drink: Gin', CAST(40.0 AS Decimal(3, 1)), CAST(7.00 AS Decimal(4, 2)), 2)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (34, N'French 75 ', N'Mixed Drink: Champagne', CAST(40.0 AS Decimal(3, 1)), CAST(7.00 AS Decimal(4, 2)), 2)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (35, N'Well drink: Any', N'Mixed Drink', CAST(40.0 AS Decimal(3, 1)), CAST(4.00 AS Decimal(4, 2)), 2)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (36, N'The Last Word', N'Mixed Drink: green Chartreuse', CAST(40.0 AS Decimal(3, 1)), CAST(7.00 AS Decimal(4, 2)), 2)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (37, N'Negroni', N'Mixed Drink: Gin, Vermouth, Campari', CAST(40.0 AS Decimal(3, 1)), CAST(7.00 AS Decimal(4, 2)), 2)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (38, N'Salty dog', N'Mixed Drink: Gin', CAST(40.0 AS Decimal(3, 1)), CAST(7.00 AS Decimal(4, 2)), 2)
INSERT [dbo].[drinks] ([id], [name], [drink_type], [abv], [cost], [instances]) VALUES (39, N'Dark ''N'' Stormy', N'Mixed Drink: Rum', CAST(40.0 AS Decimal(3, 1)), CAST(7.00 AS Decimal(4, 2)), 2)
SET IDENTITY_INSERT [dbo].[drinks] OFF
SET IDENTITY_INSERT [dbo].[foods] ON 

INSERT [dbo].[foods] ([id], [food_type], [description], [cost], [bac_removal]) VALUES (1, N'Bar Nuts', N'Nuts...From The Bar..', CAST(0.00 AS Decimal(4, 2)), 1)
INSERT [dbo].[foods] ([id], [food_type], [description], [cost], [bac_removal]) VALUES (2, N'If looks could Kale', N'Kale Salad', CAST(6.00 AS Decimal(4, 2)), 1)
INSERT [dbo].[foods] ([id], [food_type], [description], [cost], [bac_removal]) VALUES (3, N'She''s A Super Leek Burger', N'Comes with leeks', CAST(7.00 AS Decimal(4, 2)), 3)
INSERT [dbo].[foods] ([id], [food_type], [description], [cost], [bac_removal]) VALUES (4, N'Boullabaise', N'French Soup', CAST(6.00 AS Decimal(4, 2)), 2)
INSERT [dbo].[foods] ([id], [food_type], [description], [cost], [bac_removal]) VALUES (5, N'Rootin'' Tootin'' Baked Beans', N'Southern Style Y''all', CAST(4.00 AS Decimal(4, 2)), 1)
INSERT [dbo].[foods] ([id], [food_type], [description], [cost], [bac_removal]) VALUES (6, N'Boiled P''nuts', N'Why?', CAST(1.00 AS Decimal(4, 2)), 1)
INSERT [dbo].[foods] ([id], [food_type], [description], [cost], [bac_removal]) VALUES (7, N'California Roll', N'Cream cheese for life', CAST(5.00 AS Decimal(4, 2)), 2)
INSERT [dbo].[foods] ([id], [food_type], [description], [cost], [bac_removal]) VALUES (8, N'Veggie Fajita Burrito', N'Extra Salsa PLZ', CAST(5.00 AS Decimal(4, 2)), 3)
INSERT [dbo].[foods] ([id], [food_type], [description], [cost], [bac_removal]) VALUES (9, N'Nacho Boyfriends', N'Seriously, He is mine.', CAST(3.00 AS Decimal(4, 2)), 2)
INSERT [dbo].[foods] ([id], [food_type], [description], [cost], [bac_removal]) VALUES (10, N'Bangers and Mash', N'TATERS AND MEAT', CAST(6.00 AS Decimal(4, 2)), 4)
INSERT [dbo].[foods] ([id], [food_type], [description], [cost], [bac_removal]) VALUES (11, N'A TURKEY SANDWICH', N'WITH BREAD', CAST(2.00 AS Decimal(4, 2)), 2)
SET IDENTITY_INSERT [dbo].[foods] OFF
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [patrons_id], [drinks_id], [foods_id], [bartenders_id]) VALUES (40, 1, 28, 10, NULL)
INSERT [dbo].[orders] ([id], [patrons_id], [drinks_id], [foods_id], [bartenders_id]) VALUES (41, 1, 13, 9, NULL)
INSERT [dbo].[orders] ([id], [patrons_id], [drinks_id], [foods_id], [bartenders_id]) VALUES (42, 3, 35, 1, NULL)
INSERT [dbo].[orders] ([id], [patrons_id], [drinks_id], [foods_id], [bartenders_id]) VALUES (43, 3, 35, 1, NULL)
INSERT [dbo].[orders] ([id], [patrons_id], [drinks_id], [foods_id], [bartenders_id]) VALUES (44, 3, 35, 4, NULL)
INSERT [dbo].[orders] ([id], [patrons_id], [drinks_id], [foods_id], [bartenders_id]) VALUES (45, 6, NULL, NULL, 1)
INSERT [dbo].[orders] ([id], [patrons_id], [drinks_id], [foods_id], [bartenders_id]) VALUES (46, 5, NULL, NULL, 1)
INSERT [dbo].[orders] ([id], [patrons_id], [drinks_id], [foods_id], [bartenders_id]) VALUES (47, 3, 25, 9, NULL)
INSERT [dbo].[orders] ([id], [patrons_id], [drinks_id], [foods_id], [bartenders_id]) VALUES (48, 1, NULL, NULL, 4)
SET IDENTITY_INSERT [dbo].[orders] OFF
SET IDENTITY_INSERT [dbo].[patrons] ON 

INSERT [dbo].[patrons] ([id], [name], [gender], [weight], [height], [bmi]) VALUES (1, N'Alyssa', N'F', 125, 65, CAST(0.00 AS Decimal(4, 2)))
INSERT [dbo].[patrons] ([id], [name], [gender], [weight], [height], [bmi]) VALUES (2, N'Chet Manly', N'M', 215, 72, CAST(0.00 AS Decimal(4, 2)))
INSERT [dbo].[patrons] ([id], [name], [gender], [weight], [height], [bmi]) VALUES (3, N'Brick McStrongHuge', N'M', 230, 80, CAST(0.00 AS Decimal(4, 2)))
INSERT [dbo].[patrons] ([id], [name], [gender], [weight], [height], [bmi]) VALUES (4, N'David', N'M', 165, 72, CAST(0.00 AS Decimal(4, 2)))
INSERT [dbo].[patrons] ([id], [name], [gender], [weight], [height], [bmi]) VALUES (5, N'Kimlan Rolfs', N'M', 135, 67, CAST(0.00 AS Decimal(4, 2)))
INSERT [dbo].[patrons] ([id], [name], [gender], [weight], [height], [bmi]) VALUES (6, N'David Kimlan', N'M', 145, 68, CAST(0.00 AS Decimal(4, 2)))
INSERT [dbo].[patrons] ([id], [name], [gender], [weight], [height], [bmi]) VALUES (7, N'Barbara Streisand', N'F', 185, 62, CAST(0.00 AS Decimal(4, 2)))
INSERT [dbo].[patrons] ([id], [name], [gender], [weight], [height], [bmi]) VALUES (8, N'Marylin Manson', N'X', 160, 74, CAST(0.00 AS Decimal(4, 2)))
INSERT [dbo].[patrons] ([id], [name], [gender], [weight], [height], [bmi]) VALUES (9, N'RuPaul', N'F', 150, 70, CAST(0.00 AS Decimal(4, 2)))
INSERT [dbo].[patrons] ([id], [name], [gender], [weight], [height], [bmi]) VALUES (10, N'Austin Powers', N'M', 180, 65, CAST(0.00 AS Decimal(4, 2)))
INSERT [dbo].[patrons] ([id], [name], [gender], [weight], [height], [bmi]) VALUES (11, N'Dr. Frank N. Furhter', N'F', 170, 66, CAST(0.00 AS Decimal(4, 2)))
SET IDENTITY_INSERT [dbo].[patrons] OFF
USE [master]
GO
ALTER DATABASE [bac_checker] SET  READ_WRITE 
GO
