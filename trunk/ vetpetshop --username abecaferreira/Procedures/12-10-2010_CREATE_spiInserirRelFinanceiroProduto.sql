USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spiInserirRelFinanceiroProduto]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spiInserirRelFinanceiroProduto
GO

CREATE PROCEDURE [dbo].[spiInserirRelFinanceiroProduto]
	@IdFinanceiro INT,
	@IdProduto INT,
	@QuantidadeVendida INT
AS

SET NOCOUNT ON

BEGIN
	
	INSERT INTO FinanceiroProduto 
	(
	IdFinanceiro,
	IdProduto,
	DataTransacao,
	Quantidade
	)
	VALUES
	(
	@IdFinanceiro,
	@IdProduto,
	GETDATE(),
	@QuantidadeVendida
	)
END

SET NOCOUNT OFF
