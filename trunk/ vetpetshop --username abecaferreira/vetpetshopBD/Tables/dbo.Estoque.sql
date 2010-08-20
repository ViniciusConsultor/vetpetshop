CREATE TABLE [dbo].[Estoque]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Status] [smallint] NULL,
[Quantidade] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Estoque] ADD CONSTRAINT [PK_Estoque] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
