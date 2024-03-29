USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsListarConsultaAnimal]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsListarConsultaAnimal
GO

CREATE PROCEDURE [dbo].[spsListarConsultaAnimal]
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