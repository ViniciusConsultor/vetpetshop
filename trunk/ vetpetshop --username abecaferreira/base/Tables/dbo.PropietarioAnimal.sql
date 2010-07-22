CREATE TABLE [dbo].[PropietarioAnimal]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[IdCliente] [int] NOT NULL,
[IdAnimal] [int] NOT NULL,
[CPF] [varchar] (11) COLLATE Latin1_General_CI_AS NOT NULL,
[Telefone] [varchar] (8) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PropietarioAnimal] ADD CONSTRAINT [PK_PropietarioAnimal] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PropietarioAnimal] ADD CONSTRAINT [FK_PropietarioAnimal_Animal] FOREIGN KEY ([IdAnimal]) REFERENCES [dbo].[Animal] ([Id])
GO
ALTER TABLE [dbo].[PropietarioAnimal] ADD CONSTRAINT [FK_PropietarioAnimal_Cliente] FOREIGN KEY ([IdCliente]) REFERENCES [dbo].[Cliente] ([Id])
GO
