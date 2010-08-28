SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[spsObterAnimal]
	@IdAnimal Int
AS
BEGIN
	
	SELECT * FROM dbo.Animal WHERE Id = @IdAnimal
	
END
GO
