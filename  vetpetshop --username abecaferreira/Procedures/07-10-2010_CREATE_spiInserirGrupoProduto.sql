USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spiInserirGrupoProduto]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spiInserirGrupoProduto
GO

CREATE PROCEDURE [dbo].[spiInserirGrupoProduto] 
	@Nome VARCHAR(30)
AS

SET NOCOUNT ON

BEGIN

INSERT INTO dbo.Grupo (Nome) VALUES (@Nome)

END

SET NOCOUNT OFF