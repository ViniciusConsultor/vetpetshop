USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsListarProdutosEmEstoque]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsListarProdutosEmEstoque
GO


CREATE PROCEDURE [dbo].[spsListarProdutosEmEstoque]
	@Tipo INT,
	@Nome VARCHAR(100)
	
AS

SET NOCOUNT ON

BEGIN
		
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
	FROM dbo.Produto p 
	INNER JOIN dbo.Grupo g ON p.IdGrupo = g.Id	
	INNER JOIN dbo.EstoqueProduto ep ON p.Id = ep.IdProduto
	INNER JOIN dbo.Estoque e ON ep.IdEstoque = e.Id
	WHERE e.Quantidade > 0
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
	FROM dbo.Produto p 
	INNER JOIN dbo.Grupo g ON p.IdGrupo = g.Id	
	INNER JOIN dbo.EstoqueProduto ep ON p.Id = ep.IdProduto
	INNER JOIN dbo.Estoque e ON ep.IdEstoque = e.Id
	WHERE e.Quantidade > 0 AND p.IdGrupo = @Tipo
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
	FROM dbo.Produto p 
	INNER JOIN dbo.Grupo g ON p.IdGrupo = g.Id	
	INNER JOIN dbo.EstoqueProduto ep ON p.Id = ep.IdProduto
	INNER JOIN dbo.Estoque e ON ep.IdEstoque = e.Id
	WHERE e.Quantidade > 0 AND p.IdGrupo = @Tipo AND p.Nome LIKE '%'+@Nome+'%'
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
	FROM dbo.Produto p 
	INNER JOIN dbo.Grupo g ON p.IdGrupo = g.Id	
	INNER JOIN dbo.EstoqueProduto ep ON p.Id = ep.IdProduto
	INNER JOIN dbo.Estoque e ON ep.IdEstoque = e.Id
	WHERE e.Quantidade > 0 AND p.Nome LIKE '%'+@Nome+'%'
	ORDER BY g.Nome, p.Nome
	END	
END

SET NOCOUNT OFF