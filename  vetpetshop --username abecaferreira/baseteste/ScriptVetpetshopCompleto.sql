USE [vetpetshop]
GO
/****** Object:  User [vetpetshop]    Script Date: 12/05/2010 01:39:44 ******/
CREATE USER [vetpetshop] FOR LOGIN [vetpetshop] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Grupo]    Script Date: 12/05/2010 01:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Grupo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NULL,
 CONSTRAINT [PK_Grupo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Administrador]    Script Date: 12/05/2010 01:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Administrador](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NULL,
 CONSTRAINT [PK_Administrador] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Estoque]    Script Date: 12/05/2010 01:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estoque](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [smallint] NULL,
	[Quantidade] [int] NULL,
 CONSTRAINT [PK_Estoque] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 12/05/2010 01:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CPF] [varchar](20) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[RG] [varchar](20) NULL,
	[Telefone1] [varchar](15) NULL,
	[Telefone2] [varchar](15) NULL,
	[Email] [varchar](30) NULL,
	[Endereco] [varchar](50) NULL,
	[Bairro] [varchar](20) NULL,
	[Cidade] [varchar](20) NULL,
	[Estado] [varchar](20) NULL,
	[CEP] [varchar](20) NULL,
	[Sexo] [varchar](10) NULL,
	[DataCadastro] [datetime] NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoAnimal]    Script Date: 12/05/2010 01:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoAnimal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoAnimal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Veterinario]    Script Date: 12/05/2010 01:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Veterinario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NULL,
 CONSTRAINT [PK_Veterinario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Vendedor]    Script Date: 12/05/2010 01:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vendedor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NULL,
 CONSTRAINT [PK_Vendedor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[spsPegaUltimoIdCliente]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsPegaUltimoIdCliente]
	
AS

SET NOCOUNT ON

BEGIN

	SELECT MAX(Id) FROM Cliente
		 
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spuAlterarCliente]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spuAlterarCliente]

@IdCliente int,
@Nome_Cliente VARCHAR(50),
@Num_Cpf VARCHAR(20),
@Sexo VARCHAR(10),
@Num_Tel VARCHAR(20),
@Num_Cel VARCHAR(20),
@Num_RG VARCHAR(20),
@Endereco VARCHAR(50),
@Bairro VARCHAR(20),
@Cidade VARCHAR(20),
@Estado VARCHAR(20),
@CEP VARCHAR(20),
@Email VARCHAR(30)

AS

SET NOCOUNT ON

BEGIN
	UPDATE dbo.Cliente SET 
	Nome = @Nome_Cliente,
	CPF = @Num_Cpf,
	Sexo = @Sexo,
	Telefone1 = @Num_Tel,
	Telefone2 = @Num_Cel,
	RG = @Num_RG,
	Endereco = @Endereco,
	Bairro = @Bairro,
	Cidade = @Cidade,
	Estado = @Estado,
	CEP = @CEP,
	Email = @Email
	WHERE Id = @IdCliente
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsObterEstoquePorId]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsObterEstoquePorId] 
	@IdEstoque INT	
AS

SET NOCOUNT ON

BEGIN
	SELECT * FROM Estoque WHERE Id = @IdEstoque
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsListaTipoAnimal]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsListaTipoAnimal] 
	
AS

SET NOCOUNT ON

BEGIN
	SELECT Id, Nome FROM TipoAnimal
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsListaGruposProdutos]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsListaGruposProdutos] 
	
AS

SET NOCOUNT ON

BEGIN
	SELECT Id, Nome FROM Grupo
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsListaClientesByNome]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsListaClientesByNome] 
	
@Nome VARCHAR(50)
	
AS

SET NOCOUNT ON

BEGIN

SELECT
c.Id,
c.CPF,
c.Nome,
c.RG,
c.Telefone1,
c.Telefone2,
c.Email,
c.Endereco,
c.Bairro,
c.Cidade,
c.Estado,
c.CEP,
c.Sexo
FROM Cliente c 
Where c.Nome like '%'+@Nome+'%'
ORDER BY c.Nome
	
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsListaClientes]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsListaClientes]
	
AS

SET NOCOUNT ON

BEGIN

SELECT
c.Id,
c.CPF,
c.Nome,
c.RG,
c.Telefone1,
c.Telefone2,
c.Email,
c.Endereco,
c.Bairro,
c.Cidade,
c.Estado,
c.CEP,
c.sexo
FROM Cliente c 
ORDER BY c.Nome
	
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsListaClienteByPK]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsListaClienteByPK] 
	
@IdCliente int
	
AS

SET NOCOUNT ON

BEGIN

SELECT
c.Id,
c.Nome,
c.CPF,
c.RG,
c.Telefone1,
c.Telefone2,
c.Email,
c.Endereco,
c.Bairro,
c.Cidade,
c.Estado,
c.CEP,
c.Sexo
FROM Cliente c 
where Id = @IdCliente
	
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsEstBuscaSexoClientes]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsEstBuscaSexoClientes]
	@DataInicio datetime,
	@DataFim datetime
AS

SET NOCOUNT ON

BEGIN

DECLARE @HOMEM INT,
		@MULHER INT, 
		@TOTAL INT
		
	IF @DATAINICIO IS NULL AND @DATAFIM IS NULL
	BEGIN
		SELECT @HOMEM = COUNT(*) FROM CLIENTE WHERE upper(SEXO) = 'MASCULINO'
		SELECT @MULHER = COUNT(*) FROM CLIENTE WHERE upper(SEXO) = 'FEMININO'
		SELECT @TOTAL = COUNT(*) FROM CLIENTE 
	END
	ELSE
	BEGIN
		SELECT @HOMEM = COUNT(*) FROM CLIENTE WHERE upper(SEXO) = 'MASCULINO' AND DATACADASTRO >= CONVERT (DATETIME ,@DATAINICIO , 103 ) AND DATACADASTRO <= CONVERT (DATETIME ,@DATAFIM , 103 )
		SELECT @MULHER = COUNT(*) FROM CLIENTE WHERE upper(SEXO) = 'FEMININO' AND DATACADASTRO >= CONVERT (DATETIME ,@DATAINICIO , 103 ) AND DATACADASTRO <= CONVERT (DATETIME ,@DATAFIM , 103 )
		SELECT @TOTAL = COUNT(*) FROM CLIENTE WHERE DATACADASTRO >= CONVERT (DATETIME ,@DATAINICIO , 103 ) AND DATACADASTRO <= CONVERT (DATETIME ,@DATAFIM , 103 )
	END 
	
	SELECT @TOTAL, @HOMEM ,@MULHER  
	
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spdExcluirGrupoProduto]    Script Date: 12/05/2010 01:39:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdExcluirGrupoProduto]
	@Id int
AS

SET NOCOUNT ON

BEGIN

DELETE FROM dbo.Grupo WHERE Id = @Id

END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spiInserirGrupoProduto]    Script Date: 12/05/2010 01:39:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spiInserirGrupoProduto] 
	@Nome VARCHAR(30)
AS

SET NOCOUNT ON

BEGIN

INSERT INTO dbo.Grupo (Nome) VALUES (@Nome)

END

SET NOCOUNT OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 12/05/2010 01:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdAdministrador] [int] NULL,
	[IdVeterinario] [int] NULL,
	[IdVendedor] [int] NULL,
	[Nome] [varchar](50) NULL,
	[TipoUsuario] [int] NOT NULL,
	[Senha] [varchar](20) NOT NULL,
	[Email] [varchar](30) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VeterinarioCliente]    Script Date: 12/05/2010 01:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VeterinarioCliente](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdVeterinario] [int] NOT NULL,
 CONSTRAINT [PK_VeterinarioCliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Animal]    Script Date: 12/05/2010 01:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Animal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoAnimal] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[Peso] [decimal](9, 2) NOT NULL,
	[Raca] [varchar](50) NULL,
	[Nome] [varchar](50) NOT NULL,
	[DataFimVacinacao] [datetime] NULL,
	[DataNascimento] [datetime] NULL,
	[DataProxVacinacao] [datetime] NULL,
	[Sexo] [varchar](10) NULL,
	[DataCadastro] [datetime] NULL,
 CONSTRAINT [PK_Animal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[spiInserirCliente]    Script Date: 12/05/2010 01:39:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spiInserirCliente]

@Nome_Cliente VARCHAR(50),
@Num_Cpf VARCHAR(20),
@Sexo VARCHAR(10),
@Num_Tel VARCHAR(20),
@Num_Cel VARCHAR(20),
@Num_RG VARCHAR(20),
@Endereco VARCHAR(50),
@Bairro VARCHAR(20),
@Cidade VARCHAR(20),
@Estado VARCHAR(20),
@CEP VARCHAR(20),
@Email VARCHAR(30)

AS

SET NOCOUNT ON

BEGIN
	INSERT INTO dbo.Cliente(Nome,CPF,Sexo,Telefone1,Telefone2,RG,Endereco,Bairro,Cidade,Estado,CEP,Email,DataCadastro) VALUES (@Nome_Cliente,@Num_Cpf,@Sexo,@Num_Tel,@Num_Cel,@Num_RG,@Endereco,@Bairro,@Cidade,@Estado,@CEP,@Email,CAST(CONVERT(VARCHAR, GETDATE(), 103) AS DATETIME))
END

