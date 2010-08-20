CREATE TABLE [dbo].[Financeiro]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[IdUsuario] [int] NOT NULL,
[ValorTotal] [decimal] (18, 0) NULL,
[TipoPagamento] [int] NOT NULL,
[Parcelas] [int] NULL,
[TipoTransacao] [int] NOT NULL,
[TipoResponsavel] [int] NOT NULL,
[DataTransacao] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Financeiro] ADD CONSTRAINT [PK_Financeiro] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Financeiro] ADD CONSTRAINT [FK_Financeiro_Usuario] FOREIGN KEY ([IdUsuario]) REFERENCES [dbo].[Usuario] ([Id])
GO
