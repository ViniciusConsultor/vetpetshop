USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsEstBuscaSexoClientes]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[spsEstBuscaSexoClientes]
GO


CREATE PROCEDURE [dbo].[spsEstBuscaSexoClientes]
	@DataInicio datetime,
	@DataFim datetime
AS

SET NOCOUNT ON

BEGIN

DECLARE @HOMEM INT,
		@MULHER INT, 
		@TOTAL INT
		
	IF @DATAINICIO IS NULL AND @DATAFIM IS NULL
	BEGIN
		SELECT @HOMEM = COUNT(*) FROM CLIENTE WHERE upper(SEXO) = 'MASCULINO'
		SELECT @MULHER = COUNT(*) FROM CLIENTE WHERE upper(SEXO) = 'FEMININO'
		SELECT @TOTAL = COUNT(*) FROM CLIENTE 
	END
	ELSE
	BEGIN
		SELECT @HOMEM = COUNT(*) FROM CLIENTE WHERE upper(SEXO) = 'MASCULINO' AND DATACADASTRO >= CONVERT (DATETIME ,@DATAINICIO , 103 ) AND DATACADASTRO <= CONVERT (DATETIME ,@DATAFIM , 103 )
		SELECT @MULHER = COUNT(*) FROM CLIENTE WHERE upper(SEXO) = 'FEMININO' AND DATACADASTRO >= CONVERT (DATETIME ,@DATAINICIO , 103 ) AND DATACADASTRO <= CONVERT (DATETIME ,@DATAFIM , 103 )
		SELECT @TOTAL = COUNT(*) FROM CLIENTE WHERE DATACADASTRO >= CONVERT (DATETIME ,@DATAINICIO , 103 ) AND DATACADASTRO <= CONVERT (DATETIME ,@DATAFIM , 103 )
	END 
	
	SELECT @TOTAL, @HOMEM ,@MULHER  
	
END

SET NOCOUNT OFF