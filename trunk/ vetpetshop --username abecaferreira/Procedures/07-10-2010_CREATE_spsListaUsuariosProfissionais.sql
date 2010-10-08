if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsListaUsuariosProfissionais]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsListaUsuariosProfissionais
GO

CREATE PROCEDURE [dbo].[spsListaUsuariosProfissionais] 
	
AS

SET NOCOUNT ON

BEGIN

SELECT
u.Id,
u.TipoUsuario,
a.Id AS idAdministrador,
u.IdAdministrador AS idUsuarioAdministrador,
a.Nome,
u.Nome AS NomeUsuario,
u.IdVeterinario AS idUsuarioVeterinario,
vet.Id AS idVeterinario,
vet.Nome,
u.IdVendedor AS idUsuarioVendedor,
vend.Id AS idVendedor,
vend.Nome
FROM Usuario u LEFT JOIN Administrador a ON u.IdAdministrador = a.Id 
LEFT JOIN Veterinario vet ON u.IdVeterinario = vet.Id
LEFT JOIN Vendedor vend ON u.IdVendedor = vend.Id	
ORDER BY u.TipoUsuario
	
END

SET NOCOUNT OFF