SET NOCOUNT OFF
GO
/****** Object:  Table [dbo].[HistoricoEstoque]    Script Date: 12/05/2010 01:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoricoEstoque](
	[IdEstoque] [int] NOT NULL,
	[DataEstoque] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Financeiro]    Script Date: 12/05/2010 01:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Financeiro](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[ValorTotal] [decimal](9, 2) NULL,
	[TipoPagamento] [int] NOT NULL,
	[Parcelas] [int] NULL,
	[TipoTransacao] [int] NOT NULL,
	[TipoResponsavel] [int] NOT NULL,
	[DataTransacao] [datetime] NOT NULL,
	[NomeCliente] [varchar](100) NULL,
 CONSTRAINT [PK_Financeiro] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NotaFiscal]    Script Date: 12/05/2010 01:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotaFiscal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdVendedor] [int] NULL,
	[IdAdministrador] [int] NULL,
	[IdUsuario] [int] NOT NULL,
	[DataCadastro] [datetime] NULL,
	[Valor] [decimal](9, 2) NULL,
	[Status] [int] NULL,
	[DataRecebimento] [datetime] NULL,
 CONSTRAINT [PK_NotaFiscal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spdExcluirCliente]    Script Date: 12/05/2010 01:39:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdExcluirCliente]
	@Id int
	
AS

SET NOCOUNT ON

BEGIN
	
	DELETE FROM Animal WHERE IdCliente = @Id
	DELETE FROM Cliente WHERE Id = @Id
	
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spiInserirAnimal]    Script Date: 12/05/2010 01:39:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spiInserirAnimal]
 
 @IdCliente int,
 @IdTipoAnimal  int,
 @Peso    decimal,
 @Raca    varchar(50),
 @Nome    varchar(50),
 @DataNascimento  datetime,
 @Sexo varchar(10)
 
AS

SET NOCOUNT ON

BEGIN
 
INSERT INTO dbo.Animal(IdCliente,
	  Sexo,
      IdTipoAnimal,
      Peso,
      Raca,
      Nome,
      DataFimVacinacao,
      DataNascimento,
      DataProxVacinacao,
      DataCadastro)
    VALUES
           (@IdCliente,
   @Sexo,          
   @IdTipoAnimal, 
   @Peso,   
   @Raca,   
   @Nome,   
   null,
   @DataNascimento, 
   null,
   CAST(CONVERT(VARCHAR, GETDATE(), 103) AS DATETIME))
   END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spiInserirAdministrador]    Script Date: 12/05/2010 01:39:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spiInserirAdministrador]

@Nome_Prof VARCHAR(50),
@Nome_Usuario VARCHAR(20),
@Tipo INT,
@Senha VARCHAR(50),
@Email VARCHAR(50)

AS

SET NOCOUNT ON

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
	Senha,
	Email)	
	VALUES
	(@idAmin,
	NULL,
	NULL,
	@Nome_Usuario,
	@Tipo,
	@Senha,
	@Email)
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spdExcluirUsuario]    Script Date: 12/05/2010 01:39:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdExcluirUsuario]

	@Id int
	
AS

SET NOCOUNT ON

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

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spuAtualizarAgendamento]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spuAtualizarAgendamento]
	
@IdAnimal INT,	
@DataProxVacinacao SMALLDATETIME

AS

SET NOCOUNT ON

BEGIN
	
	UPDATE dbo.Animal SET 
	DataProxVacinacao = @DataProxVacinacao
	WHERE Id = @IdAnimal
	
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spuAtualizarEstoque]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spuAtualizarEstoque] 
	@IdEstoque INT,
	@Status INT,
	@Quantidade INT
AS

SET NOCOUNT ON

BEGIN
	UPDATE Estoque SET Quantidade = @Quantidade, Status = @Status
	WHERE Id = @IdEstoque
	
	DECLARE @Mes INT, @Ano INT	
	
	SELECT @Mes = MAX(MONTH(DataEstoque)) FROM HistoricoEstoque WHERE IdEstoque = @IdEstoque
	SELECT  @Ano = MAX(YEAR(DataEstoque)) FROM HistoricoEstoque WHERE IdEstoque = @IdEstoque
	
	IF MONTH(GETDATE()) = @Mes AND YEAR(GETDATE()) =  @Ano
	UPDATE HistoricoEstoque SET DataEstoque = GETDATE() WHERE MONTH(DataEstoque) = @Mes AND YEAR(DataEstoque) = @Ano 
	
	ELSE
	INSERT INTO HistoricoEstoque (IdEstoque, DataEstoque) VALUES (@IdEstoque, GETDATE())
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spiInserirVeterinario]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spiInserirVeterinario] 
@Nome_Prof VARCHAR(50),
@Nome_Usuario VARCHAR(20),
@Tipo INT,
@Senha VARCHAR(50),
@Email VARCHAR(50)
	
AS

SET NOCOUNT ON

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
	Senha,
	Email)	
	VALUES
	(NULL,
	@idVet,
	NULL,
	@Nome_Usuario,
	@Tipo,
	@Senha,
	@Email)
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spiInserirVendedor]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spiInserirVendedor]
@Nome_Prof VARCHAR(50),
@Nome_Usuario VARCHAR(20),
@Tipo INT,
@Senha VARCHAR(50),
@Email VARCHAR(50)

AS

SET NOCOUNT ON

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
	Senha,
	Email)	
	VALUES
	(NULL,
	NULL,
	@idVend,
	@Nome_Usuario,
	@Tipo,
	@Senha,
	@Email)
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsEstBuscaSexoAnimais]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsEstBuscaSexoAnimais]
	@DataInicio datetime,
	@DataFim datetime
AS

SET NOCOUNT ON

BEGIN

DECLARE @HOMEM INT,
		@MULHER INT, 
		@TOTAL INT

	IF @DATAINICIO IS NULL AND @DATAFIM IS NULL
	BEGIN
		SELECT @HOMEM = COUNT(*) FROM ANIMAL WHERE upper(SEXO) = 'MASCULINO'
		SELECT @MULHER = COUNT(*) FROM ANIMAL WHERE upper(SEXO) = 'FEMININO'
		SELECT @TOTAL = COUNT(*) FROM ANIMAL 
	END
	ELSE
	BEGIN
		SELECT @HOMEM = COUNT(*) FROM ANIMAL WHERE upper(SEXO) = 'MASCULINO' AND DATACADASTRO >= CONVERT (DATETIME ,@DATAINICIO , 103 ) AND DATACADASTRO <= CONVERT (DATETIME ,@DATAFIM , 103 )
		SELECT @MULHER = COUNT(*) FROM ANIMAL WHERE upper(SEXO) = 'FEMININO' AND DATACADASTRO >= CONVERT (DATETIME ,@DATAINICIO , 103 ) AND DATACADASTRO <= CONVERT (DATETIME ,@DATAFIM , 103 )
		SELECT @TOTAL = COUNT(*) FROM ANIMAL WHERE DATACADASTRO >= CONVERT (DATETIME ,@DATAINICIO , 103 ) AND DATACADASTRO <= CONVERT (DATETIME ,@DATAFIM , 103 )
	END 
	
	SELECT @HOMEM ,@MULHER, @TOTAL
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsListaAnimalByPK]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsListaAnimalByPK] 
	
@IdAnimal int
	
AS

SET NOCOUNT ON

BEGIN

SELECT
a.Id,
a.Nome,
a.Peso,
a.Raca,
a.DataNascimento,
a.IdTipoAnimal,
a.IdCliente,
a.Sexo
FROM Animal a 
where Id = @IdAnimal
	
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsListaAnimaisByNome]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsListaAnimaisByNome] 
	
@Nome VARCHAR(50)
	
AS

SET NOCOUNT ON

BEGIN

SELECT
a.Id,
a.Nome,
a.Peso,
a.Raca,
a.DataNascimento,
a.DataProxVacinacao,
a.DataFimVacinacao,
a.IdTipoAnimal,
a.IdCliente,
a.Sexo
FROM Animal a
WHERE a.Nome like '%'+@Nome+'%'
ORDER BY a.Nome
	
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsListaAnimaisByFK]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsListaAnimaisByFK] 
	
@IdCliente int
	
AS

SET NOCOUNT ON

BEGIN

SELECT
a.Id,
a.Nome
FROM Animal a 
WHERE IdCliente = @IdCliente
	
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsObterAnimal]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsObterAnimal]
	@IdAnimal Int
AS

SET NOCOUNT ON

BEGIN
	
	SELECT	a.Id,
			a.Nome,
			a.Peso,
			a.Raca,
			a.DataNascimento,
			a.DataProxVacinacao
	
	 FROM dbo.Animal a WHERE Id = @IdAnimal
	
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsLogin]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
GO
/****** Object:  StoredProcedure [dbo].[spsListaUsuariosProfissionais]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
GO
/****** Object:  StoredProcedure [dbo].[spsListarAnimaisTodos]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsListarAnimaisTodos]

AS

SET NOCOUNT ON

BEGIN
	
	SELECT	a.Id,
			a.Nome,
			a.Peso,
			a.Raca,
			a.DataNascimento,
			a.DataProxVacinacao
	
	 FROM dbo.Animal a
	
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spuAlterarSenha]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
GO
/****** Object:  StoredProcedure [dbo].[spuAlterarAnimal]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spuAlterarAnimal]

@IdAnimal int,
@Nome_Animal VARCHAR(50),
@Peso decimal(9,2),
@Raca VARCHAR(50),
@Nascimento datetime,
@TipoAnimal int,
@Sexo varchar(10)

AS

SET NOCOUNT ON

BEGIN
	UPDATE dbo.Animal SET 
	Nome = @Nome_Animal,
	Peso = @Peso,
	Raca = @Raca,
	DataNascimento = @Nascimento,
	IdTipoAnimal = @TipoAnimal,
	Sexo = @Sexo
	WHERE Id = @IdAnimal
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsObterUsuarioPorCodigoUsuario]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsObterUsuarioPorCodigoUsuario] 
	@Nome_Usuario VARCHAR(30)
AS

SET NOCOUNT ON

BEGIN
	SELECT * FROM Usuario WHERE Nome = @Nome_Usuario
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsObterUsuarioByIdUsuario]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsObterUsuarioByIdUsuario] 
	@IdUsuario INT
AS

SET NOCOUNT ON

BEGIN
	SELECT * FROM Usuario WHERE Id = @IdUsuario
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsObterUsuarioByEmailUsuario]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsObterUsuarioByEmailUsuario] 
	@Email VARCHAR(30)
AS

SET NOCOUNT ON

BEGIN
	SELECT * FROM Usuario WHERE Email = @Email
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsObterUltimoRegistroVendaProdutos]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsObterUltimoRegistroVendaProdutos]
	
AS

SET NOCOUNT ON

BEGIN
		SELECT Id FROM Financeiro WHERE Id = (SELECT MAX(Id) FROM Financeiro WHERE TipoTransacao = 1)
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsObterUltimoRegistroNotaFiscal]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsObterUltimoRegistroNotaFiscal]
	
AS

SET NOCOUNT ON

BEGIN

		SELECT 
		Id,
		IdUsuario,
		DataCadastro,
		Valor,
		Status,
		DataRecebimento
		FROM NotaFiscal 
		WHERE Id = (SELECT MAX(Id) FROM NotaFiscal)
		 
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsObterUltimoRegistroFinanceiroConsulta]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsObterUltimoRegistroFinanceiroConsulta]
	
AS

SET NOCOUNT ON

BEGIN

		SELECT MAX(Id) FROM Financeiro WHERE TipoTransacao = 2
		 
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsListaPedidosDeCompras]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsListaPedidosDeCompras]
AS

SET NOCOUNT ON

BEGIN
	SELECT * FROM NotaFiscal ORDER BY DataCadastro DESC
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsObterPedidoDeCompraByPK]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsObterPedidoDeCompraByPK] 
	@IdNota INT
AS

SET NOCOUNT ON

BEGIN
	SELECT 
	IdUsuario,
	DataCadastro,
	Valor,
	Status
	FROM NotaFiscal WHERE Id = @IdNota
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsObterNotasPorIdUsuario]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsObterNotasPorIdUsuario] 
	@Id_Usuario INT
AS

SET NOCOUNT ON

BEGIN
	SELECT COUNT(*) FROM NotaFiscal WHERE IdUsuario=@Id_Usuario
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsObterFinanceiroPorUsuario]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsObterFinanceiroPorUsuario]
	@Id_Usuario INT
AS

SET NOCOUNT ON

BEGIN
	SELECT COUNT(*) FROM Financeiro WHERE IdUsuario = @Id_Usuario
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsFinancasInvestimentoPorAno]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsFinancasInvestimentoPorAno]
	@Ano INT
AS

SET NOCOUNT ON

BEGIN

	SELECT MONTH(DATACADASTRO)AS MES, SUM(VALOR) FROM NotaFiscal 
	WHERE Status = 2 AND YEAR(DATACADASTRO) = @Ano
	GROUP BY MONTH(DataCadastro)
		
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsFinancasVendasPorAno]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsFinancasVendasPorAno] 
	@Ano INT
AS

SET NOCOUNT ON

BEGIN
	SELECT MONTH(DataTransacao)AS MES, SUM(ValorTotal) FROM Financeiro
	WHERE TipoTransacao = 1 AND YEAR(DataTransacao) = @Ano
	GROUP BY MONTH(DataTransacao)
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsExcluirPedidosComValorNull]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsExcluirPedidosComValorNull]
	
AS

SET NOCOUNT ON

BEGIN
	DELETE FROM NotaFiscal WHERE Valor IS NULL
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spiInserirNotaFiscal]    Script Date: 12/05/2010 01:39:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spiInserirNotaFiscal]
	@IdUsuario INT
AS

SET NOCOUNT ON

BEGIN
	INSERT INTO dbo.NotaFiscal 
	(IdAdministrador,IdVendedor,IdUsuario,Status,DataCadastro,DataRecebimento,Valor)
	
	VALUES
	
	(NULL,NULL,@IdUsuario,1,GETDATE(),NULL,NULL)
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spiInserirRegistroFinanceiro]    Script Date: 12/05/2010 01:39:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spiInserirRegistroFinanceiro]
	@IdUsuario INT,
	@ValorTotal DECIMAL(9,2),
	@TipoPagamento INT,
	@Parcelas INT,
	@TipoTransacao INT,
	@TipoResponsavel INT,
	@NomeCliente VARCHAR(100)	
AS

SET NOCOUNT ON

BEGIN
	INSERT INTO Financeiro
	(IdUsuario,
	ValorTotal,
	TipoPagamento,
	Parcelas,
	TipoTransacao,
	TipoResponsavel,
	DataTransacao,
	NomeCliente)
	
	VALUES
	
	(@IdUsuario,
	@ValorTotal,
	@TipoPagamento,
	@Parcelas,
	@TipoTransacao,
	@TipoResponsavel,
	GETDATE(),
	@NomeCliente)	
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spuAtualizarPedidoDeCompra]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spuAtualizarPedidoDeCompra] 
	@IdNota INT,
	@Status INT
AS

SET NOCOUNT ON

BEGIN
	UPDATE NotaFiscal SET Status = @Status, DataRecebimento = GETDATE()
	WHERE Id = @IdNota
END

SET NOCOUNT OFF
GO
/****** Object:  Table [dbo].[Produto]    Script Date: 12/05/2010 01:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Produto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdGrupo] [int] NOT NULL,
	[IdFinanceiro] [int] NULL,
	[Nome] [varchar](50) NULL,
	[EstoqueMin] [int] NULL,
	[EstoqueMax] [int] NULL,
	[Descricao] [varchar](200) NULL,
	[PrecoCusto] [decimal](9, 2) NULL,
	[DataValidade] [datetime] NULL,
	[PrecoVenda] [decimal](9, 2) NULL,
 CONSTRAINT [PK_Produto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConsultaVeterinaria]    Script Date: 12/05/2010 01:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConsultaVeterinaria](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdFinanceiro] [int] NULL,
	[Valor] [decimal](9, 2) NULL,
	[Data] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
	[TipoConsulta] [int] NULL,
	[HoraConsulta] [varchar](20) NULL,
 CONSTRAINT [PK_ConsultaVeterinaria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConsultaAnimal]    Script Date: 12/05/2010 01:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsultaAnimal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdConsulta] [int] NOT NULL,
	[IdAnimal] [int] NOT NULL,
 CONSTRAINT [PK_ConsultaAnimal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FinanceiroProduto]    Script Date: 12/05/2010 01:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinanceiroProduto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdFinanceiro] [int] NULL,
	[IdProduto] [int] NULL,
	[DataTransacao] [datetime] NULL,
	[Quantidade] [int] NULL,
 CONSTRAINT [PK_FinanceiroProduto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstoqueProduto]    Script Date: 12/05/2010 01:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstoqueProduto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdEstoque] [int] NOT NULL,
	[IdProduto] [int] NOT NULL,
 CONSTRAINT [PK_EstoqueProduto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProdutoNotaFiscal]    Script Date: 12/05/2010 01:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProdutoNotaFiscal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdProduto] [int] NOT NULL,
	[IdNotaFiscal] [int] NOT NULL,
	[Quantidade] [int] NOT NULL,
 CONSTRAINT [PK_ProdutoNotaFiscal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spdExcluirProduto]    Script Date: 12/05/2010 01:39:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdExcluirProduto]
	@Id_Produto INT
AS

SET NOCOUNT ON

BEGIN
	
	DELETE FROM dbo.Produto WHERE Id = @Id_Produto
	
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spuAtualizarPagamentoConsulta]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spuAtualizarPagamentoConsulta] 
	@IdConsulta INT
	
AS

SET NOCOUNT ON

BEGIN
	UPDATE ConsultaVeterinaria SET Status = '2'
	WHERE Id = @IdConsulta
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spuAtualizarProduto]    Script Date: 12/05/2010 01:39:42 ******/
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
@PrecoCusto DECIMAL(9,2),
@PrecoVenda DECIMAL(9,2),
@DataValidade DATETIME
AS

