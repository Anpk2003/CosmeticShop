USE [master]
GO
/****** Object:  Database [Cosmetic_backup]    Script Date: 7/14/2024 12:53:46 PM ******/
CREATE DATABASE [Cosmetic_backup]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cosmetic_backup', FILENAME = N'D:\SQL\MSSQL16.SQLEXPRESS\MSSQL\DATA\Cosmetic_backup.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Cosmetic_backup_log', FILENAME = N'D:\SQL\MSSQL16.SQLEXPRESS\MSSQL\DATA\Cosmetic_backup_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Cosmetic_backup] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cosmetic_backup].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cosmetic_backup] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cosmetic_backup] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cosmetic_backup] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cosmetic_backup] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cosmetic_backup] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cosmetic_backup] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Cosmetic_backup] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cosmetic_backup] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cosmetic_backup] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cosmetic_backup] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cosmetic_backup] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cosmetic_backup] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cosmetic_backup] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cosmetic_backup] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cosmetic_backup] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Cosmetic_backup] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cosmetic_backup] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cosmetic_backup] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cosmetic_backup] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cosmetic_backup] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cosmetic_backup] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cosmetic_backup] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cosmetic_backup] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Cosmetic_backup] SET  MULTI_USER 
GO
ALTER DATABASE [Cosmetic_backup] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cosmetic_backup] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cosmetic_backup] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cosmetic_backup] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Cosmetic_backup] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Cosmetic_backup] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Cosmetic_backup] SET QUERY_STORE = ON
GO
ALTER DATABASE [Cosmetic_backup] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Cosmetic_backup]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/14/2024 12:53:46 PM ******/
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
/****** Object:  Table [dbo].[Brand]    Script Date: 7/14/2024 12:53:46 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 7/14/2024 12:53:46 PM ******/
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
/****** Object:  Table [dbo].[Order_Details]    Script Date: 7/14/2024 12:53:46 PM ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 7/14/2024 12:53:46 PM ******/
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
/****** Object:  Table [dbo].[Payments]    Script Date: 7/14/2024 12:53:46 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 7/14/2024 12:53:46 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([id], [isAdmin], [username], [password], [email]) VALUES (1, 1, N'Mran', N'123', N'anpk2300@gmail.com')
INSERT [dbo].[Account] ([id], [isAdmin], [username], [password], [email]) VALUES (2, 0, N'lam', N'lam', NULL)
INSERT [dbo].[Account] ([id], [isAdmin], [username], [password], [email]) VALUES (3, 1, N'an', N'234', N'anpk2300@gmail.com')
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
INSERT [dbo].[Category] ([id], [name]) VALUES (5, N'Bodycare')
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
GO
INSERT [dbo].[Payments] ([id], [account_id], [order_id], [payment_date], [amount]) VALUES (1, 2, 1, CAST(N'2024-01-21T12:30:00.000' AS DateTime), CAST(100.00 AS Decimal(10, 2)))
INSERT [dbo].[Payments] ([id], [account_id], [order_id], [payment_date], [amount]) VALUES (2, 3, 2, CAST(N'2024-01-22T16:00:00.000' AS DateTime), CAST(90.00 AS Decimal(10, 2)))
INSERT [dbo].[Payments] ([id], [account_id], [order_id], [payment_date], [amount]) VALUES (3, 4, 3, CAST(N'2024-01-23T10:00:00.000' AS DateTime), CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[Payments] ([id], [account_id], [order_id], [payment_date], [amount]) VALUES (4, 5, 4, CAST(N'2024-01-24T19:00:00.000' AS DateTime), CAST(90.00 AS Decimal(10, 2)))
INSERT [dbo].[Payments] ([id], [account_id], [order_id], [payment_date], [amount]) VALUES (5, 1, 5, CAST(N'2024-01-25T15:00:00.000' AS DateTime), CAST(300.00 AS Decimal(10, 2)))
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
ALTER DATABASE [Cosmetic_backup] SET  READ_WRITE 
GO
