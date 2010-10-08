if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsListaTipoAnimal]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsListaTipoAnimal
GO

CREATE PROCEDURE [dbo].[spsListaTipoAnimal] 
	
AS

SET NOCOUNT ON

BEGIN
	SELECT Id, Nome FROM TipoAnimal
END

SET NOCOUNT OFF