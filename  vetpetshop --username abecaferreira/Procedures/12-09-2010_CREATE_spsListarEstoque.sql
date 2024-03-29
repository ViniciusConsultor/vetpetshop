USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsListarEstoque]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsListarEstoque
GO

CREATE PROCEDURE [dbo].[spsListarEstoque]
	
AS

SET NOCOUNT ON

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
	WHERE e.Quantidade >= 0
	ORDER BY g.Nome;
	
END

SET NOCOUNT OFF