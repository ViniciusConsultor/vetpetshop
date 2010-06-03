CREATE TABLE [dbo].[tabelateste]
(
[codigo] [int] NOT NULL,
[nome] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[endereco] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tabelateste] ADD CONSTRAINT [PK__tabelate__40F9A2070F975522] PRIMARY KEY CLUSTERED  ([codigo]) ON [PRIMARY]
GO
