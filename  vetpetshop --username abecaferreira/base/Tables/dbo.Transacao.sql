CREATE TABLE [dbo].[Transacao]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[IdUsuario] [int] NOT NULL,
[IdFinanceiro] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Transacao] ADD CONSTRAINT [PK_Transacao] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Transacao] ADD CONSTRAINT [FK_Transacao_Financeiro] FOREIGN KEY ([IdFinanceiro]) REFERENCES [dbo].[Financeiro] ([Id])
GO
ALTER TABLE [dbo].[Transacao] ADD CONSTRAINT [FK_Transacao_Usuario] FOREIGN KEY ([IdUsuario]) REFERENCES [dbo].[Usuario] ([Id])
GO
