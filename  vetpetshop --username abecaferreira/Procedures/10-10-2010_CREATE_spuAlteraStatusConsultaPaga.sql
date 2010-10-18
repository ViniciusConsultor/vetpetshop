if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spuAlteraStatusConsultaPaga]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spuAlteraStatusConsultaPaga
GO

CREATE PROCEDURE [dbo].spuAlteraStatusConsultaPaga
	
@IdConsulta int,
@IdFinanceiro int,	
@Status int

AS

SET NOCOUNT ON

BEGIN
	
	UPDATE dbo.ConsultaVeterinaria SET 
	Status = @Status,
	IdFinanceiro = @IdFinanceiro
	WHERE Id = @IdConsulta
	
END

SET NOCOUNT OFF