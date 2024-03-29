USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsObterConsultasAnimal]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsObterConsultasAnimal
GO

CREATE PROCEDURE [dbo].[spsObterConsultasAnimal]
	@IdAnimal	Int
AS

SET NOCOUNT ON
--spsObterConsultasAnimal 1
BEGIN
	
	SELECT	cv.Id,
			cv.Data,
			cv.[Status],
			cv.Valor,
			case cv.TipoConsulta when 2 then 'Vacinação' else 'Consulta' end as TipoConsulta,
			cv.HoraConsulta	
	
	 FROM dbo.consultaveterinaria cv 
	 INNER JOIN dbo.ConsultaAnimal ca ON
	 ca.IdConsulta = cv.Id 
	 INNER JOIN dbo.animal a ON
	 a.Id = ca.IdAnimal
	 
	 WHERE a.Id = @IdAnimal  
	 
	 ORDER BY cv.Data DESC 
	
END

SET NOCOUNT OFF