USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spdExcluirConsulta]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spdExcluirConsulta
GO

CREATE PROCEDURE [dbo].[spdExcluirConsulta]

@Id		INT
AS

SET NOCOUNT ON
--spdExcluirConsulta
BEGIN
	
		DELETE FROM dbo.ConsultaAnimal
				
		WHERE	IdConsulta = @Id 
	 
		DELETE FROM dbo.ConsultaVeterinaria
				
		WHERE	Id = @Id 
END

SET NOCOUNT OFF