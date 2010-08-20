
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[spiInserirCliente]
@Nome_Cliente VARCHAR(50),
@Num_Cpf VARCHAR(20),
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
BEGIN
	INSERT INTO dbo.Cliente(Nome,CPF,Telefone1,Telefone2,RG,Endereco,Bairro,Cidade,Estado,CEP,Email) VALUES (@Nome_Cliente,@Num_Cpf,@Num_Tel,@Num_Cel,@Num_RG,@Endereco,@Bairro,@Cidade,@Estado,@CEP,@Email)
END
GO
