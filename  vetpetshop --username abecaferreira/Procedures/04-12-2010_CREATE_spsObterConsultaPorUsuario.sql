if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsObterConsultaPorUsuario]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsObterConsultaPorUsuario
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spsObterConsultaPorUsuario]
	@Id_Usuario INT
AS
BEGIN
	SELECT COUNT(*) FROM ConsultaVeterinaria WHERE IdUsuario = @Id_Usuario
END
GO
