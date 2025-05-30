USE [master]
GO
/****** Object:  Database [MarketManagement]    Script Date: 4/26/2025 6:56:20 PM ******/
CREATE DATABASE [MarketManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MarketManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MarketManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MarketManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MarketManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MarketManagement] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MarketManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MarketManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MarketManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MarketManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MarketManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MarketManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [MarketManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MarketManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MarketManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MarketManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MarketManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MarketManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MarketManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MarketManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MarketManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MarketManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MarketManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MarketManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MarketManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MarketManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MarketManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MarketManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MarketManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MarketManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [MarketManagement] SET  MULTI_USER 
GO
ALTER DATABASE [MarketManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MarketManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MarketManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MarketManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MarketManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MarketManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MarketManagement', N'ON'
GO
ALTER DATABASE [MarketManagement] SET QUERY_STORE = ON
GO
ALTER DATABASE [MarketManagement] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MarketManagement]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/26/2025 6:56:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NULL,
 CONSTRAINT [CategID] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 4/26/2025 6:56:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerFirstName] [varchar](50) NOT NULL,
	[CustomerLastName] [varchar](50) NOT NULL,
	[CustomerGender] [char](1) NOT NULL,
	[CustomerAddress] [varchar](50) NOT NULL,
	[CustomerEmailAddress] [varchar](50) NOT NULL,
	[CustomerPhoneNumber] [varchar](50) NOT NULL,
	[SecurityId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 4/26/2025 6:56:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[DeliveryId] [int] IDENTITY(1,1) NOT NULL,
	[DeliveryDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DeliveryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 4/26/2025 6:56:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NULL,
	[CustomerEmailAddress] [varchar](50) NULL,
	[ProductId] [int] NULL,
 CONSTRAINT [OrderNo] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 4/26/2025 6:56:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[ProductDescription] [varchar](50) NULL,
	[Weight] [float] NULL,
	[Price] [decimal](18, 2) NULL,
	[LaunchDate] [date] NULL,
	[LaunchTime] [time](7) NULL,
	[ExpiryDate] [datetime] NULL,
	[Quantity] [int] NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Security]    Script Date: 4/26/2025 6:56:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Security](
	[SecurityId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Quiz] [varchar](50) NOT NULL,
	[Answer] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SecurityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (1, N'meat')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (2, N'fruit')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (3, N'vegetable')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (4, N'Home & Lifestyle')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (5, N'Electronics & Accessories')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (6, N'Food & Beverage')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (7, N'Personal Care & Apparel')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [OrderDate], [CustomerEmailAddress], [ProductId]) VALUES (1, CAST(N'2025-04-03T00:00:00.000' AS DateTime), N'boikutlo@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [Weight], [Price], [LaunchDate], [LaunchTime], [ExpiryDate], [Quantity], [CategoryId]) VALUES (2, N'beef', N'A grade', 10, CAST(150.00 AS Decimal(18, 2)), CAST(N'2025-01-01' AS Date), CAST(N'11:03:25' AS Time), CAST(N'2025-05-01T11:03:25.000' AS DateTime), 5, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [Weight], [Price], [LaunchDate], [LaunchTime], [ExpiryDate], [Quantity], [CategoryId]) VALUES (3, N'pork', N'A grade', 50, CAST(100.00 AS Decimal(18, 2)), CAST(N'2023-01-01' AS Date), CAST(N'11:03:25' AS Time), CAST(N'2025-02-01T11:03:25.000' AS DateTime), 5, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [Weight], [Price], [LaunchDate], [LaunchTime], [ExpiryDate], [Quantity], [CategoryId]) VALUES (4, N'banana', N'A grade', 1, CAST(1.00 AS Decimal(18, 2)), CAST(N'2025-01-01' AS Date), CAST(N'11:03:25' AS Time), CAST(N'2025-02-01T11:03:25.000' AS DateTime), 5, 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [Weight], [Price], [LaunchDate], [LaunchTime], [ExpiryDate], [Quantity], [CategoryId]) VALUES (5, N'apple', N'A grade', 1, CAST(1.00 AS Decimal(18, 2)), CAST(N'2025-04-01' AS Date), CAST(N'11:03:25' AS Time), CAST(N'2025-05-01T11:03:25.000' AS DateTime), 35, 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [Weight], [Price], [LaunchDate], [LaunchTime], [ExpiryDate], [Quantity], [CategoryId]) VALUES (6, N'tomato', N'A grade', NULL, NULL, CAST(N'2024-04-01' AS Date), CAST(N'11:03:25' AS Time), CAST(N'2025-05-01T11:03:25.000' AS DateTime), 5, 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [Weight], [Price], [LaunchDate], [LaunchTime], [ExpiryDate], [Quantity], [CategoryId]) VALUES (7, N'EcoBottle', N'Reusable water bottle', 0.5, CAST(12.99 AS Decimal(18, 2)), CAST(N'2024-05-10' AS Date), CAST(N'09:30:00' AS Time), CAST(N'2026-05-10T09:30:00.000' AS DateTime), 150, 4)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [Weight], [Price], [LaunchDate], [LaunchTime], [ExpiryDate], [Quantity], [CategoryId]) VALUES (8, N'SmartLamp', N'WiFi-enabled desk lamp', 1.2, CAST(45.50 AS Decimal(18, 2)), CAST(N'2023-09-01' AS Date), CAST(N'15:45:00' AS Time), CAST(N'2025-09-01T15:45:00.000' AS DateTime), 80, 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [Weight], [Price], [LaunchDate], [LaunchTime], [ExpiryDate], [Quantity], [CategoryId]) VALUES (9, N'QuickSnack', N'Healthy protein bar', 0.08, CAST(2.99 AS Decimal(18, 2)), CAST(N'2024-11-15' AS Date), CAST(N'11:00:00' AS Time), CAST(N'2025-11-15T11:00:00.000' AS DateTime), 1200, 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [Weight], [Price], [LaunchDate], [LaunchTime], [ExpiryDate], [Quantity], [CategoryId]) VALUES (10, N'GlowPad', N'LED mouse pad', 0.3, CAST(19.95 AS Decimal(18, 2)), CAST(N'2023-03-22' AS Date), CAST(N'10:15:00' AS Time), CAST(N'2026-03-22T10:15:00.000' AS DateTime), 300, 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [Weight], [Price], [LaunchDate], [LaunchTime], [ExpiryDate], [Quantity], [CategoryId]) VALUES (11, N'PowerJuice', N'Fruit energy drink', 0.6, CAST(3.75 AS Decimal(18, 2)), CAST(N'2024-08-01' AS Date), CAST(N'14:00:00' AS Time), CAST(N'2025-08-01T14:00:00.000' AS DateTime), 950, 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [Weight], [Price], [LaunchDate], [LaunchTime], [ExpiryDate], [Quantity], [CategoryId]) VALUES (12, N'ChocoDelight', N'Dark chocolate bar', 0.1, CAST(1.99 AS Decimal(18, 2)), CAST(N'2023-12-12' AS Date), CAST(N'13:20:00' AS Time), CAST(N'2025-12-12T13:20:00.000' AS DateTime), 2000, 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [Weight], [Price], [LaunchDate], [LaunchTime], [ExpiryDate], [Quantity], [CategoryId]) VALUES (13, N'AirCooler', N'Portable USB fan', 0.7, CAST(24.99 AS Decimal(18, 2)), CAST(N'2022-07-20' AS Date), CAST(N'16:30:00' AS Time), CAST(N'2025-07-20T16:30:00.000' AS DateTime), 420, NULL)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [Weight], [Price], [LaunchDate], [LaunchTime], [ExpiryDate], [Quantity], [CategoryId]) VALUES (14, N'CleanWipe', N'Eco-friendly wipes', 0.2, CAST(5.49 AS Decimal(18, 2)), CAST(N'2023-02-10' AS Date), CAST(N'08:05:00' AS Time), CAST(N'2025-02-10T08:05:00.000' AS DateTime), 870, 4)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [Weight], [Price], [LaunchDate], [LaunchTime], [ExpiryDate], [Quantity], [CategoryId]) VALUES (15, N'TidyBox', N'Storage container', 1.8, CAST(13.99 AS Decimal(18, 2)), CAST(N'2024-01-25' AS Date), CAST(N'17:45:00' AS Time), CAST(N'2027-01-25T17:45:00.000' AS DateTime), 500, 4)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [Weight], [Price], [LaunchDate], [LaunchTime], [ExpiryDate], [Quantity], [CategoryId]) VALUES (16, N'ZenTea', N'Herbal green tea', 0.15, CAST(4.25 AS Decimal(18, 2)), CAST(N'2024-06-18' AS Date), CAST(N'07:30:00' AS Time), CAST(N'2026-06-18T07:30:00.000' AS DateTime), 1400, 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [Weight], [Price], [LaunchDate], [LaunchTime], [ExpiryDate], [Quantity], [CategoryId]) VALUES (17, N'SpeedCable', N'USB-C fast charger', 0.1, CAST(9.99 AS Decimal(18, 2)), CAST(N'2023-05-05' AS Date), CAST(N'19:15:00' AS Time), CAST(N'2026-05-05T19:15:00.000' AS DateTime), 1000, 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [Weight], [Price], [LaunchDate], [LaunchTime], [ExpiryDate], [Quantity], [CategoryId]) VALUES (18, N'SlimCase', N'Phone case for iPhone', 0.05, CAST(14.99 AS Decimal(18, 2)), CAST(N'2022-10-10' AS Date), CAST(N'12:00:00' AS Time), CAST(N'2024-10-10T12:00:00.000' AS DateTime), 250, 4)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [Weight], [Price], [LaunchDate], [LaunchTime], [ExpiryDate], [Quantity], [CategoryId]) VALUES (19, N'CoolSocks', N'Thermal socks pack', 0.4, CAST(7.89 AS Decimal(18, 2)), CAST(N'2024-03-03' AS Date), CAST(N'10:10:00' AS Time), CAST(N'2026-03-03T10:10:00.000' AS DateTime), 670, 4)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [Weight], [Price], [LaunchDate], [LaunchTime], [ExpiryDate], [Quantity], [CategoryId]) VALUES (20, N'LiteMat', N'Yoga mat lightweight', 1, CAST(22.00 AS Decimal(18, 2)), CAST(N'2023-06-22' AS Date), CAST(N'06:50:00' AS Time), CAST(N'2026-06-22T06:50:00.000' AS DateTime), 300, 4)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [Weight], [Price], [LaunchDate], [LaunchTime], [ExpiryDate], [Quantity], [CategoryId]) VALUES (21, N'SoundBeat', N'Bluetooth speaker', 0.9, CAST(39.99 AS Decimal(18, 2)), CAST(N'2023-08-15' AS Date), CAST(N'21:00:00' AS Time), CAST(N'2025-08-15T21:00:00.000' AS DateTime), 390, 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [Weight], [Price], [LaunchDate], [LaunchTime], [ExpiryDate], [Quantity], [CategoryId]) VALUES (22, N'FreshPack', N'Vegetable storage bag', 0.25, CAST(6.49 AS Decimal(18, 2)), CAST(N'2024-02-27' AS Date), CAST(N'11:40:00' AS Time), CAST(N'2026-02-27T11:40:00.000' AS DateTime), 770, 4)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [Weight], [Price], [LaunchDate], [LaunchTime], [ExpiryDate], [Quantity], [CategoryId]) VALUES (23, N'HeatMug', N'Temperature mug', 0.75, CAST(29.95 AS Decimal(18, 2)), CAST(N'2023-01-17' AS Date), CAST(N'09:10:00' AS Time), CAST(N'2025-01-17T09:10:00.000' AS DateTime), 340, 4)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [Weight], [Price], [LaunchDate], [LaunchTime], [ExpiryDate], [Quantity], [CategoryId]) VALUES (24, N'NeatCord', N'Cable organizer set', 0.2, CAST(8.99 AS Decimal(18, 2)), CAST(N'2023-11-09' AS Date), CAST(N'18:30:00' AS Time), CAST(N'2025-11-09T18:30:00.000' AS DateTime), 620, 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [Weight], [Price], [LaunchDate], [LaunchTime], [ExpiryDate], [Quantity], [CategoryId]) VALUES (25, N'EcoWrap', N'Reusable beeswax wrap', 0.05, CAST(3.50 AS Decimal(18, 2)), CAST(N'2024-04-01' AS Date), CAST(N'08:25:00' AS Time), CAST(N'2026-04-01T08:25:00.000' AS DateTime), 900, 4)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [Weight], [Price], [LaunchDate], [LaunchTime], [ExpiryDate], [Quantity], [CategoryId]) VALUES (26, N'BrightPen', N'LED pen with stylus', 0.07, CAST(5.99 AS Decimal(18, 2)), CAST(N'2023-07-30' AS Date), CAST(N'20:20:00' AS Time), CAST(N'2025-07-30T20:20:00.000' AS DateTime), 780, 2)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Products__737584F612DF5844]    Script Date: 4/26/2025 6:56:20 PM ******/
ALTER TABLE [dbo].[Products] ADD UNIQUE NONCLUSTERED 
(
	[ProductName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Security__C9F2845688842454]    Script Date: 4/26/2025 6:56:20 PM ******/
ALTER TABLE [dbo].[Security] ADD UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([SecurityId])
REFERENCES [dbo].[Security] ([SecurityId])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD CHECK  (([Weight]>=(0)))
GO
USE [master]
GO
ALTER DATABASE [MarketManagement] SET  READ_WRITE 
GO
