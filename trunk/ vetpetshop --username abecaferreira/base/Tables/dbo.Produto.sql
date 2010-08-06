CREATE TABLE [dbo].[Produto]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[IdGrupo] [int] NOT NULL,
[IdFinanceiro] [int] NULL,
[Nome] [varchar] (50) COLLATE Latin1_General_CI_AS NULL,
[EstoqueMin] [int] NULL,
[EstoqueMax] [int] NULL,
[Descricao] [varchar] (200) COLLATE Latin1_General_CI_AS NULL,
[PrecoCusto] [decimal] (9, 2) NULL,
[DataValidade] [datetime] NULL,
[PrecoVenda] [decimal] (9, 2) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Produto] ADD CONSTRAINT [PK_Produto] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Produto] ADD CONSTRAINT [FK_Produto_Financeiro] FOREIGN KEY ([IdFinanceiro]) REFERENCES [dbo].[Financeiro] ([Id])
GO
ALTER TABLE [dbo].[Produto] ADD CONSTRAINT [FK_Produto_Grupo] FOREIGN KEY ([IdGrupo]) REFERENCES [dbo].[Grupo] ([Id])
GO
