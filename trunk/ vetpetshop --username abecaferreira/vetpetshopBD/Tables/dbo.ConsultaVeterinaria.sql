CREATE TABLE [dbo].[ConsultaVeterinaria]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[IdUsuario] [int] NOT NULL,
[IdFinanceiro] [int] NULL,
[Valor] [decimal] (18, 0) NULL,
[Data] [datetime] NOT NULL,
[Status] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ConsultaVeterinaria] ADD CONSTRAINT [PK_ConsultaVeterinaria] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ConsultaVeterinaria] ADD CONSTRAINT [FK_ConsultaVeterinaria_Financeiro] FOREIGN KEY ([IdFinanceiro]) REFERENCES [dbo].[Financeiro] ([Id])
GO
ALTER TABLE [dbo].[ConsultaVeterinaria] ADD CONSTRAINT [FK_ConsultaVeterinaria_Usuario] FOREIGN KEY ([IdUsuario]) REFERENCES [dbo].[Usuario] ([Id])
GO
