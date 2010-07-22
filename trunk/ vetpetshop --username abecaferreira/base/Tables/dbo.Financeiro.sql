CREATE TABLE [dbo].[Financeiro]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[ValorTotal] [decimal] (18, 0) NULL,
[TipoPagamento] [int] NOT NULL,
[TipoTransacao] [int] NOT NULL,
[TipoResponsavel] [int] NOT NULL,
[DataRegistroVenda] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Financeiro] ADD CONSTRAINT [PK_Financeiro] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
