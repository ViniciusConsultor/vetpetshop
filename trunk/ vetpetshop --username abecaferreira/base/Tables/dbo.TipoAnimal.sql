CREATE TABLE [dbo].[TipoAnimal]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Nome] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TipoAnimal] ADD CONSTRAINT [PK_TipoAnimal] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
