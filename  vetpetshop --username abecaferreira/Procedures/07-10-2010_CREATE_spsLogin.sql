USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsLogin]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsLogin
GO

CREATE PROCEDURE [dbo].[spsLogin]
	@Usuario VARCHAR(15),
	@Senha VARCHAR(30)
AS

SET NOCOUNT ON

BEGIN
SELECT 
TipoUsuario,
Nome,
Senha 
FROM Usuario WHERE Nome = @Usuario AND Senha = @Senha
END

SET NOCOUNT OFF