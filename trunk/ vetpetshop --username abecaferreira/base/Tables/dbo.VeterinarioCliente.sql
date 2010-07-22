CREATE TABLE [dbo].[VeterinarioCliente]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[IdCliente] [int] NOT NULL,
[IdVeterinario] [int] NOT NULL,
[CPF] [varchar] (11) COLLATE Latin1_General_CI_AS NOT NULL,
[Telefone] [varchar] (8) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VeterinarioCliente] ADD CONSTRAINT [PK_VeterinarioCliente] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VeterinarioCliente] ADD CONSTRAINT [FK_VeterinarioCliente_Cliente] FOREIGN KEY ([IdCliente]) REFERENCES [dbo].[Cliente] ([Id])
GO
ALTER TABLE [dbo].[VeterinarioCliente] ADD CONSTRAINT [FK_VeterinarioCliente_Veterinario] FOREIGN KEY ([IdVeterinario]) REFERENCES [dbo].[Veterinario] ([Id])
GO
