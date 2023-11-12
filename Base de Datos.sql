USE [master]
GO
/****** Object:  Database [DBVENTA]    Script Date: 12/11/2023 6:51:27 p. m. ******/
CREATE DATABASE [DBVENTA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBVENTA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DBVENTA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBVENTA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DBVENTA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DBVENTA] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBVENTA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBVENTA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBVENTA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBVENTA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBVENTA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBVENTA] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBVENTA] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DBVENTA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBVENTA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBVENTA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBVENTA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBVENTA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBVENTA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBVENTA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBVENTA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBVENTA] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBVENTA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBVENTA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBVENTA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBVENTA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBVENTA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBVENTA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBVENTA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBVENTA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBVENTA] SET  MULTI_USER 
GO
ALTER DATABASE [DBVENTA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBVENTA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBVENTA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBVENTA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBVENTA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBVENTA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DBVENTA] SET QUERY_STORE = ON
GO
ALTER DATABASE [DBVENTA] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DBVENTA]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 12/11/2023 6:51:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[idCategoria] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuracion]    Script Date: 12/11/2023 6:51:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuracion](
	[recurso] [varchar](50) NULL,
	[propiedad] [varchar](50) NULL,
	[valor] [varchar](60) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 12/11/2023 6:51:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVenta](
	[idDetalleVenta] [int] IDENTITY(1,1) NOT NULL,
	[idVenta] [int] NULL,
	[idProducto] [int] NULL,
	[marcaProducto] [varchar](100) NULL,
	[descripcionProducto] [varchar](100) NULL,
	[categoriaProducto] [varchar](100) NULL,
	[cantidad] [int] NULL,
	[precio] [decimal](10, 2) NULL,
	[total] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[idDetalleVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 12/11/2023 6:51:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[idMenu] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](30) NULL,
	[idMenuPadre] [int] NULL,
	[icono] [varchar](30) NULL,
	[controlador] [varchar](30) NULL,
	[paginaAccion] [varchar](30) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Negocio]    Script Date: 12/11/2023 6:51:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Negocio](
	[idNegocio] [int] NOT NULL,
	[urlLogo] [varchar](500) NULL,
	[nombreLogo] [varchar](100) NULL,
	[numeroDocumento] [varchar](50) NULL,
	[nombre] [varchar](50) NULL,
	[correo] [varchar](50) NULL,
	[direccion] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[porcentajeImpuesto] [decimal](10, 2) NULL,
	[simboloMoneda] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[idNegocio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NumeroCorrelativo]    Script Date: 12/11/2023 6:51:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NumeroCorrelativo](
	[idNumeroCorrelativo] [int] IDENTITY(1,1) NOT NULL,
	[ultimoNumero] [int] NULL,
	[cantidadDigitos] [int] NULL,
	[gestion] [varchar](100) NULL,
	[fechaActualizacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idNumeroCorrelativo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 12/11/2023 6:51:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[codigoBarra] [varchar](50) NULL,
	[marca] [varchar](50) NULL,
	[descripcion] [varchar](100) NULL,
	[idCategoria] [int] NULL,
	[stock] [int] NULL,
	[urlImagen] [varchar](500) NULL,
	[nombreImagen] [varchar](100) NULL,
	[precio] [decimal](10, 2) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 12/11/2023 6:51:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](30) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolMenu]    Script Date: 12/11/2023 6:51:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolMenu](
	[idRolMenu] [int] IDENTITY(1,1) NOT NULL,
	[idRol] [int] NULL,
	[idMenu] [int] NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idRolMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDocumentoVenta]    Script Date: 12/11/2023 6:51:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDocumentoVenta](
	[idTipoDocumentoVenta] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoDocumentoVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 12/11/2023 6:51:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[correo] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[idRol] [int] NULL,
	[urlFoto] [varchar](500) NULL,
	[nombreFoto] [varchar](100) NULL,
	[clave] [varchar](100) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 12/11/2023 6:51:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[idVenta] [int] IDENTITY(1,1) NOT NULL,
	[numeroVenta] [varchar](6) NULL,
	[idTipoDocumentoVenta] [int] NULL,
	[idUsuario] [int] NULL,
	[documentoCliente] [varchar](10) NULL,
	[nombreCliente] [varchar](20) NULL,
	[subTotal] [decimal](10, 2) NULL,
	[impuestoTotal] [decimal](10, 2) NULL,
	[Total] [decimal](10, 2) NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 
GO
INSERT [dbo].[Categoria] ([idCategoria], [descripcion], [esActivo], [fechaRegistro]) VALUES (1, N'Computadoras', 1, CAST(N'2023-11-08T06:08:17.030' AS DateTime))
GO
INSERT [dbo].[Categoria] ([idCategoria], [descripcion], [esActivo], [fechaRegistro]) VALUES (2, N'Laptops', 1, CAST(N'2023-11-08T06:08:17.030' AS DateTime))
GO
INSERT [dbo].[Categoria] ([idCategoria], [descripcion], [esActivo], [fechaRegistro]) VALUES (3, N'Teclados', 1, CAST(N'2023-11-08T06:08:17.030' AS DateTime))
GO
INSERT [dbo].[Categoria] ([idCategoria], [descripcion], [esActivo], [fechaRegistro]) VALUES (4, N'Monitores', 1, CAST(N'2023-11-08T06:08:17.030' AS DateTime))
GO
INSERT [dbo].[Categoria] ([idCategoria], [descripcion], [esActivo], [fechaRegistro]) VALUES (5, N'Microfonos', 1, CAST(N'2023-11-08T06:08:17.030' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
INSERT [dbo].[Configuracion] ([recurso], [propiedad], [valor]) VALUES (N'Servicio_Correo', N'correo', N'perezlyda@gmail.com')
GO
INSERT [dbo].[Configuracion] ([recurso], [propiedad], [valor]) VALUES (N'Servicio_Correo', N'clave', N'awkagnnhamixaiby')
GO
INSERT [dbo].[Configuracion] ([recurso], [propiedad], [valor]) VALUES (N'Servicio_Correo', N'alias', N'MiTienda.com')
GO
INSERT [dbo].[Configuracion] ([recurso], [propiedad], [valor]) VALUES (N'Servicio_Correo', N'host', N'smtp.gmail.com')
GO
INSERT [dbo].[Configuracion] ([recurso], [propiedad], [valor]) VALUES (N'Servicio_Correo', N'puerto', N'587')
GO
INSERT [dbo].[Configuracion] ([recurso], [propiedad], [valor]) VALUES (N'FireBase_Storage', N'email', N'perezlyda@gmail.com')
GO
INSERT [dbo].[Configuracion] ([recurso], [propiedad], [valor]) VALUES (N'FireBase_Storage', N'clave', N'psoftware')
GO
INSERT [dbo].[Configuracion] ([recurso], [propiedad], [valor]) VALUES (N'FireBase_Storage', N'ruta', N'psoftware-16cdd.appspot.com')
GO
INSERT [dbo].[Configuracion] ([recurso], [propiedad], [valor]) VALUES (N'FireBase_Storage', N'api_key', N'AIzaSyDux0WSWjlDYihKdSeMQZ3R34ebRjfgyn0')
GO
INSERT [dbo].[Configuracion] ([recurso], [propiedad], [valor]) VALUES (N'FireBase_Storage', N'carpeta_usuario', N'IMAGENES_USUARIO')
GO
INSERT [dbo].[Configuracion] ([recurso], [propiedad], [valor]) VALUES (N'FireBase_Storage', N'carpeta_producto', N'IMAGENES_PRODUCTO')
GO
INSERT [dbo].[Configuracion] ([recurso], [propiedad], [valor]) VALUES (N'FireBase_Storage', N'carpeta_logo', N'IMAGENES_LOGO')
GO
SET IDENTITY_INSERT [dbo].[DetalleVenta] ON 
GO
INSERT [dbo].[DetalleVenta] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (1, 1, 1, N'HALion', N'Computadora PC Core I5', N'Computadoras', 2, CAST(1699.00 AS Decimal(10, 2)), CAST(3398.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (2, 2, 1, N'HALion', N'Computadora PC Core I5', N'Computadoras', 4, CAST(1699.00 AS Decimal(10, 2)), CAST(6796.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[DetalleVenta] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [icono], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (1, N'DashBoard', 1, N'fas fa-fw fa-tachometer-alt', N'DashBoard', N'Index', 1, CAST(N'2023-11-08T21:09:39.867' AS DateTime))
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [icono], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (2, N'Administración', 2, N'fas fa-fw fa-cog', NULL, NULL, 1, CAST(N'2023-11-08T21:11:11.257' AS DateTime))
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [icono], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (3, N'Inventario', 3, N'fas fa-fw fa-clipboard-list', NULL, NULL, 1, CAST(N'2023-11-08T21:11:11.257' AS DateTime))
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [icono], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (4, N'Ventas', 4, N'fas fa-fw fa-tags', NULL, NULL, 1, CAST(N'2023-11-08T21:11:11.257' AS DateTime))
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [icono], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (5, N'Reportes', 5, N'fas fa-fw fa-chart-area', NULL, NULL, 1, CAST(N'2023-11-08T21:11:11.257' AS DateTime))
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [icono], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (6, N'Usuarios', 2, NULL, N'Usuario', N'Index', 1, CAST(N'2023-11-08T21:11:44.823' AS DateTime))
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [icono], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (7, N'Negocio', 2, NULL, N'Negocio', N'Index', 1, CAST(N'2023-11-08T21:11:44.823' AS DateTime))
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [icono], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (8, N'Categorias', 3, NULL, N'Categoria', N'Index', 1, CAST(N'2023-11-08T21:11:56.030' AS DateTime))
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [icono], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (9, N'Productos', 3, NULL, N'Producto', N'Index', 1, CAST(N'2023-11-08T21:11:56.030' AS DateTime))
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [icono], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (10, N'Nueva Venta', 4, NULL, N'Venta', N'NuevaVenta', 1, CAST(N'2023-11-08T21:12:01.130' AS DateTime))
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [icono], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (11, N'Historial Venta', 4, NULL, N'Venta', N'HistorialVenta', 1, CAST(N'2023-11-08T21:12:01.130' AS DateTime))
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [icono], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (12, N'Reporte de Ventas', 5, NULL, N'Reporte', N'Index', 1, CAST(N'2023-11-08T21:12:04.597' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
INSERT [dbo].[Negocio] ([idNegocio], [urlLogo], [nombreLogo], [numeroDocumento], [nombre], [correo], [direccion], [telefono], [porcentajeImpuesto], [simboloMoneda]) VALUES (1, N'https://firebasestorage.googleapis.com/v0/b/psoftware-16cdd.appspot.com/o/IMAGENES_LOGO%2Ffe4115abf9bd4c8bbd9beb3c7709ada7.jpeg?alt=media&token=6ccbf308-5326-46b1-8215-f239eb374f69', N'fe4115abf9bd4c8bbd9beb3c7709ada7.jpeg', N'123456789', N'Hola', N'codigo@example.com', N'Local', N'142345325', CAST(19.00 AS Decimal(10, 2)), N'$')
GO
SET IDENTITY_INSERT [dbo].[NumeroCorrelativo] ON 
GO
INSERT [dbo].[NumeroCorrelativo] ([idNumeroCorrelativo], [ultimoNumero], [cantidadDigitos], [gestion], [fechaActualizacion]) VALUES (1, 2, 6, N'venta', CAST(N'2023-11-08T17:34:29.660' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[NumeroCorrelativo] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 
GO
INSERT [dbo].[Producto] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (1, N'101010', N'HALion', N'Computadora PC Core I5', 1, 9, NULL, NULL, CAST(1699.00 AS Decimal(10, 2)), 1, CAST(N'2023-11-08T07:27:33.317' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 
GO
INSERT [dbo].[Rol] ([idRol], [descripcion], [esActivo], [fechaRegistro]) VALUES (1, N'Administrador', 1, CAST(N'2023-10-30T15:33:13.293' AS DateTime))
GO
INSERT [dbo].[Rol] ([idRol], [descripcion], [esActivo], [fechaRegistro]) VALUES (2, N'Tecnico', 1, CAST(N'2023-10-30T15:33:13.293' AS DateTime))
GO
INSERT [dbo].[Rol] ([idRol], [descripcion], [esActivo], [fechaRegistro]) VALUES (3, N'Cliente', 1, CAST(N'2023-10-30T15:33:13.293' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO
SET IDENTITY_INSERT [dbo].[RolMenu] ON 
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (1, 1, 1, 1, CAST(N'2023-11-08T21:15:01.177' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (2, 1, 6, 1, CAST(N'2023-11-08T21:15:01.177' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (3, 1, 7, 1, CAST(N'2023-11-08T21:15:01.177' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (4, 1, 8, 1, CAST(N'2023-11-08T21:15:01.177' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (5, 1, 9, 1, CAST(N'2023-11-08T21:15:01.177' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (6, 1, 10, 1, CAST(N'2023-11-08T21:15:01.177' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (7, 1, 11, 1, CAST(N'2023-11-08T21:15:01.177' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (8, 1, 12, 1, CAST(N'2023-11-08T21:15:01.177' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (9, 2, 8, 1, CAST(N'2023-11-08T21:18:55.483' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (10, 2, 9, 1, CAST(N'2023-11-08T21:18:55.483' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (11, 2, 10, 1, CAST(N'2023-11-08T21:18:55.483' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (12, 2, 11, 1, CAST(N'2023-11-08T21:18:55.483' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (13, 3, 10, 1, CAST(N'2023-11-08T21:20:22.813' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[RolMenu] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoDocumentoVenta] ON 
GO
INSERT [dbo].[TipoDocumentoVenta] ([idTipoDocumentoVenta], [descripcion], [esActivo], [fechaRegistro]) VALUES (1, N'Boleta', 1, CAST(N'2023-11-08T13:13:28.093' AS DateTime))
GO
INSERT [dbo].[TipoDocumentoVenta] ([idTipoDocumentoVenta], [descripcion], [esActivo], [fechaRegistro]) VALUES (2, N'Factura', 1, CAST(N'2023-11-08T13:13:28.093' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[TipoDocumentoVenta] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [correo], [telefono], [idRol], [urlFoto], [nombreFoto], [clave], [esActivo], [fechaRegistro]) VALUES (1, N'codigo estudiante', N'codigo@example.com', N'909090', 1, N'https://firebasestorage.googleapis.com/v0/b/psoftware-16cdd.appspot.com/o/IMAGENES_USUARIO%2Fa970875f730f427eb526ca75833b16d0.jpeg?alt=media&token=2bad7c05-1028-419d-b4e1-c4bb51a17afe', N'a970875f730f427eb526ca75833b16d0.jpeg', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 1, CAST(N'2023-10-30T15:34:14.787' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [correo], [telefono], [idRol], [urlFoto], [nombreFoto], [clave], [esActivo], [fechaRegistro]) VALUES (11, N'pepe', N'xedodi2398@rdluxe.com', N'123456789', 3, N'https://firebasestorage.googleapis.com/v0/b/psoftware-16cdd.appspot.com/o/IMAGENES_USUARIO%2F1262d327e70843e69894ef7cf5de48cd.jpg?alt=media&token=3d66016f-15fd-42b9-8e0b-066e62d493eb', N'1262d327e70843e69894ef7cf5de48cd.jpg', N'78ac505b51ae991fe716c20d027ff38c1069bee517e791c2a3f31998a6cc7dd4', 1, CAST(N'2023-11-08T21:52:41.257' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[Venta] ON 
GO
INSERT [dbo].[Venta] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (1, N'000001', 1, 1, N'123123', N'pepe', CAST(2855.46 AS Decimal(10, 2)), CAST(542.54 AS Decimal(10, 2)), CAST(3398.00 AS Decimal(10, 2)), CAST(N'2023-11-08T16:49:45.383' AS DateTime))
GO
INSERT [dbo].[Venta] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (2, N'000002', 1, 1, N'123456', N'ola', CAST(5710.92 AS Decimal(10, 2)), CAST(1085.08 AS Decimal(10, 2)), CAST(6796.00 AS Decimal(10, 2)), CAST(N'2023-11-08T17:34:29.960' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Venta] OFF
GO
ALTER TABLE [dbo].[Categoria] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[Menu] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[Producto] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[Rol] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[RolMenu] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[TipoDocumentoVenta] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD FOREIGN KEY([idVenta])
REFERENCES [dbo].[Venta] ([idVenta])
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD FOREIGN KEY([idMenuPadre])
REFERENCES [dbo].[Menu] ([idMenu])
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([idCategoria])
REFERENCES [dbo].[Categoria] ([idCategoria])
GO
ALTER TABLE [dbo].[RolMenu]  WITH CHECK ADD FOREIGN KEY([idMenu])
REFERENCES [dbo].[Menu] ([idMenu])
GO
ALTER TABLE [dbo].[RolMenu]  WITH CHECK ADD FOREIGN KEY([idRol])
REFERENCES [dbo].[Rol] ([idRol])
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([idRol])
REFERENCES [dbo].[Rol] ([idRol])
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([idTipoDocumentoVenta])
REFERENCES [dbo].[TipoDocumentoVenta] ([idTipoDocumentoVenta])
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarProducto]    Script Date: 12/11/2023 6:51:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertarProducto] (
    @CodigoBarra NVARCHAR(50)
)
AS
BEGIN
    -- Insertar datos en la tabla dbo.Producto
    INSERT INTO DBVENTA.dbo.Producto (CodigoBarra)
    VALUES (@CodigoBarra);
END
EXEC sp_InsertarProducto '1234567890'; 

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarRol]    Script Date: 12/11/2023 6:51:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertarRol] (
    @Descripcion NVARCHAR(255),
    @EsActivo BIT
)
AS
BEGIN
    
    INSERT INTO DBVENTA.dbo.Rol (Descripcion, EsActivo)
    VALUES (@Descripcion, @EsActivo);
END
EXEC sp_InsertarRol 'Descripción del Rol', 1; 
GO
USE [master]
GO
ALTER DATABASE [DBVENTA] SET  READ_WRITE 
GO
