USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spdExcluirProduto]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spdExcluirProduto
GO

CREATE PROCEDURE [dbo].[spdExcluirProduto]
	@Id_Produto INT
AS

SET NOCOUNT ON

BEGIN
	
	DELETE FROM dbo.Produto WHERE Id = @Id_Produto
	
END

SET NOCOUNT OFF
