USE [vetpetshop]
GO
/****** Object:  StoredProcedure [dbo].[spsListarEstoque]    Script Date: 09/12/2010 17:30:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spsListarEstoque]
	
AS
BEGIN
	SELECT 
	e.Id,
	g.Nome,
	p.Nome,
	p.EstoqueMin,
	p.EstoqueMax,
	e.Quantidade,
	e.Status
	FROM Estoque e INNER JOIN EstoqueProduto ep ON ep.IdEstoque = e.Id
	INNER JOIN Produto p ON p.Id = ep.IdProduto
	INNER JOIN Grupo g ON G.Id = p.IdGrupo
	ORDER BY e.Id, g.Nome;
	
END
