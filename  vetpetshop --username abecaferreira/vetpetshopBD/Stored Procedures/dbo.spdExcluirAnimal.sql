SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[spdExcluirAnimal]

	@Id int
	
AS
BEGIN
	
	DELETE FROM ConsultaAnimal WHERE IdAnimal = @Id
	DELETE FROM Animal WHERE Id = @Id
	
END
GO