SET NOCOUNT ON

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

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spuAtualizarAgendamentoConsulta]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spuAtualizarAgendamentoConsulta]

@id_consulta	INT,
@id_usuario		INT,
@Data			DATETIME,
@Valor			DECIMAL(9,2),
@Status			INT,
@Horario		VARCHAR(20)
AS

SET NOCOUNT ON
--spuAtualizarAgendamentoConsulta
BEGIN
		
		
		UPDATE dbo.COnsultaVeterinaria 
		
		SET		IdUsuario = @id_usuario,
				Data = @Data,
				Valor = @Valor,
				[Status] = @Status,
				HoraConsulta = @Horario
				
		WHERE	Id = @id_consulta 
		
		
	 
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spuAlteraStatusConsultaPaga]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spuAlteraStatusConsultaPaga]
	
@IdConsulta int,
@IdFinanceiro int,	
@Status int

AS

SET NOCOUNT ON

BEGIN
	
	UPDATE dbo.ConsultaVeterinaria SET 
	Status = @Status,
	IdFinanceiro = @IdFinanceiro
	WHERE Id = @IdConsulta
	
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spiInserirProduto]    Script Date: 12/05/2010 01:39:41 ******/
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
@PrecoCusto DECIMAL(9,2),
@PrecoVenda DECIMAL(9,2),
@DataValidade DATETIME

