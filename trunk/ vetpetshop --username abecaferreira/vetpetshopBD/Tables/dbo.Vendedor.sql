CREATE TABLE [dbo].[Vendedor]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Nome] [varchar] (50) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Vendedor] ADD CONSTRAINT [PK_Vendedor] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
