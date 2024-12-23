USE [master]
GO
/****** Object:  Database [TheCosmetic_BackUp1]    Script Date: 7/14/2024 9:06:07 PM ******/
CREATE DATABASE [TheCosmetic_BackUp1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TheCosmetic_BackUp1', FILENAME = N'D:\SQL\MSSQL16.SQLEXPRESS\MSSQL\DATA\TheCosmetic_BackUp1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TheCosmetic_BackUp1_log', FILENAME = N'D:\SQL\MSSQL16.SQLEXPRESS\MSSQL\DATA\TheCosmetic_BackUp1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TheCosmetic_BackUp1] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TheCosmetic_BackUp1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TheCosmetic_BackUp1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TheCosmetic_BackUp1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TheCosmetic_BackUp1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TheCosmetic_BackUp1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TheCosmetic_BackUp1] SET ARITHABORT OFF 
GO
ALTER DATABASE [TheCosmetic_BackUp1] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TheCosmetic_BackUp1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TheCosmetic_BackUp1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TheCosmetic_BackUp1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TheCosmetic_BackUp1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TheCosmetic_BackUp1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TheCosmetic_BackUp1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TheCosmetic_BackUp1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TheCosmetic_BackUp1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TheCosmetic_BackUp1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TheCosmetic_BackUp1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TheCosmetic_BackUp1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TheCosmetic_BackUp1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TheCosmetic_BackUp1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TheCosmetic_BackUp1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TheCosmetic_BackUp1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TheCosmetic_BackUp1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TheCosmetic_BackUp1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TheCosmetic_BackUp1] SET  MULTI_USER 
GO
ALTER DATABASE [TheCosmetic_BackUp1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TheCosmetic_BackUp1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TheCosmetic_BackUp1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TheCosmetic_BackUp1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TheCosmetic_BackUp1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TheCosmetic_BackUp1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TheCosmetic_BackUp1] SET QUERY_STORE = ON
GO
ALTER DATABASE [TheCosmetic_BackUp1] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TheCosmetic_BackUp1]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/14/2024 9:06:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] NOT NULL,
	[isAdmin] [bit] NULL,
	[username] [varchar](100) NULL,
	[password] [varchar](32) NULL,
	[email] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 7/14/2024 9:06:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[id] [int] NOT NULL,
	[name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/14/2024 9:06:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] NOT NULL,
	[name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Details]    Script Date: 7/14/2024 9:06:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Details](
	[id] [int] NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[price] [float] NULL,
	[num] [int] NULL,
	[total_money] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/14/2024 9:06:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] NOT NULL,
	[account_id] [int] NULL,
	[fullname] [nvarchar](50) NULL,
	[email] [varchar](150) NULL,
	[phone_number] [varchar](20) NULL,
	[address] [nvarchar](200) NULL,
	[note] [nvarchar](1000) NULL,
	[order_date] [datetime] NULL,
	[status] [int] NULL,
	[total_money] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 7/14/2024 9:06:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[id] [int] NOT NULL,
	[account_id] [int] NULL,
	[order_id] [int] NULL,
	[payment_date] [datetime] NULL,
	[amount] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/14/2024 9:06:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] NOT NULL,
	[category_id] [int] NULL,
	[brand_id] [int] NULL,
	[title] [nvarchar](250) NULL,
	[price] [float] NULL,
	[thumbnail] [nvarchar](500) NULL,
	[description] [nvarchar](1000) NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([id], [isAdmin], [username], [password], [email]) VALUES (1, 0, N'admin', N'123', N'andmin@email.com')
