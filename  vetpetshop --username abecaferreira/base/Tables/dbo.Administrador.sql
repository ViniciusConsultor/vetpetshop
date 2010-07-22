CREATE TABLE [dbo].[Administrador]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Nome] [varchar] (50) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Administrador] ADD CONSTRAINT [PK_Administrador] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
