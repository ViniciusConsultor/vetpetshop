if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsListarVacinacoesAnimais]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsListarVacinacoesAnimais
GO

CREATE PROCEDURE [dbo].[spsListarVacinacoesAnimais]

AS

SET NOCOUNT ON
--spsListarVacinacoesAnimais
BEGIN
	
	SELECT	a.Id,
			c.Nome,
			a.Nome,
			a.DataProxVacinacao
				
	 FROM dbo.animal a
	 INNER JOIN dbo.cliente c ON
	 c.Id = a.IdCliente
	 
	 WHERE a.DataProxVacinacao IS NOT NULL
		 
	 ORDER BY a.DataProxVacinacao DESC 
	
END

SET NOCOUNT OFF