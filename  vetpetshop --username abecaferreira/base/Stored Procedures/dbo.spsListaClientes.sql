SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[spsListaClientes] 
	
AS
BEGIN

SELECT
c.Id,
c.Nome,
c.CPF,
c.Telefone,
c.Email
FROM Cliente c 
ORDER BY c.Nome
	
END
GO
