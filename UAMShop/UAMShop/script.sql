USE [master]
GO
/****** Object:  Database [UAM]    Script Date: 09/08/2016 11:33:21 p.m. ******/
CREATE DATABASE [UAM]
GO
ALTER DATABASE [UAM] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UAM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UAM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UAM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UAM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UAM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UAM] SET ARITHABORT OFF 
GO
ALTER DATABASE [UAM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UAM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UAM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UAM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UAM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UAM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UAM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UAM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UAM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UAM] SET  ENABLE_BROKER 
GO
ALTER DATABASE [UAM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UAM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UAM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UAM] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [UAM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UAM] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [UAM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UAM] SET RECOVERY FULL 
GO
ALTER DATABASE [UAM] SET  MULTI_USER 
GO
ALTER DATABASE [UAM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UAM] SET DB_CHAINING OFF 
GO
USE [UAM]
GO
/****** Object:  Table [dbo].[carrito]    Script Date: 09/08/2016 11:33:21 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[carrito](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [bigint] NOT NULL,
	[Codigo] [int] NULL,
	[Descripcion] [varchar](50) NULL,
	[Precio] [money] NULL,
	[Cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[categorias]    Script Date: 09/08/2016 11:33:21 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[categorias](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Categoria] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[contactenos]    Script Date: 09/08/2016 11:33:22 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[contactenos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellidos] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
	[Correo] [varchar](50) NULL,
	[Fecha] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[estados]    Script Date: 09/08/2016 11:33:22 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[estados](
	[IdEstado] [bigint] IDENTITY(1,1) NOT NULL,
	[EstadoA] [varchar](50) NOT NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[facturadetalle]    Script Date: 09/08/2016 11:33:22 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[facturadetalle](
	[IdFacturaDetalle] [int] IDENTITY(1,1) NOT NULL,
	[IdFactura] [int] NULL,
	[Codigo] [int] NULL,
	[Descripcion] [varchar](50) NULL,
	[Precio] [money] NULL,
	[Cantidad] [int] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[facturas]    Script Date: 09/08/2016 11:33:22 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[facturas](
	[IdFactura] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [bigint] NULL,
	[Fecha] [datetime] NULL,
	[Monto] [money] NULL,
	[Tarjeta] [varchar](50) NOT NULL,
	[Titular] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Log]    Script Date: 09/08/2016 11:33:23 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Log](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Thread] [varchar](255) NOT NULL,
	[Level] [varchar](50) NOT NULL,
	[Logger] [varchar](255) NOT NULL,
	[Message] [varchar](4000) NOT NULL,
	[Exception] [varchar](2000) NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[menu]    Script Date: 09/08/2016 11:33:23 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[menu](
	[IdMenu] [int] IDENTITY(1,1) NOT NULL,
	[Menu] [varchar](50) NULL,
	[Pagina] [varchar](50) NULL,
	[IdSubMenu] [int] NULL,
	[RequiereLogin] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[productos]    Script Date: 09/08/2016 11:33:23 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[productos](
	[Codigo] [varchar](50) NOT NULL,
	[Producto] [varchar](50) NULL,
	[Existencia] [int] NULL,
	[Precio] [money] NULL,
	[IdCategoria] [int] NULL,
	[Imagen] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[roles]    Script Date: 09/08/2016 11:33:23 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Rol] [varchar](50) NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rolesxmenu]    Script Date: 09/08/2016 11:33:23 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rolesxmenu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdMenu] [int] NULL,
	[IdRol] [int] NULL
)

GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 09/08/2016 11:33:24 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuarios](
	[IdUsuario] [bigint] IDENTITY(1,1) NOT NULL,
	[Usuario] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Contrasena] [varchar](50) NOT NULL,
	[IdRol] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
	[FechaSuscripcion] [datetime] NOT NULL,
 CONSTRAINT [PKusuarios] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[carrito] ON 

INSERT [dbo].[carrito] ([Id], [IdUsuario], [Codigo], [Descripcion], [Precio], [Cantidad]) VALUES (312, 16, 120882, N'APPLE MACBOOK PRO - PORTÁTIL DE 13"', 673200.0000, 2)
INSERT [dbo].[carrito] ([Id], [IdUsuario], [Codigo], [Descripcion], [Precio], [Cantidad]) VALUES (313, 16, 142652, N'NETBOOK TOSHIBA NB15 A/1203SL', 455000.0000, 2)
SET IDENTITY_INSERT [dbo].[carrito] OFF
SET IDENTITY_INSERT [dbo].[categorias] ON 

INSERT [dbo].[categorias] ([Id], [Categoria]) VALUES (1, N'Informática')
INSERT [dbo].[categorias] ([Id], [Categoria]) VALUES (10, N'Celulares & Tablets')
SET IDENTITY_INSERT [dbo].[categorias] OFF
SET IDENTITY_INSERT [dbo].[estados] ON 

INSERT [dbo].[estados] ([IdEstado], [EstadoA]) VALUES (1, N'Activo')
INSERT [dbo].[estados] ([IdEstado], [EstadoA]) VALUES (0, N'Inactivo')
SET IDENTITY_INSERT [dbo].[estados] OFF
SET IDENTITY_INSERT [dbo].[facturadetalle] ON 

INSERT [dbo].[facturadetalle] ([IdFacturaDetalle], [IdFactura], [Codigo], [Descripcion], [Precio], [Cantidad]) VALUES (140, 96752, 127688, N'SMTR® ONEPLUS 3 ', 209500.0000, 2)
INSERT [dbo].[facturadetalle] ([IdFacturaDetalle], [IdFactura], [Codigo], [Descripcion], [Precio], [Cantidad]) VALUES (141, 96752, 127786, N'SAMSUNG GALAXY S7 - SMARTPHONE', 287400.0000, 1)
INSERT [dbo].[facturadetalle] ([IdFacturaDetalle], [IdFactura], [Codigo], [Descripcion], [Precio], [Cantidad]) VALUES (142, 96753, 127688, N'SMTR® ONEPLUS 3 ', 209500.0000, 1)
INSERT [dbo].[facturadetalle] ([IdFacturaDetalle], [IdFactura], [Codigo], [Descripcion], [Precio], [Cantidad]) VALUES (143, 96754, 142652, N'NETBOOK TOSHIBA NB15 A/1203SL', 455000.0000, 1)
INSERT [dbo].[facturadetalle] ([IdFacturaDetalle], [IdFactura], [Codigo], [Descripcion], [Precio], [Cantidad]) VALUES (144, 96754, 149083, N'TABLET RCA RC7TK9 7PLG WIFI', 49350.0000, 1)
INSERT [dbo].[facturadetalle] ([IdFacturaDetalle], [IdFactura], [Codigo], [Descripcion], [Precio], [Cantidad]) VALUES (148, 96758, 127688, N'SMTR® ONEPLUS 3 ', 209500.0000, 3)
INSERT [dbo].[facturadetalle] ([IdFacturaDetalle], [IdFactura], [Codigo], [Descripcion], [Precio], [Cantidad]) VALUES (149, 96759, 127786, N'SAMSUNG GALAXY S7 - SMARTPHONE', 287400.0000, 2)
INSERT [dbo].[facturadetalle] ([IdFacturaDetalle], [IdFactura], [Codigo], [Descripcion], [Precio], [Cantidad]) VALUES (150, 96760, 127786, N'SAMSUNG GALAXY S7 - SMARTPHONE', 287400.0000, 1)
INSERT [dbo].[facturadetalle] ([IdFacturaDetalle], [IdFactura], [Codigo], [Descripcion], [Precio], [Cantidad]) VALUES (131, 96748, 127688, N'SMTR® ONEPLUS 3 ', 209500.0000, 2)
INSERT [dbo].[facturadetalle] ([IdFacturaDetalle], [IdFactura], [Codigo], [Descripcion], [Precio], [Cantidad]) VALUES (132, 96749, 120882, N'APPLE MACBOOK PRO - PORTÁTIL DE 13"', 673200.0000, 8)
INSERT [dbo].[facturadetalle] ([IdFacturaDetalle], [IdFactura], [Codigo], [Descripcion], [Precio], [Cantidad]) VALUES (133, 96749, 149084, N'SMTR® ONEPLUS 2 ', 157600.0000, 1)
INSERT [dbo].[facturadetalle] ([IdFacturaDetalle], [IdFactura], [Codigo], [Descripcion], [Precio], [Cantidad]) VALUES (134, 96749, 127786, N'SAMSUNG GALAXY S7 - SMARTPHONE', 287400.0000, 1)
INSERT [dbo].[facturadetalle] ([IdFacturaDetalle], [IdFactura], [Codigo], [Descripcion], [Precio], [Cantidad]) VALUES (135, 96749, 147710, N'APPLE IPHONE 6S 16GB 4G GRIS - SMARTPHONE', 398750.0000, 1)
INSERT [dbo].[facturadetalle] ([IdFacturaDetalle], [IdFactura], [Codigo], [Descripcion], [Precio], [Cantidad]) VALUES (136, 96749, 149083, N'TABLET RCA RC7TK9 7PLG WIFI', 49350.0000, 1)
INSERT [dbo].[facturadetalle] ([IdFacturaDetalle], [IdFactura], [Codigo], [Descripcion], [Precio], [Cantidad]) VALUES (137, 96750, 127688, N'SMTR® ONEPLUS 3 ', 209500.0000, 1)
INSERT [dbo].[facturadetalle] ([IdFacturaDetalle], [IdFactura], [Codigo], [Descripcion], [Precio], [Cantidad]) VALUES (138, 96750, 120882, N'APPLE MACBOOK PRO - PORTÁTIL DE 13"', 673200.0000, 3)
INSERT [dbo].[facturadetalle] ([IdFacturaDetalle], [IdFactura], [Codigo], [Descripcion], [Precio], [Cantidad]) VALUES (139, 96751, 127688, N'SMTR® ONEPLUS 3 ', 209500.0000, 1)
INSERT [dbo].[facturadetalle] ([IdFacturaDetalle], [IdFactura], [Codigo], [Descripcion], [Precio], [Cantidad]) VALUES (145, 96755, 127688, N'SMTR® ONEPLUS 3 ', 209500.0000, 1)
INSERT [dbo].[facturadetalle] ([IdFacturaDetalle], [IdFactura], [Codigo], [Descripcion], [Precio], [Cantidad]) VALUES (146, 96756, 127786, N'SAMSUNG GALAXY S7 - SMARTPHONE', 287400.0000, 1)
INSERT [dbo].[facturadetalle] ([IdFacturaDetalle], [IdFactura], [Codigo], [Descripcion], [Precio], [Cantidad]) VALUES (147, 96757, 149083, N'TABLET RCA RC7TK9 7PLG WIFI', 49350.0000, 1)
INSERT [dbo].[facturadetalle] ([IdFacturaDetalle], [IdFactura], [Codigo], [Descripcion], [Precio], [Cantidad]) VALUES (129, 96747, 120882, N'APPLE MACBOOK PRO - PORTÁTIL DE 13"', 673200.0000, 1)
INSERT [dbo].[facturadetalle] ([IdFacturaDetalle], [IdFactura], [Codigo], [Descripcion], [Precio], [Cantidad]) VALUES (130, 96747, 142652, N'NETBOOK TOSHIBA NB15 A/1203SL', 455000.0000, 1)
SET IDENTITY_INSERT [dbo].[facturadetalle] OFF
SET IDENTITY_INSERT [dbo].[facturas] ON 

INSERT [dbo].[facturas] ([IdFactura], [IdUsuario], [Fecha], [Monto], [Tarjeta], [Titular]) VALUES (96747, 15, CAST(N'2016-08-09 21:57:04.603' AS DateTime), 1128200.0000, N'377713145238815', N'DIEGO CASTRO')
INSERT [dbo].[facturas] ([IdFactura], [IdUsuario], [Fecha], [Monto], [Tarjeta], [Titular]) VALUES (96748, 13, CAST(N'2016-08-09 22:29:02.430' AS DateTime), 419000.0000, N'5303151916034220', N'JOHANNA SANCHEZ ELIZONDO')
INSERT [dbo].[facturas] ([IdFactura], [IdUsuario], [Fecha], [Monto], [Tarjeta], [Titular]) VALUES (96749, 17, CAST(N'2016-08-09 22:45:54.977' AS DateTime), 6278700.0000, N'5303151916034220', N'RANDALL RODRIGUEZ')
INSERT [dbo].[facturas] ([IdFactura], [IdUsuario], [Fecha], [Monto], [Tarjeta], [Titular]) VALUES (96750, 13, CAST(N'2016-08-09 22:57:03.120' AS DateTime), 2229100.0000, N'5303151916034220', N'JOHANNA SANCHEZ ELIZONDO')
INSERT [dbo].[facturas] ([IdFactura], [IdUsuario], [Fecha], [Monto], [Tarjeta], [Titular]) VALUES (96751, 13, CAST(N'2016-08-09 22:59:26.153' AS DateTime), 209500.0000, N'5303151916034220', N'JOHANNA SANCHEZ ELIZONDO')
INSERT [dbo].[facturas] ([IdFactura], [IdUsuario], [Fecha], [Monto], [Tarjeta], [Titular]) VALUES (96752, 13, CAST(N'2016-08-10 01:44:42.420' AS DateTime), 706400.0000, N'5303151916034220', N'JOHANNA SANCHEZ ELIZONDO')
INSERT [dbo].[facturas] ([IdFactura], [IdUsuario], [Fecha], [Monto], [Tarjeta], [Titular]) VALUES (96753, 13, CAST(N'2016-08-10 01:55:10.833' AS DateTime), 209500.0000, N'5303151916034220', N'JOHANNA SANCHEZ ELIZONDO')
INSERT [dbo].[facturas] ([IdFactura], [IdUsuario], [Fecha], [Monto], [Tarjeta], [Titular]) VALUES (96754, 3, CAST(N'2016-08-10 02:45:01.227' AS DateTime), 504350.0000, N'4111111111111111', N'MAYKOOL RIVERA CARRANZA')
INSERT [dbo].[facturas] ([IdFactura], [IdUsuario], [Fecha], [Monto], [Tarjeta], [Titular]) VALUES (96755, 13, CAST(N'2016-08-10 03:05:26.110' AS DateTime), 209500.0000, N'5303151916034220', N'JOHANNA SANCHEZ ELIZONDO')
INSERT [dbo].[facturas] ([IdFactura], [IdUsuario], [Fecha], [Monto], [Tarjeta], [Titular]) VALUES (96756, 13, CAST(N'2016-08-10 04:02:04.780' AS DateTime), 287400.0000, N'5303151916034220', N'FRANCISCO LOBO P')
INSERT [dbo].[facturas] ([IdFactura], [IdUsuario], [Fecha], [Monto], [Tarjeta], [Titular]) VALUES (96757, 13, CAST(N'2016-08-10 04:17:59.233' AS DateTime), 49350.0000, N'5303151916034220', N'5303151916034220')
INSERT [dbo].[facturas] ([IdFactura], [IdUsuario], [Fecha], [Monto], [Tarjeta], [Titular]) VALUES (96758, 18, CAST(N'2016-08-10 05:12:41.667' AS DateTime), 628500.0000, N'4205515000211658', N'JOHANNA SANCHEZ ELIZONDO')
INSERT [dbo].[facturas] ([IdFactura], [IdUsuario], [Fecha], [Monto], [Tarjeta], [Titular]) VALUES (96759, 13, CAST(N'2016-08-10 05:23:27.110' AS DateTime), 574800.0000, N'5303151916034220', N'JOHANNA SANCHEZ ELIZONDO')
INSERT [dbo].[facturas] ([IdFactura], [IdUsuario], [Fecha], [Monto], [Tarjeta], [Titular]) VALUES (96760, 18, CAST(N'2016-08-10 05:26:45.693' AS DateTime), 287400.0000, N'5303151916034220', N'JOHANNA SANCHEZ ELIZONDO')
SET IDENTITY_INSERT [dbo].[facturas] OFF
SET IDENTITY_INSERT [dbo].[Log] ON 

INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (1, CAST(N'2016-08-09 20:03:54.957' AS DateTime), N'8', N'ERROR', N'UAMSHOP', N'Attempted to divide by zero.   at Log4NetModule.Test.Main(String[] args) in c:\Users\u46416\Documents\GitHub\progra\UAMShop\Log4NetModule\Test.cs:line 16', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (2, CAST(N'2016-08-09 20:04:01.210' AS DateTime), N'8', N'WARN', N'UAMSHOP', N'Attempted to divide by zero.   at Log4NetModule.Test.Main(String[] args) in c:\Users\u46416\Documents\GitHub\progra\UAMShop\Log4NetModule\Test.cs:line 16', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (3, CAST(N'2016-08-09 20:27:51.957' AS DateTime), N'6', N'INFO', N'UAMSHOP', N'Usuario logueado Francisco Javier Lobo Porras', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (4, CAST(N'2016-08-09 20:29:43.923' AS DateTime), N'17', N'ERROR', N'UAMSHOP', N'The SMTP server requires a secure connection or the client was not authenticated. The server response was: 5.5.1 Authentication Required. Learn more at   at System.Net.Mail.MailCommand.CheckResponse(SmtpStatusCode statusCode, String response)
   at System.Net.Mail.MailCommand.Send(SmtpConnection conn, Byte[] command, MailAddress from, Boolean allowUnicode)
   at System.Net.Mail.SmtpTransport.SendMail(MailAddress sender, MailAddressCollection recipients, String deliveryNotify, Boolean allowUnicode, SmtpFailedRecipientException& exception)
   at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at NotificationModule.Mail.SendMail(MailMessage mensaje) in c:\Users\u46416\Documents\GitHub\progra\UAMShop\NotificationModule\Mail.cs:line 29
   at NotificationModule.SendMail.SendInvoice(String idInvoice, String to, String nameTo, Double amount, String titularTarjeta, String creditCard, String htmltable) in c:\Users\u46416\Documents\GitHub\progra\UAMShop\NotificationModule\SendMail.cs:line 75', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (5, CAST(N'2016-08-09 20:35:55.833' AS DateTime), N'24', N'ERROR', N'UAMSHOP', N'A network-related or instance-specific error occurred while establishing a connection to SQL Server. The server was not found or was not accessible. Verify that the instance name is correct and that SQL Server is configured to allow remote connections. (provider: Named Pipes Provider, error: 40 - Could not open a connection to SQL Server)   at System.Data.SqlClient.SqlInternalConnectionTds..ctor(DbConnectionPoolIdentity identity, SqlConnectionString connectionOptions, SqlCredential credential, Object providerInfo, String newPassword, SecureString newSecurePassword, Boolean redirectedUserInstance, SqlConnectionString userConnectionOptions, SessionData reconnectSessionData, DbConnectionPool pool, String accessToken, Boolean applyTransientFaultHandling)
   at System.Data.SqlClient.SqlConnectionFactory.CreateConnection(DbConnectionOptions options, DbConnectionPoolKey poolKey, Object poolGroupProviderInfo, DbConnectionPool pool, DbConnection owningConnection, DbConnectionOptions userOptions)
   at System.Data.ProviderBase.DbConnectionFactory.CreatePooledConnection(DbConnectionPool pool, DbConnection owningObject, DbConnectionOptions options, DbConnectionPoolKey poolKey, DbConnectionOptions userOptions)
   at System.Data.ProviderBase.DbConnectionPool.CreateObject(DbConnection owningObject, DbConnectionOptions userOptions, DbConnectionInternal oldConnection)
   at System.Data.ProviderBase.DbConnectionPool.UserCreateRequest(DbConnection owningObject, DbConnectionOptions userOptions, DbConnectionInternal oldConnection)
   at System.Data.ProviderBase.DbConnectionPool.TryGetConnection(DbConnection owningObject, UInt32 waitForMultipleObjectsTimeout, Boolean allowCreate, Boolean onlyOneCheckConnection, DbConnectionOptions userOptions, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionPool.TryGetConnection(DbConnection owningObject, TaskCompletionSource`1 retry, DbConnectionOptions userOptions, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionFactory.TryGetConnection(DbConnection owningConnection, TaskCompletionSource`1 retry, DbConnectionOptions userOptions, DbConnectionInternal oldConnection, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionInternal.TryOpenConnectionInternal(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at System.Data.ProviderBase.DbConnectionClosed.TryOpenConnection(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at System.Data.SqlClient.SqlConnection.TryOpenInner(TaskCompletionSource`1 retry)
   at System.Data.SqlClient.SqlConnection.TryOpen(TaskCompletionSource`1 retry)
   at System.Data.SqlClient.SqlConnection.Open()
   at ProductModule.ProductDAL.RetrieveProductsTop(String connectionString) in c:\Users\u46416\Documents\GitHub\progra\UAMShop\ProductModule\ProductDAL.cs:line 64', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (6, CAST(N'2016-08-10 02:40:35.697' AS DateTime), N'9', N'INFO', N'UAMSHOP', N'Usuario logueado Franco Rivera', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (7, CAST(N'2016-08-09 20:58:56.387' AS DateTime), N'9', N'ERROR', N'UAMSHOP', N'The SMTP server requires a secure connection or the client was not authenticated. The server response was: 5.5.1 Authentication Required. Learn more at   at System.Net.Mail.MailCommand.CheckResponse(SmtpStatusCode statusCode, String response)
   at System.Net.Mail.MailCommand.Send(SmtpConnection conn, Byte[] command, MailAddress from, Boolean allowUnicode)
   at System.Net.Mail.SmtpTransport.SendMail(MailAddress sender, MailAddressCollection recipients, String deliveryNotify, Boolean allowUnicode, SmtpFailedRecipientException& exception)
   at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at NotificationModule.Mail.SendMail(MailMessage mensaje) in c:\Users\u46416\Documents\GitHub\progra\UAMShop\NotificationModule\Mail.cs:line 29
   at NotificationModule.SendMail.SendUserNotification(String nombre, String correo) in c:\Users\u46416\Documents\GitHub\progra\UAMShop\NotificationModule\SendMail.cs:line 105', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (8, CAST(N'2016-08-09 20:59:05.167' AS DateTime), N'11', N'ERROR', N'UAMSHOP', N'Input string was not in a correct format.   at System.Text.StringBuilder.AppendFormatHelper(IFormatProvider provider, String format, ParamsArray args)
   at System.String.FormatHelper(IFormatProvider provider, String format, ParamsArray args)
   at System.String.Format(String format, Object arg0, Object arg1)
   at NotificationModule.SendMail.SendUserNotification(String nombre, String correo) in c:\Users\u46416\Documents\GitHub\progra\UAMShop\NotificationModule\SendMail.cs:line 107', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (9, CAST(N'2016-08-10 02:43:30.743' AS DateTime), N'20', N'INFO', N'UAMSHOP', N'Usuario logueado Administrador UAM SHOP', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (10, CAST(N'2016-08-10 02:44:07.543' AS DateTime), N'6', N'INFO', N'UAMSHOP', N'Usuario logueado Franco Rivera', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (11, CAST(N'2016-08-10 02:45:00.663' AS DateTime), N'19', N'ERROR', N'UAMSHOP', N'The SMTP server requires a secure connection or the client was not authenticated. The server response was: 5.5.1 Authentication Required. Learn more at   at System.Net.Mail.MailCommand.CheckResponse(SmtpStatusCode statusCode, String response)
   at System.Net.Mail.MailCommand.Send(SmtpConnection conn, Byte[] command, MailAddress from, Boolean allowUnicode)
   at System.Net.Mail.SmtpTransport.SendMail(MailAddress sender, MailAddressCollection recipients, String deliveryNotify, Boolean allowUnicode, SmtpFailedRecipientException& exception)
   at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at NotificationModule.SendMail.SendInvoice(String idInvoice, String to, String nameTo, Double amount, String titularTarjeta, String creditCard, String htmltable)', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (12, CAST(N'2016-08-09 21:00:32.217' AS DateTime), N'7', N'INFO', N'UAMSHOP', N'Usuario logueado Francisco Javier Lobo Porras', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (13, CAST(N'2016-08-09 21:02:56.617' AS DateTime), N'7', N'INFO', N'UAMSHOP', N'Usuario logueado Guillermo Ching', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (14, CAST(N'2016-08-09 21:04:09.870' AS DateTime), N'23', N'INFO', N'UAMSHOP', N'Usuario logueado Francisco Javier Lobo Porras', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (15, CAST(N'2016-08-09 21:04:45.857' AS DateTime), N'10', N'INFO', N'UAMSHOP', N'Estimado(a) Francisco Javier Lobo Porras se le ha enviado a loboporras@gmail.com la factura de compra 96755 por un monto de ¢209.500,00.', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (16, CAST(N'2016-08-10 03:22:32.853' AS DateTime), N'8', N'INFO', N'UAMSHOP', N'Usuario logueado Administrador UAM SHOP', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (22, CAST(N'2016-08-10 03:57:39.530' AS DateTime), N'11', N'INFO', N'UAMSHOP', N'Usuario logueado Francisco Javier Lobo Porras', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (23, CAST(N'2016-08-10 04:00:01.347' AS DateTime), N'8', N'INFO', N'UAMSHOP', N'Usuario logueado Francisco Javier Lobo Porras', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (28, CAST(N'2016-08-09 22:18:32.587' AS DateTime), N'30', N'ERROR', N'UAMSHOP', N'A network-related or instance-specific error occurred while establishing a connection to SQL Server. The server was not found or was not accessible. Verify that the instance name is correct and that SQL Server is configured to allow remote connections. (provider: Named Pipes Provider, error: 40 - Could not open a connection to SQL Server)   at System.Data.SqlClient.SqlInternalConnectionTds..ctor(DbConnectionPoolIdentity identity, SqlConnectionString connectionOptions, SqlCredential credential, Object providerInfo, String newPassword, SecureString newSecurePassword, Boolean redirectedUserInstance, SqlConnectionString userConnectionOptions, SessionData reconnectSessionData, DbConnectionPool pool, String accessToken, Boolean applyTransientFaultHandling)
   at System.Data.SqlClient.SqlConnectionFactory.CreateConnection(DbConnectionOptions options, DbConnectionPoolKey poolKey, Object poolGroupProviderInfo, DbConnectionPool pool, DbConnection owningConnection, DbConnectionOptions userOptions)
   at System.Data.ProviderBase.DbConnectionFactory.CreatePooledConnection(DbConnectionPool pool, DbConnection owningObject, DbConnectionOptions options, DbConnectionPoolKey poolKey, DbConnectionOptions userOptions)
   at System.Data.ProviderBase.DbConnectionPool.CreateObject(DbConnection owningObject, DbConnectionOptions userOptions, DbConnectionInternal oldConnection)
   at System.Data.ProviderBase.DbConnectionPool.UserCreateRequest(DbConnection owningObject, DbConnectionOptions userOptions, DbConnectionInternal oldConnection)
   at System.Data.ProviderBase.DbConnectionPool.TryGetConnection(DbConnection owningObject, UInt32 waitForMultipleObjectsTimeout, Boolean allowCreate, Boolean onlyOneCheckConnection, DbConnectionOptions userOptions, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionPool.TryGetConnection(DbConnection owningObject, TaskCompletionSource`1 retry, DbConnectionOptions userOptions, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionFactory.TryGetConnection(DbConnection owningConnection, TaskCompletionSource`1 retry, DbConnectionOptions userOptions, DbConnectionInternal oldConnection, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionInternal.TryOpenConnectionInternal(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at System.Data.ProviderBase.DbConnectionClosed.TryOpenConnection(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at System.Data.SqlClient.SqlConnection.TryOpenInner(TaskCompletionSource`1 retry)
   at System.Data.SqlClient.SqlConnection.TryOpen(TaskCompletionSource`1 retry)
   at System.Data.SqlClient.SqlConnection.Open()
   at ProductModule.ProductDAL.RetrieveProductsTop(String connectionString) in c:\Users\u46416\Documents\GitHub\progra\UAMShop\ProductModule\ProductDAL.cs:line 64', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (29, CAST(N'2016-08-09 22:18:32.617' AS DateTime), N'30', N'ERROR', N'UAMSHOP', N'A network-related or instance-specific error occurred while establishing a connection to SQL Server. The server was not found or was not accessible. Verify that the instance name is correct and that SQL Server is configured to allow remote connections. (provider: Named Pipes Provider, error: 40 - Could not open a connection to SQL Server)   at System.Data.ProviderBase.DbConnectionPool.TryGetConnection(DbConnection owningObject, UInt32 waitForMultipleObjectsTimeout, Boolean allowCreate, Boolean onlyOneCheckConnection, DbConnectionOptions userOptions, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionPool.TryGetConnection(DbConnection owningObject, TaskCompletionSource`1 retry, DbConnectionOptions userOptions, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionFactory.TryGetConnection(DbConnection owningConnection, TaskCompletionSource`1 retry, DbConnectionOptions userOptions, DbConnectionInternal oldConnection, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionInternal.TryOpenConnectionInternal(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at System.Data.ProviderBase.DbConnectionClosed.TryOpenConnection(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at System.Data.SqlClient.SqlConnection.TryOpenInner(TaskCompletionSource`1 retry)
   at System.Data.SqlClient.SqlConnection.TryOpen(TaskCompletionSource`1 retry)
   at System.Data.SqlClient.SqlConnection.Open()
   at MenuModule.MenuDal.RetrieveMenu(Int32 idUsuario) in c:\Users\u46416\Documents\GitHub\progra\UAMShop\MenuModule\MenuDal.cs:line 29', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (43, CAST(N'2016-08-10 05:06:13.420' AS DateTime), N'11', N'INFO', N'UAMSHOP', N'Usuario logueado Administrador UAM SHOP', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (44, CAST(N'2016-08-10 05:06:20.133' AS DateTime), N'9', N'ERROR', N'UAMSHOP', N'Thread was being aborted.   at System.Threading.Thread.AbortInternal()
   at System.Threading.Thread.Abort(Object stateInfo)
   at System.Web.HttpResponse.AbortCurrentThread()
   at System.Web.HttpResponse.End()
   at System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   at UAMShop.MasterPages.MainTemplate.logout_btn_Click(Object sender, EventArgs e)', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (45, CAST(N'2016-08-10 05:06:28.203' AS DateTime), N'8', N'INFO', N'UAMSHOP', N'Usuario logueado Administrador UAM SHOP', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (17, CAST(N'2016-08-09 21:24:11.207' AS DateTime), N'5', N'ERROR', N'UAMSHOP', N'A network-related or instance-specific error occurred while establishing a connection to SQL Server. The server was not found or was not accessible. Verify that the instance name is correct and that SQL Server is configured to allow remote connections. (provider: Named Pipes Provider, error: 40 - Could not open a connection to SQL Server)   at System.Data.SqlClient.SqlInternalConnectionTds..ctor(DbConnectionPoolIdentity identity, SqlConnectionString connectionOptions, SqlCredential credential, Object providerInfo, String newPassword, SecureString newSecurePassword, Boolean redirectedUserInstance, SqlConnectionString userConnectionOptions, SessionData reconnectSessionData, DbConnectionPool pool, String accessToken, Boolean applyTransientFaultHandling)
   at System.Data.SqlClient.SqlConnectionFactory.CreateConnection(DbConnectionOptions options, DbConnectionPoolKey poolKey, Object poolGroupProviderInfo, DbConnectionPool pool, DbConnection owningConnection, DbConnectionOptions userOptions)
   at System.Data.ProviderBase.DbConnectionFactory.CreatePooledConnection(DbConnectionPool pool, DbConnection owningObject, DbConnectionOptions options, DbConnectionPoolKey poolKey, DbConnectionOptions userOptions)
   at System.Data.ProviderBase.DbConnectionPool.CreateObject(DbConnection owningObject, DbConnectionOptions userOptions, DbConnectionInternal oldConnection)
   at System.Data.ProviderBase.DbConnectionPool.UserCreateRequest(DbConnection owningObject, DbConnectionOptions userOptions, DbConnectionInternal oldConnection)
   at System.Data.ProviderBase.DbConnectionPool.TryGetConnection(DbConnection owningObject, UInt32 waitForMultipleObjectsTimeout, Boolean allowCreate, Boolean onlyOneCheckConnection, DbConnectionOptions userOptions, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionPool.TryGetConnection(DbConnection owningObject, TaskCompletionSource`1 retry, DbConnectionOptions userOptions, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionFactory.TryGetConnection(DbConnection owningConnection, TaskCompletionSource`1 retry, DbConnectionOptions userOptions, DbConnectionInternal oldConnection, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionInternal.TryOpenConnectionInternal(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at System.Data.ProviderBase.DbConnectionClosed.TryOpenConnection(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at System.Data.SqlClient.SqlConnection.TryOpenInner(TaskCompletionSource`1 retry)
   at System.Data.SqlClient.SqlConnection.TryOpen(TaskCompletionSource`1 retry)
   at System.Data.SqlClient.SqlConnection.Open()
   at ProductModule.ProductDAL.RetrieveProductsTop(String connectionString) in c:\Users\u46416\Documents\GitHub\progra\UAMShop\ProductModule\ProductDAL.cs:line 64', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (18, CAST(N'2016-08-09 21:24:11.277' AS DateTime), N'5', N'ERROR', N'UAMSHOP', N'A network-related or instance-specific error occurred while establishing a connection to SQL Server. The server was not found or was not accessible. Verify that the instance name is correct and that SQL Server is configured to allow remote connections. (provider: Named Pipes Provider, error: 40 - Could not open a connection to SQL Server)   at System.Data.ProviderBase.DbConnectionPool.TryGetConnection(DbConnection owningObject, UInt32 waitForMultipleObjectsTimeout, Boolean allowCreate, Boolean onlyOneCheckConnection, DbConnectionOptions userOptions, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionPool.TryGetConnection(DbConnection owningObject, TaskCompletionSource`1 retry, DbConnectionOptions userOptions, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionFactory.TryGetConnection(DbConnection owningConnection, TaskCompletionSource`1 retry, DbConnectionOptions userOptions, DbConnectionInternal oldConnection, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionInternal.TryOpenConnectionInternal(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at System.Data.ProviderBase.DbConnectionClosed.TryOpenConnection(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at System.Data.SqlClient.SqlConnection.TryOpenInner(TaskCompletionSource`1 retry)
   at System.Data.SqlClient.SqlConnection.TryOpen(TaskCompletionSource`1 retry)
   at System.Data.SqlClient.SqlConnection.Open()
   at MenuModule.MenuDal.RetrieveMenu(Int32 idUsuario) in c:\Users\u46416\Documents\GitHub\progra\UAMShop\MenuModule\MenuDal.cs:line 29', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (20, CAST(N'2016-08-09 21:38:57.177' AS DateTime), N'11', N'INFO', N'UAMSHOP', N'Usuario logueado Francisco Javier Lobo Porras', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (21, CAST(N'2016-08-09 21:39:48.080' AS DateTime), N'34', N'INFO', N'UAMSHOP', N'Usuario logueado Francisco Javier Lobo Porras', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (24, CAST(N'2016-08-10 04:01:34.907' AS DateTime), N'10', N'INFO', N'UAMSHOP', N'Usuario logueado Francisco Javier Lobo Porras', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (25, CAST(N'2016-08-10 04:02:04.423' AS DateTime), N'8', N'ERROR', N'UAMSHOP', N'The SMTP server requires a secure connection or the client was not authenticated. The server response was: 5.5.1 Authentication Required. Learn more at   at System.Net.Mail.MailCommand.CheckResponse(SmtpStatusCode statusCode, String response)
   at System.Net.Mail.MailCommand.Send(SmtpConnection conn, Byte[] command, MailAddress from, Boolean allowUnicode)
   at System.Net.Mail.SmtpTransport.SendMail(MailAddress sender, MailAddressCollection recipients, String deliveryNotify, Boolean allowUnicode, SmtpFailedRecipientException& exception)
   at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at NotificationModule.SendMail.SendInvoice(String idInvoice, String to, String nameTo, Double amount, String titularTarjeta, String creditCard, String htmltable)', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (27, CAST(N'2016-08-10 04:16:48.273' AS DateTime), N'18', N'INFO', N'UAMSHOP', N'Usuario logueado Francisco Javier Lobo Porras', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (30, CAST(N'2016-08-10 04:17:20.583' AS DateTime), N'8', N'INFO', N'UAMSHOP', N'Usuario logueado Francisco Javier Lobo Porras', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (31, CAST(N'2016-08-10 04:17:58.933' AS DateTime), N'16', N'ERROR', N'UAMSHOP', N'The SMTP server requires a secure connection or the client was not authenticated. The server response was: 5.5.1 Authentication Required. Learn more at   at System.Net.Mail.MailCommand.CheckResponse(SmtpStatusCode statusCode, String response)
   at System.Net.Mail.MailCommand.Send(SmtpConnection conn, Byte[] command, MailAddress from, Boolean allowUnicode)
   at System.Net.Mail.SmtpTransport.SendMail(MailAddress sender, MailAddressCollection recipients, String deliveryNotify, Boolean allowUnicode, SmtpFailedRecipientException& exception)
   at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at NotificationModule.SendMail.SendInvoice(String idInvoice, String to, String nameTo, Double amount, String titularTarjeta, String creditCard, String htmltable)', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (34, CAST(N'2016-08-09 23:06:56.817' AS DateTime), N'24', N'INFO', N'UAMSHOP', N'Usuario logueado Francisco Javier Lobo Porras', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (37, CAST(N'2016-08-09 23:09:45.387' AS DateTime), N'24', N'INFO', N'UAMSHOP', N'Usuario logueado Francisco Javier Lobo Porras', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (52, CAST(N'2016-08-09 23:25:42.683' AS DateTime), N'29', N'INFO', N'UAMSHOP', N'Usuario logueado Francisco Javier Lobo Porras', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (53, CAST(N'2016-08-09 23:26:03.373' AS DateTime), N'22', N'INFO', N'UAMSHOP', N'Estimado(a) Francisco Javier Lobo Porras se le ha enviado a franciscolobo@hotmail.es la factura de compra 96760 por un monto de ¢287.400,00.', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (19, CAST(N'2016-08-09 21:36:35.133' AS DateTime), N'31', N'ERROR', N'UAMSHOP', N'A network-related or instance-specific error occurred while establishing a connection to SQL Server. The server was not found or was not accessible. Verify that the instance name is correct and that SQL Server is configured to allow remote connections. (provider: Named Pipes Provider, error: 40 - Could not open a connection to SQL Server)   at System.Data.SqlClient.SqlInternalConnectionTds..ctor(DbConnectionPoolIdentity identity, SqlConnectionString connectionOptions, SqlCredential credential, Object providerInfo, String newPassword, SecureString newSecurePassword, Boolean redirectedUserInstance, SqlConnectionString userConnectionOptions, SessionData reconnectSessionData, DbConnectionPool pool, String accessToken, Boolean applyTransientFaultHandling)
   at System.Data.SqlClient.SqlConnectionFactory.CreateConnection(DbConnectionOptions options, DbConnectionPoolKey poolKey, Object poolGroupProviderInfo, DbConnectionPool pool, DbConnection owningConnection, DbConnectionOptions userOptions)
   at System.Data.ProviderBase.DbConnectionFactory.CreatePooledConnection(DbConnectionPool pool, DbConnection owningObject, DbConnectionOptions options, DbConnectionPoolKey poolKey, DbConnectionOptions userOptions)
   at System.Data.ProviderBase.DbConnectionPool.CreateObject(DbConnection owningObject, DbConnectionOptions userOptions, DbConnectionInternal oldConnection)
   at System.Data.ProviderBase.DbConnectionPool.UserCreateRequest(DbConnection owningObject, DbConnectionOptions userOptions, DbConnectionInternal oldConnection)
   at System.Data.ProviderBase.DbConnectionPool.TryGetConnection(DbConnection owningObject, UInt32 waitForMultipleObjectsTimeout, Boolean allowCreate, Boolean onlyOneCheckConnection, DbConnectionOptions userOptions, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionPool.TryGetConnection(DbConnection owningObject, TaskCompletionSource`1 retry, DbConnectionOptions userOptions, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionFactory.TryGetConnection(DbConnection owningConnection, TaskCompletionSource`1 retry, DbConnectionOptions userOptions, DbConnectionInternal oldConnection, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionInternal.TryOpenConnectionInternal(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at System.Data.ProviderBase.DbConnectionClosed.TryOpenConnection(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at System.Data.SqlClient.SqlConnection.TryOpenInner(TaskCompletionSource`1 retry)
   at System.Data.SqlClient.SqlConnection.TryOpen(TaskCompletionSource`1 retry)
   at System.Data.SqlClient.SqlConnection.Open()
   at ProductModule.ProductDAL.RetrieveProductsTop(String connectionString) in c:\Users\u46416\Documents\GitHub\progra\UAMShop\ProductModule\ProductDAL.cs:line 64', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (26, CAST(N'2016-08-09 22:15:37.740' AS DateTime), N'21', N'ERROR', N'UAMSHOP', N'A network-related or instance-specific error occurred while establishing a connection to SQL Server. The server was not found or was not accessible. Verify that the instance name is correct and that SQL Server is configured to allow remote connections. (provider: Named Pipes Provider, error: 40 - Could not open a connection to SQL Server)   at System.Data.SqlClient.SqlInternalConnectionTds..ctor(DbConnectionPoolIdentity identity, SqlConnectionString connectionOptions, SqlCredential credential, Object providerInfo, String newPassword, SecureString newSecurePassword, Boolean redirectedUserInstance, SqlConnectionString userConnectionOptions, SessionData reconnectSessionData, DbConnectionPool pool, String accessToken, Boolean applyTransientFaultHandling)
   at System.Data.SqlClient.SqlConnectionFactory.CreateConnection(DbConnectionOptions options, DbConnectionPoolKey poolKey, Object poolGroupProviderInfo, DbConnectionPool pool, DbConnection owningConnection, DbConnectionOptions userOptions)
   at System.Data.ProviderBase.DbConnectionFactory.CreatePooledConnection(DbConnectionPool pool, DbConnection owningObject, DbConnectionOptions options, DbConnectionPoolKey poolKey, DbConnectionOptions userOptions)
   at System.Data.ProviderBase.DbConnectionPool.CreateObject(DbConnection owningObject, DbConnectionOptions userOptions, DbConnectionInternal oldConnection)
   at System.Data.ProviderBase.DbConnectionPool.UserCreateRequest(DbConnection owningObject, DbConnectionOptions userOptions, DbConnectionInternal oldConnection)
   at System.Data.ProviderBase.DbConnectionPool.TryGetConnection(DbConnection owningObject, UInt32 waitForMultipleObjectsTimeout, Boolean allowCreate, Boolean onlyOneCheckConnection, DbConnectionOptions userOptions, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionPool.TryGetConnection(DbConnection owningObject, TaskCompletionSource`1 retry, DbConnectionOptions userOptions, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionFactory.TryGetConnection(DbConnection owningConnection, TaskCompletionSource`1 retry, DbConnectionOptions userOptions, DbConnectionInternal oldConnection, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionInternal.TryOpenConnectionInternal(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at System.Data.ProviderBase.DbConnectionClosed.TryOpenConnection(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at System.Data.SqlClient.SqlConnection.TryOpenInner(TaskCompletionSource`1 retry)
   at System.Data.SqlClient.SqlConnection.TryOpen(TaskCompletionSource`1 retry)
   at System.Data.SqlClient.SqlConnection.Open()
   at ProductModule.ProductDAL.RetrieveProductsTop(String connectionString) in c:\Users\u46416\Documents\GitHub\progra\UAMShop\ProductModule\ProductDAL.cs:line 64', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (35, CAST(N'2016-08-09 23:07:17.300' AS DateTime), N'17', N'ERROR', N'UAMSHOP', N'Thread was being aborted.   at System.Threading.Thread.AbortInternal()
   at System.Threading.Thread.Abort(Object stateInfo)
   at System.Web.HttpResponse.AbortCurrentThread()
   at System.Web.HttpResponse.End()
   at System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   at System.Web.HttpResponse.Redirect(String url)
   at UAMShop.MasterPages.MainTemplate.logout_btn_Click(Object sender, EventArgs e) in c:\Users\u46416\Documents\GitHub\progra\UAMShop\UAMShop\MasterPages\MainTemplate.Master.cs:line 43', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (32, CAST(N'2016-08-09 23:06:42.700' AS DateTime), N'19', N'ERROR', N'UAMSHOP', N'A network-related or instance-specific error occurred while establishing a connection to SQL Server. The server was not found or was not accessible. Verify that the instance name is correct and that SQL Server is configured to allow remote connections. (provider: Named Pipes Provider, error: 40 - Could not open a connection to SQL Server)   at System.Data.SqlClient.SqlInternalConnectionTds..ctor(DbConnectionPoolIdentity identity, SqlConnectionString connectionOptions, SqlCredential credential, Object providerInfo, String newPassword, SecureString newSecurePassword, Boolean redirectedUserInstance, SqlConnectionString userConnectionOptions, SessionData reconnectSessionData, DbConnectionPool pool, String accessToken, Boolean applyTransientFaultHandling)
   at System.Data.SqlClient.SqlConnectionFactory.CreateConnection(DbConnectionOptions options, DbConnectionPoolKey poolKey, Object poolGroupProviderInfo, DbConnectionPool pool, DbConnection owningConnection, DbConnectionOptions userOptions)
   at System.Data.ProviderBase.DbConnectionFactory.CreatePooledConnection(DbConnectionPool pool, DbConnection owningObject, DbConnectionOptions options, DbConnectionPoolKey poolKey, DbConnectionOptions userOptions)
   at System.Data.ProviderBase.DbConnectionPool.CreateObject(DbConnection owningObject, DbConnectionOptions userOptions, DbConnectionInternal oldConnection)
   at System.Data.ProviderBase.DbConnectionPool.UserCreateRequest(DbConnection owningObject, DbConnectionOptions userOptions, DbConnectionInternal oldConnection)
   at System.Data.ProviderBase.DbConnectionPool.TryGetConnection(DbConnection owningObject, UInt32 waitForMultipleObjectsTimeout, Boolean allowCreate, Boolean onlyOneCheckConnection, DbConnectionOptions userOptions, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionPool.TryGetConnection(DbConnection owningObject, TaskCompletionSource`1 retry, DbConnectionOptions userOptions, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionFactory.TryGetConnection(DbConnection owningConnection, TaskCompletionSource`1 retry, DbConnectionOptions userOptions, DbConnectionInternal oldConnection, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionInternal.TryOpenConnectionInternal(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at System.Data.ProviderBase.DbConnectionClosed.TryOpenConnection(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at System.Data.SqlClient.SqlConnection.TryOpenInner(TaskCompletionSource`1 retry)
   at System.Data.SqlClient.SqlConnection.TryOpen(TaskCompletionSource`1 retry)
   at System.Data.SqlClient.SqlConnection.Open()
   at ProductModule.ProductDAL.RetrieveProductsTop(String connectionString) in c:\Users\u46416\Documents\GitHub\progra\UAMShop\ProductModule\ProductDAL.cs:line 71', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (33, CAST(N'2016-08-09 23:06:42.757' AS DateTime), N'19', N'ERROR', N'UAMSHOP', N'A network-related or instance-specific error occurred while establishing a connection to SQL Server. The server was not found or was not accessible. Verify that the instance name is correct and that SQL Server is configured to allow remote connections. (provider: Named Pipes Provider, error: 40 - Could not open a connection to SQL Server)   at System.Data.ProviderBase.DbConnectionPool.TryGetConnection(DbConnection owningObject, UInt32 waitForMultipleObjectsTimeout, Boolean allowCreate, Boolean onlyOneCheckConnection, DbConnectionOptions userOptions, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionPool.TryGetConnection(DbConnection owningObject, TaskCompletionSource`1 retry, DbConnectionOptions userOptions, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionFactory.TryGetConnection(DbConnection owningConnection, TaskCompletionSource`1 retry, DbConnectionOptions userOptions, DbConnectionInternal oldConnection, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionInternal.TryOpenConnectionInternal(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at System.Data.ProviderBase.DbConnectionClosed.TryOpenConnection(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at System.Data.SqlClient.SqlConnection.TryOpenInner(TaskCompletionSource`1 retry)
   at System.Data.SqlClient.SqlConnection.TryOpen(TaskCompletionSource`1 retry)
   at System.Data.SqlClient.SqlConnection.Open()
   at MenuModule.MenuDal.RetrieveMenu(Int32 idUsuario) in c:\Users\u46416\Documents\GitHub\progra\UAMShop\MenuModule\MenuDal.cs:line 29', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (36, CAST(N'2016-08-09 23:09:15.987' AS DateTime), N'7', N'ERROR', N'UAMSHOP', N'Input string was not in a correct format.   at System.Text.StringBuilder.AppendFormatHelper(IFormatProvider provider, String format, ParamsArray args)
   at System.String.FormatHelper(IFormatProvider provider, String format, ParamsArray args)
   at System.String.Format(String format, Object arg0, Object arg1)
   at NotificationModule.SendMail.SendUserNotification(String nombre, String correo) in c:\Users\u46416\Documents\GitHub\progra\UAMShop\NotificationModule\SendMail.cs:line 107', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (42, CAST(N'2016-08-09 23:15:46.000' AS DateTime), N'23', N'INFO', N'UAMSHOP', N'Usuario logueado Francisco Javier Lobo Porras', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (38, CAST(N'2016-08-09 23:09:51.993' AS DateTime), N'15', N'ERROR', N'UAMSHOP', N'Cannot insert the value NULL into column ''Contrasena'', table ''UAM.dbo.usuarios''; column does not allow nulls. UPDATE fails.
The statement has been terminated.   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at System.Web.UI.WebControls.SqlDataSourceView.ExecuteDbCommand(DbCommand command, DataSourceOperation operation)
   at System.Web.UI.WebControls.SqlDataSourceView.ExecuteUpdate(IDictionary keys, IDictionary values, IDictionary oldValues)
   at System.Web.UI.WebControls.SqlDataSource.Update()
   at UAMShop.profile.btnCambiarContrasena_Click(Object sender, EventArgs e) in c:\Users\u46416\Documents\GitHub\progra\UAMShop\UAMShop\user\profile.aspx.cs:line 30', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (39, CAST(N'2016-08-09 23:10:16.333' AS DateTime), N'5', N'INFO', N'UAMSHOP', N'Usuario logueado Francisco Javier Lobo Porras', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (40, CAST(N'2016-08-09 23:11:59.907' AS DateTime), N'5', N'INFO', N'UAMSHOP', N'Estimado(a) Francisco Javier Lobo Porras se le ha enviado a franciscolobo@hotmail.es la factura de compra 96758 por un monto de ¢628.500,00.', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (41, CAST(N'2016-08-09 23:12:23.030' AS DateTime), N'14', N'INFO', N'UAMSHOP', N'Usuario logueado Francisco Javier Lobo Porras', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (46, CAST(N'2016-08-09 23:25:32.467' AS DateTime), N'7', N'ERROR', N'UAMSHOP', N'A network-related or instance-specific error occurred while establishing a connection to SQL Server. The server was not found or was not accessible. Verify that the instance name is correct and that SQL Server is configured to allow remote connections. (provider: Named Pipes Provider, error: 40 - Could not open a connection to SQL Server)   at System.Data.SqlClient.SqlInternalConnectionTds..ctor(DbConnectionPoolIdentity identity, SqlConnectionString connectionOptions, SqlCredential credential, Object providerInfo, String newPassword, SecureString newSecurePassword, Boolean redirectedUserInstance, SqlConnectionString userConnectionOptions, SessionData reconnectSessionData, DbConnectionPool pool, String accessToken, Boolean applyTransientFaultHandling)
   at System.Data.SqlClient.SqlConnectionFactory.CreateConnection(DbConnectionOptions options, DbConnectionPoolKey poolKey, Object poolGroupProviderInfo, DbConnectionPool pool, DbConnection owningConnection, DbConnectionOptions userOptions)
   at System.Data.ProviderBase.DbConnectionFactory.CreatePooledConnection(DbConnectionPool pool, DbConnection owningObject, DbConnectionOptions options, DbConnectionPoolKey poolKey, DbConnectionOptions userOptions)
   at System.Data.ProviderBase.DbConnectionPool.CreateObject(DbConnection owningObject, DbConnectionOptions userOptions, DbConnectionInternal oldConnection)
   at System.Data.ProviderBase.DbConnectionPool.UserCreateRequest(DbConnection owningObject, DbConnectionOptions userOptions, DbConnectionInternal oldConnection)
   at System.Data.ProviderBase.DbConnectionPool.TryGetConnection(DbConnection owningObject, UInt32 waitForMultipleObjectsTimeout, Boolean allowCreate, Boolean onlyOneCheckConnection, DbConnectionOptions userOptions, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionPool.TryGetConnection(DbConnection owningObject, TaskCompletionSource`1 retry, DbConnectionOptions userOptions, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionFactory.TryGetConnection(DbConnection owningConnection, TaskCompletionSource`1 retry, DbConnectionOptions userOptions, DbConnectionInternal oldConnection, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionInternal.TryOpenConnectionInternal(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at System.Data.ProviderBase.DbConnectionClosed.TryOpenConnection(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at System.Data.SqlClient.SqlConnection.TryOpenInner(TaskCompletionSource`1 retry)
   at System.Data.SqlClient.SqlConnection.TryOpen(TaskCompletionSource`1 retry)
   at System.Data.SqlClient.SqlConnection.Open()
   at ProductModule.ProductDAL.RetrieveProductsTop(String connectionString) in c:\Users\u46416\Documents\GitHub\progra\UAMShop\ProductModule\ProductDAL.cs:line 71', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (47, CAST(N'2016-08-09 23:25:32.490' AS DateTime), N'7', N'ERROR', N'UAMSHOP', N'A network-related or instance-specific error occurred while establishing a connection to SQL Server. The server was not found or was not accessible. Verify that the instance name is correct and that SQL Server is configured to allow remote connections. (provider: Named Pipes Provider, error: 40 - Could not open a connection to SQL Server)   at System.Data.ProviderBase.DbConnectionPool.TryGetConnection(DbConnection owningObject, UInt32 waitForMultipleObjectsTimeout, Boolean allowCreate, Boolean onlyOneCheckConnection, DbConnectionOptions userOptions, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionPool.TryGetConnection(DbConnection owningObject, TaskCompletionSource`1 retry, DbConnectionOptions userOptions, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionFactory.TryGetConnection(DbConnection owningConnection, TaskCompletionSource`1 retry, DbConnectionOptions userOptions, DbConnectionInternal oldConnection, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionInternal.TryOpenConnectionInternal(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at System.Data.ProviderBase.DbConnectionClosed.TryOpenConnection(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at System.Data.SqlClient.SqlConnection.TryOpenInner(TaskCompletionSource`1 retry)
   at System.Data.SqlClient.SqlConnection.TryOpen(TaskCompletionSource`1 retry)
   at System.Data.SqlClient.SqlConnection.Open()
   at MenuModule.MenuDal.RetrieveMenu(Int32 idUsuario) in c:\Users\u46416\Documents\GitHub\progra\UAMShop\MenuModule\MenuDal.cs:line 29', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (48, CAST(N'2016-08-09 23:25:34.747' AS DateTime), N'29', N'ERROR', N'UAMSHOP', N'A network-related or instance-specific error occurred while establishing a connection to SQL Server. The server was not found or was not accessible. Verify that the instance name is correct and that SQL Server is configured to allow remote connections. (provider: Named Pipes Provider, error: 40 - Could not open a connection to SQL Server)   at System.Data.ProviderBase.DbConnectionPool.TryGetConnection(DbConnection owningObject, UInt32 waitForMultipleObjectsTimeout, Boolean allowCreate, Boolean onlyOneCheckConnection, DbConnectionOptions userOptions, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionPool.TryGetConnection(DbConnection owningObject, TaskCompletionSource`1 retry, DbConnectionOptions userOptions, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionFactory.TryGetConnection(DbConnection owningConnection, TaskCompletionSource`1 retry, DbConnectionOptions userOptions, DbConnectionInternal oldConnection, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionInternal.TryOpenConnectionInternal(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at System.Data.ProviderBase.DbConnectionClosed.TryOpenConnection(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at System.Data.SqlClient.SqlConnection.TryOpenInner(TaskCompletionSource`1 retry)
   at System.Data.SqlClient.SqlConnection.TryOpen(TaskCompletionSource`1 retry)
   at System.Data.SqlClient.SqlConnection.Open()
   at ProductModule.ProductDAL.RetrieveProductsTop(String connectionString) in c:\Users\u46416\Documents\GitHub\progra\UAMShop\ProductModule\ProductDAL.cs:line 71', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (49, CAST(N'2016-08-09 23:25:34.750' AS DateTime), N'29', N'ERROR', N'UAMSHOP', N'A network-related or instance-specific error occurred while establishing a connection to SQL Server. The server was not found or was not accessible. Verify that the instance name is correct and that SQL Server is configured to allow remote connections. (provider: Named Pipes Provider, error: 40 - Could not open a connection to SQL Server)   at System.Data.ProviderBase.DbConnectionPool.TryGetConnection(DbConnection owningObject, UInt32 waitForMultipleObjectsTimeout, Boolean allowCreate, Boolean onlyOneCheckConnection, DbConnectionOptions userOptions, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionPool.TryGetConnection(DbConnection owningObject, TaskCompletionSource`1 retry, DbConnectionOptions userOptions, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionFactory.TryGetConnection(DbConnection owningConnection, TaskCompletionSource`1 retry, DbConnectionOptions userOptions, DbConnectionInternal oldConnection, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionInternal.TryOpenConnectionInternal(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at System.Data.ProviderBase.DbConnectionClosed.TryOpenConnection(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at System.Data.SqlClient.SqlConnection.TryOpenInner(TaskCompletionSource`1 retry)
   at System.Data.SqlClient.SqlConnection.TryOpen(TaskCompletionSource`1 retry)
   at System.Data.SqlClient.SqlConnection.Open()
   at MenuModule.MenuDal.RetrieveMenu(Int32 idUsuario) in c:\Users\u46416\Documents\GitHub\progra\UAMShop\MenuModule\MenuDal.cs:line 29', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (50, CAST(N'2016-08-09 23:25:36.053' AS DateTime), N'13', N'ERROR', N'UAMSHOP', N'A network-related or instance-specific error occurred while establishing a connection to SQL Server. The server was not found or was not accessible. Verify that the instance name is correct and that SQL Server is configured to allow remote connections. (provider: Named Pipes Provider, error: 40 - Could not open a connection to SQL Server)   at System.Data.ProviderBase.DbConnectionPool.TryGetConnection(DbConnection owningObject, UInt32 waitForMultipleObjectsTimeout, Boolean allowCreate, Boolean onlyOneCheckConnection, DbConnectionOptions userOptions, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionPool.TryGetConnection(DbConnection owningObject, TaskCompletionSource`1 retry, DbConnectionOptions userOptions, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionFactory.TryGetConnection(DbConnection owningConnection, TaskCompletionSource`1 retry, DbConnectionOptions userOptions, DbConnectionInternal oldConnection, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionInternal.TryOpenConnectionInternal(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at System.Data.ProviderBase.DbConnectionClosed.TryOpenConnection(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at System.Data.SqlClient.SqlConnection.TryOpenInner(TaskCompletionSource`1 retry)
   at System.Data.SqlClient.SqlConnection.TryOpen(TaskCompletionSource`1 retry)
   at System.Data.SqlClient.SqlConnection.Open()
   at ProductModule.ProductDAL.RetrieveProductsTop(String connectionString) in c:\Users\u46416\Documents\GitHub\progra\UAMShop\ProductModule\ProductDAL.cs:line 71', N'')
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (51, CAST(N'2016-08-09 23:25:36.057' AS DateTime), N'13', N'ERROR', N'UAMSHOP', N'A network-related or instance-specific error occurred while establishing a connection to SQL Server. The server was not found or was not accessible. Verify that the instance name is correct and that SQL Server is configured to allow remote connections. (provider: Named Pipes Provider, error: 40 - Could not open a connection to SQL Server)   at System.Data.ProviderBase.DbConnectionPool.TryGetConnection(DbConnection owningObject, UInt32 waitForMultipleObjectsTimeout, Boolean allowCreate, Boolean onlyOneCheckConnection, DbConnectionOptions userOptions, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionPool.TryGetConnection(DbConnection owningObject, TaskCompletionSource`1 retry, DbConnectionOptions userOptions, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionFactory.TryGetConnection(DbConnection owningConnection, TaskCompletionSource`1 retry, DbConnectionOptions userOptions, DbConnectionInternal oldConnection, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionInternal.TryOpenConnectionInternal(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at System.Data.ProviderBase.DbConnectionClosed.TryOpenConnection(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at System.Data.SqlClient.SqlConnection.TryOpenInner(TaskCompletionSource`1 retry)
   at System.Data.SqlClient.SqlConnection.TryOpen(TaskCompletionSource`1 retry)
   at System.Data.SqlClient.SqlConnection.Open()
   at MenuModule.MenuDal.RetrieveMenu(Int32 idUsuario) in c:\Users\u46416\Documents\GitHub\progra\UAMShop\MenuModule\MenuDal.cs:line 29', N'')
SET IDENTITY_INSERT [dbo].[Log] OFF
SET IDENTITY_INSERT [dbo].[menu] ON 

INSERT [dbo].[menu] ([IdMenu], [Menu], [Pagina], [IdSubMenu], [RequiereLogin]) VALUES (1, N'Inicio', N'/index.aspx', 0, 0)
INSERT [dbo].[menu] ([IdMenu], [Menu], [Pagina], [IdSubMenu], [RequiereLogin]) VALUES (2, N'Categorias', N'/category/category.aspx', 0, 0)
INSERT [dbo].[menu] ([IdMenu], [Menu], [Pagina], [IdSubMenu], [RequiereLogin]) VALUES (5, N'Mantenimientos', N'', 0, 1)
INSERT [dbo].[menu] ([IdMenu], [Menu], [Pagina], [IdSubMenu], [RequiereLogin]) VALUES (6, N'Ingresar', N'/login.aspx', 0, 0)
INSERT [dbo].[menu] ([IdMenu], [Menu], [Pagina], [IdSubMenu], [RequiereLogin]) VALUES (7, N'<i class="fa fa-shopping-cart"></i>', N'/category/cart.aspx', 0, 0)
INSERT [dbo].[menu] ([IdMenu], [Menu], [Pagina], [IdSubMenu], [RequiereLogin]) VALUES (12, N'<i class="fa fa-user"></i>', N'/user/profile.aspx', 0, 1)
INSERT [dbo].[menu] ([IdMenu], [Menu], [Pagina], [IdSubMenu], [RequiereLogin]) VALUES (22, N'Categorias', N'/mantenimiento/mantcategorias.aspx', 5, 1)
INSERT [dbo].[menu] ([IdMenu], [Menu], [Pagina], [IdSubMenu], [RequiereLogin]) VALUES (23, N'Productos', N'/mantenimiento/mantproductos.aspx', 5, 1)
INSERT [dbo].[menu] ([IdMenu], [Menu], [Pagina], [IdSubMenu], [RequiereLogin]) VALUES (24, N'Usuarios', N'/mantenimiento/mantusuarios.aspx', 5, 1)
INSERT [dbo].[menu] ([IdMenu], [Menu], [Pagina], [IdSubMenu], [RequiereLogin]) VALUES (25, N'Mis Compras', N'/user/history.aspx', 0, 1)
SET IDENTITY_INSERT [dbo].[menu] OFF
INSERT [dbo].[productos] ([Codigo], [Producto], [Existencia], [Precio], [IdCategoria], [Imagen]) VALUES (N'120882', N'APPLE MACBOOK PRO - PORTÁTIL DE 13"', 0, 673200.0000, 1, N'../img/productos/120882.png')
INSERT [dbo].[productos] ([Codigo], [Producto], [Existencia], [Precio], [IdCategoria], [Imagen]) VALUES (N'127688', N'SMTR® ONEPLUS 3 ', 1, 209500.0000, 10, N'../img/productos/127688.png')
INSERT [dbo].[productos] ([Codigo], [Producto], [Existencia], [Precio], [IdCategoria], [Imagen]) VALUES (N'127786', N'SAMSUNG GALAXY S7 - SMARTPHONE', 6, 287400.0000, 10, N'../img/productos/127786.png')
INSERT [dbo].[productos] ([Codigo], [Producto], [Existencia], [Precio], [IdCategoria], [Imagen]) VALUES (N'142652', N'NETBOOK TOSHIBA NB15 A/1203SL', 10, 455000.0000, 1, N'../img/productos/142652.png')
INSERT [dbo].[productos] ([Codigo], [Producto], [Existencia], [Precio], [IdCategoria], [Imagen]) VALUES (N'146551', N'COMP PORT LENOVO B4080 14" I3 500GB 4GB', 12, 229770.0000, 1, N'../img/productos/146551.png')
INSERT [dbo].[productos] ([Codigo], [Producto], [Existencia], [Precio], [IdCategoria], [Imagen]) VALUES (N'147710', N'APPLE IPHONE 6S 16GB 4G GRIS - SMARTPHONE', 11, 398750.0000, 10, N'../img/productos/147710.png')
INSERT [dbo].[productos] ([Codigo], [Producto], [Existencia], [Precio], [IdCategoria], [Imagen]) VALUES (N'149083', N'TABLET RCA RC7TK9 7PLG WIFI', 9, 49350.0000, 10, N'../img/productos/149083.png')
INSERT [dbo].[productos] ([Codigo], [Producto], [Existencia], [Precio], [IdCategoria], [Imagen]) VALUES (N'149084', N'SMTR® ONEPLUS 2 ', 11, 157600.0000, 10, N'../img/productos/149084.png')
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([Id], [Rol]) VALUES (1, N'Administrador')
INSERT [dbo].[roles] ([Id], [Rol]) VALUES (2, N'Usuario Regular')
SET IDENTITY_INSERT [dbo].[roles] OFF
SET IDENTITY_INSERT [dbo].[rolesxmenu] ON 

INSERT [dbo].[rolesxmenu] ([Id], [IdMenu], [IdRol]) VALUES (1, 5, 1)
INSERT [dbo].[rolesxmenu] ([Id], [IdMenu], [IdRol]) VALUES (2, 22, 1)
INSERT [dbo].[rolesxmenu] ([Id], [IdMenu], [IdRol]) VALUES (3, 23, 1)
INSERT [dbo].[rolesxmenu] ([Id], [IdMenu], [IdRol]) VALUES (4, 24, 1)
INSERT [dbo].[rolesxmenu] ([Id], [IdMenu], [IdRol]) VALUES (5, 1, 2)
INSERT [dbo].[rolesxmenu] ([Id], [IdMenu], [IdRol]) VALUES (6, 2, 2)
INSERT [dbo].[rolesxmenu] ([Id], [IdMenu], [IdRol]) VALUES (10, 25, 2)
INSERT [dbo].[rolesxmenu] ([Id], [IdMenu], [IdRol]) VALUES (8, 7, 2)
INSERT [dbo].[rolesxmenu] ([Id], [IdMenu], [IdRol]) VALUES (9, 12, 2)
SET IDENTITY_INSERT [dbo].[rolesxmenu] OFF
SET IDENTITY_INSERT [dbo].[usuarios] ON 

INSERT [dbo].[usuarios] ([IdUsuario], [Usuario], [Nombre], [Contrasena], [IdRol], [Estado], [FechaSuscripcion]) VALUES (1, N'uamshopcr@gmail.com', N'Administrador UAM SHOP', N'progra4uamshop', 1, 1, CAST(N'2016-04-18 00:00:00.000' AS DateTime))
INSERT [dbo].[usuarios] ([IdUsuario], [Usuario], [Nombre], [Contrasena], [IdRol], [Estado], [FechaSuscripcion]) VALUES (3, N'maykoolfr@gmail.com', N'Franco Rivera', N'123', 2, 1, CAST(N'2016-09-30 00:00:00.000' AS DateTime))
INSERT [dbo].[usuarios] ([IdUsuario], [Usuario], [Nombre], [Contrasena], [IdRol], [Estado], [FechaSuscripcion]) VALUES (11, N'gchinglam@gmail.com', N'Guillermo Ching', N'123', 2, 1, CAST(N'2016-08-09 04:30:46.750' AS DateTime))
INSERT [dbo].[usuarios] ([IdUsuario], [Usuario], [Nombre], [Contrasena], [IdRol], [Estado], [FechaSuscripcion]) VALUES (13, N'loboporras@gmail.com', N'Francisco Javier Lobo Porras', N'123', 2, 1, CAST(N'2016-08-09 17:12:34.913' AS DateTime))
INSERT [dbo].[usuarios] ([IdUsuario], [Usuario], [Nombre], [Contrasena], [IdRol], [Estado], [FechaSuscripcion]) VALUES (15, N'diegocastro1417@gmail.com', N'Luis Diego', N'17diegocas', 2, 1, CAST(N'2016-08-09 21:53:32.703' AS DateTime))
INSERT [dbo].[usuarios] ([IdUsuario], [Usuario], [Nombre], [Contrasena], [IdRol], [Estado], [FechaSuscripcion]) VALUES (16, N'jose@monge.com', N'José Ramírez', N'jramirez', 2, 1, CAST(N'2016-08-09 22:25:47.360' AS DateTime))
INSERT [dbo].[usuarios] ([IdUsuario], [Usuario], [Nombre], [Contrasena], [IdRol], [Estado], [FechaSuscripcion]) VALUES (17, N'rrodriguezborbon@hotmail.com', N'Randall ', N'123', 2, 1, CAST(N'2016-08-09 22:32:11.950' AS DateTime))
INSERT [dbo].[usuarios] ([IdUsuario], [Usuario], [Nombre], [Contrasena], [IdRol], [Estado], [FechaSuscripcion]) VALUES (18, N'franciscolobo@hotmail.es', N'Francisco Javier Lobo Porras', N'123', 2, 1, CAST(N'2016-08-10 05:09:56.817' AS DateTime))
SET IDENTITY_INSERT [dbo].[usuarios] OFF
/****** Object:  Index [ixLog]    Script Date: 09/08/2016 11:33:26 p.m. ******/
CREATE NONCLUSTERED INDEX [ixLog] ON [dbo].[Log]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  StoredProcedure [dbo].[cleanDB]    Script Date: 09/08/2016 11:33:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cleanDB]
AS
DELETE dbo.facturadetalle
DELETE dbo.facturas
UPDATE dbo.productos SET Existencia=12
DELETE dbo.carrito
DELETE dbo.Log


