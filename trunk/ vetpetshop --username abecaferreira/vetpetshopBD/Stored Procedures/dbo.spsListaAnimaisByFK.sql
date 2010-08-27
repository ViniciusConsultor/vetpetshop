SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[spsListaAnimaisByFK] 
	
@IdCliente int
	
AS
BEGIN

SELECT
a.Id,
a.Nome
FROM Animal a 
WHERE IdCliente = @IdCliente
	
END
GO
