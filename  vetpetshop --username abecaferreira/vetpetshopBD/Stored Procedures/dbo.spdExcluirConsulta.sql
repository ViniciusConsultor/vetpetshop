SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create PROCEDURE [dbo].[spdExcluirConsulta]

@Id		INT
AS
--spdExcluirConsulta
BEGIN
	
		DELETE FROM dbo.ConsultaAnimal
				
		WHERE	IdConsulta = @Id 
	 
		DELETE FROM dbo.ConsultaVeterinaria
				
		WHERE	Id = @Id 
END
GO
