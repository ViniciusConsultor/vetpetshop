CREATE TABLE [dbo].[ProdutoNotaFiscal]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[IdProduto] [int] NOT NULL,
[IdNotaFiscal] [int] NOT NULL,
[Quantidade] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProdutoNotaFiscal] ADD CONSTRAINT [PK_ProdutoNotaFiscal] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProdutoNotaFiscal] ADD CONSTRAINT [FK_ProdutoNotaFiscal_NotaFiscal] FOREIGN KEY ([IdNotaFiscal]) REFERENCES [dbo].[NotaFiscal] ([Id])
GO
ALTER TABLE [dbo].[ProdutoNotaFiscal] ADD CONSTRAINT [FK_ProdutoNotaFiscal_Produto] FOREIGN KEY ([IdProduto]) REFERENCES [dbo].[Produto] ([Id])
GO
