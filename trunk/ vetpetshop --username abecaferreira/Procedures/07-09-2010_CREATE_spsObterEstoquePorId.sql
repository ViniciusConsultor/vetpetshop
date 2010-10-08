if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsObterEstoquePorId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsObterEstoquePorId
GO

CREATE PROCEDURE [dbo].[spsObterEstoquePorId] 
	@IdEstoque INT	
AS

SET NOCOUNT ON

BEGIN
	SELECT * FROM Estoque WHERE Id = @IdEstoque
END

SET NOCOUNT OFF

