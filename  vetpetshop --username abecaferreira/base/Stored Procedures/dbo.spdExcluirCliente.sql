SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[spdExcluirCliente]

	@Id int
	
AS
BEGIN
	
	DELETE FROM Cliente WHERE Id = @Id
	
END

GO
