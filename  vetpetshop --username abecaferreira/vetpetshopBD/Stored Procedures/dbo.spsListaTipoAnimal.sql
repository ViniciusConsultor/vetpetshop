SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[spsListaTipoAnimal] 
	
AS
BEGIN
	SELECT Id, Nome FROM TipoAnimal
END
GO