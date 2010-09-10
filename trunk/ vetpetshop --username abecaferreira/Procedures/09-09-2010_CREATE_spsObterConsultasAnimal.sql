USE [vetpetshop]
GO
/****** Object:  StoredProcedure [dbo].[spsObterConsultasAnimal]    Script Date: 09/09/2010 22:29:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsObterConsultasAnimal]
	@IdAnimal	Int
AS
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
