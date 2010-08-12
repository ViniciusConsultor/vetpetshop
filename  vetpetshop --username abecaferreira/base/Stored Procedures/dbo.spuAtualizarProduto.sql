SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[spuAtualizarProduto]
	
@IdProduto INT,	
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
	
	UPDATE dbo.Produto SET 
	IdGrupo = @IdGrupo,
	IdFinanceiro = NULL,
	Nome = @Nome,
	EstoqueMin = @EstoqueMin,
	EstoqueMax = @EstoqueMax,
	Descricao = @Descricao,
	PrecoCusto = @PrecoCusto,
	PrecoVenda = @PrecoVenda,
	DataValidade = @DataValidade
	WHERE Id = @IdProduto
	
END
GO
