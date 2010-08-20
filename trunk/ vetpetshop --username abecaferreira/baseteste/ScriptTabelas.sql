DECLARE @error INT;

BEGIN TRANSACTION

CREATE TABLE Estoque
(
Id					INT IDENTITY(1,1)	NOT NULL,
[Status]			SMALLINT			NULL, -- Mínimo Médio Máximo
Quantidade			INT					NULL,
CONSTRAINT  		PK_Estoque			PRIMARY KEY(Id)
)

CREATE TABLE Grupo
(
Id					INT IDENTITY(1,1)	NOT NULL,
Nome				VARCHAR(50)			NULL,
CONSTRAINT  		PK_Grupo			PRIMARY KEY(Id)
)

CREATE TABLE Administrador
(
Id					INT IDENTITY(1,1)	NOT NULL,
Nome				VARCHAR(50)			NULL,
CONSTRAINT  		PK_Administrador	PRIMARY KEY(Id)
)

CREATE TABLE Veterinario
(
Id					INT IDENTITY(1,1)	NOT NULL,
Nome				VARCHAR(50)			NULL,
CONSTRAINT  		PK_Veterinario		PRIMARY KEY(Id)
)

CREATE TABLE Vendedor
(
Id					INT IDENTITY(1,1)	NOT NULL,
Nome				VARCHAR(50)			NULL,
CONSTRAINT  		PK_Vendedor			PRIMARY KEY(Id)
)

CREATE TABLE Usuario
(
Id					INT IDENTITY(1,1)	NOT NULL,
IdAdministrador		INT					NOT NULL,
IdVeterinario		INT					NOT NULL,
IdVendedor			INT					NOT NULL,
Nome				VARCHAR(50)		    NULL,
TipoUsuario 		INT					NOT NULL, -- Veterinario Vendedor Administrador
Senha				VARCHAR(20)			NOT NULL,
Email				VARCHAR(30)			NULL,
CONSTRAINT  PK_Usuario					PRIMARY KEY(Id),
CONSTRAINT  FK_Usuario_Administrador	FOREIGN KEY(IdAdministrador)	REFERENCES  Administrador(Id),
CONSTRAINT  FK_Usuario_Veterinario		FOREIGN KEY(IdVeterinario)		REFERENCES  Veterinario(Id),
CONSTRAINT  FK_Usuario_Vendedor			FOREIGN KEY(IdVendedor)			REFERENCES  Vendedor(Id),
)

CREATE TABLE Financeiro 
(
Id					INT IDENTITY(1,1)	NOT NULL,
IdUsuario		    INT				    NOT NULL,
ValorTotal			DECIMAL				NULL,
TipoPagamento 		INT					NOT NULL, -- Cheque Dinheiro Cartão
Parcelas            INT                 NULL,     -- Quantidade de Parcelas (cartão, cheque)
TipoTransacao 		INT					NOT NULL, -- Venda Consulta
TipoResponsavel 	INT					NOT NULL, -- Veterinario Vendedor Administrador
DataTransacao   	DATETIME			NOT NULL,
CONSTRAINT  PK_Financeiro				PRIMARY KEY(Id),
CONSTRAINT  FK_Financeiro_Usuario		FOREIGN KEY(IdUsuario)     REFERENCES  Usuario(Id)
)

CREATE TABLE Produto
(
Id					INT IDENTITY(1,1)	NOT NULL,	
IdGrupo				INT					NOT NULL,
IdFinanceiro		INT					NOT NULL,
Nome				VARCHAR(50)			NULL,
EstoqueMin			INT					NULL,
EstoqueMax			INT					NULL,
Descricao			VARCHAR(200)		NULL,
PrecoCusto			DECIMAL				NULL,
DataValidade		DATETIME			NOT NULL,
PrecoVenda			DECIMAL				NULL,
CONSTRAINT  PK_Produto					PRIMARY KEY(Id),
CONSTRAINT  FK_Produto_Grupo			FOREIGN KEY(IdGrupo)			REFERENCES	Grupo(Id),
CONSTRAINT  FK_Produto_Financeiro		FOREIGN KEY(IdFinanceiro)		REFERENCES  Financeiro(Id)
)

CREATE TABLE EstoqueProduto 
(
Id					INT IDENTITY(1,1)	NOT NULL,
IdEstoque			INT					NOT NULL,
IdProduto 			INT					NOT NULL,
CONSTRAINT  PK_EstoqueProduto			PRIMARY KEY(Id),
CONSTRAINT  FK_EstoqueProduto_Estoque	FOREIGN KEY(IdEstoque)     REFERENCES  Estoque(Id),
CONSTRAINT  FK_EstoqueProduto_Produto	FOREIGN KEY(IdProduto)     REFERENCES  Produto(Id)
)

CREATE TABLE ConsultaVeterinaria 
(
Id				INT IDENTITY(1,1)				NOT NULL,
IdUsuario		INT								NOT NULL,
IdFinanceiro	INT								NULL,
Valor			DECIMAL							NULL,
Data			DATETIME						NOT NULL,
[Status]		INT								NOT NULL, --Agendada Realizada Não Realizada
CONSTRAINT  PK_ConsultaVeterinaria				PRIMARY KEY(Id),
CONSTRAINT  FK_ConsultaVeterinaria_Financeiro	FOREIGN KEY(IdFinanceiro)  REFERENCES  Financeiro(Id),
CONSTRAINT  FK_ConsultaVeterinaria_Usuario		FOREIGN KEY(IdUsuario)     REFERENCES  Usuario(Id)
)

