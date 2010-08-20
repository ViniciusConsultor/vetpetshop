CREATE TABLE [dbo].[NotaFiscal]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[IdVendedor] [int] NOT NULL,
[IdAdministrador] [int] NOT NULL,
[IdUsuario] [int] NOT NULL,
[DataCadastro] [datetime] NOT NULL,
[Valor] [decimal] (18, 0) NOT NULL,
[Status] [int] NOT NULL,
[DataRecebimento] [datetime] NOT NULL
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
