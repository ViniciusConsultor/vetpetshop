CREATE TABLE [dbo].[ConsultaAnimal]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[IdConsulta] [int] NOT NULL,
[IdAnimal] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ConsultaAnimal] ADD CONSTRAINT [PK_ConsultaAnimal] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ConsultaAnimal] ADD CONSTRAINT [FK_ConsultaAnimal_Animal] FOREIGN KEY ([IdAnimal]) REFERENCES [dbo].[Animal] ([Id])
GO
ALTER TABLE [dbo].[ConsultaAnimal] ADD CONSTRAINT [FK_ConsultaAnimal_ConsultaVeterinaria] FOREIGN KEY ([IdConsulta]) REFERENCES [dbo].[ConsultaVeterinaria] ([Id])
GO
