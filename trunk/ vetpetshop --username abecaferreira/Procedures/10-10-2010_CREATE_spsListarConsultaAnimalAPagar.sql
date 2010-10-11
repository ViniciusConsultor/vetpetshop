if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsListarConsultaAnimalAPagar]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsListarConsultaAnimalAPagar
GO

CREATE PROCEDURE [dbo].spsListarConsultaAnimalAPagar
	@idConsulta int
AS

SET NOCOUNT ON

BEGIN
	
	SELECT	
			cv.IdUsuario,
			cv.Valor
				
	 FROM dbo.consultaveterinaria cv
	 INNER JOIN dbo.consultaanimal ca  ON
	 cv.Id = ca.IdConsulta
	 INNER JOIN dbo.animal a ON
	 a.Id = ca.IdAnimal
	 
	 WHERE cv.Id = @idConsulta
	
END

SET NOCOUNT OFF