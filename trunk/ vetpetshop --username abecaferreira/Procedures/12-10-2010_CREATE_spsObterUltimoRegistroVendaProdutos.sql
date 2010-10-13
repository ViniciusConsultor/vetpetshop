if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsObterUltimoRegistroVendaProdutos]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsObterUltimoRegistroVendaProdutos
GO
/****** Object:  StoredProcedure [dbo].[ObterUltimoFinanceiroVendaRegistrado]    Script Date: 10/12/2010 20:35:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spsObterUltimoRegistroVendaProdutos]
	
AS
BEGIN
		SELECT Id FROM Financeiro WHERE Id = (SELECT MAX(Id) FROM Financeiro WHERE TipoTransacao = 1)
END


