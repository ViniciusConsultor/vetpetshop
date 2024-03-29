USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsListarProdutos]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsListarProdutos
GO

CREATE PROCEDURE [dbo].[spsListarProdutos]

@Tipo int,
@Nome VARCHAR(100)

AS

SET NOCOUNT ON
	
	IF @Tipo = 0 AND @Nome = ''
	BEGIN
	SELECT 
	p.Id,
	p.IdGrupo,	
	p.IdFinanceiro,
	p.Nome,
	p.EstoqueMin,
	p.EstoqueMax,
	p.Descricao,
	p.PrecoCusto,
	p.DataValidade,
	p.PrecoVenda,
	g.Nome AS NomeGrupo
	FROM dbo.Produto p INNER JOIN dbo.Grupo g
	ON p.IdGrupo = g.Id	
	ORDER BY g.Nome, p.Nome
	END
	
	IF @Tipo <> 0 AND @Nome = ''
	BEGIN
	SELECT 
	p.Id,
	p.IdGrupo,	
	p.IdFinanceiro,
	p.Nome,
	p.EstoqueMin,
	p.EstoqueMax,
	p.Descricao,
	p.PrecoCusto,
	p.DataValidade,
	p.PrecoVenda,
	g.Nome AS NomeGrupo
	FROM dbo.Produto p INNER JOIN dbo.Grupo g
	ON p.IdGrupo = g.Id	
	WHERE p.IdGrupo = @Tipo 	
	ORDER BY g.Nome, p.Nome
	END
	
	IF @Tipo <> 0 AND @Nome <> ''
	BEGIN
	SELECT 
	p.Id,
	p.IdGrupo,	
	p.IdFinanceiro,
	p.Nome,
	p.EstoqueMin,
	p.EstoqueMax,
	p.Descricao,
	p.PrecoCusto,
	p.DataValidade,
	p.PrecoVenda,
	g.Nome AS NomeGrupo
	FROM dbo.Produto p INNER JOIN dbo.Grupo g
	ON p.IdGrupo = g.Id	
	WHERE p.IdGrupo = @Tipo 	
	AND p.Nome LIKE '%'+@Nome+'%'
	ORDER BY g.Nome, p.Nome
	END
	
	IF @Tipo = 0 AND @Nome <> ''
	BEGIN
	SELECT 
	p.Id,
	p.IdGrupo,	
	p.IdFinanceiro,
	p.Nome,
	p.EstoqueMin,
	p.EstoqueMax,
	p.Descricao,
	p.PrecoCusto,
	p.DataValidade,
	p.PrecoVenda,
	g.Nome AS NomeGrupo
	FROM dbo.Produto p INNER JOIN dbo.Grupo g
	ON p.IdGrupo = g.Id		
	AND p.Nome LIKE '%'+@Nome+'%'
	ORDER BY g.Nome, p.Nome
	END

SET NOCOUNT OFF