USE clinica_medica;

SELECT * FROM pedido_exame;

--DELETE FROM pedido_exame

DBCC CHECKIDENT('pedido_exame', RESEED, 2199)

CREATE TRIGGER Atualiza_Pedido_Exame
	ON pedido_exame
	AFTER INSERT
	AS
    BEGIN 
		SET NOCOUNT ON;
		DECLARE @num_ped AS INTEGER;
		SELECT @num_ped = numero_pedido FROM inserted;
		DECLARE @num_cons AS INTEGER;
		SELECT @num_cons = fk_consulta_numero_consulta FROM inserted;
		DECLARE @cod_ex AS INTEGER;
		SELECT @cod_ex = fk_exame_codigo FROM inserted;
		DECLARE @prc AS MONEY;
		SELECT @prc = preco FROM exame WHERE codigo = @cod_ex;
		DECLARE @cpf_pac AS VARCHAR(20);
		SELECT @cpf_pac = fk_paciente_cpf FROM consulta WHERE numero_consulta = @num_cons;
		DECLARE @tp_plan AS VARCHAR(20);
		SELECT @tp_plan = tipo_plano FROM paciente WHERE cpf = @cpf_pac;


		-- plano Especial
		IF @tp_plan = 'Especial'
		BEGIN
				UPDATE pedido_exame SET valor_pagar = @prc - @prc * 100 / 100 WHERE numero_pedido = @num_ped;
		END
		IF @tp_plan = 'Padrão'
		BEGIN
				UPDATE pedido_exame SET valor_pagar = @prc - @prc * 30 / 100 WHERE numero_pedido = @num_ped;
		END
		IF @tp_plan = 'Básico'
		BEGIN
				UPDATE pedido_exame SET valor_pagar = @prc - @prc * 10 / 100 WHERE numero_pedido = @num_ped;
		END
		PRINT 'Trigger (Atualiza Pedido de Exame) Encerrada';
	END

CREATE PROCEDURE Agenda_Medicos
AS
BEGIN
	SELECT m.nome_medico, m.especialidade, m.crm, c.numero_consulta, c.data_consulta, 
		c.horario_consulta, p.nome_paciente, p.cpf,  
		p.nome_plano, p.tipo_plano 	FROM medico AS m INNER JOIN consulta AS c 
		ON m.crm = c.fk_medico_crm INNER JOIN paciente AS p ON c.fk_paciente_cpf = p.cpf 
		ORDER BY m.nome_medico, c.data_consulta;
END

EXECUTE Agenda_Medicos;

CREATE PROCEDURE Exames_Solicitados
AS
BEGIN
	SELECT m.nome_medico, m.especialidade, m.crm, c.numero_consulta, 
		p.numero_pedido, p.data_exame, e.codigo, e.especificacao
		FROM medico AS m INNER JOIN consulta AS c 
		ON m.crm = c.fk_medico_crm INNER JOIN pedido_exame AS p 
		ON c.numero_consulta = p.fk_consulta_numero_consulta
		INNER JOIN exame AS e ON p.fk_exame_codigo = e.codigo 
		ORDER BY m.nome_medico, p.data_exame;
END

EXECUTE Exames_Solicitados;

CREATE PROCEDURE Historico_Pagamentos
AS
BEGIN
	SELECT pa.nome_paciente, pa.cpf, c.numero_consulta, c.data_consulta,  
		pe.data_exame, pe.valor_pagar, 
		e.codigo, e.especificacao FROM paciente AS pa INNER JOIN consulta AS c 
		ON pa.cpf = c.fk_paciente_cpf INNER JOIN pedido_exame AS pe 
		ON c.numero_consulta = pe.fk_consulta_numero_consulta INNER JOIN exame AS e 
		ON pe.fk_exame_codigo = e.codigo 
		ORDER BY pa.nome_paciente, pe.data_exame;
END

EXECUTE Historico_Pagamentos;

CREATE PROCEDURE Resumo_Pagamentos (@nome_pac VARCHAR(40))
AS
BEGIN
	SELECT pa.nome_paciente, SUM(pe.valor_pagar) AS total_pagar
		FROM paciente AS pa INNER JOIN consulta AS c 
		ON pa.cpf = c.fk_paciente_cpf INNER JOIN pedido_exame AS pe 
		ON c.numero_consulta = pe.fk_consulta_numero_consulta 
		WHERE pa.nome_paciente = @nome_pac
		GROUP BY pa.nome_paciente;
END

EXECUTE Resumo_Pagamentos 'Leonardo Ribeiro';