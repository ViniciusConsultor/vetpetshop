USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spiInserirCliente]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spiInserirCliente
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
