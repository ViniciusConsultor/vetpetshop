SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
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
