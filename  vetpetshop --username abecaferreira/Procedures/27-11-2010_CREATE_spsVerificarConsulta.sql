USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsVerificarConsulta]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsVerificarConsulta

GO 

CREATE PROCEDURE [dbo].[spsVerificarConsulta]
	@Data VARCHAR(30),
	@Hora VARCHAR(30)
AS

SET NOCOUNT ON

BEGIN
	SELECT count(*) FROM ConsultaVeterinaria
	WHERE  Data=@Data AND HoraConsulta=@Hora
END

SET NOCOUNT OFF