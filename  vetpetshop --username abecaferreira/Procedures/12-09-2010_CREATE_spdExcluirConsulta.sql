USE [vetpetshop]
GO
/****** Object:  StoredProcedure [dbo].[spdExcluirConsulta]    Script Date: 09/13/2010 00:59:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spdExcluirConsulta]

@Id		INT
AS
--spdExcluirConsulta
BEGIN
	
		DELETE FROM dbo.ConsultaAnimal
				
		WHERE	IdConsulta = @Id 
	 
		DELETE FROM dbo.ConsultaVeterinaria
				
		WHERE	Id = @Id 
END
