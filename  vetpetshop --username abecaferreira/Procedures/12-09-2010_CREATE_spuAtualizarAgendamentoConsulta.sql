USE [vetpetshop]
GO
/****** Object:  StoredProcedure [dbo].[spuAtualizarAgendamentoConsulta]    Script Date: 09/13/2010 00:59:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spuAtualizarAgendamentoConsulta]

@id_consulta	INT,
@id_usuario		INT,
@Data			DATETIME,
@Valor			DECIMAL,
@Status			INT
AS
--spuAtualizarAgendamentoConsulta
BEGIN
	
		UPDATE dbo.COnsultaVeterinaria 
		
		SET		IdUsuario = @id_usuario,
				Data = @Data,
				Valor = @Valor,
				[Status] = @Status
				
		WHERE	Id = @id_consulta 
	 
END
