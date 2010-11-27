USE [vetpetshop]
GO
/****** Object:  StoredProcedure [dbo].[spsVerificarConsulta]    Script Date: 11/27/2010 03:13:58 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsVerificarConsulta]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsVerificarConsulta
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spsVerificarConsulta]
	@Data VARCHAR(30),
	@Hora VARCHAR(30)
AS
BEGIN
	SELECT count(*) FROM ConsultaVeterinaria
	WHERE  Data=@Data AND HoraConsulta=@Hora
END