AS

SET NOCOUNT ON

BEGIN

INSERT INTO [dbo].[Produto] 

(IdGrupo,IdFinanceiro,Nome,EstoqueMin,EstoqueMax,Descricao,PrecoCusto,PrecoVenda,DataValidade)

VALUES

(@IdGrupo,NULL,@Nome,@EstoqueMin,@EstoqueMax,@Descricao,@PrecoCusto,@PrecoVenda,@DataValidade)

END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsFinancasConsultasPorAno]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsFinancasConsultasPorAno] 
	@Ano INT
AS

SET NOCOUNT ON

BEGIN

	SELECT MONTH(f.DataTransacao) AS MES, SUM(f.ValorTotal) AS ValorTotal FROM ConsultaVeterinaria cv
	INNER JOIN Financeiro F ON cv.IdFinanceiro = f.Id 
	WHERE cv.Status = 2 AND cv.TipoConsulta = 1 AND YEAR(f.DataTransacao) =@Ano and MONTH(f.DataTransacao) = MONTH(cv.Data)
	GROUP BY MONTH(f.DataTransacao)
		
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsListarProdutos]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsListarProdutos]

@Tipo int,
@Nome VARCHAR(100)

AS

SET NOCOUNT ON
	
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
	ORDER BY g.Nome, p.Nome
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
	ORDER BY g.Nome, p.Nome
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
	ORDER BY g.Nome, p.Nome
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
	ORDER BY g.Nome, p.Nome
	END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsListarFinanceiroClientesEspeciaisPorAno]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsListarFinanceiroClientesEspeciaisPorAno]
	@Ano INT
AS

SET NOCOUNT ON

BEGIN
	
	SELECT 
	f.NomeCliente, 
	f.DataTransacao AS Mes, 
	f.TipoTransacao, 
	cv.TipoConsulta, 
	f.ValorTotal AS ValorTotal 
	FROM Financeiro f
	LEFT JOIN ConsultaVeterinaria cv ON cv.IdFinanceiro = f.Id
	WHERE  f.NomeCliente IS NOT NULL AND YEAR(f.DataTransacao) = @Ano
	ORDER BY F.DataTransacao
	
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsFinancasFaturamentoPorAno]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsFinancasFaturamentoPorAno] 
	@Ano INT
AS

SET NOCOUNT ON

BEGIN

	SELECT MONTH(f.DataTransacao) AS MES, SUM(f.ValorTotal) AS ValorTotal FROM ConsultaVeterinaria cv
	INNER JOIN Financeiro f ON F.Id = cv.IdFinanceiro
	WHERE IdFinanceiro IS NOT NULL AND YEAR(DataTransacao) = @Ano AND MONTH(f.DataTransacao) = MONTH(cv.Data)
	GROUP BY MONTH(f.DataTransacao)
	
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsFinancasVacinasPorAno]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsFinancasVacinasPorAno] 
	@Ano INT
AS

SET NOCOUNT ON

BEGIN

	SELECT MONTH(f.DataTransacao) AS MES, SUM(f.ValorTotal) AS ValorTotal FROM ConsultaVeterinaria cv
	INNER JOIN Financeiro F ON cv.IdFinanceiro = f.Id 
	WHERE cv.Status = 2 AND cv.TipoConsulta = 2 AND YEAR(f.DataTransacao) = @Ano and MONTH(f.DataTransacao) = MONTH(cv.Data)
	GROUP BY MONTH(f.DataTransacao)
	
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsObterProduto]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsObterProduto]
	@IdProduto Int
AS

SET NOCOUNT ON

BEGIN
	
	SELECT * FROM dbo.Produto WHERE Id = @IdProduto
	
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsVerificarConsulta]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsVerificarConsulta]
	@Data DATETIME,
	@Hora VARCHAR(30)
AS

SET NOCOUNT ON

BEGIN
	SELECT count(*) 
	FROM ConsultaVeterinaria
	WHERE  CAST(CONVERT(VARCHAR, Data, 103) AS DATETIME) = CAST(CONVERT(VARCHAR, @Data, 103) AS DATETIME) 
	AND HoraConsulta = @Hora
	AND [Status] in (0,2)
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsProdutoPorGrupo]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsProdutoPorGrupo]
	@Id_Grupo int
AS

SET NOCOUNT ON

BEGIN
	SELECT * FROM dbo.Produto WHERE IdGrupo = @Id_Grupo
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsObterConsultaPorUsuario]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsObterConsultaPorUsuario]
	@Id_Usuario INT
AS

SET NOCOUNT ON

BEGIN
	SELECT COUNT(*) FROM ConsultaVeterinaria WHERE IdUsuario = @Id_Usuario
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsObterConsultasAnimal]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsObterConsultasAnimal]
	@IdAnimal	Int
AS

SET NOCOUNT ON
--spsObterConsultasAnimal 1
BEGIN
	
	SELECT	cv.Id,
			cv.Data,
			cv.[Status],
			cv.Valor,
			case cv.TipoConsulta when 2 then 'Vacinação' else 'Consulta' end as TipoConsulta,
			cv.HoraConsulta	
	
	 FROM dbo.consultaveterinaria cv 
	 INNER JOIN dbo.ConsultaAnimal ca ON
	 ca.IdConsulta = cv.Id 
	 INNER JOIN dbo.animal a ON
	 a.Id = ca.IdAnimal
	 
	 WHERE a.Id = @IdAnimal  
	 
	 ORDER BY cv.Data DESC 
	
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsObterEstoqueProdutoPorIdProduto]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsObterEstoqueProdutoPorIdProduto] 
	@IdProd INT
AS

SET NOCOUNT ON

BEGIN
	SELECT * FROM EstoqueProduto WHERE IdProduto = @IdProd
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsListarVacinacoesAnimais]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsListarVacinacoesAnimais]

AS

SET NOCOUNT ON
--spsListarVacinacoesAnimais
BEGIN
	
	SELECT	cv.Id,
			c.Nome,
			a.Nome,			
			cv.Data,
			cv.Valor,
			cv.[Status],
			cv.HoraConsulta
							
	 FROM dbo.animal a
	 INNER JOIN dbo.cliente c ON c.Id = a.IdCliente
	 INNER JOIN dbo.ConsultaAnimal ca on ca.IdAnimal = a.Id
	 INNER JOIN dbo.ConsultaVeterinaria cv ON cv.Id = ca.IdConsulta
	 WHERE cv.TipoConsulta = 2
	 ORDER BY cv.[Status], cv.Data DESC, cv.HoraConsulta
	
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsListarProdutosVendidosPorData]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsListarProdutosVendidosPorData]
	@DataInicio datetime,
	@DataFim datetime
AS

SET NOCOUNT ON

BEGIN

SELECT P.NOME AS NOMEPRODUTO, 
	   COUNT(FP.QUANTIDADE) AS QUANTIDADEVENDIDA, 
	   G.NOME AS GRUPOPRODUTO
	FROM FINANCEIROPRODUTO FP
		INNER JOIN PRODUTO P ON P.ID = FP.IDPRODUTO
		INNER JOIN GRUPO G ON G.ID = P.IDGRUPO
	WHERE FP.DataTransacao >= @DataInicio AND FP.DataTransacao <= @DataFim
GROUP BY P.NOME, G.NOME
ORDER BY G.NOME, P.NOME
	
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsListarProdutosEmEstoque]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsListarProdutosEmEstoque]
	@Tipo INT,
	@Nome VARCHAR(100)
	
AS

SET NOCOUNT ON

BEGIN
		
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
	FROM dbo.Produto p 
	INNER JOIN dbo.Grupo g ON p.IdGrupo = g.Id	
	INNER JOIN dbo.EstoqueProduto ep ON p.Id = ep.IdProduto
	INNER JOIN dbo.Estoque e ON ep.IdEstoque = e.Id
	WHERE e.Quantidade > 0
	ORDER BY g.Nome, p.Nome
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
	FROM dbo.Produto p 
	INNER JOIN dbo.Grupo g ON p.IdGrupo = g.Id	
	INNER JOIN dbo.EstoqueProduto ep ON p.Id = ep.IdProduto
	INNER JOIN dbo.Estoque e ON ep.IdEstoque = e.Id
	WHERE e.Quantidade > 0 AND p.IdGrupo = @Tipo
	ORDER BY g.Nome, p.Nome 
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
	FROM dbo.Produto p 
	INNER JOIN dbo.Grupo g ON p.IdGrupo = g.Id	
	INNER JOIN dbo.EstoqueProduto ep ON p.Id = ep.IdProduto
	INNER JOIN dbo.Estoque e ON ep.IdEstoque = e.Id
	WHERE e.Quantidade > 0 AND p.IdGrupo = @Tipo AND p.Nome LIKE '%'+@Nome+'%'
	ORDER BY g.Nome, p.Nome
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
	FROM dbo.Produto p 
	INNER JOIN dbo.Grupo g ON p.IdGrupo = g.Id	
	INNER JOIN dbo.EstoqueProduto ep ON p.Id = ep.IdProduto
	INNER JOIN dbo.Estoque e ON ep.IdEstoque = e.Id
	WHERE e.Quantidade > 0 AND p.Nome LIKE '%'+@Nome+'%'
	ORDER BY g.Nome, p.Nome
	END	
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsFinancasLucroPorAno]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsFinancasLucroPorAno]
	@Ano INT
