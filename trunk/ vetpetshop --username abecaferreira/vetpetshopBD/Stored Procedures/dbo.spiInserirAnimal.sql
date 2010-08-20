SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[spiInserirAnimal]
 
 @idCliente   int,
 @IdTipoAnimal  int,
 @Peso    decimal,
 @Raca    varchar(50),
 @Nome    varchar(50),
 @DataFimVacinacao datetime,
 @DataNascimento  datetime,
 @DataProxVacinacao datetime  
 
AS
BEGIN
 
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
