USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsPegaUltimoIdCliente]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsPegaUltimoIdCliente
GO

CREATE PROCEDURE [dbo].[spsPegaUltimoIdCliente]
	
AS

SET NOCOUNT ON

BEGIN

	SELECT MAX(Id) FROM Cliente
		 
END

SET NOCOUNT OFF