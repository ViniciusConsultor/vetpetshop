USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsVerificarConsulta]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsVerificarConsulta

GO 

CREATE PROCEDURE [dbo].[spsVerificarConsulta]
	@Data DATETIME,
	@Hora VARCHAR(30)
AS

SET NOCOUNT ON

BEGIN
	SELECT count(*) 
	FROM ConsultaVeterinaria
	WHERE  CAST(CONVERT(VARCHAR, Data, 103) AS DATETIME) = CAST(CONVERT(VARCHAR, @Data, 103) AS DATETIME) 
	AND HoraConsulta = @Hora
	AND [Status] in (0,2)
END

SET NOCOUNT OFF