GO
/****** Object:  StoredProcedure [dbo].[selectusers]    Script Date: 09/08/2016 11:33:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[selectusers] 
 
AS   

    SELECT DISTINCT a.IdUsuario, a.Usuario, a.Nombre, a.Contrasena, a.IdRol, Rol, EstadoA, IdEstado
    FROM usuarios a 
    INNER JOIN roles b ON  b.Id = a.IdRol
	INNER JOIN estados c on c.IdEstado = a.Estado

GO
/****** Object:  StoredProcedure [dbo].[usp_AutenticarUsuario]    Script Date: 09/08/2016 11:33:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_AutenticarUsuario]
    @Usuario VARCHAR(50) ,
    @Contrasena VARCHAR(50)
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRAN

    SELECT  [Usuario] ,
            [Nombre] ,
            [IdUsuario],
			[Rol],
			[EstadoA],
			[FechaSuscripcion]
    FROM    [dbo].[usuarios] a WITH(NOLOCK)
	inner join roles b on b.Id = a.IdRol
	inner join estados c on c.IdEstado = a.Estado
    WHERE   ( [Usuario] = @Usuario
              AND [Contrasena] = @Contrasena
            ) 

			COMMIT


GO
/****** Object:  StoredProcedure [dbo].[usp_carritoClear]    Script Date: 09/08/2016 11:33:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_carritoClear] 
    @IdUsuario VARCHAR(50)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[carrito]
	WHERE  [IdUsuario] = @IdUsuario

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_carritoDelete]    Script Date: 09/08/2016 11:33:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_carritoDelete] @Id INT
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  
	
    BEGIN TRAN

    DELETE  FROM [dbo].[carrito]
    WHERE   [Id] = @Id

    COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_carritoInsert]    Script Date: 09/08/2016 11:33:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[usp_carritoInsert]
    @IdUsuario VARCHAR(50) = NULL ,
    @Codigo INT = NULL ,
    @Cantidad INT = NULL
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  
	
    BEGIN TRAN
	

    IF EXISTS ( SELECT  1
                FROM    dbo.carrito
                WHERE   IdUsuario = @IdUsuario
                        AND Codigo = @Codigo )
        BEGIN
            UPDATE  dbo.carrito
            SET     Cantidad = Cantidad + @Cantidad
            WHERE   IdUsuario = @IdUsuario
                    AND Codigo = @Codigo
        END
    ELSE
        BEGIN
            INSERT  INTO [dbo].[carrito]
                    ( [IdUsuario] ,
                      [Codigo] ,
                      [Descripcion] ,
                      [Precio] ,
                      [Cantidad]
                    )
                    SELECT  @IdUsuario ,
                            @Codigo ,
                            Producto ,
                            Precio ,
                            @Cantidad
                    FROM    dbo.productos WITH ( NOLOCK )
                    WHERE   Codigo = @Codigo
        END
	-- Begin Return Select <- do not remove
    SELECT  [Id] ,
            [IdUsuario] ,
            [Codigo] ,
            [Descripcion] ,
            [Precio] ,
            [Cantidad]
    FROM    [dbo].[carrito] WITH ( NOLOCK )
    WHERE   [Id] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
    COMMIT




GO
/****** Object:  StoredProcedure [dbo].[usp_carritoSelect]    Script Date: 09/08/2016 11:33:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_carritoSelect] @IdUsuario VARCHAR(50)
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON    

    SELECT  Id ,
            IdUsuario ,
            A.Codigo ,
            Descripcion ,
            A.Precio ,
            Cantidad ,
            P.Imagen
    FROM    dbo.carrito A WITH ( NOLOCK )
            INNER JOIN dbo.productos P WITH ( NOLOCK ) ON P.Codigo = A.Codigo
    WHERE   ( [IdUsuario] = @IdUsuario )


GO
/****** Object:  StoredProcedure [dbo].[usp_carritoUpdate]    Script Date: 09/08/2016 11:33:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_carritoUpdate]
    @Id INT ,   
    @Cantidad INT = NULL
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  


    UPDATE  [dbo].[carrito]
    SET     [Cantidad] = @Cantidad
    WHERE   [Id] = @Id
	
	-- Begin Return Select <- do not remove
    SELECT  [Id] ,
            [IdUsuario] ,
            [Codigo] ,
            [Descripcion] ,
            [Precio] ,
            [Cantidad]
    FROM    [dbo].[carrito] WITH(NOLOCK)
    WHERE   [Id] = @Id	
	-- End Return Select <- do not remove




GO
/****** Object:  StoredProcedure [dbo].[usp_categoriasDelete]    Script Date: 09/08/2016 11:33:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_categoriasDelete] @Id INT
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  
	
    BEGIN TRAN

    DELETE  FROM [dbo].[categorias]
    WHERE   [Id] = @Id

    COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_categoriasInsert]    Script Date: 09/08/2016 11:33:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_categoriasInsert]
    @Categoria VARCHAR(50) = NULL
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  
	
    BEGIN TRAN
	
    INSERT  INTO [dbo].[categorias]
            ( [Categoria] )
            SELECT  @Categoria
	
	
    SELECT  [Id] ,
            [Categoria]
    FROM    [dbo].[categorias]
    WHERE   [Id] = SCOPE_IDENTITY()
	
               
    COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_categoriasSelect]    Script Date: 09/08/2016 11:33:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[usp_categoriasSelect]
    @Id INT = 0 ,
    @HasProducts BIT = 0
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    DECLARE @FROM VARCHAR(MAX)= ' SELECT  [Id] ,
										[Categoria]
										FROM    dbo.categorias C WITH ( NOLOCK ) '
    DECLARE @EXIST VARCHAR(MAX)= ' AND EXISTS (SELECT 1 FROM dbo.productos B WITH ( NOLOCK ) WHERE C.Id=B.IdCategoria  )'
    DECLARE @WHERE VARCHAR(MAX)= ' WHERE   ( [Id] = ' + CONVERT(VARCHAR, @Id)
        + '
												OR 0 = '
        + CONVERT(VARCHAR, @Id) + ')'

    DECLARE @CONSULTASQL VARCHAR(MAX)= ''
												

    SET @CONSULTASQL = @FROM + @WHERE + CASE WHEN @HasProducts = 1 THEN @EXIST
                                             ELSE ''
                                        END 
           
    EXEC(@CONSULTASQL)                                      



GO
/****** Object:  StoredProcedure [dbo].[usp_categoriasUpdate]    Script Date: 09/08/2016 11:33:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_categoriasUpdate]
    @Id INT ,
    @Categoria VARCHAR(50) = NULL
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  
	
    BEGIN TRAN

    UPDATE  [dbo].[categorias]
    SET     [Categoria] = @Categoria
    WHERE   [Id] = @Id
	
	
    SELECT  [Id] ,
            [Categoria]
    FROM    [dbo].[categorias]
    WHERE   [Id] = @Id	
	

    COMMIT


GO
/****** Object:  StoredProcedure [dbo].[usp_EstadoSelect]    Script Date: 09/08/2016 11:33:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[usp_EstadoSelect]

AS   
 
    SELECT IdEstado, EstadoA
    FROM estados 

GO
/****** Object:  StoredProcedure [dbo].[usp_FacturaInsert]    Script Date: 09/08/2016 11:33:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[usp_FacturaInsert]
    @IdUsuario VARCHAR(50) ,
    @Tarjeta VARCHAR(50) ,
    @Titular VARCHAR(50) ,
    @IdFactura INT = 0 OUTPUT
AS
    SET NOCOUNT ON; 
    SET XACT_ABORT ON; 
   
	   
    BEGIN TRY

        BEGIN TRANSACTION;

        DECLARE @Cantidad BIGINT= 0;
        DECLARE @Mensaje VARCHAR(MAX)= '';
        DECLARE @ResultadoEjecucion INT = 0
        DECLARE @MontoFactura BIGINT= 0;
        DECLARE @Articulos VARCHAR(MAX)= '';

		--Valida si hay algo para facturar
        IF NOT EXISTS ( SELECT  1
                        FROM    dbo.carrito WITH ( NOLOCK )
                        WHERE   IdUsuario = @IdUsuario )
            BEGIN
                SET @Mensaje = 'No hay articulos en el carrito';

                RAISERROR(@Mensaje,16,4);
            END;

		--Valida si hay existencias para todos los articulos
        SELECT  A.Id ,
                A.IdUsuario ,
                A.Codigo ,
                A.Descripcion ,
                A.Precio ,
                Cantidad = A.Cantidad ,
                Existencia = B.Existencia
        INTO    #carrito
        FROM    dbo.carrito A WITH ( NOLOCK )
                INNER JOIN dbo.productos B WITH ( NOLOCK ) ON B.Codigo = A.Codigo
        WHERE   IdUsuario = @IdUsuario
                AND A.Cantidad > B.Existencia;
   
        SET @Cantidad = @@ROWCOUNT;

        IF @Cantidad > 0
            BEGIN 
                SELECT  @Articulos += ' [' + CONVERT(VARCHAR, A.Codigo) + ': '
                        + CONVERT(VARCHAR, A.Descripcion) + ']'
                FROM    dbo.carrito A WITH ( NOLOCK )
                        INNER JOIN dbo.productos B WITH ( NOLOCK ) ON B.Codigo = A.Codigo
                WHERE   IdUsuario = @IdUsuario
                        AND Cantidad > B.Existencia;         

                SET @Mensaje = 'La cantidad a comprar para los articulos: '
                    + @Articulos + ' no esta en existencia';

                RAISERROR(@Mensaje,16,4);
            END;

		--Actualiza la existencia en productos
        UPDATE  B
        SET     B.Existencia = B.Existencia - A.Cantidad
        FROM    dbo.carrito A WITH ( NOLOCK )
                INNER JOIN dbo.productos B WITH ( NOLOCK ) ON B.Codigo = A.Codigo
        WHERE   A.IdUsuario = @IdUsuario
               -- AND A.Cantidad < B.Existencia;

		--Ingresa el encabezado de la factura
        SELECT  @MontoFactura = SUM(Cantidad * Precio)
        FROM    dbo.carrito WITH ( NOLOCK )
        WHERE   IdUsuario = @IdUsuario;
        INSERT  INTO dbo.facturas
                ( IdUsuario ,
                  Fecha ,
                  Monto ,
                  Tarjeta ,
                  Titular
                )
        VALUES  ( @IdUsuario , -- IdUsuario - int
                  GETDATE() , -- Fecha - datetime
                  @MontoFactura , -- Monto - money
                  @Tarjeta , -- Tarjeta - varchar(50)
                  UPPER(@Titular)  -- Titular - varchar(50)
	            );

        SET @IdFactura = SCOPE_IDENTITY();

		--Inserta el detalle de la factura
        INSERT  INTO dbo.facturadetalle
                ( IdFactura ,
                  Codigo ,
                  Descripcion ,
                  Precio ,
                  Cantidad
	            )
                SELECT  @IdFactura ,
                        Codigo ,
                        Descripcion ,
                        Precio ,
                        Cantidad
                FROM    dbo.carrito WITH ( NOLOCK )
                WHERE   IdUsuario = @IdUsuario;

        EXEC dbo.usp_carritoClear @IdUsuario = @IdUsuario;
			
			
        SELECT  @Mensaje = 'FACTURA  #:' + CONVERT(VARCHAR, @IdFactura)
                + ' GENERADA ';

        SELECT  Resultado = @ResultadoEjecucion ,
                Mensaje = @Mensaje;

        SELECT  IdFactura ,
                IdUsuario ,
                Fecha ,
                Monto ,
                Tarjeta ,
                Titular
        FROM    dbo.facturas WITH ( NOLOCK )
        WHERE   IdFactura = @IdFactura

        SELECT  fd.IdFacturaDetalle ,
                fd.IdFactura ,
                fd.Codigo ,
                fd.Descripcion ,
                fd.Precio ,
                fd.Cantidad ,
                p.Imagen
        FROM    dbo.facturadetalle fd WITH ( NOLOCK )
                INNER JOIN dbo.productos p WITH ( NOLOCK ) ON p.Codigo = fd.Codigo
        WHERE   IdFactura = @IdFactura
			
        COMMIT;

    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            BEGIN
                ROLLBACK TRAN;
            END;
		
        SELECT  Resultado = -1 ,
                Mensaje = ERROR_MESSAGE();				
    END CATCH;










GO
/****** Object:  StoredProcedure [dbo].[usp_FacturasSelect]    Script Date: 09/08/2016 11:33:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_FacturasSelect] @IdUsuario INT
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  
	
    SELECT  IdFactura ,
            IdUsuario ,
            Fecha ,
            Monto ,
            Tarjeta ,
            Titular
    FROM    dbo.facturas WITH ( NOLOCK )
    WHERE   IdUsuario=@IdUsuario

GO
/****** Object:  StoredProcedure [dbo].[usp_MenuSelect]    Script Date: 09/08/2016 11:33:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_MenuSelect]
    (
      @IdUsuario VARCHAR(50) = ''
    )
AS
    IF ( @IdUsuario > 0 )
        BEGIN 
            SELECT  X.IdMenu ,
                    X.Menu ,
                    X.Pagina ,
                    X.IdSubMenu ,
                    X.RequiereLogin ,
                    X.IdCategoria
            FROM    ( SELECT    M.IdMenu ,
                                M.Menu ,
                                M.Pagina ,
                                M.IdSubMenu ,
                                M.RequiereLogin ,
                                IdCategoria = 0
                      FROM      dbo.menu M WITH ( NOLOCK )
                                INNER JOIN dbo.rolesxmenu RM WITH ( NOLOCK ) ON RM.IdMenu = M.IdMenu
                                INNER JOIN dbo.roles R WITH ( NOLOCK ) ON R.Id = RM.IdRol
                                INNER JOIN dbo.usuarios U WITH ( NOLOCK ) ON U.IdRol = R.Id
                                                              AND U.IdUsuario = @IdUsuario
                      UNION ALL
                      SELECT    IdMenu = 0 ,
                                Menu = Categoria ,
                                Pagina = '' ,
                                IdSubMenu = ( SELECT    IdMenu
                                              FROM      dbo.menu WITH(NOLOCK)
                                              WHERE     Pagina LIKE  '%category.aspx%'
                                            ) ,
                                RequiereLogin = 0 ,
                                IdCategoria = Id
                      FROM      dbo.categorias WITH ( NOLOCK )
                    ) X

			
        END
    IF ( @IdUsuario = 0 )
        BEGIN
            SELECT  IdMenu ,
                    X.Menu ,
                    X.Pagina ,
                    X.IdSubMenu ,
                    X.RequiereLogin ,
                    X.IdCategoria
            FROM    ( SELECT    M.IdMenu ,
                                M.Menu ,
                                M.Pagina ,
                                M.IdSubMenu ,
                                M.RequiereLogin ,
                                IdCategoria = 0
                      FROM      dbo.menu M WITH ( NOLOCK )
                      WHERE     M.RequiereLogin = 0
                      UNION ALL
                      SELECT    IdMenu = 0 ,
                                Menu = Categoria ,
                                Pagina = '' ,
                                IdSubMenu = 2 ,
                                RequiereLogin = 0 ,
                                IdCategoria = Id
                      FROM      dbo.categorias WITH ( NOLOCK )
                    ) X
        END



GO
/****** Object:  StoredProcedure [dbo].[usp_productosDelete]    Script Date: 09/08/2016 11:33:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_productosDelete] 
    @Codigo varchar(50)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[productos]
	WHERE  [Codigo] = @Codigo

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_productosInsert]    Script Date: 09/08/2016 11:33:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_productosInsert] 
    @Codigo varchar(50),
    @Producto varchar(50) = NULL,
    @Existencia int = NULL,
    @Precio money = NULL,
    @IdCategoria int = NULL,
    @Imagen varchar(MAX) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[productos] ([Codigo], [Producto], [Existencia], [Precio], [IdCategoria], [Imagen])
	SELECT @Codigo, @Producto, @Existencia, @Precio, @IdCategoria, @Imagen
	
	-- Begin Return Select <- do not remove
	SELECT [Codigo], [Producto], [Existencia], [Precio], [IdCategoria], [Imagen]
	FROM   [dbo].[productos]
	WHERE  [Codigo] = @Codigo
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_productosSelect]    Script Date: 09/08/2016 11:33:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROC [dbo].[usp_productosSelect]
    @Codigo VARCHAR(50) = '' ,
    @IdCategoria INT = 0 ,
    @Busqueda VARCHAR(MAX) = ''
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON 

    SELECT  [Codigo] ,
            [Producto] ,
            [Existencia] ,
            [Precio] ,
            [IdCategoria] ,
			Categoria,
            [Imagen]
    FROM    [dbo].[productos] a WITH ( NOLOCK )
	Inner join categorias  b WITH ( NOLOCK ) on a.IdCategoria = b.Id
    WHERE   ( [Codigo] = @Codigo
              OR @Codigo = ''
            )
            AND ( IdCategoria = @IdCategoria
                  OR @IdCategoria = 0
                )
            AND ( Producto LIKE '%' + @Busqueda+ '%'
                  OR @Busqueda = ''
                )

	







GO
/****** Object:  StoredProcedure [dbo].[usp_productosSelectTop]    Script Date: 09/08/2016 11:33:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROC [dbo].[usp_productosSelectTop]
    @Codigo VARCHAR(50) = '' ,
    @IdCategoria INT = 0
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON 

    SELECT  DISTINCT TOP 4 P.[Codigo] ,
            [Producto] ,
            [Existencia] ,
            P.[Precio] ,
            [IdCategoria] ,
            [Imagen]
    FROM    [dbo].[productos] P WITH ( NOLOCK )
            INNER JOIN dbo.facturadetalle FD WITH ( NOLOCK ) ON FD.Codigo = P.Codigo
            INNER JOIN dbo.facturas F WITH ( NOLOCK ) ON FD.IdFactura = F.IdFactura
    
	







GO
/****** Object:  StoredProcedure [dbo].[usp_productosUpdate]    Script Date: 09/08/2016 11:33:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[usp_productosUpdate] 
    @Codigo varchar(50),
    @Producto varchar(50) = NULL,
    @Existencia int = NULL,
    @Precio money = NULL,
    @IdCategoria int = NULL,
    @Imagen varchar(MAX) = ''
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[productos]
	SET    [Codigo] = @Codigo, [Producto] = @Producto, [Existencia] = @Existencia, [Precio] = @Precio, [IdCategoria] = @IdCategoria, [Imagen] = case when @Imagen is null then Imagen else @Imagen end
	WHERE  [Codigo] = @Codigo
	
	-- Begin Return Select <- do not remove
	SELECT [Codigo], [Producto], [Existencia], [Precio], [IdCategoria], [Imagen]
	FROM   [dbo].[productos]
	WHERE  [Codigo] = @Codigo	
	-- End Return Select <- do not remove

	COMMIT



GO
/****** Object:  StoredProcedure [dbo].[usp_RoleSelect]    Script Date: 09/08/2016 11:33:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE  [dbo].[usp_RoleSelect]

AS   
 
    SELECT Id, Rol
    FROM roles 

GO
/****** Object:  StoredProcedure [dbo].[usp_usuariosDelete]    Script Date: 09/08/2016 11:33:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_usuariosDelete] 
    @Usuario varchar(50)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[usuarios]
	WHERE  [Usuario] = @Usuario

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_usuariosInsert]    Script Date: 09/08/2016 11:33:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[usp_usuariosInsert] 
    @Usuario varchar(50),
    @Nombre varchar(50),
    @Contrasena varchar(50),
    @IdRol int,
	@Estado bit
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	
	INSERT INTO [dbo].[usuarios] ([Usuario], [Nombre], [Contrasena], [IdRol], [Estado], [FechaSuscripcion])
	SELECT @Usuario, @Nombre, @Contrasena, @IdRol, @Estado, getdate()

GO
/****** Object:  StoredProcedure [dbo].[usp_usuariosSelect]    Script Date: 09/08/2016 11:33:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_usuariosSelect] 
    @Usuario varchar(50)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [Usuario], [Nombre], [Contrasena], [IdRol] 
	FROM   [dbo].[usuarios] 
	WHERE  ([Usuario] = @Usuario OR @Usuario IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_usuariosUpdate]    Script Date: 09/08/2016 11:33:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_usuariosUpdate] 
	@IdUsuario VARCHAR(50),
    @Usuario VARCHAR(50),
    @Nombre VARCHAR(50),
    @Contrasena VARCHAR(50),
    @IdRol INT,
	@IdEstado bit
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[usuarios]
	SET    [Usuario] = @Usuario, [Nombre] = @Nombre, [Contrasena] = @Contrasena, [IdRol] = @IdRol, [Estado]= @IdEstado
    WHERE  [Usuario] = @Usuario
	
	-- Begin Return Select <- do not remove
	SELECT [Usuario], [Nombre], [Contrasena], [IdRol]
	FROM   [dbo].[usuarios] WITH(NOLOCK)
	WHERE  [Usuario] = @Usuario	
	-- End Return Select <- do not remove

	COMMIT


GO
/****** Object:  StoredProcedure [dbo].[usp_usuariosUpdatePassword]    Script Date: 09/08/2016 11:33:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROC [dbo].[usp_usuariosUpdatePassword]
	@Password VARCHAR(50),
	@Usuario VARCHAR(50)

	as

	UPDATE [dbo].[usuarios]
	SET    [Contrasena] = @Password 
	WHERE  [Usuario] = @Usuario;



GO
USE [master]
GO
ALTER DATABASE [UAM] SET  READ_WRITE 
GO
