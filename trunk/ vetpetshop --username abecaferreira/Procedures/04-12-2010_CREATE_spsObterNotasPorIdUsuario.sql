if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsObterNotasPorIdUsuario]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsObterNotasPorIdUsuario

GO
/****** Object:  StoredProcedure [dbo].[spsObterNotasPorIdUsuario]    Script Date: 12/04/2010 16:37:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spsObterNotasPorIdUsuario] 
	@Id_Usuario INT
AS
BEGIN
	SELECT COUNT(*) FROM NotaFiscal WHERE IdUsuario=@Id_Usuario
END
