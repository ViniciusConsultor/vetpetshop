CREATE TABLE [dbo].[Cliente]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[CPF] [varchar] (20) COLLATE Latin1_General_CI_AS NOT NULL,
[Nome] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[RG] [varchar] (20) COLLATE Latin1_General_CI_AS NULL,
[Telefone1] [varchar] (15) COLLATE Latin1_General_CI_AS NULL,
[Telefone2] [varchar] (15) COLLATE Latin1_General_CI_AS NULL,
[Email] [varchar] (30) COLLATE Latin1_General_CI_AS NULL,
[Endereco] [varchar] (50) COLLATE Latin1_General_CI_AS NULL,
[Bairro] [varchar] (20) COLLATE Latin1_General_CI_AS NULL,
[Cidade] [varchar] (20) COLLATE Latin1_General_CI_AS NULL,
[Estado] [varchar] (20) COLLATE Latin1_General_CI_AS NULL,
[CEP] [varchar] (20) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cliente] ADD CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
