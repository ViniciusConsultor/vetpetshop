CREATE TABLE [dbo].[VeterinarioCliente]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[IdCliente] [int] NOT NULL,
[IdVeterinario] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VeterinarioCliente] ADD CONSTRAINT [PK_VeterinarioCliente] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VeterinarioCliente] ADD CONSTRAINT [FK_VeterinarioCliente_Cliente] FOREIGN KEY ([IdCliente]) REFERENCES [dbo].[Cliente] ([Id])
GO
ALTER TABLE [dbo].[VeterinarioCliente] ADD CONSTRAINT [FK_VeterinarioCliente_Veterinario] FOREIGN KEY ([IdVeterinario]) REFERENCES [dbo].[Veterinario] ([Id])
GO
