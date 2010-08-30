
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[spiInserirAnimal]
 
 @IdCliente int,
 @IdTipoAnimal  int,
 @Peso    decimal,
 @Raca    varchar(50),
 @Nome    varchar(50),
 @DataNascimento  datetime
 
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
           (@IdCliente,  
   @IdTipoAnimal, 
   @Peso,   
   @Raca,   
   @Nome,   
   null,
   @DataNascimento, 
   null)
   END
GO
