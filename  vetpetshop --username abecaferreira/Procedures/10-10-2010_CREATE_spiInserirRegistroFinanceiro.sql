USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spiInserirRegistroFinanceiro]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spiInserirRegistroFinanceiro
GO

CREATE PROCEDURE [dbo].[spiInserirRegistroFinanceiro]
	@IdUsuario INT,
	@ValorTotal DECIMAL(9,2),
	@TipoPagamento INT,
	@Parcelas INT,
	@TipoTransacao INT,
	@TipoResponsavel INT,
	@NomeCliente VARCHAR(100)	
AS

SET NOCOUNT ON

BEGIN
	INSERT INTO Financeiro
	(IdUsuario,
	ValorTotal,
	TipoPagamento,
	Parcelas,
	TipoTransacao,
	TipoResponsavel,
	DataTransacao,
	NomeCliente)
	
	VALUES
	
	(@IdUsuario,
	@ValorTotal,
	@TipoPagamento,
	@Parcelas,
	@TipoTransacao,
	@TipoResponsavel,
	GETDATE(),
	@NomeCliente)	
END

SET NOCOUNT OFF
