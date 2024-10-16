USE [master]
GO
/****** Object:  Database [SHUB_TEST_SOLUTION]    Script Date: 10/10/2024 21:46:42 ******/
CREATE DATABASE [SHUB_TEST_SOLUTION]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SHUB_TEST_SOLUTION', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SHUB_TEST_SOLUTION.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SHUB_TEST_SOLUTION_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SHUB_TEST_SOLUTION_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SHUB_TEST_SOLUTION] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SHUB_TEST_SOLUTION].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SHUB_TEST_SOLUTION] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SHUB_TEST_SOLUTION] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SHUB_TEST_SOLUTION] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SHUB_TEST_SOLUTION] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SHUB_TEST_SOLUTION] SET ARITHABORT OFF 
GO
ALTER DATABASE [SHUB_TEST_SOLUTION] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SHUB_TEST_SOLUTION] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SHUB_TEST_SOLUTION] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SHUB_TEST_SOLUTION] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SHUB_TEST_SOLUTION] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SHUB_TEST_SOLUTION] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SHUB_TEST_SOLUTION] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SHUB_TEST_SOLUTION] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SHUB_TEST_SOLUTION] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SHUB_TEST_SOLUTION] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SHUB_TEST_SOLUTION] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SHUB_TEST_SOLUTION] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SHUB_TEST_SOLUTION] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SHUB_TEST_SOLUTION] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SHUB_TEST_SOLUTION] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SHUB_TEST_SOLUTION] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SHUB_TEST_SOLUTION] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SHUB_TEST_SOLUTION] SET RECOVERY FULL 
GO
ALTER DATABASE [SHUB_TEST_SOLUTION] SET  MULTI_USER 
GO
ALTER DATABASE [SHUB_TEST_SOLUTION] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SHUB_TEST_SOLUTION] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SHUB_TEST_SOLUTION] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SHUB_TEST_SOLUTION] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SHUB_TEST_SOLUTION] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SHUB_TEST_SOLUTION] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SHUB_TEST_SOLUTION', N'ON'
GO
ALTER DATABASE [SHUB_TEST_SOLUTION] SET QUERY_STORE = OFF
GO
USE [SHUB_TEST_SOLUTION]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/10/2024 21:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] NOT NULL,
	[category_name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 10/10/2024 21:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customer_id] [int] NOT NULL,
	[customer_name] [nvarchar](50) NOT NULL,
	[customer_code] [nvarchar](15) NOT NULL,
	[customer_type] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 10/10/2024 21:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[employee_id] [int] NOT NULL,
	[employee_name] [nvarchar](50) NOT NULL,
	[phone_number] [nvarchar](50) NOT NULL,
	[hire_date] [date] NOT NULL,
	[station_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GasStation]    Script Date: 10/10/2024 21:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GasStation](
	[station_id] [int] NOT NULL,
	[station_name] [nvarchar](50) NOT NULL,
	[station_address] [nvarchar](50) NOT NULL,
	[station_phone] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[station_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 10/10/2024 21:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[invoice_id] [int] NOT NULL,
	[petrol_pump_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[employee_id] [int] NOT NULL,
	[quantity] [decimal](10, 2) NOT NULL,
	[total_price] [decimal](10, 2) NOT NULL,
	[payment_status] [nvarchar](50) NOT NULL,
	[payment_date] [datetime] NOT NULL,
	[vehicle_license_plate] [nvarchar](50) NULL,
	[invoice_status] [nvarchar](50) NOT NULL,
	[created_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[invoice_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 10/10/2024 21:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] NOT NULL,
	[petrol_pump_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[employee_id] [int] NOT NULL,
	[discount_percent] [int] NULL,
	[total_price] [decimal](10, 2) NULL,
	[vehicle_license_plate] [nvarchar](50) NULL,
	[status] [nvarchar](50) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 10/10/2024 21:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[order_detail_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
	[total_price] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Petrol_pump]    Script Date: 10/10/2024 21:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Petrol_pump](
	[petrol_pump_id] [int] NOT NULL,
	[station_id] [int] NOT NULL,
	[transaction_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[petrol_pump_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10/10/2024 21:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[product_id] [int] NOT NULL,
	[product_name] [nvarchar](50) NOT NULL,
	[quantity] [decimal](10, 2) NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
	[category_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (1, N'Xăng')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (2, N'Dầu')
GO
INSERT [dbo].[Customer] ([customer_id], [customer_name], [customer_code], [customer_type]) VALUES (1, N'Khách lẻ', N'00001', N'Lẻ')
INSERT [dbo].[Customer] ([customer_id], [customer_name], [customer_code], [customer_type]) VALUES (2, N'Khách lẻ', N'00002', N'Lẻ')
INSERT [dbo].[Customer] ([customer_id], [customer_name], [customer_code], [customer_type]) VALUES (3, N'Khách lẻ', N'00003', N'Lẻ')
GO
INSERT [dbo].[Employee] ([employee_id], [employee_name], [phone_number], [hire_date], [station_id]) VALUES (1, N'Nguyễn Văn A', N'0912345678', CAST(N'2020-01-01' AS Date), 1)
GO
INSERT [dbo].[GasStation] ([station_id], [station_name], [station_address], [station_phone]) VALUES (1, N'Cửa hàng xăng dầu số 27', N'Địa chỉ không xác định', N'0123456789')
GO
INSERT [dbo].[Invoice] ([invoice_id], [petrol_pump_id], [product_id], [customer_id], [employee_id], [quantity], [total_price], [payment_status], [payment_date], [vehicle_license_plate], [invoice_status], [created_at]) VALUES (1, 1, 1, 1, 1, CAST(53.07 AS Decimal(10, 2)), CAST(1290432.00 AS Decimal(10, 2)), N'Tiền mặt', CAST(N'2024-03-21T00:00:00.000' AS DateTime), N'Không có', N'Đã ký: 3708', CAST(N'2024-03-21T21:10:28.000' AS DateTime))
INSERT [dbo].[Invoice] ([invoice_id], [petrol_pump_id], [product_id], [customer_id], [employee_id], [quantity], [total_price], [payment_status], [payment_date], [vehicle_license_plate], [invoice_status], [created_at]) VALUES (2, 2, 2, 2, 1, CAST(252.39 AS Decimal(10, 2)), CAST(6144978.00 AS Decimal(10, 2)), N'Tiền mặt', CAST(N'2024-03-21T00:00:00.000' AS DateTime), N'Không có', N'Đã ký: 3808', CAST(N'2024-03-21T21:09:50.000' AS DateTime))
INSERT [dbo].[Invoice] ([invoice_id], [petrol_pump_id], [product_id], [customer_id], [employee_id], [quantity], [total_price], [payment_status], [payment_date], [vehicle_license_plate], [invoice_status], [created_at]) VALUES (3, 3, 3, 3, 1, CAST(2.05 AS Decimal(10, 2)), CAST(50000.00 AS Decimal(10, 2)), N'Tiền mặt', CAST(N'2024-03-21T00:00:00.000' AS DateTime), N'Không có', N'Đã ký: 3807', CAST(N'2024-03-21T21:08:30.000' AS DateTime))
GO
INSERT [dbo].[Order] ([order_id], [petrol_pump_id], [customer_id], [employee_id], [discount_percent], [total_price], [vehicle_license_plate], [status], [created_at], [updated_at]) VALUES (1, 1, 1, 1, 0, CAST(1290432.00 AS Decimal(10, 2)), N'Không có', N'Thanh toán tiền mặt', CAST(N'2024-03-21T21:10:28.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([order_id], [petrol_pump_id], [customer_id], [employee_id], [discount_percent], [total_price], [vehicle_license_plate], [status], [created_at], [updated_at]) VALUES (2, 2, 2, 1, 0, CAST(6144978.00 AS Decimal(10, 2)), N'Không có', N'Thanh toán tiền mặt', CAST(N'2024-03-21T21:09:50.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([order_id], [petrol_pump_id], [customer_id], [employee_id], [discount_percent], [total_price], [vehicle_license_plate], [status], [created_at], [updated_at]) VALUES (3, 3, 3, 1, 0, CAST(50000.00 AS Decimal(10, 2)), N'Không có', N'Thanh toán tiền mặt', CAST(N'2024-03-21T21:08:30.000' AS DateTime), NULL)
GO
INSERT [dbo].[Order_Detail] ([order_detail_id], [product_id], [order_id], [quantity], [price], [total_price]) VALUES (1, 1, 1, 53, CAST(24280.00 AS Decimal(10, 2)), CAST(1290432.00 AS Decimal(10, 2)))
INSERT [dbo].[Order_Detail] ([order_detail_id], [product_id], [order_id], [quantity], [price], [total_price]) VALUES (2, 2, 2, 252, CAST(24280.00 AS Decimal(10, 2)), CAST(6144978.00 AS Decimal(10, 2)))
INSERT [dbo].[Order_Detail] ([order_detail_id], [product_id], [order_id], [quantity], [price], [total_price]) VALUES (3, 3, 3, 2, CAST(24280.00 AS Decimal(10, 2)), CAST(50000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Petrol_pump] ([petrol_pump_id], [station_id], [transaction_id], [product_id]) VALUES (1, 1, 3708, 1)
INSERT [dbo].[Petrol_pump] ([petrol_pump_id], [station_id], [transaction_id], [product_id]) VALUES (2, 1, 3808, 1)
INSERT [dbo].[Petrol_pump] ([petrol_pump_id], [station_id], [transaction_id], [product_id]) VALUES (3, 1, 3807, 1)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [quantity], [price], [category_id]) VALUES (1, N'Xăng Ron A95-III', CAST(53.07 AS Decimal(10, 2)), CAST(24280.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Products] ([product_id], [product_name], [quantity], [price], [category_id]) VALUES (2, N'Xăng Ron A95-III', CAST(252.39 AS Decimal(10, 2)), CAST(24280.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Products] ([product_id], [product_name], [quantity], [price], [category_id]) VALUES (3, N'Xăng Ron A95-III', CAST(2.05 AS Decimal(10, 2)), CAST(24280.00 AS Decimal(10, 2)), 1)
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([station_id])
REFERENCES [dbo].[GasStation] ([station_id])
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD FOREIGN KEY([employee_id])
REFERENCES [dbo].[Employee] ([employee_id])
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD FOREIGN KEY([petrol_pump_id])
REFERENCES [dbo].[Petrol_pump] ([petrol_pump_id])
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([employee_id])
REFERENCES [dbo].[Employee] ([employee_id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([petrol_pump_id])
REFERENCES [dbo].[Petrol_pump] ([petrol_pump_id])
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Petrol_pump]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Petrol_pump]  WITH CHECK ADD FOREIGN KEY([station_id])
REFERENCES [dbo].[GasStation] ([station_id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
USE [master]
GO
ALTER DATABASE [SHUB_TEST_SOLUTION] SET  READ_WRITE 
GO
