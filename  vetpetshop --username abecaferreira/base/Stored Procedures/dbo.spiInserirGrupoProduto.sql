SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[spiInserirGrupoProduto] 
	@Nome VARCHAR(30)
AS
BEGIN

INSERT INTO dbo.Grupo (Nome) VALUES (@Nome)

END
GO
