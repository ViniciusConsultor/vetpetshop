USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spiInserirAnimal]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spiInserirAnimal
GO

CREATE PROCEDURE [dbo].[spiInserirAnimal]
 
 @IdCliente int,
 @IdTipoAnimal  int,
 @Peso    decimal,
 @Raca    varchar(50),
 @Nome    varchar(50),
 @DataNascimento  datetime,
 @Sexo varchar(10)
 
AS

SET NOCOUNT ON

BEGIN
 
INSERT INTO dbo.Animal(IdCliente,
	  Sexo,
      IdTipoAnimal,
      Peso,
      Raca,
      Nome,
      DataFimVacinacao,
      DataNascimento,
      DataProxVacinacao,
      DataCadastro)
    VALUES
           (@IdCliente,
   @Sexo,          
   @IdTipoAnimal, 
   @Peso,   
   @Raca,   
   @Nome,   
   null,
   @DataNascimento, 
   null,
   CAST(CONVERT(VARCHAR, GETDATE(), 103) AS DATETIME))
   END

SET NOCOUNT OFF