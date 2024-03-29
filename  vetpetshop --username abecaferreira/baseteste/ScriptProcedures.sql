GO
/****** Object:  StoredProcedure [dbo].[spdExcluirUsuario]    Script Date: 08/19/2010 21:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdExcluirUsuario]

	@Id int
	
AS
BEGIN

	DECLARE 
	@idAdmin int,
	@idVet int,
	@idVend int	
	
	SET @idAdmin = (SELECT IdAdministrador FROM Usuario WHERE Id = @Id)
	SET @idVet = (SELECT IdVeterinario FROM Usuario WHERE Id = @Id)
	SET @idVend = (SELECT IdVendedor FROM Usuario WHERE Id = @Id)
	
	DELETE FROM Usuario WHERE Id = @Id
	
	IF(@idAdmin IS NOT NULL)
	BEGIN 
	DELETE FROM dbo.Administrador WHERE Id = @idAdmin
	END
	
	IF(@idVet IS NOT NULL)
	BEGIN 
	DELETE FROM dbo.Veterinario WHERE Id = @idVet
	END
	
	IF(@idVend IS NOT NULL)
	BEGIN 
	DELETE FROM dbo.Vendedor WHERE Id = @idVend
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spiInserirAdministrador]    Script Date: 08/19/2010 21:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spiInserirAdministrador]

@Nome_Prof VARCHAR(50),
@Nome_Usuario VARCHAR(20),
@Tipo INT,
@Senha VARCHAR(50)

AS
BEGIN

INSERT INTO dbo.Administrador (Nome) VALUES (@Nome_Prof)

DECLARE @idAmin INT

SELECT @idAmin = SCOPE_IDENTITY()

	INSERT INTO dbo.Usuario 
	(IdAdministrador, 
	IdVeterinario,
	IdVendedor,
	Nome,
	TipoUsuario,
	Senha)	
	VALUES
	(@idAmin,
	NULL,
	NULL,
	@Nome_Usuario,
	@Tipo,
	@Senha)
END
GO
/****** Object:  StoredProcedure [dbo].[spiInserirVendedor]    Script Date: 08/19/2010 21:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spiInserirVendedor]
@Nome_Prof VARCHAR(50),
@Nome_Usuario VARCHAR(20),
@Tipo INT,
@Senha VARCHAR(50)

AS
BEGIN
	INSERT INTO dbo.Vendedor(Nome) VALUES (@Nome_Prof)
	
	DECLARE @idVend INT
	SELECT @idVend = SCOPE_IDENTITY()

	INSERT INTO dbo.Usuario 
	(IdAdministrador, 
	IdVeterinario,
	IdVendedor,
	Nome,
	TipoUsuario,
	Senha)	
	VALUES
	(NULL,
	NULL,
	@idVend,
	@Nome_Usuario,
	@Tipo,
	@Senha)
END
GO
/****** Object:  StoredProcedure [dbo].[spiInserirVeterinario]    Script Date: 08/19/2010 21:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spiInserirVeterinario] 
@Nome_Prof VARCHAR(50),
@Nome_Usuario VARCHAR(20),
@Tipo INT,
@Senha VARCHAR(50)
	
AS
BEGIN
	INSERT INTO dbo.Veterinario (Nome) VALUES (@Nome_Prof)
	
	DECLARE @idVet INT
	SELECT @idVet = SCOPE_IDENTITY()

	INSERT INTO dbo.Usuario 
	(IdAdministrador, 
	IdVeterinario,
	IdVendedor,
	Nome,
	TipoUsuario,
	Senha)	
	VALUES
	(NULL,
	@idVet,
	NULL,
	@Nome_Usuario,
	@Tipo,
	@Senha)
END
GO
/****** Object:  StoredProcedure [dbo].[spsListaUsuariosProfissionais]    Script Date: 08/19/2010 21:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsListaUsuariosProfissionais] 
	
AS
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
GO
/****** Object:  StoredProcedure [dbo].[spsLogin]    Script Date: 08/19/2010 21:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsLogin]
	@Usuario VARCHAR(15),
	@Senha VARCHAR(30)
AS
BEGIN
SELECT 
TipoUsuario,
Nome,
Senha 
FROM Usuario WHERE Nome = @Usuario AND Senha = @Senha
END
GO
/****** Object:  StoredProcedure [dbo].[spsObterProduto]    Script Date: 08/19/2010 21:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsObterProduto]
	@IdProduto Int
AS
BEGIN
	
	SELECT * FROM dbo.Produto WHERE Id = @IdProduto
	
END
GO
/****** Object:  StoredProcedure [dbo].[spsProdutoPorGrupo]    Script Date: 08/19/2010 21:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsProdutoPorGrupo]
	@Id_Grupo int
AS
BEGIN
	SELECT * FROM dbo.Produto WHERE IdGrupo = @Id_Grupo
END
GO
/****** Object:  StoredProcedure [dbo].[spuAtualizarProduto]    Script Date: 08/19/2010 21:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spuAtualizarProduto]
	
@IdProduto INT,	
@IdGrupo INT,
@Nome VARCHAR(40),
@EstoqueMin INT,
@EstoqueMax INT,
@Descricao VARCHAR(100),
@PrecoCusto DECIMAL(7,2),
@PrecoVenda DECIMAL(7,2),
@DataValidade DATETIME
AS
BEGIN
	
	UPDATE dbo.Produto SET 
	IdGrupo = @IdGrupo,	
	Nome = @Nome,
	EstoqueMin = @EstoqueMin,
	EstoqueMax = @EstoqueMax,
	Descricao = @Descricao,
	PrecoCusto = @PrecoCusto,
	PrecoVenda = @PrecoVenda,
	DataValidade = @DataValidade
	WHERE Id = @IdProduto
	
END
GO
/****** Object:  StoredProcedure [dbo].[spiInserirProduto]    Script Date: 08/19/2010 21:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spiInserirProduto]

@IdGrupo INT,
@Nome VARCHAR(40),
@EstoqueMin INT,
@EstoqueMax INT,
@Descricao VARCHAR(100),
@PrecoCusto DECIMAL(7,2),
@PrecoVenda DECIMAL(7,2),
@DataValidade DATETIME

AS
BEGIN

INSERT INTO [dbo].[Produto] 

(IdGrupo,IdFinanceiro,Nome,EstoqueMin,EstoqueMax,Descricao,PrecoCusto,PrecoVenda,DataValidade)

VALUES

(@IdGrupo,NULL,@Nome,@EstoqueMin,@EstoqueMax,@Descricao,@PrecoCusto,@PrecoVenda,@DataValidade)

END
GO
/****** Object:  StoredProcedure [dbo].[spdExcluirProduto]    Script Date: 08/19/2010 21:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdExcluirProduto]
	
	@Id_Produto INT
AS
BEGIN
	
	DELETE FROM dbo.Produto WHERE Id = @Id_Produto
	
END
GO
/****** Object:  StoredProcedure [dbo].[spsListarProdutos]    Script Date: 08/19/2010 21:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsListarProdutos]

@Tipo int,
@Nome VARCHAR(100)

AS
	
	IF @Tipo = 0 AND @Nome = ''
	BEGIN
	SELECT 
	p.Id,
	p.IdGrupo,	
	p.IdFinanceiro,
	p.Nome,
	p.EstoqueMin,
	p.EstoqueMax,
	p.Descricao,
	p.PrecoCusto,
	p.DataValidade,
	p.PrecoVenda,
	g.Nome AS NomeGrupo
	FROM dbo.Produto p INNER JOIN dbo.Grupo g
	ON p.IdGrupo = g.Id	
	ORDER BY g.Nome
	END
	
	IF @Tipo <> 0 AND @Nome = ''
	BEGIN
	SELECT 
	p.Id,
	p.IdGrupo,	
	p.IdFinanceiro,
	p.Nome,
	p.EstoqueMin,
	p.EstoqueMax,
	p.Descricao,
	p.PrecoCusto,
	p.DataValidade,
	p.PrecoVenda,
	g.Nome AS NomeGrupo
	FROM dbo.Produto p INNER JOIN dbo.Grupo g
	ON p.IdGrupo = g.Id	
	WHERE p.IdGrupo = @Tipo 	
	ORDER BY g.Nome
	END
	
	IF @Tipo <> 0 AND @Nome <> ''
	BEGIN
	SELECT 
	p.Id,
	p.IdGrupo,	
	p.IdFinanceiro,
	p.Nome,
	p.EstoqueMin,
	p.EstoqueMax,
	p.Descricao,
	p.PrecoCusto,
	p.DataValidade,
	p.PrecoVenda,
	g.Nome AS NomeGrupo
	FROM dbo.Produto p INNER JOIN dbo.Grupo g
	ON p.IdGrupo = g.Id	
	WHERE p.IdGrupo = @Tipo 	
	AND p.Nome LIKE '%'+@Nome+'%'
	ORDER BY g.Nome
	END
	
	IF @Tipo = 0 AND @Nome <> ''
	BEGIN
	SELECT 
	p.Id,
	p.IdGrupo,	
	p.IdFinanceiro,
	p.Nome,
	p.EstoqueMin,
	p.EstoqueMax,
	p.Descricao,
	p.PrecoCusto,
	p.DataValidade,
	p.PrecoVenda,
	g.Nome AS NomeGrupo
	FROM dbo.Produto p INNER JOIN dbo.Grupo g
	ON p.IdGrupo = g.Id		
	AND p.Nome LIKE '%'+@Nome+'%'
	ORDER BY g.Nome
	END
GO
/****** Object:  StoredProcedure [dbo].[spiInserirGrupoProduto]    Script Date: 08/19/2010 21:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spiInserirGrupoProduto] 
	@Nome VARCHAR(30)
AS
BEGIN

INSERT INTO dbo.Grupo (Nome) VALUES (@Nome)

END
GO
/****** Object:  StoredProcedure [dbo].[spdExcluirGrupoProduto]    Script Date: 08/19/2010 21:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdExcluirGrupoProduto]
	@Id int
AS
BEGIN

DELETE FROM dbo.Grupo WHERE Id = @Id

END
GO
/****** Object:  StoredProcedure [dbo].[spsListaGruposProdutos]    Script Date: 08/19/2010 21:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsListaGruposProdutos] 
	
AS
BEGIN
	SELECT Id, Nome FROM Grupo
END
GO
/****** Object:  StoredProcedure [dbo].[spsListaClientes]    Script Date: 08/19/2010 21:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsListaClientes] 
	
AS
BEGIN

SELECT
c.Id,
c.Nome,
c.CPF,
c.Telefone,
c.Email
FROM Cliente c 
ORDER BY c.Nome
	
END
GO
/****** Object:  StoredProcedure [dbo].[spdExcluirCliente]    Script Date: 08/19/2010 21:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdExcluirCliente]

	@Id int
	
AS
BEGIN
	
	DELETE FROM Cliente WHERE Id = @Id
	
END
GO
/****** Object:  StoredProcedure [dbo].[spiInserirCliente]    Script Date: 08/19/2010 21:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spiInserirCliente]
@Nome_Cliente VARCHAR(50),
@Num_Cpf VARCHAR(20),
@Num_Tel VARCHAR(20),
@Email VARCHAR(30)

AS
BEGIN
	INSERT INTO dbo.Cliente(Nome,CPF,Telefone,Email) VALUES (@Nome_Cliente,@Num_Cpf, @Num_Tel, @Email)
END
GO
