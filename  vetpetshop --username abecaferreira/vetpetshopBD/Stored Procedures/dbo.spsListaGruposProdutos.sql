SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[spsListaGruposProdutos] 
	
AS
BEGIN
	SELECT Id, Nome FROM Grupo
END
GO
