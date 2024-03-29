USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsListarEstoquePorGrupo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsListarEstoquePorGrupo
GO

CREATE PROCEDURE [dbo].[spsListarEstoquePorGrupo]
	@IdGrupo INT
AS

SET NOCOUNT ON

BEGIN
	SELECT 
	e.Id,
	g.Nome,
	g.Id,
	p.Nome,
	p.EstoqueMin,
	p.EstoqueMax,
	e.Quantidade,
	e.Status
	FROM Estoque e INNER JOIN EstoqueProduto ep ON ep.IdEstoque = e.Id
	INNER JOIN Produto p ON p.Id = ep.IdProduto
	INNER JOIN Grupo g ON G.Id = p.IdGrupo	
	WHERE g.Id = @IdGrupo AND e.Quantidade >= 0
END

SET NOCOUNT OFF
