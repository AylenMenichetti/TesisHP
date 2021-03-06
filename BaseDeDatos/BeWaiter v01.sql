USE [BeWaiter v01]
GO
/****** Object:  Table [dbo].[CategoriaCarta]    Script Date: 04/06/2017 21:14:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CategoriaCarta](
	[idCategoriaCarta] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[idTipoCategoria] [int] NOT NULL,
 CONSTRAINT [PK_CategoriaCarta] PRIMARY KEY CLUSTERED 
(
	[idCategoriaCarta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CategoriaCartaXProducto]    Script Date: 04/06/2017 21:14:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriaCartaXProducto](
	[idProducto] [int] NOT NULL,
	[idCategoriaCarta] [int] NOT NULL,
 CONSTRAINT [PK_CategoriaCartaXProducto] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC,
	[idCategoriaCarta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Producto]    Script Date: 04/06/2017 21:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producto](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[tienePrecio] [bit] NOT NULL,
	[esCompuesto] [bit] NOT NULL,
	[esFinal] [bit] NOT NULL,
	[precio] [float] NULL,
	[disponible] [bit] NOT NULL,
	[cantidad] [int] NULL,
	[baja] [bit] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Producto] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoCategoria]    Script Date: 04/06/2017 21:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoCategoria](
	[idTipoCategoria] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_TipoCategoria] PRIMARY KEY CLUSTERED 
(
	[idTipoCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_TipoCategoria] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[CategoriaCarta]  WITH CHECK ADD  CONSTRAINT [FK_CategoriaCarta_TipoCategoria] FOREIGN KEY([idTipoCategoria])
REFERENCES [dbo].[TipoCategoria] ([idTipoCategoria])
GO
ALTER TABLE [dbo].[CategoriaCarta] CHECK CONSTRAINT [FK_CategoriaCarta_TipoCategoria]
GO
ALTER TABLE [dbo].[CategoriaCartaXProducto]  WITH CHECK ADD  CONSTRAINT [FK_CategoriaCartaXProducto_CategoriaCarta] FOREIGN KEY([idCategoriaCarta])
REFERENCES [dbo].[CategoriaCarta] ([idCategoriaCarta])
GO
ALTER TABLE [dbo].[CategoriaCartaXProducto] CHECK CONSTRAINT [FK_CategoriaCartaXProducto_CategoriaCarta]
GO
ALTER TABLE [dbo].[CategoriaCartaXProducto]  WITH CHECK ADD  CONSTRAINT [FK_CategoriaCartaXProducto_Producto] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Producto] ([idProducto])
GO
ALTER TABLE [dbo].[CategoriaCartaXProducto] CHECK CONSTRAINT [FK_CategoriaCartaXProducto_Producto]
GO
