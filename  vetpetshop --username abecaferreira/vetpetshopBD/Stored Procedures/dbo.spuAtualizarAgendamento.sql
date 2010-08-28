
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[spuAtualizarAgendamento]
	
@IdAnimal INT,	
@DataProxVacinacao SMALLDATETIME

AS
BEGIN
	
	UPDATE dbo.Animal SET 
	DataProxVacinacao = @DataProxVacinacao
	WHERE Id = @IdAnimal
	
END
GO
