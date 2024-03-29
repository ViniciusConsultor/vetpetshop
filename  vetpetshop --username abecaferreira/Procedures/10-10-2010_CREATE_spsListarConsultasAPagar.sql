USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsListarConsultasAPagar]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsListarConsultasAPagar
GO

CREATE PROCEDURE [dbo].spsListarConsultasAPagar

@NomeAnimal varchar(50)

AS

SET NOCOUNT ON

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
	 
	 WHERE cv.Status <> 2
	 AND a.Nome like '%'+@NomeAnimal+'%'
		 
	 ORDER BY cv.Data ASC, cv.HoraConsulta 
	
END

SET NOCOUNT OFF