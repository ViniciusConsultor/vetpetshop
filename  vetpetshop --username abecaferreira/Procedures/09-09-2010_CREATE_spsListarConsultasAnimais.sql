USE [vetpetshop]
GO
/****** Object:  StoredProcedure [dbo].[spsListarConsultasAnimais]    Script Date: 09/09/2010 22:29:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsListarConsultasAnimais]

AS
--spsListarConsultaAnimal
BEGIN
	
	SELECT	c.Id,
			c.Nome,
			cv.Id,
			cv.Data,
			cv.[Status],
			cv.Valor,
			ca.Id,
			a.Id
			
	
	 FROM dbo.consultaanimal ca 
	 INNER JOIN dbo.consultaveterinaria cv ON
	 cv.Id = ca.IdConsulta
	 INNER JOIN dbo.animal a ON
	 a.Id = ca.IdAnimal
	 INNER JOIN dbo.cliente c ON
	 c.Id = a.IdCliente
		 
	 ORDER BY cv.Data DESC 
	
END
