USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spuAtualizarAgendamento]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spuAtualizarAgendamento
GO

CREATE PROCEDURE [dbo].[spuAtualizarAgendamento]
	
@IdAnimal INT,	
@DataProxVacinacao SMALLDATETIME

AS

SET NOCOUNT ON

BEGIN
	
	UPDATE dbo.Animal SET 
	DataProxVacinacao = @DataProxVacinacao
	WHERE Id = @IdAnimal
	
END

SET NOCOUNT OFF