CREATE TABLE TipoAnimal 
(
Id				INT IDENTITY(1,1)		NOT NULL,
Nome			VARCHAR(50)				NOT NULL,
CONSTRAINT  PK_TipoAnimal				PRIMARY KEY(Id)
)

CREATE TABLE Animal 
(
Id					INT IDENTITY(1,1)			NOT NULL,
IdTipoAnimal		INT							NOT NULL,
IdCliente			INT							NOT NULL,
Peso				DECIMAL(9,2)				NOT NULL,
Raca				VARCHAR(50)					NULL,
Nome				VARCHAR(50)					NOT NULL,
DataFimVacinacao	DATETIME					NULL,
DataNascimento		DATETIME					NULL,
DataProxVacinacao	DATETIME					NULL,
CONSTRAINT  PK_Animal							PRIMARY KEY(Id),
CONSTRAINT  FK_Animal_TipoAnimal				FOREIGN KEY(IdTipoAnimal)  REFERENCES  TipoAnimal(Id),
CONSTRAINT  FK_Animal_IdCliente					FOREIGN KEY(IdCliente)  REFERENCES  Cliente(Id)
) 

CREATE TABLE Cliente 
(
Id					INT IDENTITY(1,1)			NOT NULL,
CPF					VARCHAR(20)					NOT NULL,
Nome				VARCHAR(50)					NOT NULL,
RG                  VARCHAR(20)					NULL,
Telefone1			VARCHAR(15)					NULL,
Telefone2           VARCHAR(15)					NULL,
Email				VARCHAR(30)					NULL,
Endereco            VARCHAR(50)                 NULL,
Bairro              VARCHAR(20)                 NULL,
Cidade              VARCHAR(20)                 NULL,
Estado              VARCHAR(20)                 NULL,
CEP                 VARCHAR(20)                 NULL,
CONSTRAINT  PK_Cliente							PRIMARY KEY(Id),
)

CREATE TABLE ConsultaAnimal 
(
Id					INT IDENTITY(1,1)				NOT NULL,
IdConsulta			INT								NOT NULL,
IdAnimal			INT								NOT NULL,
CONSTRAINT  PK_ConsultaAnimal						PRIMARY KEY(Id),
CONSTRAINT  FK_ConsultaAnimal_ConsultaVeterinaria	FOREIGN KEY(IdConsulta)  REFERENCES  ConsultaVeterinaria(Id),
CONSTRAINT  FK_ConsultaAnimal_Animal				FOREIGN KEY(IdAnimal)	 REFERENCES  Animal(Id)
)

CREATE TABLE NotaFiscal 
(
Id					INT IDENTITY(1,1)			NOT NULL,
IdVendedor			INT							NOT NULL,
IdAdministrador		INT							NOT NULL,
IdUsuario			INT							NOT NULL,
DataCadastro		DATETIME					NOT NULL,
Valor				DECIMAL						NOT NULL,
[Status]			INT							NOT NULL, --Emitida Recebida
DataRecebimento		DATETIME					NOT NULL,
CONSTRAINT  PK_NotaFiscal						PRIMARY KEY(Id),
CONSTRAINT  FK_NotaFiscal_Vendedor				FOREIGN KEY(IdVendedor)			REFERENCES  Vendedor(Id),
CONSTRAINT  FK_NotaFiscal_Administrador			FOREIGN KEY(IdAdministrador)	REFERENCES  Administrador(Id),
CONSTRAINT  FK_NotaFiscal_Usuario				FOREIGN KEY(IdUsuario)			REFERENCES  Usuario(Id)
)

CREATE TABLE VeterinarioCliente
(
Id					INT IDENTITY(1,1)			NOT NULL,
IdCliente			INT							NOT NULL,
IdVeterinario		INT							NOT NULL,
CONSTRAINT  PK_VeterinarioCliente					PRIMARY KEY(Id),
CONSTRAINT  FK_VeterinarioCliente_Cliente			FOREIGN KEY(IdCliente)			REFERENCES  Cliente(Id),
CONSTRAINT  FK_VeterinarioCliente_Veterinario		FOREIGN KEY(IdVeterinario)		REFERENCES  Veterinario(Id)
)

CREATE TABLE ProdutoNotaFiscal 
(
Id					INT IDENTITY(1,1)			NOT NULL,
IdProduto			INT							NOT NULL,
IdNotaFiscal		INT							NOT NULL,
Quantidade			INT							NOT NULL,
CONSTRAINT  PK_ProdutoNotaFiscal				PRIMARY KEY(Id),
CONSTRAINT  FK_ProdutoNotaFiscal_Produto		FOREIGN KEY(IdProduto)			REFERENCES  Produto(Id),
CONSTRAINT  FK_ProdutoNotaFiscal_NotaFiscal		FOREIGN KEY(IdNotaFiscal)		REFERENCES  NotaFiscal(Id)
)

SET @error = @@ERROR
IF @@ERROR = 0 AND @error = 0
BEGIN
	COMMIT TRANSACTION
END
ELSE 
BEGIN
	ROLLBACK TRANSACTION
END




