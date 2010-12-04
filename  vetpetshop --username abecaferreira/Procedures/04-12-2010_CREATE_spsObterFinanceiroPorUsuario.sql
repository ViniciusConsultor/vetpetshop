if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsObterFinanceiroPorUsuario]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsObterFinanceiroPorUsuario
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spsObterFinanceiroPorUsuario]
	@Id_Usuario INT
AS
BEGIN
	SELECT COUNT(*) FROM Financeiro WHERE IdUsuario = @Id_Usuario
END
GO
