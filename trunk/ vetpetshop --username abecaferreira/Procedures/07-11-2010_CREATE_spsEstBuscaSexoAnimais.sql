if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsEstBuscaSexoAnimais]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[spsEstBuscaSexoAnimais]
GO


CREATE PROCEDURE [dbo].[spsEstBuscaSexoAnimais]
	@DataInicio datetime,
	@DataFim datetime
AS

BEGIN

DECLARE @HOMEM INT,
		@MULHER INT, 
		@TOTAL INT

	IF @DATAINICIO IS NULL AND @DATAFIM IS NULL
	BEGIN
		SELECT @HOMEM = COUNT(*) FROM ANIMAL WHERE SEXO = 'MASCULINO'
		SELECT @MULHER = COUNT(*) FROM ANIMAL WHERE SEXO = 'FEMININO'
		SELECT @TOTAL = COUNT(*) FROM ANIMAL 
	END
	ELSE
	BEGIN
		SELECT @HOMEM = COUNT(*) FROM ANIMAL WHERE SEXO = 'MASCULINO' AND DATACADASTRO >= CONVERT (DATETIME ,@DATAINICIO , 103 ) AND DATACADASTRO <= CONVERT (DATETIME ,@DATAFIM , 103 )
		SELECT @MULHER = COUNT(*) FROM ANIMAL WHERE SEXO = 'FEMININO' AND DATACADASTRO >= CONVERT (DATETIME ,@DATAINICIO , 103 ) AND DATACADASTRO <= CONVERT (DATETIME ,@DATAFIM , 103 )
		SELECT @TOTAL = COUNT(*) FROM ANIMAL WHERE DATACADASTRO >= CONVERT (DATETIME ,@DATAINICIO , 103 ) AND DATACADASTRO <= CONVERT (DATETIME ,@DATAFIM , 103 )
	END 
	
	SELECT @TOTAL, @HOMEM ,@MULHER
END
