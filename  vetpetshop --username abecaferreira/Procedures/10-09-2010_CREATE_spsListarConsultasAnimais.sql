USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsListarConsultasAnimais]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsListarConsultasAnimais
GO

CREATE PROCEDURE [dbo].[spsListarConsultasAnimais]

AS

SET NOCOUNT ON
--spsListarConsultasAnimais
BEGIN
	
	SELECT	cv.Id,
			c.Nome,
			a.Nome,
			cv.Data,
			cv.Valor,
			cv.[Status],
			cv.HoraConsulta
				
	 FROM dbo.consultaanimal ca 
	 INNER JOIN dbo.consultaveterinaria cv ON
	 cv.Id = ca.IdConsulta
	 INNER JOIN dbo.animal a ON
	 a.Id = ca.IdAnimal
	 INNER JOIN dbo.cliente c ON
	 c.Id = a.IdCliente
	 WHERE cv.TipoConsulta = 1	 
	 ORDER BY cv.[Status], cv.Data DESC, cv.HoraConsulta 
	
END

SET NOCOUNT OFF