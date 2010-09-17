USE [vetpetshop]
GO
/****** Object:  StoredProcedure [dbo].[spsListarVacinacoesAnimais]    Script Date: 09/16/2010 22:20:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsListarVacinacoesAnimais]

AS
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
