USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsListaAnimaisByFK]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsListaAnimaisByFK
GO

CREATE PROCEDURE [dbo].[spsListaAnimaisByFK] 
	
@IdCliente int
	
AS

SET NOCOUNT ON

BEGIN

SELECT
a.Id,
a.Nome
FROM Animal a 
WHERE IdCliente = @IdCliente
	
END

SET NOCOUNT OFF