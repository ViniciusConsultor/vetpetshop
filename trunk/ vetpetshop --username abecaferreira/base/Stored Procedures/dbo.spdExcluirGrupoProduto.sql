SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[spdExcluirGrupoProduto]
	@Id int
AS
BEGIN

DELETE FROM dbo.Grupo WHERE Id = @Id

END
GO
