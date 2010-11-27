USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsObterProduto]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsObterProduto
GO

CREATE PROCEDURE [dbo].[spsObterProduto]
	@IdProduto Int
AS

SET NOCOUNT ON

BEGIN
	
	SELECT * FROM dbo.Produto WHERE Id = @IdProduto
	
END

SET NOCOUNT OFF