USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spdExcluirAnimal]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spdExcluirAnimal
GO

CREATE PROCEDURE [dbo].[spdExcluirAnimal]

	@Id int
	
AS

SET NOCOUNT ON

BEGIN
	
	DELETE FROM ConsultaAnimal WHERE IdAnimal = @Id
	DELETE FROM Animal WHERE Id = @Id
	
END

SET NOCOUNT OFF