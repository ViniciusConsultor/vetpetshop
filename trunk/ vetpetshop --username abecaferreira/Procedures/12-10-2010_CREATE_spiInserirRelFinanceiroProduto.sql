if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spiInserirRelFinanceiroProduto]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spiInserirRelFinanceiroProduto
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spiInserirRelFinanceiroProduto]
	@IdFinanceiro INT,
	@IdProduto INT,
	@QuantidadeVendida INT
AS
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
GO
