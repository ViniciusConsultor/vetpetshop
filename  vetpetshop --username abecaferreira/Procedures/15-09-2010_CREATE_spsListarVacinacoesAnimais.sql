USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsListarVacinacoesAnimais]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsListarVacinacoesAnimais
GO

CREATE PROCEDURE [dbo].[spsListarVacinacoesAnimais]

AS

SET NOCOUNT ON
--spsListarVacinacoesAnimais
BEGIN
	
	SELECT	cv.Id,
			c.Nome,
			a.Nome,			
			cv.Data,
			cv.Valor,
			cv.[Status],
			cv.HoraConsulta
							
	 FROM dbo.animal a
	 INNER JOIN dbo.cliente c ON c.Id = a.IdCliente
	 INNER JOIN dbo.ConsultaAnimal ca on ca.IdAnimal = a.Id
	 INNER JOIN dbo.ConsultaVeterinaria cv ON cv.Id = ca.IdConsulta
	 WHERE cv.TipoConsulta = 2
	 ORDER BY cv.[Status], cv.Data DESC, cv.HoraConsulta
	
END

SET NOCOUNT OFF