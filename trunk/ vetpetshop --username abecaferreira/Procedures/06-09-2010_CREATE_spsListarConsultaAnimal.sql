USE [vetpetshop]
GO
/****** Object:  StoredProcedure [dbo].[spsListarConsultaAnimal]    Script Date: 09/06/2010 19:55:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsListarConsultaAnimal]
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
