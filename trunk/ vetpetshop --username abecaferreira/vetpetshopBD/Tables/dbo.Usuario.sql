CREATE TABLE [dbo].[Usuario]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[IdAdministrador] [int] NULL,
[IdVeterinario] [int] NULL,
[IdVendedor] [int] NULL,
[Nome] [varchar] (50) COLLATE Latin1_General_CI_AS NULL,
[TipoUsuario] [int] NOT NULL,
[Senha] [varchar] (20) COLLATE Latin1_General_CI_AS NOT NULL,
[Email] [varchar] (30) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Usuario] ADD CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Usuario] ADD CONSTRAINT [FK_Usuario_Administrador] FOREIGN KEY ([IdAdministrador]) REFERENCES [dbo].[Administrador] ([Id])
GO
ALTER TABLE [dbo].[Usuario] ADD CONSTRAINT [FK_Usuario_Vendedor] FOREIGN KEY ([IdVendedor]) REFERENCES [dbo].[Vendedor] ([Id])
GO
ALTER TABLE [dbo].[Usuario] ADD CONSTRAINT [FK_Usuario_Veterinario] FOREIGN KEY ([IdVeterinario]) REFERENCES [dbo].[Veterinario] ([Id])
GO
