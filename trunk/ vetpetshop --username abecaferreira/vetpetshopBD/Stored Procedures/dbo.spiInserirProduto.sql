SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[spiInserirProduto]

@IdGrupo INT,
@Nome VARCHAR(40),
@EstoqueMin INT,
@EstoqueMax INT,
@Descricao VARCHAR(100),
@PrecoCusto DECIMAL(7,2),
@PrecoVenda DECIMAL(7,2),
@DataValidade DATETIME

AS
BEGIN

INSERT INTO [dbo].[Produto] 

(IdGrupo,IdFinanceiro,Nome,EstoqueMin,EstoqueMax,Descricao,PrecoCusto,PrecoVenda,DataValidade)

VALUES

(@IdGrupo,NULL,@Nome,@EstoqueMin,@EstoqueMax,@Descricao,@PrecoCusto,@PrecoVenda,@DataValidade)

END
GO
