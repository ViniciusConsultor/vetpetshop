USE [vetpetshop]
GO
/****** Object:  StoredProcedure [dbo].[spsObterUsuarioByIdUsuario]    Script Date: 09/02/2010 22:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spsObterUsuarioByIdUsuario] 
	@IdUsuario INT
AS
BEGIN
	SELECT * FROM Usuario WHERE Id = @IdUsuario
END