AS

SET NOCOUNT ON

BEGIN
	SELECT MONTH(fp.DataTransacao) AS Mes, SUM((p.PrecoVenda - p.PrecoCusto) * fp.Quantidade) AS TotalLucro
	FROM FinanceiroProduto fp INNER JOIN Produto p ON p.Id = fp.IdProduto 
	WHERE YEAR(fp.DataTransacao) = @Ano
	GROUP BY MONTH(fp.DataTransacao)
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsFinancasEstoquePorAno]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsFinancasEstoquePorAno]
	@Ano INT
AS

SET NOCOUNT ON

BEGIN
	SELECT MONTH(n.DataCadastro), SUM(e.Quantidade * p.PrecoCusto) AS TotalEstoque 
	FROM EstoqueProduto ep inner join Estoque e ON ep.IdEstoque = e.Id
	inner join Produto p ON p.Id = ep.IdProduto 
	inner join ProdutoNotaFiscal pn ON pn.IdProduto = p.Id
	inner join NotaFiscal n ON n.Id = pn.IdNotaFiscal
	WHERE e.Quantidade >= pn.Quantidade AND YEAR(n.DataCadastro) = @Ano
	GROUP BY MONTH(n.DataCadastro)
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsListarEstoquePorGrupo]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsListarEstoquePorGrupo]
	@IdGrupo INT
AS

SET NOCOUNT ON

BEGIN
	SELECT 
	e.Id,
	g.Nome,
	g.Id,
	p.Nome,
	p.EstoqueMin,
	p.EstoqueMax,
	e.Quantidade,
	e.Status
	FROM Estoque e INNER JOIN EstoqueProduto ep ON ep.IdEstoque = e.Id
	INNER JOIN Produto p ON p.Id = ep.IdProduto
	INNER JOIN Grupo g ON G.Id = p.IdGrupo	
	WHERE g.Id = @IdGrupo AND e.Quantidade >= 0
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsListarEstoque]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsListarEstoque]
	
AS

SET NOCOUNT ON

BEGIN
	SELECT 
	e.Id,
	g.Nome,
	p.Nome,
	p.EstoqueMin,
	p.EstoqueMax,
	e.Quantidade,
	e.Status
	FROM Estoque e INNER JOIN EstoqueProduto ep ON ep.IdEstoque = e.Id
	INNER JOIN Produto p ON p.Id = ep.IdProduto
	INNER JOIN Grupo g ON G.Id = p.IdGrupo
	WHERE e.Quantidade >= 0
	ORDER BY g.Nome;
	
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsListaRelProdutoNotaFiscal]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsListaRelProdutoNotaFiscal] 
	@IdNota INT
AS

SET NOCOUNT ON

