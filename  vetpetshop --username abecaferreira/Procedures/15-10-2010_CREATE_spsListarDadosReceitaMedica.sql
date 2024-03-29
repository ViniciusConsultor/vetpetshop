USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsListarDadosReceitaMedica]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsListarDadosReceitaMedica
GO

CREATE PROCEDURE [dbo].[spsListarDadosReceitaMedica]
@IdConsultaAnimal	int
AS

SET NOCOUNT ON
--spsListarDadosReceitaMedica 3
BEGIN
	
	SELECT	c.CPF, c.Nome as Cliente, c.RG, c.Telefone1, c.Telefone2, c.Email,
			c.Endereco, c.Bairro, c.Cidade, c.Estado, c.CEP,
			ta.Nome as TipoAnimal, a.Peso, a.Raca, a.Nome as Animal, a.DataFimVacinacao, 
			a.DataNascimento, a.DataProxVacinacao,
			v.Nome as Veterinario,
			cv.Data
				
	 FROM dbo.consultaanimal ca 
	 INNER JOIN dbo.consultaveterinaria cv ON
	 cv.Id = ca.IdConsulta
	 INNER JOIN dbo.animal a ON
	 a.Id = ca.IdAnimal
	 INNER JOIN dbo.TipoAnimal ta ON
	 ta.ID = a.IdTipoAnimal
	 INNER JOIN dbo.cliente c ON
	 c.Id = a.IdCliente
	 INNER JOIN dbo.Usuario u ON
	 u.Id = cv.IdUsuario
	 INNER JOIN dbo.Veterinario v ON
	 v.Id = u.IdVeterinario
	 
	 WHERE	ca.Id = @IdConsultaAnimal
	
END

SET NOCOUNT OFF