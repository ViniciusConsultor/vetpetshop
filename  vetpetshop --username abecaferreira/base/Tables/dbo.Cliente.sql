CREATE TABLE [dbo].[Cliente]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[CPF] [varchar] (11) COLLATE Latin1_General_CI_AS NOT NULL,
[Nome] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[Telefone] [varchar] (8) COLLATE Latin1_General_CI_AS NULL,
[Email] [varchar] (30) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cliente] ADD CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
