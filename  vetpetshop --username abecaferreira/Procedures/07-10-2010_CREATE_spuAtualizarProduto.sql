USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spuAtualizarProduto]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spuAtualizarProduto
GO

CREATE PROCEDURE [dbo].[spuAtualizarProduto]
	
@IdProduto INT,	
@IdGrupo INT,
@Nome VARCHAR(40),
@EstoqueMin INT,
@EstoqueMax INT,
@Descricao VARCHAR(100),
@PrecoCusto DECIMAL(9,2),
@PrecoVenda DECIMAL(9,2),
@DataValidade DATETIME
AS

SET NOCOUNT ON

BEGIN
	
	UPDATE dbo.Produto SET 
	IdGrupo = @IdGrupo,	
	Nome = @Nome,
	EstoqueMin = @EstoqueMin,
	EstoqueMax = @EstoqueMax,
	Descricao = @Descricao,
	PrecoCusto = @PrecoCusto,
	PrecoVenda = @PrecoVenda,
	DataValidade = @DataValidade
	WHERE Id = @IdProduto
	
END

SET NOCOUNT OFF