INSERT [dbo].[Account] ([id], [isAdmin], [username], [password], [email]) VALUES (2, 0, N'lam', N'lam', NULL)
INSERT [dbo].[Account] ([id], [isAdmin], [username], [password], [email]) VALUES (3, 1, N'an23', N'234', N'anpk2300@gmail.com')
INSERT [dbo].[Account] ([id], [isAdmin], [username], [password], [email]) VALUES (4, 0, N'bao', N'bao', NULL)
INSERT [dbo].[Account] ([id], [isAdmin], [username], [password], [email]) VALUES (5, 1, N'kien', N'1234', NULL)
INSERT [dbo].[Account] ([id], [isAdmin], [username], [password], [email]) VALUES (6, 0, N'khanh', N'222222', NULL)
INSERT [dbo].[Account] ([id], [isAdmin], [username], [password], [email]) VALUES (7, 0, N'mra', N'123', N'kimito2300@gmail.com')
INSERT [dbo].[Account] ([id], [isAdmin], [username], [password], [email]) VALUES (8, 0, N'thai', N'1234', NULL)
INSERT [dbo].[Account] ([id], [isAdmin], [username], [password], [email]) VALUES (9, 0, N'sang', N'sang', NULL)
INSERT [dbo].[Account] ([id], [isAdmin], [username], [password], [email]) VALUES (10, 0, N'doanh', N'123', NULL)
INSERT [dbo].[Account] ([id], [isAdmin], [username], [password], [email]) VALUES (14, 0, N'mra', N'123', N'viettran1170@gmail.com')
INSERT [dbo].[Account] ([id], [isAdmin], [username], [password], [email]) VALUES (15, 0, N'andz', N'420361', N'anpgkhe172101@fpt.edu.vn')
INSERT [dbo].[Account] ([id], [isAdmin], [username], [password], [email]) VALUES (16, 0, N'doanhdz', N'123', N'dtran4673@gmail.com')
GO
INSERT [dbo].[Brand] ([id], [name]) VALUES (1, N'NPP Bắc')
INSERT [dbo].[Brand] ([id], [name]) VALUES (2, N'NPP Nam')
INSERT [dbo].[Brand] ([id], [name]) VALUES (3, N'NPP Đông')
INSERT [dbo].[Brand] ([id], [name]) VALUES (4, N'NPP Tây')
INSERT [dbo].[Brand] ([id], [name]) VALUES (5, N'NPP Ngoài')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'skincares')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'Makeup')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'Haircare')
INSERT [dbo].[Category] ([id], [name]) VALUES (4, N'Fragrance')
INSERT [dbo].[Category] ([id], [name]) VALUES (5, N'Bodycares')
GO
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (1, 1, 1, 50, 2, 100)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (2, 2, 2, 30, 3, 90)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (3, 3, 3, 25, 1, 25)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (4, 4, 4, 80, 1, 80)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (5, 5, 5, 40, 2, 80)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (6, 6, 1, 375000, 1, 375000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (7, 6, 2, 329000, 2, 658000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (8, 7, 1, 375000, 1, 375000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (9, 7, 2, 329000, 2, 658000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (10, 8, 1, 375000, 2, 750000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (11, 8, 2, 329000, 3, 987000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (12, 9, 2, 329000, 2, 658000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (13, 9, 5, 276000, 2, 552000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (14, 10, 2, 329000, 2, 658000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (15, 10, 5, 276000, 2, 552000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (16, 11, 5, 276000, 8, 2208000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (17, 12, 12, 655000, 10, 6550000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (18, 13, 5, 276000, 2, 552000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (19, 14, 5, 276000, 2, 552000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (20, 15, 10, 170000, 3, 510000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (21, 16, 10, 170000, 3, 510000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (22, 17, 10, 170000, 3, 510000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (23, 17, 8, 180000, 2, 360000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (24, 18, 4, 385000, 1, 385000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (25, 19, 20, 200000, 1, 200000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (26, 20, 1, 375000, 1, 375000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (27, 20, 3, 399000, 1, 399000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (28, 20, 8, 180000, 1, 180000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (29, 20, 10, 170000, 1, 170000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (30, 20, 13, 400000, 1, 400000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (31, 21, 4, 385000, 1, 385000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (32, 21, 6, 800000, 2, 1600000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (33, 22, 2, 1974000, 6, 11844000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (34, 23, 1, 1125000, 3, 3375000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (35, 24, 5, 1656000, 1, 1656000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (36, 24, 8, 540000, 2, 1080000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (37, 24, 25, 720000, 3, 2160000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (38, 25, 1, 1875000, 5, 9375000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (39, 25, 5, 1656000, 6, 9936000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (40, 25, 6, 800000, 1, 800000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (41, 25, 8, 360000, 2, 720000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (42, 26, 1, 375000, 3, 1125000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (43, 27, 1, 225600000, 10, 2256000000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (44, 28, 1, 1880000, 5, 9400000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (45, 29, 2, 987000, 3, 2961000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (46, 30, 1, 2256000, 6, 13536000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (47, 31, 2, 1974000, 6, 11844000)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (48, 32, 1, 2256000, 6, 13536000)
GO
INSERT [dbo].[Orders] ([id], [account_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (1, 2, N'Lâm', N'user1@example.com', N'1234567890', N'Address 1', N'Note for order 1', CAST(N'2024-01-21T12:00:00.000' AS DateTime), 1, 150)
INSERT [dbo].[Orders] ([id], [account_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (2, 3, N'An', N'user2@example.com', N'9876543210', N'Address 2', N'Note for order 2', CAST(N'2024-01-22T15:30:00.000' AS DateTime), 2, 120)
INSERT [dbo].[Orders] ([id], [account_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (3, 4, N'Bảo', N'user3@example.com', N'5555555555', N'Address 3', N'Note for order 3', CAST(N'2024-01-23T09:45:00.000' AS DateTime), 1, 200)
INSERT [dbo].[Orders] ([id], [account_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (4, 5, N'Kiên', N'user4@example.com', N'3333333333', N'Address 4', N'Note for order 4', CAST(N'2024-01-24T18:20:00.000' AS DateTime), 3, 90)
INSERT [dbo].[Orders] ([id], [account_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (5, 1, N'Admin User', N'admin@example.com', N'1111111111', N'Admin Address', N'Note for admin order', CAST(N'2024-01-25T14:00:00.000' AS DateTime), 2, 300)
INSERT [dbo].[Orders] ([id], [account_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (6, 3, N'Anh An', N'anpk2300@gmail.com', N'1234567988', N'Hà Nội, Việt Nam', N'ship ngay', CAST(N'2024-03-10T00:00:00.000' AS DateTime), 1, 1033000)
INSERT [dbo].[Orders] ([id], [account_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (7, 3, N'Anh An', N'anpk2300@gmail.com', N'1234567988', N'Hà Nội, Việt Nam', N'ship ngay', CAST(N'2024-03-10T00:00:00.000' AS DateTime), 1, 1033000)
INSERT [dbo].[Orders] ([id], [account_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (8, 5, N'kien trinh', N'kien@gmail.com', N'123345678', N'Hà Nội, Việt Nam', N'', CAST(N'2024-03-10T00:00:00.000' AS DateTime), 1, 1737000)
INSERT [dbo].[Orders] ([id], [account_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (9, 5, N'kan', N'kaen@gmail.com', N'1234567988', N'Hà Nội, Việt Nam', N'', CAST(N'2024-03-10T00:00:00.000' AS DateTime), 1, 1210000)
INSERT [dbo].[Orders] ([id], [account_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (10, 5, N'kan', N'kaen@gmail.com', N'1234567988', N'Hà Nội, Việt Nam', N'', CAST(N'2024-03-10T00:00:00.000' AS DateTime), 1, 1210000)
INSERT [dbo].[Orders] ([id], [account_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (11, 3, N'kan', N'kaen@gmail.com', N'1234567988', N'Hà Nội, Việt Nam', N'', CAST(N'2024-03-10T00:00:00.000' AS DateTime), 1, 2208000)
INSERT [dbo].[Orders] ([id], [account_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (12, 3, N'kan', N'kaen@gmail.com', N'1234567988', N'Hà Nội, Việt Nam', N'', CAST(N'2024-03-10T00:00:00.000' AS DateTime), 1, 6550000)
INSERT [dbo].[Orders] ([id], [account_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (13, 5, N'kien trinh', N'kien@gmail.com', N'123345678', N'Hà Nội, Việt Nam', N'123213', CAST(N'2024-03-10T00:00:00.000' AS DateTime), 1, 552000)
INSERT [dbo].[Orders] ([id], [account_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (14, 5, N'kien trinh', N'kien@gmail.com', N'123345678', N'Hà Nội, Việt Nam', N'123213', CAST(N'2024-03-10T00:00:00.000' AS DateTime), 1, 552000)
INSERT [dbo].[Orders] ([id], [account_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (15, 3, N'Anh An', N'anpk2300@gmail.com', N'1234567988', N'Hà Nội, Việt Nam', N'123', CAST(N'2024-03-10T00:00:00.000' AS DateTime), 1, 510000)
INSERT [dbo].[Orders] ([id], [account_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (16, 3, N'Anh An', N'anpk2300@gmail.com', N'1234567988', N'Hà Nội, Việt Nam', N'123', CAST(N'2024-03-10T00:00:00.000' AS DateTime), 1, 510000)
INSERT [dbo].[Orders] ([id], [account_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (17, 3, N'Anh An', N'anpk2300@gmail.com', N'1234567988', N'Hà Nội, Việt Nam', N'', CAST(N'2024-03-10T00:00:00.000' AS DateTime), 1, 870000)
INSERT [dbo].[Orders] ([id], [account_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (18, 3, N'Anh An', N'anpk2300@gmail.com', N'1234567988', N'Hà Nội, Việt Nam', N'', CAST(N'2024-03-10T00:00:00.000' AS DateTime), 1, 385000)
INSERT [dbo].[Orders] ([id], [account_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (19, 3, N'Em anh An', N'anpk2300@gmail.com', N'1234567988', N'Hà Nội, Việt Nam', N'123', CAST(N'2024-03-10T00:00:00.000' AS DateTime), 1, 200000)
INSERT [dbo].[Orders] ([id], [account_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (20, 3, N'anh Tiến', N'tien@gmail.com', N'012345678', N'Hà Nội, Việt Nam', N'', CAST(N'2024-03-10T00:00:00.000' AS DateTime), 1, 1524000)
INSERT [dbo].[Orders] ([id], [account_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (21, 3, N'anh Tiến', N'tien@gmail.com', N'1234445667', N'Hà Nội, Việt Nam', N'', CAST(N'2024-03-11T00:00:00.000' AS DateTime), 1, 1985000)
INSERT [dbo].[Orders] ([id], [account_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (22, 3, N'anh Tiến', N'tien@gmail.com', N'1234445667', N'Hà Nội, Việt Nam', N'đồ xịn quá đê', CAST(N'2024-03-11T00:00:00.000' AS DateTime), 1, 1974000)
INSERT [dbo].[Orders] ([id], [account_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (23, 3, N'Em anh D', N'dnh2300@gmail.com', N'1234567988', N'Hà Nội, Việt Nam', N'', CAST(N'2024-03-11T00:00:00.000' AS DateTime), 1, 1125000)
INSERT [dbo].[Orders] ([id], [account_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (24, 3, N'Phùng An', N'anpk2300@gmail.com', N'012345666', N'Hà Nội, Việt Nam', N'', CAST(N'2024-03-12T00:00:00.000' AS DateTime), 1, 996000)
INSERT [dbo].[Orders] ([id], [account_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (25, 9, N'Sáng ', N'sang@gmail.com', N'023345678', N'hải dương', N'', CAST(N'2024-03-12T00:00:00.000' AS DateTime), 1, 4691000)
INSERT [dbo].[Orders] ([id], [account_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (26, 3, N'em Sáng', N'sang@gmail.com', N'1234445667', N'hải dương', N'', CAST(N'2024-03-12T00:00:00.000' AS DateTime), 1, 1125000)
INSERT [dbo].[Orders] ([id], [account_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (27, 3, N'Em anh An', N'anpk2300@gmail.com', N'1234567988', N'Hà Nội, Việt Nam', N'ok', CAST(N'2024-07-08T00:00:00.000' AS DateTime), 1, 3760000)
INSERT [dbo].[Orders] ([id], [account_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (28, 3, N'kien trinh', N'kien@gmail.com', N'123345678', N'Hà Nội, Việt Nam', N'56', CAST(N'2024-07-08T00:00:00.000' AS DateTime), 1, 1880000)
INSERT [dbo].[Orders] ([id], [account_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (29, 3, N'an23', N'anpk2300@gmail.com', N'1234567988', N'Hà Nội, Việt Nam', N'nho giao cho toi', CAST(N'2024-07-08T00:00:00.000' AS DateTime), 1, 987000)
INSERT [dbo].[Orders] ([id], [account_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (30, 3, N'anphung', N'anpk2300@gmail.com', N'1234567988', N'Hà Nội, Việt Nam', N'', CAST(N'2024-07-08T00:00:00.000' AS DateTime), 1, 2256000)
INSERT [dbo].[Orders] ([id], [account_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (31, 3, N'an23', N'anpk2300@gmail.com', N'1234567988', N'Hà Nội, Việt Nam', N'', CAST(N'2024-07-08T00:00:00.000' AS DateTime), 1, 1974000)
INSERT [dbo].[Orders] ([id], [account_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (32, 3, N'an23', N'anpk2300@gmail.com', N'123345678', N'Hà Nội, Việt Nam', N'', CAST(N'2024-07-08T00:00:00.000' AS DateTime), 1, 2256000)
GO
INSERT [dbo].[Payments] ([id], [account_id], [order_id], [payment_date], [amount]) VALUES (1, 2, 1, CAST(N'2024-01-21T12:30:00.000' AS DateTime), CAST(100.00 AS Decimal(10, 2)))
INSERT [dbo].[Payments] ([id], [account_id], [order_id], [payment_date], [amount]) VALUES (2, 3, 2, CAST(N'2024-01-22T16:00:00.000' AS DateTime), CAST(90.00 AS Decimal(10, 2)))
INSERT [dbo].[Payments] ([id], [account_id], [order_id], [payment_date], [amount]) VALUES (3, 4, 3, CAST(N'2024-01-23T10:00:00.000' AS DateTime), CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[Payments] ([id], [account_id], [order_id], [payment_date], [amount]) VALUES (4, 5, 4, CAST(N'2024-01-24T19:00:00.000' AS DateTime), CAST(90.00 AS Decimal(10, 2)))
INSERT [dbo].[Payments] ([id], [account_id], [order_id], [payment_date], [amount]) VALUES (5, 1, 5, CAST(N'2024-01-25T15:00:00.000' AS DateTime), CAST(300.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([id], [category_id], [brand_id], [title], [price], [thumbnail], [description], [quantity]) VALUES (1, 2, 5, N'Son Thỏi 3CE', 376000, N'https://media.hcdn.vn/catalog/product/s/o/son-thoi-3ce-vo-trong-suot-unstained-red-do-phan-3-5g-1679295911_img_358x358_843626_fit_center.jpg', N'<p>Son thỏi 3CE mịn l&igrave; 3.5g 3ce Lip Color Matte Smooth Lipstick -Matte 3.5g | Official Store Lip Make up Cosmetic</p>
', 873)
INSERT [dbo].[Product] ([id], [category_id], [brand_id], [title], [price], [thumbnail], [description], [quantity]) VALUES (2, 1, 3, N'Cetaphil', 329000, N'https://media.hcdn.vn/catalog/product/g/o/google-shopping-sua-rua-mat-cetaphil-diu-nhe-khong-xa-phong-500ml-moi-1684727079_img_358x358_843626_fit_center.jpg', N'<p>Sữa Rửa Mặt Cetaphil Dịu L&agrave;nh Cho Da Nhạy Cảm 500ml (Mới)</p>
', 491)
INSERT [dbo].[Product] ([id], [category_id], [brand_id], [title], [price], [thumbnail], [description], [quantity]) VALUES (3, 1, 1, N'CeraVe', 399000, N'https://media.hcdn.vn/catalog/product/g/o/google-shopping-sua-rua-mat-cerave-cho-da-thuong-den-kho-473ml-1660553029_img_358x358_843626_fit_center.jpg', N'<p><em><strong>Sữa Rửa Mặt Cerave Foaming Cleanser kết cấu dạng gel tạo bọt rất l&yacute; tưởng để loại bỏ dầu thừa, bụi bẩn v&agrave; lớp trang điểm với c&ocirc;ng thức nhẹ nh&agrave;ng, kh&ocirc;ng ph&aacute; vỡ h&agrave;ng r&agrave;o bảo vệ tự nhi&ecirc;n của da v&agrave; chứa c&aacute;c th&agrave;nh phần gi&uacute;p duy tr&igrave; độ ẩm c&acirc;n bằng da. Cerave Foaming Cleanser chứa Ceramides, Axit Hyaluronic v&agrave; Niacinamide gi&uacute;p duy tr&igrave; h&agrave;ng r&agrave;o bảo vệ da, kh&oacute;a ẩm v&agrave; l&agrave;m dịu l&agrave;n da của bạn.</strong></em></p>
', 1000)
INSERT [dbo].[Product] ([id], [category_id], [brand_id], [title], [price], [thumbnail], [description], [quantity]) VALUES (4, 1, 1, N' La Roche-Posay', 385000, N'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-kem-chong-nang-la-roche-posay-kiem-soat-dau-spf50-50ml_AVSMYYf1vzdU7tqS_img_358x358_843626_fit_center.png', N'<p>Kem Chống Nắng La Roche-Posay Kiểm So&aacute;t Dầu SPF50+ 50mlAnthelios UV Mune 400</p>
', 250)
INSERT [dbo].[Product] ([id], [category_id], [brand_id], [title], [price], [thumbnail], [description], [quantity]) VALUES (5, 2, 3, N'Skin1004', 276000, N'https://media.hcdn.vn/catalog/product/g/o/google-shopping-kem-chong-nang-skin1004-chiet-xuat-rau-ma-spf50-pa-50ml-1_img_358x358_843626_fit_center.jpg', N'<p>Kem Chống Nắng Skin1004 Cho Da Nhạy Cảm l&agrave; sản phẩm kem chống nắng đến từ thương hiệu mỹ phẩm Skin1004 của H&agrave;n Quốc, l&agrave; kem chống nắng vật l&yacute; với chiết xuất rau m&aacute; v&agrave; chất kem mỏng nhẹ c&oacute; m&agrave;u gi&uacute;p che phủ nhẹ khuyết điểm cho da. C&ocirc;ng thức đa năng vừa chống nắng vừa đều m&agrave;u da lại dưỡng ẩm ch&iacute;nh l&agrave; sản phẩm m&agrave; những c&ocirc; n&agrave;ng da mụn hay da dầu nhạy cảm cần v&igrave; kh&ocirc;ng cần sử dụng qu&aacute; nhiều bước lỉnh kỉnh.</p>
', 340)
INSERT [dbo].[Product] ([id], [category_id], [brand_id], [title], [price], [thumbnail], [description], [quantity]) VALUES (6, 1, 2, N'dầu tẩy trang', 800000, N'https://media.hcdn.vn/catalog/product/d/a/dau-tay-trang-shu-uemura-giam-tac-nhan-o-nhiem-150ml-1-1667442721_img_358x358_843626_fit_center.jpg', N'<p>c&ocirc;ng thức chứa 8 loại dầu qu&yacute; hiếm, bao gồm: jojoba, rễ gừng, hạt ng&ocirc;, hoa rum, đậu n&agrave;nh</p>
', 333)
INSERT [dbo].[Product] ([id], [category_id], [brand_id], [title], [price], [thumbnail], [description], [quantity]) VALUES (7, 2, 4, N'Maybelline', 200000, N'https://media.hcdn.vn/catalog/product/g/o/google-shopping-but-ke-mat-nuoc-maybelline-sac-manh-bk1-ultra-black-0-4g-1697091849_img_358x358_843626_fit_center.jpg', N'<p>B&uacute;t Kẻ Mắt Nước Sắc Mảnh Maybelline Hyper Sharp Liner Extreme 0.4g l&agrave; sản phẩm kẻ mắt nước đến từ thương hiệu mỹ phẩm Maybelline của Mỹ, &aacute;p dụng c&ocirc;ng nghệ Ink Capsule mới gi&uacute;p d&ograve;ng mực ra đều hơn 147% v&agrave; đậm n&eacute;t hơn so với phi&ecirc;n bản cũ đồng thời giữ đường eyeliner bền m&agrave;u suốt 36 giờ. Với đầu cọ sắc mảnh 0,01mm gi&uacute;p bạn linh hoạt tạo ra những đường kẻ như &yacute;.</p>
', 5000)
INSERT [dbo].[Product] ([id], [category_id], [brand_id], [title], [price], [thumbnail], [description], [quantity]) VALUES (8, 2, 1, N'innisfree', 180000, N'https://media.hcdn.vn/catalog/product/g/o/google-shopping-phan-phu-innisfree-kiem-dau-dang-bot-khoang-5g-1-1689395390_img_358x358_843626_fit_center.jpg', N'<p>Phấn Phủ innisfree Kiềm Dầu Dạng Bột Kho&aacute;ng 5g (Mới 2023)</p>
', 230)
INSERT [dbo].[Product] ([id], [category_id], [brand_id], [title], [price], [thumbnail], [description], [quantity]) VALUES (9, 5, 1, N'Lifeboy', 150000, N'https://media.hcdn.vn/catalog/product/g/o/google-shopping-sua-tam-lifebuoy-detox-matcha-kho-qua-800g-1651220801_img_358x358_843626_fit_center.jpg', N'<p>Sữa Tắm Lifebuoy Detox Matcha &amp; Khổ Qua 800g</p>
', 5000)
INSERT [dbo].[Product] ([id], [category_id], [brand_id], [title], [price], [thumbnail], [description], [quantity]) VALUES (10, 5, 1, N'Sữa Tắm Gội Cetaphil ', 170000, N'https://media.hcdn.vn/catalog/product/g/o/google-shopping-sua-tam-va-goi-cetaphil-tinh-chat-hoa-cuc-diu-nhe-cho-be-400ml-1695713893_img_358x358_843626_fit_center.jpg', N'<p>Với chiết xuất từ hoa c&uacute;c Calendula hữu cơ l&agrave;nh t&iacute;nh, sữa tắm gội Cetaphil Baby Wash &amp; Shampoo with Organic Calendula sẽ gi&uacute;p l&agrave;m dịu, dưỡng ẩm &amp; l&agrave;m mềm l&agrave;n da nhạy cảm của b&eacute;, kết hợp với c&aacute;c th&agrave;nh phần dịu l&agrave;nh như hạnh nh&acirc;n, bơ hạt mỡ, sản phẩm c&ograve;n gi&uacute;p bạn bảo vệ da em b&eacute; với 5 điều dịu l&agrave;nh: l&agrave;nh t&iacute;nh, mềm mịn, giữ ẩm, kh&ocirc;ng g&acirc;y k&iacute;ch ứng v&agrave; che chở m&agrave;n ẩm tự nhi&ecirc;n. Sản phẩm đ&atilde; được chứng minh l&acirc;m s&agrave;ng l&agrave; dịu nhẹ với l&agrave;n da nhạy cảm &amp; được tin d&ugrave;ng bởi c&aacute;c b&aacute;c sĩ da liễu.</p>
', 400)
INSERT [dbo].[Product] ([id], [category_id], [brand_id], [title], [price], [thumbnail], [description], [quantity]) VALUES (11, 1, 3, N' Johnson''s', 171000, N'https://media.hcdn.vn/catalog/product/g/o/google-shopping-sua-tam-johnson-s-adult-2-trong-1-cap-am-cho-nguoi-lon-750ml-1696480561_img_358x358_843626_fit_center.jpg', N'<p>Sữa Tắm Johnson&#39;s Adult pH 5.5 Cho Người Lớn 750ml hiện đ&atilde; c&oacute; tại Hasaki với 2 ph&acirc;n loại: Sữa Tắm Johnson&#39;s Adult pH 5.5 Nourishing Body Wash With Almond Oil Từ Hạnh Nh&acirc;n Cho Người Lớn 750ml: Chứa tinh dầu hạnh nh&acirc;n gi&uacute;p cấp ẩm cho da v&agrave; bảo vệ l&agrave;n da của bạn mỗi ng&agrave;y.</p>
', 1000)
INSERT [dbo].[Product] ([id], [category_id], [brand_id], [title], [price], [thumbnail], [description], [quantity]) VALUES (12, 4, 2, N'Dr.Pepti', 655000, N'https://media.hcdn.vn/catalog/product/g/o/google-shopping-nuoc-hoa-hong-dr-pepti-duong-da-cang-bong-180ml-1655952167_img_358x358_843626_fit_center.jpg', N'<p>Nước Hoa Hồng Dr.Pepti Dưỡng Da Căng B&oacute;ng 180ml Centella Toner</p>
', 400)
INSERT [dbo].[Product] ([id], [category_id], [brand_id], [title], [price], [thumbnail], [description], [quantity]) VALUES (13, 4, 2, N'Klairs', 400000, N'https://media.hcdn.vn/catalog/product/g/o/google-shopping-nuoc-hoa-hong-klairs-khong-mui-cho-da-nhay-cam-180ml_img_358x358_843626_fit_center.jpg', N'<p>Nước Hoa Hồng Klairs Kh&ocirc;ng M&ugrave;i Cho Da Nhạy Cảm 180ml</p>
', 4000)
INSERT [dbo].[Product] ([id], [category_id], [brand_id], [title], [price], [thumbnail], [description], [quantity]) VALUES (14, 1, 1, N'Diamond', 550000, N'https://media.hcdn.vn/catalog/product/g/o/google-shopping-nuoc-hoa-nu-laura-anne-diamond-pour-femme-edp-45ml-trang-1648775966_img_358x358_843626_fit_center.jpg', N'<p>Nước Hoa Nữ Diamond Femme 45ml (Trắng)</p>
', 5000)
INSERT [dbo].[Product] ([id], [category_id], [brand_id], [title], [price], [thumbnail], [description], [quantity]) VALUES (15, 4, 1, N'Diamond', 550000, N'https://media.hcdn.vn/catalog/product/g/o/google-shopping-nuoc-hoa-nam-laura-anne-diamond-homme-45ml-1_img_358x358_843626_fit_center.jpg', N'<p>Nước Hoa Nam Diamond Homme 45ml (Đen)</p>
', 500)
INSERT [dbo].[Product] ([id], [category_id], [brand_id], [title], [price], [thumbnail], [description], [quantity]) VALUES (16, 3, 1, N'Selsun', 93000, N'https://media.hcdn.vn/catalog/product/g/o/google-shopping-dau-goi-selsun-ngua-gau-va-ngua-1-selenium-sulfide-100ml-1655869051_img_358x358_843626_fit_center.jpg', N'<p>Dầu Gội Selsun Ngừa G&agrave;u V&agrave; Ngứa 1% Selenium Sulfide 100ml</p>
', 400)
INSERT [dbo].[Product] ([id], [category_id], [brand_id], [title], [price], [thumbnail], [description], [quantity]) VALUES (17, 3, 1, N'Tsubaki', 215000, N'https://media.hcdn.vn/catalog/product/g/o/google-shopping-dau-goi-tsubaki-premium-ngan-ngua-rung-toc-490ml-1680751337_img_358x358_843626_fit_center.jpg', N'<p>Dầu Gội Tsubaki Phục Hồi Ngăn Rụng T&oacute;c 490ml Premium Volume</p>
', 500)
INSERT [dbo].[Product] ([id], [category_id], [brand_id], [title], [price], [thumbnail], [description], [quantity]) VALUES (18, 4, 3, N'Cocoon', 325000, N'https://media.hcdn.vn/catalog/product/g/o/google-shopping-nuoc-duong-toc-cocoon-tinh-dau-buoi-310ml-1684212359_img_358x358_843626_fit_center.jpg', N'<p>Nước Dưỡng T&oacute;c Cocoon Tinh Dầu Bưởi 310mlPomelo Hair Tonic</p>
', 500)
INSERT [dbo].[Product] ([id], [category_id], [brand_id], [title], [price], [thumbnail], [description], [quantity]) VALUES (20, 2, 4, N'Black Rouge', 200000, N'https://media.hcdn.vn/catalog/product/s/o/son-kem-li-black-rouge-a12-dashed-brown-nau-gach-4-5g-1-1676863048_img_358x358_843626_fit_center.jpg', N'<p>Son Kem L&igrave; Black Rouge A12 Dashed Brown N&acirc;u Gạch 4.5g</p>
', 400)
INSERT [dbo].[Product] ([id], [category_id], [brand_id], [title], [price], [thumbnail], [description], [quantity]) VALUES (21, 1, 5, N'Sữa Chống Nắng Anessa', 390000, N'https://media.hcdn.vn/catalog/product/g/o/google-shopping-sua-chong-nang-anessa-duong-da-kiem-dau-bao-ve-hoan-hao-60ml_img_358x358_843626_fit_center.jpg', N'<p>Anessa Perfect UV Sunscreen Skincare Milk N SPF50+ PA++++ ứng dụng c&ocirc;ng nghệ Auto Booster v&agrave; Very Water Resistant độc quyền từ thương hiệu ANESSA, gi&uacute;p cho lớp m&agrave;ng chống UV trở n&ecirc;n bền vững hơn khi gặp NHIỆT ĐỘ CAO - ĐỘ ẨM - MỒ H&Ocirc;I - NƯỚC - MA S&Aacute;T, đồng thời chống tr&ocirc;i trong nước l&ecirc;n đến 80 ph&uacute;t, chống bụi mịn PM.25 v&agrave; chống d&iacute;nh c&aacute;t. Ngo&agrave;i ra, sự bổ sung của phức hợp 50% th&agrave;nh phần dưỡng da gi&uacute;p ngăn ngừa l&atilde;o ho&aacute; do tia UV hiệu quả v&agrave; nu&ocirc;i dưỡng da ẩm mịn.</p>
', 300)
INSERT [dbo].[Product] ([id], [category_id], [brand_id], [title], [price], [thumbnail], [description], [quantity]) VALUES (22, 5, 5, N'Sữa Tắm Hatomugi Dưỡng Ẩm', 80000, N'https://media.hcdn.vn/catalog/product/g/o/google-shopping-sua-tam-hatomugi-duong-sang-da-800ml-1683085255_img_358x358_843626_fit_center.jpg', N'<p>Sữa Tắm Dưỡng Ẩm, L&agrave;m S&aacute;ng Da Reihaku Hatomugi Body Soap (800ml) Th&agrave;nh phần ch&iacute;nh: Chiết xuất hạt &Yacute; Dĩ Nhật Bản: chứa nhiều axit b&eacute;o v&agrave; dưỡng chất vitamin E, B1, B12 c&oacute; khả năng cung cấp độ ẩm cho da ẩm mượt hơn, đồng thời giảm sự h&igrave;nh th&agrave;nh nếp nhăn, l&agrave;m mờ c&aacute;c đốm n&acirc;u, dưỡng da s&aacute;ng v&agrave; đều m&agrave;u.</p>
', 1000)
INSERT [dbo].[Product] ([id], [category_id], [brand_id], [title], [price], [thumbnail], [description], [quantity]) VALUES (24, 3, 4, N'Dầu gội Kumano', 135000, N'https://storage.googleapis.com/jagodo/jagodo/2019/09/019f8170-dau-goi-kumano-salon-link-1000ml-3-768x768.jpg', N'<p>thức chứa c&aacute;c th&agrave;nh phần dưỡng chất từ bơ hạt mỡ, mật ong, panthenol, protein từ k&eacute;n tằm tự nhi&ecirc;n v&agrave; keratin thủy ph&acirc;n, gi&uacute;p nu&ocirc;i dưỡng v&agrave; hỗ trợ phục hồi m&aacute;i t&oacute;c hư tổn trở n&ecirc;n chắc khỏe v&agrave; b&oacute;ng mượt hơn. Đồng thời, dầu gội c&ograve;n gi&uacute;p bảo vệ t&oacute;c khỏi c&aacute;c tổn thương h&agrave;ng ng&agrave;y, ngăn ngừa t&oacute;c kh&ocirc;, xơ rối v&agrave; kh&oacute; v&agrave;o nếp, duy tr&igrave; c&acirc;n bằng độ ẩm cho t&oacute;c.</p>
', 200)
INSERT [dbo].[Product] ([id], [category_id], [brand_id], [title], [price], [thumbnail], [description], [quantity]) VALUES (25, 3, 1, N'Dầu Gội Head ', 120000, N'https://media.hcdn.vn/catalog/product/g/o/google-shopping-dau-goi-head-shoulders-bac-ha-mat-lanh-625ml-3_img_358x358_843626_fit_center.jpg', N'<p>Dầu Gội Head &amp; Shoulders L&agrave;m Sạch G&agrave;u l&agrave; d&ograve;ng sản phẩm dầu gội đến từ Head &amp; Shoulders - một trong những thương hiệu dầu gội ngăn ngừa g&agrave;u h&agrave;ng đầu tr&ecirc;n thế giới. Dầu Gội Head &amp; Shoulders nhiều m&ugrave;i hương với t&iacute;nh năng ưu việt ph&ugrave; hợp cho nhiều loại da đầu,</p>
', 300)
INSERT [dbo].[Product] ([id], [category_id], [brand_id], [title], [price], [thumbnail], [description], [quantity]) VALUES (26, 2, 1, N'Phấn Phủ MAC', 1010000, N'https://media.hcdn.vn/catalog/product/p/h/phan-phu-dang-bot-kiem-dau-mac-9g-2_img_358x358_843626_fit_center.jpg', N'<p>Phấn Phủ Dạng Bột Kiềm Dầu MAC Prep + Prime Transparent Finishing Powder l&agrave; sản phẩm thuộc thương hiệu M.A.C nổi tiếng kh&ocirc;ng chỉ ở Mỹ m&agrave; c&ograve;n tr&ecirc;n to&agrave;n thế giới. C&aacute;c sản phẩm của M.A.C lu&ocirc;n mang đến những ưu điểm v&ocirc; c&ugrave;ng xịn s&ograve; v&agrave; sản phẩm lần n&agrave;y cũng như thế.</p>
', 300)
INSERT [dbo].[Product] ([id], [category_id], [brand_id], [title], [price], [thumbnail], [description], [quantity]) VALUES (27, 2, 5, N'Bộ Kiehl''s Làm Sáng Da 4 Món', 1074000, N'https://media.hcdn.vn/catalog/product/g/o/google-shopping-bo-san-pham-kiehl-s-lam-sang-da-4-mon-1673062519-1697076254_img_358x358_843626_fit_center.jpg', N'<p>Bộ 4 sản phẩm gi&uacute;p s&aacute;ng da Kiehl&#39;s Brightening Best Seller Skincare Set 4 items gồm 1. Tinh chất l&agrave;m s&aacute;ng da &amp; mờ th&acirc;m mụn Kiehl&#39;s Clearly Corrective&trade; Dark Spot Solution 50ml 2. Kem dưỡng ẩm cho da Kiehl&#39;s Ultra Facial Cream 50ml</p>
', 5)
INSERT [dbo].[Product] ([id], [category_id], [brand_id], [title], [price], [thumbnail], [description], [quantity]) VALUES (28, 1, 1, N'Bộ Sản Phẩm Vichy Hỗ Trợ Phục Hồi ', 1096000, N'https://media.hcdn.vn/catalog/product/g/o/google-shopping-bo-san-pham-vichy-box-recharge-ho-tro-phuc-hoi-cap-am-da-2-mon_img_358x358_843626_fit_center.jpg', N'<p>Bộ sản phẩm bao gồm 2 m&oacute;n: Dưỡng Chất Kho&aacute;ng C&ocirc; Đặc Phục Hồi, Bảo Vệ Da Vichy Mineral 89 Serum 50ml Xịt Kho&aacute;ng Dưỡng Da VICHY Thermal Spa Water 300ml</p>
', 3000)
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([brand_id])
REFERENCES [dbo].[Brand] ([id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([id])
GO
USE [master]
GO
ALTER DATABASE [TheCosmetic_BackUp1] SET  READ_WRITE 
GO
