CREATE TABLE [dbo].[Grupo]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Nome] [varchar] (50) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Grupo] ADD CONSTRAINT [PK_Grupo] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
