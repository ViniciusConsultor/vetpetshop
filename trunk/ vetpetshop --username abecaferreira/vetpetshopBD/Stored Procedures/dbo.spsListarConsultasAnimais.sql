SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[spsListarConsultasAnimais]

AS
--spsListarConsultasAnimais
BEGIN
	
	SELECT	cv.Id,
			c.Nome,
			a.Nome,
			cv.Data,
			cv.Valor,
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
GO
