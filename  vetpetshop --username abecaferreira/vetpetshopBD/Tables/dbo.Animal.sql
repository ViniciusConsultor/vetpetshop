CREATE TABLE [dbo].[Animal]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[IdTipoAnimal] [int] NOT NULL,
[IdCliente] [int] NOT NULL,
[TipoAnimal] [int] NOT NULL,
[Peso] [decimal] (18, 0) NOT NULL,
[Raca] [varchar] (50) COLLATE Latin1_General_CI_AS NULL,
[Nome] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[DataFimVacinacao] [datetime] NULL,
[DataNascimento] [datetime] NULL,
[DataProxVacinacao] [datetime] NULL
) ON [PRIMARY]
ALTER TABLE [dbo].[Animal] ADD
CONSTRAINT [FK_Animal_IdCliente] FOREIGN KEY ([IdCliente]) REFERENCES [dbo].[Cliente] ([Id])
GO
ALTER TABLE [dbo].[Animal] ADD CONSTRAINT [PK_Animal] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Animal] ADD CONSTRAINT [FK_Animal_TipoAnimal] FOREIGN KEY ([IdTipoAnimal]) REFERENCES [dbo].[TipoAnimal] ([Id])
GO
