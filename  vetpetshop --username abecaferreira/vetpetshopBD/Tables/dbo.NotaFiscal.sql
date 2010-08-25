CREATE TABLE [dbo].[NotaFiscal]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[IdVendedor] [int] NULL,
[IdAdministrador] [int] NULL,
[IdUsuario] [int] NOT NULL,
[DataCadastro] [datetime] NULL,
[Valor] [decimal] (9, 2) NULL,
[Status] [int] NULL,
[DataRecebimento] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[NotaFiscal] ADD CONSTRAINT [PK_NotaFiscal] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[NotaFiscal] ADD CONSTRAINT [FK_NotaFiscal_Administrador] FOREIGN KEY ([IdAdministrador]) REFERENCES [dbo].[Administrador] ([Id])
GO
ALTER TABLE [dbo].[NotaFiscal] ADD CONSTRAINT [FK_NotaFiscal_Usuario] FOREIGN KEY ([IdUsuario]) REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[NotaFiscal] ADD CONSTRAINT [FK_NotaFiscal_Vendedor] FOREIGN KEY ([IdVendedor]) REFERENCES [dbo].[Vendedor] ([Id])
GO
