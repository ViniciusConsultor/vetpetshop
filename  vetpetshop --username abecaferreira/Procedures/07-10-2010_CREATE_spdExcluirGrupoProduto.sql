USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spdExcluirGrupoProduto]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spdExcluirGrupoProduto
GO

CREATE PROCEDURE [dbo].[spdExcluirGrupoProduto]
	@Id int
AS

SET NOCOUNT ON

BEGIN

DELETE FROM dbo.Grupo WHERE Id = @Id

END

SET NOCOUNT OFF