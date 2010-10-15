if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsListarConsultasAnimais2]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsListarConsultasAnimais2
GO

CREATE PROCEDURE [dbo].[spsListarConsultasAnimais2]

AS

SET NOCOUNT ON
--spsListarConsultasAnimais2
BEGIN
	
	SELECT	cv.Id,
			c.Nome,
			a.Nome,
			cv.Data,
			cv.[Status]
				
	 FROM dbo.consultaanimal ca 
	 INNER JOIN dbo.consultaveterinaria cv ON
	 cv.Id = ca.IdConsulta
	 INNER JOIN dbo.animal a ON
	 a.Id = ca.IdAnimal
	 INNER JOIN dbo.cliente c ON
	 c.Id = a.IdCliente
		 
	 ORDER BY cv.Data DESC 
	
END

SET NOCOUNT OFF