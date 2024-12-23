USE [master]
GO
/****** Object:  Database [CoffeeShop]    Script Date: 21.11.2024 11:53:17 ******/
CREATE DATABASE [CoffeeShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CoffeeShop', FILENAME = N'C:\Users\10241421\CoffeeShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CoffeeShop_log', FILENAME = N'C:\Users\10241421\CoffeeShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CoffeeShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CoffeeShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CoffeeShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CoffeeShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CoffeeShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CoffeeShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CoffeeShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [CoffeeShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CoffeeShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CoffeeShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CoffeeShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CoffeeShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CoffeeShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CoffeeShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CoffeeShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CoffeeShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CoffeeShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CoffeeShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CoffeeShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CoffeeShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CoffeeShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CoffeeShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CoffeeShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CoffeeShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CoffeeShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CoffeeShop] SET  MULTI_USER 
GO
ALTER DATABASE [CoffeeShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CoffeeShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CoffeeShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CoffeeShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CoffeeShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CoffeeShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CoffeeShop] SET QUERY_STORE = OFF
GO
USE [CoffeeShop]
GO
/****** Object:  Table [dbo].[Administrators]    Script Date: 21.11.2024 11:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrators](
	[admin_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdminPermissions]    Script Date: 21.11.2024 11:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminPermissions](
	[permission_id] [int] IDENTITY(1,1) NOT NULL,
	[admin_id] [int] NOT NULL,
	[table_name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 21.11.2024 11:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[loyalty_points] [int] NULL,
	[password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Customer__CD65CB8583898CB6] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 21.11.2024 11:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[employee_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[salary] [decimal](10, 2) NULL,
	[hire_date] [date] NULL,
	[password] [nvarchar](50) NOT NULL,
	[position_id] [int] NULL,
 CONSTRAINT [PK__Employee__C52E0BA8EF001770] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 21.11.2024 11:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[inventory_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](50) NOT NULL,
	[supplier_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[unit_price] [decimal](10, 2) NOT NULL,
	[last_ordered] [date] NULL,
 CONSTRAINT [PK__Inventor__B59ACC49B02C0329] PRIMARY KEY CLUSTERED 
(
	[inventory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 21.11.2024 11:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[order_item_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK__OrderIte__3764B6BCEF8764AE] PRIMARY KEY CLUSTERED 
(
	[order_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 21.11.2024 11:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NOT NULL,
	[employee_id] [int] NOT NULL,
	[order_date] [datetime] NOT NULL,
	[total] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK__Orders__4659622980253742] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 21.11.2024 11:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Positions](
	[position_id] [int] IDENTITY(1,1) NOT NULL,
	[position_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[position_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 21.11.2024 11:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__ProductC__D54EE9B4659760FE] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 21.11.2024 11:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[category_id] [int] NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
	[stock] [int] NULL,
 CONSTRAINT [PK__Products__47027DF564C99437] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShipmentItems]    Script Date: 21.11.2024 11:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipmentItems](
	[shipment_item_id] [int] IDENTITY(1,1) NOT NULL,
	[shipment_id] [int] NOT NULL,
	[inventory_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK__Shipment__731D6A95934BB6DE] PRIMARY KEY CLUSTERED 
(
	[shipment_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipments]    Script Date: 21.11.2024 11:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipments](
	[shipment_id] [int] IDENTITY(1,1) NOT NULL,
	[supplier_id] [int] NOT NULL,
	[order_date] [date] NOT NULL,
	[delivery_date] [date] NULL,
 CONSTRAINT [PK__Shipment__41466E598DF1C3D1] PRIMARY KEY CLUSTERED 
(
	[shipment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 21.11.2024 11:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[supplier_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[contact_name] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[address] [text] NULL,
 CONSTRAINT [PK__Supplier__6EE594E8C5C9A97F] PRIMARY KEY CLUSTERED 
(
	[supplier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Administrators] ON 

INSERT [dbo].[Administrators] ([admin_id], [name], [email], [password], [phone]) VALUES (1, N'John Smith', N'john.smith@example.com', N'securepassword123', N'+1234567890')
INSERT [dbo].[Administrators] ([admin_id], [name], [email], [password], [phone]) VALUES (2, N'Jane Doe', N'jane.doe@example.com', N'mypassword456', N'+1987654321')
INSERT [dbo].[Administrators] ([admin_id], [name], [email], [password], [phone]) VALUES (3, N'Michael Johnson', N'michael.j@example.com', N'password789', N'+1122334455')
SET IDENTITY_INSERT [dbo].[Administrators] OFF
GO
SET IDENTITY_INSERT [dbo].[AdminPermissions] ON 

INSERT [dbo].[AdminPermissions] ([permission_id], [admin_id], [table_name]) VALUES (2, 1, N'Users')
INSERT [dbo].[AdminPermissions] ([permission_id], [admin_id], [table_name]) VALUES (3, 1, N'Orders')
INSERT [dbo].[AdminPermissions] ([permission_id], [admin_id], [table_name]) VALUES (4, 2, N'Products')
INSERT [dbo].[AdminPermissions] ([permission_id], [admin_id], [table_name]) VALUES (5, 2, N'Sales')
INSERT [dbo].[AdminPermissions] ([permission_id], [admin_id], [table_name]) VALUES (6, 3, N'Reports')
SET IDENTITY_INSERT [dbo].[AdminPermissions] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([customer_id], [name], [email], [phone], [loyalty_points], [password]) VALUES (1, N'John Doe', N'johndoe@example.com', N'123-456-7890', 10, N'password123')
INSERT [dbo].[Customers] ([customer_id], [name], [email], [phone], [loyalty_points], [password]) VALUES (2, N'Jane Smith', N'janesmith@example.com', N'321-654-0987', 20, N'password456')
INSERT [dbo].[Customers] ([customer_id], [name], [email], [phone], [loyalty_points], [password]) VALUES (3, N'Emily Davis', N'emilyd@example.com', N'987-654-3210', 15, N'password789')
INSERT [dbo].[Customers] ([customer_id], [name], [email], [phone], [loyalty_points], [password]) VALUES (4, N'Michael Brown', N'mbrown@example.com', N'654-987-1234', 5, N'password101')
INSERT [dbo].[Customers] ([customer_id], [name], [email], [phone], [loyalty_points], [password]) VALUES (5, N'Sarah Wilson', N'swilson@example.com', N'456-789-0123', 25, N'password202')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([employee_id], [name], [salary], [hire_date], [password], [position_id]) VALUES (2, N'Alice Johnson', CAST(45000.00 AS Decimal(10, 2)), CAST(N'2021-06-15' AS Date), N'pass123', 1)
INSERT [dbo].[Employees] ([employee_id], [name], [salary], [hire_date], [password], [position_id]) VALUES (3, N'Bob Martin', CAST(50000.00 AS Decimal(10, 2)), CAST(N'2022-03-10' AS Date), N'pass456', 2)
INSERT [dbo].[Employees] ([employee_id], [name], [salary], [hire_date], [password], [position_id]) VALUES (4, N'Charlie Taylor', CAST(42000.00 AS Decimal(10, 2)), CAST(N'2023-01-20' AS Date), N'pass789', 1)
INSERT [dbo].[Employees] ([employee_id], [name], [salary], [hire_date], [password], [position_id]) VALUES (5, N'Diana Lee', CAST(48000.00 AS Decimal(10, 2)), CAST(N'2021-11-05' AS Date), N'pass321', 3)
INSERT [dbo].[Employees] ([employee_id], [name], [salary], [hire_date], [password], [position_id]) VALUES (6, N'Evan Harris', CAST(47000.00 AS Decimal(10, 2)), CAST(N'2022-08-18' AS Date), N'pass654', 2)
INSERT [dbo].[Employees] ([employee_id], [name], [salary], [hire_date], [password], [position_id]) VALUES (7, N'Alice Johnson', CAST(45000.00 AS Decimal(10, 2)), CAST(N'2021-06-15' AS Date), N'pass123', 1)
INSERT [dbo].[Employees] ([employee_id], [name], [salary], [hire_date], [password], [position_id]) VALUES (8, N'Bob Martin', CAST(50000.00 AS Decimal(10, 2)), CAST(N'2022-03-10' AS Date), N'pass456', 2)
INSERT [dbo].[Employees] ([employee_id], [name], [salary], [hire_date], [password], [position_id]) VALUES (9, N'Charlie Taylor', CAST(42000.00 AS Decimal(10, 2)), CAST(N'2023-01-20' AS Date), N'pass789', 1)
INSERT [dbo].[Employees] ([employee_id], [name], [salary], [hire_date], [password], [position_id]) VALUES (10, N'Diana Lee', CAST(48000.00 AS Decimal(10, 2)), CAST(N'2021-11-05' AS Date), N'pass321', 3)
INSERT [dbo].[Employees] ([employee_id], [name], [salary], [hire_date], [password], [position_id]) VALUES (11, N'Evan Harris', CAST(47000.00 AS Decimal(10, 2)), CAST(N'2022-08-18' AS Date), N'pass654', 2)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Inventory] ON 

INSERT [dbo].[Inventory] ([inventory_id], [product_name], [supplier_id], [quantity], [unit_price], [last_ordered]) VALUES (1, N'Espresso Beans', 1, 100, CAST(10.00 AS Decimal(10, 2)), CAST(N'2024-11-01' AS Date))
INSERT [dbo].[Inventory] ([inventory_id], [product_name], [supplier_id], [quantity], [unit_price], [last_ordered]) VALUES (2, N'Green Tea Leaves', 2, 50, CAST(5.00 AS Decimal(10, 2)), CAST(N'2024-10-25' AS Date))
INSERT [dbo].[Inventory] ([inventory_id], [product_name], [supplier_id], [quantity], [unit_price], [last_ordered]) VALUES (3, N'Croissant Dough', 3, 75, CAST(2.50 AS Decimal(10, 2)), CAST(N'2024-11-05' AS Date))
INSERT [dbo].[Inventory] ([inventory_id], [product_name], [supplier_id], [quantity], [unit_price], [last_ordered]) VALUES (4, N'Brownie Mix', 3, 60, CAST(3.00 AS Decimal(10, 2)), CAST(N'2024-10-30' AS Date))
INSERT [dbo].[Inventory] ([inventory_id], [product_name], [supplier_id], [quantity], [unit_price], [last_ordered]) VALUES (5, N'Coffee Cups', 5, 200, CAST(0.25 AS Decimal(10, 2)), CAST(N'2024-11-10' AS Date))
SET IDENTITY_INSERT [dbo].[Inventory] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItems] ON 

INSERT [dbo].[OrderItems] ([order_item_id], [order_id], [product_id], [quantity], [price]) VALUES (1, 1, 1, 2, CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItems] ([order_item_id], [order_id], [product_id], [quantity], [price]) VALUES (2, 2, 2, 3, CAST(5.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItems] ([order_item_id], [order_id], [product_id], [quantity], [price]) VALUES (3, 3, 3, 10, CAST(2.50 AS Decimal(10, 2)))
INSERT [dbo].[OrderItems] ([order_item_id], [order_id], [product_id], [quantity], [price]) VALUES (4, 3, 4, 5, CAST(3.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItems] ([order_item_id], [order_id], [product_id], [quantity], [price]) VALUES (5, 4, 5, 10, CAST(0.25 AS Decimal(10, 2)))
INSERT [dbo].[OrderItems] ([order_item_id], [order_id], [product_id], [quantity], [price]) VALUES (10, 1, 1, 12, CAST(300.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([order_id], [customer_id], [employee_id], [order_date], [total]) VALUES (1, 1, 2, CAST(N'2024-11-20T00:00:00.000' AS DateTime), CAST(30.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [customer_id], [employee_id], [order_date], [total]) VALUES (2, 2, 3, CAST(N'2024-11-20T00:00:00.000' AS DateTime), CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [customer_id], [employee_id], [order_date], [total]) VALUES (3, 3, 4, CAST(N'2024-11-21T00:00:00.000' AS DateTime), CAST(50.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [customer_id], [employee_id], [order_date], [total]) VALUES (4, 4, 5, CAST(N'2024-11-21T00:00:00.000' AS DateTime), CAST(22.50 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Positions] ON 

INSERT [dbo].[Positions] ([position_id], [position_name]) VALUES (1, N'Barista')
INSERT [dbo].[Positions] ([position_id], [position_name]) VALUES (4, N'Cashier')
INSERT [dbo].[Positions] ([position_id], [position_name]) VALUES (5, N'Cook')
INSERT [dbo].[Positions] ([position_id], [position_name]) VALUES (2, N'Manager')
INSERT [dbo].[Positions] ([position_id], [position_name]) VALUES (3, N'Supervisor')
SET IDENTITY_INSERT [dbo].[Positions] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategories] ON 

INSERT [dbo].[ProductCategories] ([category_id], [name]) VALUES (4, N'Beverages')
INSERT [dbo].[ProductCategories] ([category_id], [name]) VALUES (1, N'Coffee')
INSERT [dbo].[ProductCategories] ([category_id], [name]) VALUES (5, N'Desserts')
INSERT [dbo].[ProductCategories] ([category_id], [name]) VALUES (3, N'Snacks')
INSERT [dbo].[ProductCategories] ([category_id], [name]) VALUES (2, N'Tea')
SET IDENTITY_INSERT [dbo].[ProductCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([product_id], [name], [category_id], [price], [stock]) VALUES (1, N'Espresso', 1, CAST(3.50 AS Decimal(10, 2)), 50)
INSERT [dbo].[Products] ([product_id], [name], [category_id], [price], [stock]) VALUES (2, N'Cappuccino', 1, CAST(4.00 AS Decimal(10, 2)), 40)
INSERT [dbo].[Products] ([product_id], [name], [category_id], [price], [stock]) VALUES (3, N'Green Tea', 2, CAST(2.50 AS Decimal(10, 2)), 30)
INSERT [dbo].[Products] ([product_id], [name], [category_id], [price], [stock]) VALUES (4, N'Croissant', 3, CAST(2.00 AS Decimal(10, 2)), 20)
INSERT [dbo].[Products] ([product_id], [name], [category_id], [price], [stock]) VALUES (5, N'Brownie', 5, CAST(3.00 AS Decimal(10, 2)), 25)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ShipmentItems] ON 

INSERT [dbo].[ShipmentItems] ([shipment_item_id], [shipment_id], [inventory_id], [quantity]) VALUES (1, 1, 1, 50)
INSERT [dbo].[ShipmentItems] ([shipment_item_id], [shipment_id], [inventory_id], [quantity]) VALUES (2, 2, 2, 25)
INSERT [dbo].[ShipmentItems] ([shipment_item_id], [shipment_id], [inventory_id], [quantity]) VALUES (3, 3, 3, 40)
INSERT [dbo].[ShipmentItems] ([shipment_item_id], [shipment_id], [inventory_id], [quantity]) VALUES (4, 4, 4, 30)
INSERT [dbo].[ShipmentItems] ([shipment_item_id], [shipment_id], [inventory_id], [quantity]) VALUES (5, 5, 5, 100)
SET IDENTITY_INSERT [dbo].[ShipmentItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Shipments] ON 

INSERT [dbo].[Shipments] ([shipment_id], [supplier_id], [order_date], [delivery_date]) VALUES (1, 1, CAST(N'2024-10-20' AS Date), CAST(N'2024-10-25' AS Date))
INSERT [dbo].[Shipments] ([shipment_id], [supplier_id], [order_date], [delivery_date]) VALUES (2, 2, CAST(N'2024-10-15' AS Date), CAST(N'2024-10-18' AS Date))
INSERT [dbo].[Shipments] ([shipment_id], [supplier_id], [order_date], [delivery_date]) VALUES (3, 3, CAST(N'2024-10-10' AS Date), CAST(N'2024-10-14' AS Date))
INSERT [dbo].[Shipments] ([shipment_id], [supplier_id], [order_date], [delivery_date]) VALUES (4, 4, CAST(N'2024-11-01' AS Date), CAST(N'2024-11-05' AS Date))
INSERT [dbo].[Shipments] ([shipment_id], [supplier_id], [order_date], [delivery_date]) VALUES (5, 5, CAST(N'2024-10-30' AS Date), CAST(N'2024-11-02' AS Date))
SET IDENTITY_INSERT [dbo].[Shipments] OFF
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([supplier_id], [name], [contact_name], [phone], [address]) VALUES (1, N'CoffeeCo', N'James Walker', N'123-456-7890', N'123 Coffee St')
INSERT [dbo].[Suppliers] ([supplier_id], [name], [contact_name], [phone], [address]) VALUES (2, N'TeaTime', N'Linda Baker', N'321-654-0987', N'456 Tea Rd')
INSERT [dbo].[Suppliers] ([supplier_id], [name], [contact_name], [phone], [address]) VALUES (3, N'SweetTreats', N'George Adams', N'987-654-3210', N'789 Dessert Ln')
INSERT [dbo].[Suppliers] ([supplier_id], [name], [contact_name], [phone], [address]) VALUES (4, N'SnackWorld', N'Helen Brooks', N'654-987-1234', N'321 Snack Blvd')
INSERT [dbo].[Suppliers] ([supplier_id], [name], [contact_name], [phone], [address]) VALUES (5, N'BeverageSupplies', N'Frank Wright', N'456-789-0123', N'654 Drink Ave')
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Administ__AB6E6164CC496824]    Script Date: 21.11.2024 11:53:17 ******/
ALTER TABLE [dbo].[Administrators] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__AB6E61645F7BE0AA]    Script Date: 21.11.2024 11:53:17 ******/
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [UQ__Customer__AB6E61645F7BE0AA] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Position__0030EAD774060DC4]    Script Date: 21.11.2024 11:53:17 ******/
ALTER TABLE [dbo].[Positions] ADD UNIQUE NONCLUSTERED 
(
	[position_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ProductC__72E12F1BAD7F0C2B]    Script Date: 21.11.2024 11:53:17 ******/
ALTER TABLE [dbo].[ProductCategories] ADD  CONSTRAINT [UQ__ProductC__72E12F1BAD7F0C2B] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [DF__Customers__loyal__25869641]  DEFAULT ((0)) FOR [loyalty_points]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF__Orders__order_da__32E0915F]  DEFAULT (getdate()) FOR [order_date]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF__Products__stock__2F10007B]  DEFAULT ((0)) FOR [stock]
GO
ALTER TABLE [dbo].[AdminPermissions]  WITH CHECK ADD FOREIGN KEY([admin_id])
REFERENCES [dbo].[Administrators] ([admin_id])
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_PositionID] FOREIGN KEY([position_id])
REFERENCES [dbo].[Positions] ([position_id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_PositionID]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Suppliers] FOREIGN KEY([supplier_id])
REFERENCES [dbo].[Suppliers] ([supplier_id])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_Suppliers]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders1] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders1]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Products1] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Products1]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customers] ([customer_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([employee_id])
REFERENCES [dbo].[Employees] ([employee_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Employees]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductCategories] FOREIGN KEY([category_id])
REFERENCES [dbo].[ProductCategories] ([category_id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductCategories]
GO
ALTER TABLE [dbo].[ShipmentItems]  WITH CHECK ADD  CONSTRAINT [FK_ShipmentItems_Inventory] FOREIGN KEY([inventory_id])
REFERENCES [dbo].[Inventory] ([inventory_id])
GO
ALTER TABLE [dbo].[ShipmentItems] CHECK CONSTRAINT [FK_ShipmentItems_Inventory]
GO
ALTER TABLE [dbo].[ShipmentItems]  WITH CHECK ADD  CONSTRAINT [FK_ShipmentItems_Shipments] FOREIGN KEY([shipment_id])
REFERENCES [dbo].[Shipments] ([shipment_id])
GO
ALTER TABLE [dbo].[ShipmentItems] CHECK CONSTRAINT [FK_ShipmentItems_Shipments]
GO
ALTER TABLE [dbo].[Shipments]  WITH CHECK ADD  CONSTRAINT [FK_Shipments_Suppliers] FOREIGN KEY([supplier_id])
REFERENCES [dbo].[Suppliers] ([supplier_id])
GO
ALTER TABLE [dbo].[Shipments] CHECK CONSTRAINT [FK_Shipments_Suppliers]
GO
USE [master]
GO
ALTER DATABASE [CoffeeShop] SET  READ_WRITE 
GO
