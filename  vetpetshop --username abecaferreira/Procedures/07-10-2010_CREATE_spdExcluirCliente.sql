USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spdExcluirCliente]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spdExcluirCliente
GO

CREATE PROCEDURE [dbo].[spdExcluirCliente]
	@Id int
	
AS

SET NOCOUNT ON

BEGIN
	
	DELETE FROM Animal WHERE IdCliente = @Id
	DELETE FROM Cliente WHERE Id = @Id
	
END

SET NOCOUNT OFF