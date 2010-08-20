CREATE TABLE [dbo].[EstoqueProduto]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[IdEstoque] [int] NOT NULL,
[IdProduto] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EstoqueProduto] ADD CONSTRAINT [PK_EstoqueProduto] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EstoqueProduto] ADD CONSTRAINT [FK_EstoqueProduto_Estoque] FOREIGN KEY ([IdEstoque]) REFERENCES [dbo].[Estoque] ([Id])
GO
ALTER TABLE [dbo].[EstoqueProduto] ADD CONSTRAINT [FK_EstoqueProduto_Produto] FOREIGN KEY ([IdProduto]) REFERENCES [dbo].[Produto] ([Id])
GO
