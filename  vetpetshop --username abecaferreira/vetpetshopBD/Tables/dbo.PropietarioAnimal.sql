CREATE TABLE [dbo].[PropietarioAnimal]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[IdCliente] [int] NOT NULL,
[IdAnimal] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PropietarioAnimal] ADD CONSTRAINT [PK_PropietarioAnimal] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PropietarioAnimal] ADD CONSTRAINT [FK_PropietarioAnimal_Animal] FOREIGN KEY ([IdAnimal]) REFERENCES [dbo].[Animal] ([Id])
GO
ALTER TABLE [dbo].[PropietarioAnimal] ADD CONSTRAINT [FK_PropietarioAnimal_Cliente] FOREIGN KEY ([IdCliente]) REFERENCES [dbo].[Cliente] ([Id])
GO
