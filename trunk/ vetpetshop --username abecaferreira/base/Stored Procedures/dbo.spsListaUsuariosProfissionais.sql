SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[spsListaUsuariosProfissionais] 
	
AS
BEGIN

SELECT
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
	
END
GO
