USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spiInserirProduto]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spiInserirProduto
GO

CREATE PROCEDURE [dbo].[spiInserirProduto]

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

INSERT INTO [dbo].[Produto] 

(IdGrupo,IdFinanceiro,Nome,EstoqueMin,EstoqueMax,Descricao,PrecoCusto,PrecoVenda,DataValidade)

VALUES

(@IdGrupo,NULL,@Nome,@EstoqueMin,@EstoqueMax,@Descricao,@PrecoCusto,@PrecoVenda,@DataValidade)

END

SET NOCOUNT OFF