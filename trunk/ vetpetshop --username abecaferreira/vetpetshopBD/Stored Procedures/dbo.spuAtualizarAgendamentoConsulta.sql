SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create PROCEDURE [dbo].[spuAtualizarAgendamentoConsulta]

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
GO