BEGIN
	SELECT 
	a.Id,
	a.IdNotaFiscal,
	a.IdProduto,
	a.Quantidade,
	p.Nome,
	p.PrecoCusto
	FROM ProdutoNotaFiscal a INNER JOIN Produto p ON a.IdProduto = p.Id
	WHERE IdNotaFiscal = @IdNota
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsListarDadosReceitaMedica]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
GO
/****** Object:  StoredProcedure [dbo].[spsListarConsultasAPagar]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsListarConsultasAPagar]

@NomeAnimal varchar(50)

AS

SET NOCOUNT ON

BEGIN
	
	SELECT	cv.Id,
			c.Nome,
			a.Nome,
			cv.Data,
			cv.Valor,
			cv.[Status],
			cv.HoraConsulta
				
	 FROM dbo.consultaanimal ca 
	 INNER JOIN dbo.consultaveterinaria cv ON
	 cv.Id = ca.IdConsulta
	 INNER JOIN dbo.animal a ON
	 a.Id = ca.IdAnimal
	 INNER JOIN dbo.cliente c ON
	 c.Id = a.IdCliente
	 
	 WHERE cv.Status <> 2
	 AND a.Nome like '%'+@NomeAnimal+'%'
		 
	 ORDER BY cv.Data ASC, cv.HoraConsulta 
	
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsListarConsultasAnimais2]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsListarConsultasAnimais2]
@Nome	varchar(50),
@Data	datetime
AS

SET NOCOUNT ON
--spsListarConsultasAnimais2 '', '2010-09-11' 
BEGIN
	
	SELECT	cv.Id,
			c.Nome,
			a.Nome,
			cv.Data,
			cv.[Status]
				
	 FROM dbo.consultaanimal ca 
	 INNER JOIN dbo.consultaveterinaria cv ON
	 cv.Id = ca.IdConsulta
	 INNER JOIN dbo.animal a ON
	 a.Id = ca.IdAnimal
	 INNER JOIN dbo.cliente c ON
	 c.Id = a.IdCliente
	 
	 WHERE	c.Nome like '%' + (@Nome) + '%'
	 AND	cv.Data = ISNULL(@Data, cv.Data)	 
	 ORDER BY cv.Data DESC 
	
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsListarConsultasAnimais]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsListarConsultasAnimais]

AS

SET NOCOUNT ON
--spsListarConsultasAnimais
BEGIN
	
	SELECT	cv.Id,
			c.Nome,
			a.Nome,
			cv.Data,
			cv.Valor,
			cv.[Status],
			cv.HoraConsulta
				
	 FROM dbo.consultaanimal ca 
	 INNER JOIN dbo.consultaveterinaria cv ON
	 cv.Id = ca.IdConsulta
	 INNER JOIN dbo.animal a ON
	 a.Id = ca.IdAnimal
	 INNER JOIN dbo.cliente c ON
	 c.Id = a.IdCliente
	 WHERE cv.TipoConsulta = 1	 
	 ORDER BY cv.[Status], cv.Data DESC, cv.HoraConsulta 
	
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsListarConsultaAnimalAPagar]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsListarConsultaAnimalAPagar]
	@idConsulta int
AS

SET NOCOUNT ON

BEGIN
	
	SELECT	
			cv.IdUsuario,
			cv.Valor
				
	 FROM dbo.consultaveterinaria cv
	 INNER JOIN dbo.consultaanimal ca  ON
	 cv.Id = ca.IdConsulta
	 INNER JOIN dbo.animal a ON
	 a.Id = ca.IdAnimal
	 
	 WHERE cv.Id = @idConsulta
	
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsListarConsultaAnimal]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsListarConsultaAnimal]
	@IdAnimal	Int
AS

SET NOCOUNT ON
--spsListarConsultaAnimal 1
BEGIN
	
	SELECT	cv.Id,
			cv.Data,
			cv.[Status],
			cv.Valor
			
	
	 FROM dbo.consultaanimal ca 
	 INNER JOIN dbo.consultaveterinaria cv ON
	 cv.Id = ca.IdConsulta
	 INNER JOIN dbo.animal a ON
	 a.Id = ca.IdAnimal
	 
	 WHERE ca.IdAnimal = @IdAnimal  
	 
	 ORDER BY cv.Data DESC 
	
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsFinancasValorAReceberPorAno]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsFinancasValorAReceberPorAno]
	@Ano INT
AS

SET NOCOUNT ON

BEGIN
	SELECT MONTH(fp.DataTransacao) AS Mes, ABS(SUM((p.PrecoVenda - pn.Quantidade) - (p.PrecoVenda * fp.Quantidade))) AS TotalValorAReceber
	FROM FinanceiroProduto fp INNER JOIN Produto p ON p.Id = fp.IdProduto 
	INNER JOIN ProdutoNotaFiscal pn ON pn.IdProduto = fp.IdProduto
	WHERE YEAR(fp.DataTransacao) = @Ano
	GROUP BY MONTH(fp.DataTransacao)
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsEstBuscaVacinaAnimais]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsEstBuscaVacinaAnimais]
	@DataInicio datetime,
	@DataFim datetime
AS

SET NOCOUNT ON

BEGIN

DECLARE @CACHORRO INT,
		@GATO INT, 
		@TOTAL INT,
		@PEIXE INT,
		@PASSARO INT,
		@ROEDOR INT,
		@CLIESP INT
		
	IF @DATAINICIO IS NULL AND @DATAFIM IS NULL
	BEGIN
		SELECT @CACHORRO = COUNT(*) FROM CONSULTAVETERINARIA CV, CONSULTAANIMAL CA, ANIMAL A WHERE CA.IDCONSULTA = CV.ID AND CA.IDANIMAL = A.ID AND CV.TIPOCONSULTA = 2 AND A.IdTipoAnimal = 1
		SELECT @GATO = COUNT(*) FROM CONSULTAVETERINARIA CV, CONSULTAANIMAL CA, ANIMAL A WHERE CA.IDCONSULTA = CV.ID AND CA.IDANIMAL = A.ID AND CV.TIPOCONSULTA = 2 AND A.IdTipoAnimal = 2
		SELECT @PEIXE = COUNT(*) FROM CONSULTAVETERINARIA CV, CONSULTAANIMAL CA, ANIMAL A WHERE CA.IDCONSULTA = CV.ID AND CA.IDANIMAL = A.ID AND CV.TIPOCONSULTA = 2 AND A.IdTipoAnimal = 3
		SELECT @PASSARO = COUNT(*) FROM CONSULTAVETERINARIA CV, CONSULTAANIMAL CA, ANIMAL A WHERE CA.IDCONSULTA = CV.ID AND CA.IDANIMAL = A.ID AND CV.TIPOCONSULTA = 2 AND A.IdTipoAnimal = 4
		SELECT @ROEDOR = COUNT(*) FROM CONSULTAVETERINARIA CV, CONSULTAANIMAL CA, ANIMAL A WHERE CA.IDCONSULTA = CV.ID AND CA.IDANIMAL = A.ID AND CV.TIPOCONSULTA = 2 AND A.IdTipoAnimal = 5
		SELECT @TOTAL = COUNT(*) FROM CONSULTAVETERINARIA CV, CONSULTAANIMAL CA, ANIMAL A WHERE CA.IDCONSULTA = CV.ID AND CA.IDANIMAL = A.ID AND CV.TIPOCONSULTA = 2
		SELECT @CLIESP = COUNT(*) FROM CONSULTAVETERINARIA INNER JOIN FINANCEIRO ON FINANCEIRO.ID = CONSULTAVETERINARIA.IDFINANCEIRO WHERE FINANCEIRO.NOMECLIENTE IS NOT NULL AND CONSULTAVETERINARIA.STATUS = 2 AND CONSULTAVETERINARIA.TIPOCONSULTA = 2
	END
	ELSE
	BEGIN
		SELECT @CACHORRO = COUNT(*) FROM CONSULTAVETERINARIA CV, CONSULTAANIMAL CA, ANIMAL A WHERE CA.IDCONSULTA = CV.ID AND CA.IDANIMAL = A.ID AND CV.TIPOCONSULTA = 2 AND A.IdTipoAnimal = 1 AND CV.DATA >= CONVERT (DATETIME ,@DATAINICIO , 103 ) AND CV.DATA <= CONVERT (DATETIME ,@DATAFIM , 103 )
		SELECT @GATO = COUNT(*) FROM CONSULTAVETERINARIA CV, CONSULTAANIMAL CA, ANIMAL A WHERE CA.IDCONSULTA = CV.ID AND CA.IDANIMAL = A.ID AND CV.TIPOCONSULTA = 2 AND A.IdTipoAnimal = 2 AND CV.DATA >= CONVERT (DATETIME ,@DATAINICIO , 103 ) AND CV.DATA <= CONVERT (DATETIME ,@DATAFIM , 103 )
		SELECT @PEIXE = COUNT(*) FROM CONSULTAVETERINARIA CV, CONSULTAANIMAL CA, ANIMAL A WHERE CA.IDCONSULTA = CV.ID AND CA.IDANIMAL = A.ID AND CV.TIPOCONSULTA = 2 AND A.IdTipoAnimal = 3 AND CV.DATA >= CONVERT (DATETIME ,@DATAINICIO , 103 ) AND CV.DATA <= CONVERT (DATETIME ,@DATAFIM , 103 )
		SELECT @PASSARO = COUNT(*) FROM CONSULTAVETERINARIA CV, CONSULTAANIMAL CA, ANIMAL A WHERE CA.IDCONSULTA = CV.ID AND CA.IDANIMAL = A.ID AND CV.TIPOCONSULTA = 2 AND A.IdTipoAnimal = 4 AND CV.DATA >= CONVERT (DATETIME ,@DATAINICIO , 103 ) AND CV.DATA <= CONVERT (DATETIME ,@DATAFIM , 103 )
		SELECT @ROEDOR = COUNT(*) FROM CONSULTAVETERINARIA CV, CONSULTAANIMAL CA, ANIMAL A WHERE CA.IDCONSULTA = CV.ID AND CA.IDANIMAL = A.ID AND CV.TIPOCONSULTA = 2 AND A.IdTipoAnimal = 5 AND CV.DATA >= CONVERT (DATETIME ,@DATAINICIO , 103 ) AND CV.DATA <= CONVERT (DATETIME ,@DATAFIM , 103 )
		SELECT @TOTAL = COUNT(*) FROM CONSULTAVETERINARIA CV, CONSULTAANIMAL CA, ANIMAL A WHERE CA.IDCONSULTA = CV.ID AND CA.IDANIMAL = A.ID AND CV.TIPOCONSULTA = 2 AND CV.DATA >= CONVERT (DATETIME ,@DATAINICIO , 103 ) AND CV.DATA <= CONVERT (DATETIME ,@DATAFIM , 103 )
		SELECT @CLIESP = COUNT(*) FROM CONSULTAVETERINARIA CV INNER JOIN FINANCEIRO F ON F.ID = CV.IDFINANCEIRO WHERE F.NOMECLIENTE IS NOT NULL AND CV.STATUS = 2 AND CV.TIPOCONSULTA = 2 AND CV.DATA >= CONVERT (DATETIME ,@DATAINICIO , 103 ) AND CV.DATA <= CONVERT (DATETIME ,@DATAFIM , 103 )
	END 
	
	
	SELECT @TOTAL, @CACHORRO ,@GATO ,@PEIXE, @PASSARO, @ROEDOR
	
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spsEstBuscaConsultaAnimais]    Script Date: 12/05/2010 01:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsEstBuscaConsultaAnimais]
	@DataInicio datetime,
	@DataFim datetime
AS

SET NOCOUNT ON

BEGIN

DECLARE @CACHORRO INT,
		@GATO INT, 
		@TOTAL INT,
		@PEIXE INT,
		@PASSARO INT,
		@ROEDOR INT,
		@CLIESP INT
		
	IF @DATAINICIO IS NULL AND @DATAFIM IS NULL
	BEGIN
		SELECT @CACHORRO = COUNT(*) FROM CONSULTAVETERINARIA CV, CONSULTAANIMAL CA, ANIMAL A WHERE CA.IDCONSULTA = CV.ID AND CA.IDANIMAL = A.ID AND CV.TIPOCONSULTA = 1 AND A.IdTipoAnimal = 1
		SELECT @GATO = COUNT(*) FROM CONSULTAVETERINARIA CV, CONSULTAANIMAL CA, ANIMAL A WHERE CA.IDCONSULTA = CV.ID AND CA.IDANIMAL = A.ID AND CV.TIPOCONSULTA = 1 AND A.IdTipoAnimal = 2
		SELECT @PEIXE = COUNT(*) FROM CONSULTAVETERINARIA CV, CONSULTAANIMAL CA, ANIMAL A WHERE CA.IDCONSULTA = CV.ID AND CA.IDANIMAL = A.ID AND CV.TIPOCONSULTA = 1 AND A.IdTipoAnimal = 3
		SELECT @PASSARO = COUNT(*) FROM CONSULTAVETERINARIA CV, CONSULTAANIMAL CA, ANIMAL A WHERE CA.IDCONSULTA = CV.ID AND CA.IDANIMAL = A.ID AND CV.TIPOCONSULTA = 1 AND A.IdTipoAnimal = 4
		SELECT @ROEDOR = COUNT(*) FROM CONSULTAVETERINARIA CV, CONSULTAANIMAL CA, ANIMAL A WHERE CA.IDCONSULTA = CV.ID AND CA.IDANIMAL = A.ID AND CV.TIPOCONSULTA = 1 AND A.IdTipoAnimal = 5
		SELECT @TOTAL = COUNT(*) FROM CONSULTAVETERINARIA CV, CONSULTAANIMAL CA, ANIMAL A WHERE CA.IDCONSULTA = CV.ID AND CA.IDANIMAL = A.ID AND CV.TIPOCONSULTA = 1
		SELECT @CLIESP = COUNT(*) FROM CONSULTAVETERINARIA INNER JOIN FINANCEIRO ON FINANCEIRO.ID = CONSULTAVETERINARIA.IDFINANCEIRO WHERE FINANCEIRO.NOMECLIENTE IS NOT NULL AND CONSULTAVETERINARIA.STATUS = 2 AND CONSULTAVETERINARIA.TIPOCONSULTA = 1
	END
	ELSE
	BEGIN
		SELECT @CACHORRO = COUNT(*) FROM CONSULTAVETERINARIA CV, CONSULTAANIMAL CA, ANIMAL A WHERE CA.IDCONSULTA = CV.ID AND CA.IDANIMAL = A.ID AND CV.TIPOCONSULTA = 1 AND A.IdTipoAnimal = 1 AND CV.DATA >= CONVERT (DATETIME ,@DATAINICIO , 103 ) AND CV.DATA <= CONVERT (DATETIME ,@DATAFIM , 103 )
		SELECT @GATO = COUNT(*) FROM CONSULTAVETERINARIA CV, CONSULTAANIMAL CA, ANIMAL A WHERE CA.IDCONSULTA = CV.ID AND CA.IDANIMAL = A.ID AND CV.TIPOCONSULTA = 1 AND A.IdTipoAnimal = 2 AND CV.DATA >= CONVERT (DATETIME ,@DATAINICIO , 103 ) AND CV.DATA <= CONVERT (DATETIME ,@DATAFIM , 103 )
		SELECT @PEIXE = COUNT(*) FROM CONSULTAVETERINARIA CV, CONSULTAANIMAL CA, ANIMAL A WHERE CA.IDCONSULTA = CV.ID AND CA.IDANIMAL = A.ID AND CV.TIPOCONSULTA = 1 AND A.IdTipoAnimal = 3 AND CV.DATA >= CONVERT (DATETIME ,@DATAINICIO , 103 ) AND CV.DATA <= CONVERT (DATETIME ,@DATAFIM , 103 )
		SELECT @PASSARO = COUNT(*) FROM CONSULTAVETERINARIA CV, CONSULTAANIMAL CA, ANIMAL A WHERE CA.IDCONSULTA = CV.ID AND CA.IDANIMAL = A.ID AND CV.TIPOCONSULTA = 1 AND A.IdTipoAnimal = 4 AND CV.DATA >= CONVERT (DATETIME ,@DATAINICIO , 103 ) AND CV.DATA <= CONVERT (DATETIME ,@DATAFIM , 103 )
		SELECT @ROEDOR = COUNT(*) FROM CONSULTAVETERINARIA CV, CONSULTAANIMAL CA, ANIMAL A WHERE CA.IDCONSULTA = CV.ID AND CA.IDANIMAL = A.ID AND CV.TIPOCONSULTA = 1 AND A.IdTipoAnimal = 5 AND CV.DATA >= CONVERT (DATETIME ,@DATAINICIO , 103 ) AND CV.DATA <= CONVERT (DATETIME ,@DATAFIM , 103 )
		SELECT @TOTAL = COUNT(*) FROM CONSULTAVETERINARIA CV, CONSULTAANIMAL CA, ANIMAL A WHERE CA.IDCONSULTA = CV.ID AND CA.IDANIMAL = A.ID AND CV.TIPOCONSULTA = 1 AND CV.DATA >= CONVERT (DATETIME ,@DATAINICIO , 103 ) AND CV.DATA <= CONVERT (DATETIME ,@DATAFIM , 103 )
		SELECT @CLIESP = COUNT(*) FROM CONSULTAVETERINARIA CV INNER JOIN FINANCEIRO F ON F.ID = CV.IDFINANCEIRO WHERE F.NOMECLIENTE IS NOT NULL AND CV.STATUS = 2 AND CV.TIPOCONSULTA = 1 AND CV.DATA >= CONVERT (DATETIME ,@DATAINICIO , 103 ) AND CV.DATA <= CONVERT (DATETIME ,@DATAFIM , 103 )
	END 
	
	
	SELECT @TOTAL, @CACHORRO ,@GATO ,@PEIXE, @PASSARO, @ROEDOR, @CLIESP
	
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spiInserirRelNotaFiscal]    Script Date: 12/05/2010 01:39:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spiInserirRelNotaFiscal]
	@IdNota INT,
	@IdProd INT,
	@Quantidade INT,
	@ValorNota DECIMAL(9,2)
AS

SET NOCOUNT ON

BEGIN
	UPDATE NotaFiscal SET Valor = @ValorNota WHERE Id = @IdNota
	
	INSERT INTO ProdutoNotaFiscal
	(IdProduto,IdNotaFiscal,Quantidade)
	VALUES
	(@IdProd,@IdNota,@Quantidade)
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spiInserirRelFinanceiroProduto]    Script Date: 12/05/2010 01:39:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spiInserirRelFinanceiroProduto]
	@IdFinanceiro INT,
	@IdProduto INT,
	@QuantidadeVendida INT
AS

SET NOCOUNT ON

BEGIN
	
	INSERT INTO FinanceiroProduto 
	(
	IdFinanceiro,
	IdProduto,
	DataTransacao,
	Quantidade
	)
	VALUES
	(
	@IdFinanceiro,
	@IdProduto,
	GETDATE(),
	@QuantidadeVendida
	)
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spiInserirEstoque]    Script Date: 12/05/2010 01:39:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spiInserirEstoque]
	@Status INT,
	@Quantidade INT,
	@IdProd INT
AS

SET NOCOUNT ON

BEGIN
	
	INSERT INTO Estoque (Status, Quantidade) VALUES (@Status, @Quantidade)
	
	DECLARE	@IdEst INT
	SELECT @IdEst = SCOPE_IDENTITY()
	
	INSERT INTO EstoqueProduto(IdEstoque, IdProduto) VALUES (@IdEst, @IdProd) 
	
	INSERT INTO HistoricoEstoque (IdEstoque, DataEstoque) VALUES (@IdEst,GETDATE())
	
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spiInserirConsultaVeterinaria]    Script Date: 12/05/2010 01:39:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spiInserirConsultaVeterinaria]
 
@IdUsuario		int,
@IdAnimal		int,
@Valor			decimal(9,2),
@Data			datetime,
@Status			int,
@Tipo			int,
@DataVacinacao	datetime,
@Hora			VARCHAR(30)
 
AS

SET NOCOUNT ON

DECLARE @IdConsulta		int

BEGIN TRANSACTION

	IF @Tipo = 1
	INSERT INTO dbo.ConsultaVeterinaria
	( 
				IdUsuario,	
				Valor,		
				Data,		
				[Status],
				TipoConsulta,
				HoraConsulta
	)
	VALUES
	( 
				@IdUsuario,	
				@Valor,		
				@Data,		
				@Status,
				@Tipo,
				@Hora
	)
	
	ELSE
		INSERT INTO dbo.ConsultaVeterinaria
	( 
				IdUsuario,	
				Valor,		
				Data,		
				[Status],
				TipoConsulta,
				HoraConsulta
	)
	VALUES
	( 
				@IdUsuario,	
				@Valor,		
				@DataVacinacao,		
				@Status,
				@Tipo,
				@Hora
	)
	
			
	SET @IdConsulta = @@IDENTITY
	
	IF @Tipo = 2
	BEGIN
	UPDATE dbo.Animal SET 
	DataProxVacinacao = @DataVacinacao
	WHERE Id = @IdAnimal	
	END

	IF @@ERROR <> 0 
	BEGIN
		ROLLBACK TRANSACTION
		RETURN
	END

	INSERT INTO dbo.ConsultaAnimal
	( 
				IdConsulta,	
				IdAnimal
	)
	VALUES
	( 
				@IdConsulta,	
				@IdAnimal
	)
			


	IF @@ERROR <> 0 
	BEGIN
		ROLLBACK TRANSACTION
		RETURN
	END


	--SELECT @IdConsulta

COMMIT TRANSACTION

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spdExcluirConsulta]    Script Date: 12/05/2010 01:39:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdExcluirConsulta]

@Id		INT
AS

SET NOCOUNT ON
--spdExcluirConsulta
BEGIN
	
		DELETE FROM dbo.ConsultaAnimal
				
		WHERE	IdConsulta = @Id 
	 
		DELETE FROM dbo.ConsultaVeterinaria
				
		WHERE	Id = @Id 
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spdExcluirAnimal]    Script Date: 12/05/2010 01:39:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdExcluirAnimal]

	@Id int
	
AS

SET NOCOUNT ON

BEGIN
	
	DELETE FROM ConsultaAnimal WHERE IdAnimal = @Id
	DELETE FROM Animal WHERE Id = @Id
	
END

SET NOCOUNT OFF
GO
/****** Object:  ForeignKey [FK_Animal_IdCliente]    Script Date: 12/05/2010 01:39:44 ******/
ALTER TABLE [dbo].[Animal]  WITH CHECK ADD  CONSTRAINT [FK_Animal_IdCliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([Id])
GO
ALTER TABLE [dbo].[Animal] CHECK CONSTRAINT [FK_Animal_IdCliente]
GO
/****** Object:  ForeignKey [FK_Animal_TipoAnimal]    Script Date: 12/05/2010 01:39:44 ******/
ALTER TABLE [dbo].[Animal]  WITH CHECK ADD  CONSTRAINT [FK_Animal_TipoAnimal] FOREIGN KEY([IdTipoAnimal])
REFERENCES [dbo].[TipoAnimal] ([Id])
GO
ALTER TABLE [dbo].[Animal] CHECK CONSTRAINT [FK_Animal_TipoAnimal]
GO
/****** Object:  ForeignKey [FK_ConsultaAnimal_Animal]    Script Date: 12/05/2010 01:39:44 ******/
ALTER TABLE [dbo].[ConsultaAnimal]  WITH CHECK ADD  CONSTRAINT [FK_ConsultaAnimal_Animal] FOREIGN KEY([IdAnimal])
REFERENCES [dbo].[Animal] ([Id])
GO
ALTER TABLE [dbo].[ConsultaAnimal] CHECK CONSTRAINT [FK_ConsultaAnimal_Animal]
GO
/****** Object:  ForeignKey [FK_ConsultaAnimal_ConsultaVeterinaria]    Script Date: 12/05/2010 01:39:44 ******/
ALTER TABLE [dbo].[ConsultaAnimal]  WITH CHECK ADD  CONSTRAINT [FK_ConsultaAnimal_ConsultaVeterinaria] FOREIGN KEY([IdConsulta])
REFERENCES [dbo].[ConsultaVeterinaria] ([Id])
GO
ALTER TABLE [dbo].[ConsultaAnimal] CHECK CONSTRAINT [FK_ConsultaAnimal_ConsultaVeterinaria]
GO
/****** Object:  ForeignKey [FK_ConsultaVeterinaria_Financeiro]    Script Date: 12/05/2010 01:39:44 ******/
ALTER TABLE [dbo].[ConsultaVeterinaria]  WITH CHECK ADD  CONSTRAINT [FK_ConsultaVeterinaria_Financeiro] FOREIGN KEY([IdFinanceiro])
REFERENCES [dbo].[Financeiro] ([Id])
GO
ALTER TABLE [dbo].[ConsultaVeterinaria] CHECK CONSTRAINT [FK_ConsultaVeterinaria_Financeiro]
GO
/****** Object:  ForeignKey [FK_ConsultaVeterinaria_Usuario]    Script Date: 12/05/2010 01:39:44 ******/
ALTER TABLE [dbo].[ConsultaVeterinaria]  WITH CHECK ADD  CONSTRAINT [FK_ConsultaVeterinaria_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[ConsultaVeterinaria] CHECK CONSTRAINT [FK_ConsultaVeterinaria_Usuario]
GO
/****** Object:  ForeignKey [FK_EstoqueProduto_Estoque]    Script Date: 12/05/2010 01:39:44 ******/
ALTER TABLE [dbo].[EstoqueProduto]  WITH CHECK ADD  CONSTRAINT [FK_EstoqueProduto_Estoque] FOREIGN KEY([IdEstoque])
REFERENCES [dbo].[Estoque] ([Id])
GO
ALTER TABLE [dbo].[EstoqueProduto] CHECK CONSTRAINT [FK_EstoqueProduto_Estoque]
GO
/****** Object:  ForeignKey [FK_EstoqueProduto_Produto]    Script Date: 12/05/2010 01:39:44 ******/
ALTER TABLE [dbo].[EstoqueProduto]  WITH CHECK ADD  CONSTRAINT [FK_EstoqueProduto_Produto] FOREIGN KEY([IdProduto])
REFERENCES [dbo].[Produto] ([Id])
GO
ALTER TABLE [dbo].[EstoqueProduto] CHECK CONSTRAINT [FK_EstoqueProduto_Produto]
GO
/****** Object:  ForeignKey [FK_Financeiro_Usuario]    Script Date: 12/05/2010 01:39:44 ******/
ALTER TABLE [dbo].[Financeiro]  WITH CHECK ADD  CONSTRAINT [FK_Financeiro_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Financeiro] CHECK CONSTRAINT [FK_Financeiro_Usuario]
GO
/****** Object:  ForeignKey [FK_Financeiro_Financeiro]    Script Date: 12/05/2010 01:39:44 ******/
ALTER TABLE [dbo].[FinanceiroProduto]  WITH CHECK ADD  CONSTRAINT [FK_Financeiro_Financeiro] FOREIGN KEY([IdFinanceiro])
REFERENCES [dbo].[Financeiro] ([Id])
GO
ALTER TABLE [dbo].[FinanceiroProduto] CHECK CONSTRAINT [FK_Financeiro_Financeiro]
GO
/****** Object:  ForeignKey [FK_Financeiro_Produto]    Script Date: 12/05/2010 01:39:44 ******/
ALTER TABLE [dbo].[FinanceiroProduto]  WITH CHECK ADD  CONSTRAINT [FK_Financeiro_Produto] FOREIGN KEY([IdProduto])
REFERENCES [dbo].[Produto] ([Id])
GO
ALTER TABLE [dbo].[FinanceiroProduto] CHECK CONSTRAINT [FK_Financeiro_Produto]
GO
/****** Object:  ForeignKey [FK_HistoricoEstoque_Estoque]    Script Date: 12/05/2010 01:39:44 ******/
ALTER TABLE [dbo].[HistoricoEstoque]  WITH CHECK ADD  CONSTRAINT [FK_HistoricoEstoque_Estoque] FOREIGN KEY([IdEstoque])
REFERENCES [dbo].[Estoque] ([Id])
GO
ALTER TABLE [dbo].[HistoricoEstoque] CHECK CONSTRAINT [FK_HistoricoEstoque_Estoque]
GO
/****** Object:  ForeignKey [FK_NotaFiscal_Administrador]    Script Date: 12/05/2010 01:39:44 ******/
ALTER TABLE [dbo].[NotaFiscal]  WITH CHECK ADD  CONSTRAINT [FK_NotaFiscal_Administrador] FOREIGN KEY([IdAdministrador])
REFERENCES [dbo].[Administrador] ([Id])
GO
ALTER TABLE [dbo].[NotaFiscal] CHECK CONSTRAINT [FK_NotaFiscal_Administrador]
GO
/****** Object:  ForeignKey [FK_NotaFiscal_Usuario]    Script Date: 12/05/2010 01:39:44 ******/
ALTER TABLE [dbo].[NotaFiscal]  WITH CHECK ADD  CONSTRAINT [FK_NotaFiscal_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[NotaFiscal] CHECK CONSTRAINT [FK_NotaFiscal_Usuario]
GO
/****** Object:  ForeignKey [FK_NotaFiscal_Vendedor]    Script Date: 12/05/2010 01:39:44 ******/
ALTER TABLE [dbo].[NotaFiscal]  WITH CHECK ADD  CONSTRAINT [FK_NotaFiscal_Vendedor] FOREIGN KEY([IdVendedor])
REFERENCES [dbo].[Vendedor] ([Id])
GO
ALTER TABLE [dbo].[NotaFiscal] CHECK CONSTRAINT [FK_NotaFiscal_Vendedor]
GO
/****** Object:  ForeignKey [FK_Produto_Financeiro]    Script Date: 12/05/2010 01:39:44 ******/
ALTER TABLE [dbo].[Produto]  WITH CHECK ADD  CONSTRAINT [FK_Produto_Financeiro] FOREIGN KEY([IdFinanceiro])
REFERENCES [dbo].[Financeiro] ([Id])
GO
ALTER TABLE [dbo].[Produto] CHECK CONSTRAINT [FK_Produto_Financeiro]
GO
/****** Object:  ForeignKey [FK_Produto_Grupo]    Script Date: 12/05/2010 01:39:44 ******/
ALTER TABLE [dbo].[Produto]  WITH CHECK ADD  CONSTRAINT [FK_Produto_Grupo] FOREIGN KEY([IdGrupo])
REFERENCES [dbo].[Grupo] ([Id])
GO
ALTER TABLE [dbo].[Produto] CHECK CONSTRAINT [FK_Produto_Grupo]
GO
/****** Object:  ForeignKey [FK_ProdutoNotaFiscal_NotaFiscal]    Script Date: 12/05/2010 01:39:44 ******/
ALTER TABLE [dbo].[ProdutoNotaFiscal]  WITH CHECK ADD  CONSTRAINT [FK_ProdutoNotaFiscal_NotaFiscal] FOREIGN KEY([IdNotaFiscal])
REFERENCES [dbo].[NotaFiscal] ([Id])
GO
ALTER TABLE [dbo].[ProdutoNotaFiscal] CHECK CONSTRAINT [FK_ProdutoNotaFiscal_NotaFiscal]
GO
/****** Object:  ForeignKey [FK_ProdutoNotaFiscal_Produto]    Script Date: 12/05/2010 01:39:44 ******/
ALTER TABLE [dbo].[ProdutoNotaFiscal]  WITH CHECK ADD  CONSTRAINT [FK_ProdutoNotaFiscal_Produto] FOREIGN KEY([IdProduto])
REFERENCES [dbo].[Produto] ([Id])
GO
ALTER TABLE [dbo].[ProdutoNotaFiscal] CHECK CONSTRAINT [FK_ProdutoNotaFiscal_Produto]
GO
/****** Object:  ForeignKey [FK_Usuario_Administrador]    Script Date: 12/05/2010 01:39:44 ******/
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Administrador] FOREIGN KEY([IdAdministrador])
REFERENCES [dbo].[Administrador] ([Id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Administrador]
GO
/****** Object:  ForeignKey [FK_Usuario_Vendedor]    Script Date: 12/05/2010 01:39:44 ******/
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Vendedor] FOREIGN KEY([IdVendedor])
REFERENCES [dbo].[Vendedor] ([Id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Vendedor]
GO
/****** Object:  ForeignKey [FK_Usuario_Veterinario]    Script Date: 12/05/2010 01:39:44 ******/
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Veterinario] FOREIGN KEY([IdVeterinario])
REFERENCES [dbo].[Veterinario] ([Id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Veterinario]
GO
/****** Object:  ForeignKey [FK_VeterinarioCliente_Cliente]    Script Date: 12/05/2010 01:39:44 ******/
ALTER TABLE [dbo].[VeterinarioCliente]  WITH CHECK ADD  CONSTRAINT [FK_VeterinarioCliente_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([Id])
GO
ALTER TABLE [dbo].[VeterinarioCliente] CHECK CONSTRAINT [FK_VeterinarioCliente_Cliente]
GO
/****** Object:  ForeignKey [FK_VeterinarioCliente_Veterinario]    Script Date: 12/05/2010 01:39:44 ******/
ALTER TABLE [dbo].[VeterinarioCliente]  WITH CHECK ADD  CONSTRAINT [FK_VeterinarioCliente_Veterinario] FOREIGN KEY([IdVeterinario])
REFERENCES [dbo].[Veterinario] ([Id])
GO
ALTER TABLE [dbo].[VeterinarioCliente] CHECK CONSTRAINT [FK_VeterinarioCliente_Veterinario]
GO
