CREATE TABLE [dbo].[Veterinario]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Nome] [varchar] (50) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Veterinario] ADD CONSTRAINT [PK_Veterinario] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
