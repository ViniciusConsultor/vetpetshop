CREATE TABLE [dbo].[prof]
(
[mat] [numeric] (18, 0) NOT NULL,
[nome] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[profiss] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[prof] ADD CONSTRAINT [PK__prof__DF5071D60BC6C43E] PRIMARY KEY CLUSTERED  ([mat]) ON [PRIMARY]
GO
