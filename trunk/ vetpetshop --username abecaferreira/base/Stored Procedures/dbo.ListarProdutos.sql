SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[ListarProdutos]

@Tipo int,
@Nome VARCHAR(100)

AS
	
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
	ORDER BY g.Nome
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
	ORDER BY g.Nome
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
	ORDER BY g.Nome
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
	ORDER BY g.Nome
	END
	
	
	

GO
