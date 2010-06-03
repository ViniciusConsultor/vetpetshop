

SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[InserirProfissional]
@matr int
AS

select nome from dbo.tabelateste where codigo = @matr

GO
