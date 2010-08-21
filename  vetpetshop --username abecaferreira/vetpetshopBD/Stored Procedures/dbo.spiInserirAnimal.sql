
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[spiInserirAnimal]
 
 @IdTipoAnimal  int,
 @Peso    decimal,
 @Raca    varchar(50),
 @Nome    varchar(50),
 @DataFimVacinacao datetime,
 @DataNascimento  datetime,
 @DataProxVacinacao datetime  
 
AS
BEGIN

DECLARE  @idCliente   int
SELECT @idCliente = SCOPE_IDENTITY()
 
INSERT INTO dbo.Animal( IdCliente,
      IdTipoAnimal,
      Peso,
      Raca,
      Nome,
      DataFimVacinacao,
      DataNascimento,
      DataProxVacinacao)
    VALUES
           (@idCliente,  
   @IdTipoAnimal, 
   @Peso,   
   @Raca,   
   @Nome,   
   @DataFimVacinacao,
   @DataNascimento, 
   @DataProxVacinacao)
   END
GO
