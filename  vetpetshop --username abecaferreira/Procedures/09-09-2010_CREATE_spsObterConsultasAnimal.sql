if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsObterConsultasAnimal]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsObterConsultasAnimal
GO

CREATE PROCEDURE [dbo].[spsObterConsultasAnimal]
	@IdAnimal	Int
AS

SET NOCOUNT ON
--spsListarConsultaAnimal 1
BEGIN
	
	SELECT	cv.Id,
			cv.Data,
			cv.[Status],
			cv.Valor
			
	
	 FROM dbo.consultaanimal ca 
	 INNER JOIN dbo.consultaveterinaria cv ON
	 cv.Id = ca.IdConsulta
	 INNER JOIN dbo.animal a ON
	 a.Id = ca.IdAnimal
	 
	 WHERE ca.IdAnimal = @IdAnimal  
	 
	 ORDER BY cv.Data DESC 
	
END

SET NOCOUNT OFF