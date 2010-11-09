if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsEstBuscaConsultaAnimais]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsEstBuscaConsultaAnimais
GO


CREATE PROCEDURE [dbo].spsEstBuscaConsultaAnimais
	@DataInicio datetime,
	@DataFim datetime
AS

BEGIN

DECLARE @CACHORRO INT,
		@GATO INT, 
		@TOTAL INT,
		@PEIXE INT,
		@PASSARO INT,
		@ROEDOR INT
		
	IF @DATAINICIO IS NULL AND @DATAFIM IS NULL
	BEGIN
		SELECT @CACHORRO = COUNT(*) FROM CONSULTAVETERINARIA CV, CONSULTAANIMAL CA, ANIMAL A WHERE CA.IDCONSULTA = CV.ID AND CA.IDANIMAL = A.ID AND CV.TIPOCONSULTA = 1 AND A.IdTipoAnimal = 1
		SELECT @GATO = COUNT(*) FROM CONSULTAVETERINARIA CV, CONSULTAANIMAL CA, ANIMAL A WHERE CA.IDCONSULTA = CV.ID AND CA.IDANIMAL = A.ID AND CV.TIPOCONSULTA = 1 AND A.IdTipoAnimal = 2
		SELECT @PEIXE = COUNT(*) FROM CONSULTAVETERINARIA CV, CONSULTAANIMAL CA, ANIMAL A WHERE CA.IDCONSULTA = CV.ID AND CA.IDANIMAL = A.ID AND CV.TIPOCONSULTA = 1 AND A.IdTipoAnimal = 3
		SELECT @PASSARO = COUNT(*) FROM CONSULTAVETERINARIA CV, CONSULTAANIMAL CA, ANIMAL A WHERE CA.IDCONSULTA = CV.ID AND CA.IDANIMAL = A.ID AND CV.TIPOCONSULTA = 1 AND A.IdTipoAnimal = 4
		SELECT @ROEDOR = COUNT(*) FROM CONSULTAVETERINARIA CV, CONSULTAANIMAL CA, ANIMAL A WHERE CA.IDCONSULTA = CV.ID AND CA.IDANIMAL = A.ID AND CV.TIPOCONSULTA = 1 AND A.IdTipoAnimal = 5
		SELECT @TOTAL = COUNT(*) FROM CONSULTAVETERINARIA CV, CONSULTAANIMAL CA, ANIMAL A WHERE CA.IDCONSULTA = CV.ID AND CA.IDANIMAL = A.ID AND CV.TIPOCONSULTA = 1
	END
	ELSE
	BEGIN
		SELECT @CACHORRO = COUNT(*) FROM CONSULTAVETERINARIA CV, CONSULTAANIMAL CA, ANIMAL A WHERE CA.IDCONSULTA = CV.ID AND CA.IDANIMAL = A.ID AND CV.TIPOCONSULTA = 1 AND A.IdTipoAnimal = 1 AND CV.DATA >= CONVERT (DATETIME ,@DATAINICIO , 103 ) AND CV.DATA <= CONVERT (DATETIME ,@DATAFIM , 103 )
		SELECT @GATO = COUNT(*) FROM CONSULTAVETERINARIA CV, CONSULTAANIMAL CA, ANIMAL A WHERE CA.IDCONSULTA = CV.ID AND CA.IDANIMAL = A.ID AND CV.TIPOCONSULTA = 1 AND A.IdTipoAnimal = 2 AND CV.DATA >= CONVERT (DATETIME ,@DATAINICIO , 103 ) AND CV.DATA <= CONVERT (DATETIME ,@DATAFIM , 103 )
		SELECT @PEIXE = COUNT(*) FROM CONSULTAVETERINARIA CV, CONSULTAANIMAL CA, ANIMAL A WHERE CA.IDCONSULTA = CV.ID AND CA.IDANIMAL = A.ID AND CV.TIPOCONSULTA = 1 AND A.IdTipoAnimal = 3 AND CV.DATA >= CONVERT (DATETIME ,@DATAINICIO , 103 ) AND CV.DATA <= CONVERT (DATETIME ,@DATAFIM , 103 )
		SELECT @PASSARO = COUNT(*) FROM CONSULTAVETERINARIA CV, CONSULTAANIMAL CA, ANIMAL A WHERE CA.IDCONSULTA = CV.ID AND CA.IDANIMAL = A.ID AND CV.TIPOCONSULTA = 1 AND A.IdTipoAnimal = 4 AND CV.DATA >= CONVERT (DATETIME ,@DATAINICIO , 103 ) AND CV.DATA <= CONVERT (DATETIME ,@DATAFIM , 103 )
		SELECT @ROEDOR = COUNT(*) FROM CONSULTAVETERINARIA CV, CONSULTAANIMAL CA, ANIMAL A WHERE CA.IDCONSULTA = CV.ID AND CA.IDANIMAL = A.ID AND CV.TIPOCONSULTA = 1 AND A.IdTipoAnimal = 5 AND CV.DATA >= CONVERT (DATETIME ,@DATAINICIO , 103 ) AND CV.DATA <= CONVERT (DATETIME ,@DATAFIM , 103 )
		SELECT @TOTAL = COUNT(*) FROM CONSULTAVETERINARIA CV, CONSULTAANIMAL CA, ANIMAL A WHERE CA.IDCONSULTA = CV.ID AND CA.IDANIMAL = A.ID AND CV.TIPOCONSULTA = 1 AND CV.DATA >= CONVERT (DATETIME ,@DATAINICIO , 103 ) AND CV.DATA <= CONVERT (DATETIME ,@DATAFIM , 103 )
	END 
	
	
	SELECT @TOTAL, @CACHORRO ,@GATO ,@PEIXE, @PASSARO, @ROEDOR
	
END
