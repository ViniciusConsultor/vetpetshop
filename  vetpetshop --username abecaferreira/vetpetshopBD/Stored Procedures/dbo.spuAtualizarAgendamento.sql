SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[spuAtualizarAgendamento]
	
@IdAnimal INT,	
@DataVacinacao SMALLDATETIME,
@DataProxVacinacao SMALLDATETIME

AS
BEGIN
	
	UPDATE dbo.Animal SET 
	DataFimVacinacao = @DataVacinacao,
	DataProxVacinacao = @DataProxVacinacao
	WHERE Id = @IdAnimal
	
END
GO
