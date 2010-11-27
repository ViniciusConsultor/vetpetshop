USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsListarProdutosVendidosPorData]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsListarProdutosVendidosPorData
GO

CREATE PROCEDURE [dbo].spsListarProdutosVendidosPorData
	@DataInicio datetime,
	@DataFim datetime
AS

SET NOCOUNT ON

BEGIN

SELECT P.NOME AS NOMEPRODUTO, 
	   COUNT(FP.QUANTIDADE) AS QUANTIDADEVENDIDA, 
	   G.NOME AS GRUPOPRODUTO
	FROM FINANCEIROPRODUTO FP
		INNER JOIN PRODUTO P ON P.ID = FP.IDPRODUTO
		INNER JOIN GRUPO G ON G.ID = P.IDGRUPO
	WHERE FP.DataTransacao >= @DataInicio AND FP.DataTransacao <= @DataFim
GROUP BY P.NOME, G.NOME
ORDER BY G.NOME, P.NOME
	
END

SET NOCOUNT OFF