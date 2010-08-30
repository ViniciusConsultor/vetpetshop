SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[spuAlterarCliente]

@IdCliente int,
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
	UPDATE dbo.Cliente SET 
	Nome = @Nome_Cliente,
	CPF = @Num_Cpf,
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


GO
