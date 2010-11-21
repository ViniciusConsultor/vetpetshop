if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spuAlterarSenha]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spuAlterarSenha
GO

CREATE PROCEDURE [dbo].[spuAlterarSenha]
	
@Id INT,	
@Senha VARCHAR(20)

AS

SET NOCOUNT ON

BEGIN
	
	UPDATE dbo.Usuario SET 
	Senha = @Senha
	WHERE Id = @Id
	
END

SET NOCOUNT OFF