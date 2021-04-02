/*Utilizador*/
DELIMITER $$
CREATE TRIGGER `trig_insert_user` BEFORE INSERT ON `utilizador`
    FOR EACH ROW BEGIN
DECLARE new_id INT;
SELECT MAX(ID) + 1 INTO new_id FROM log_utilizador;
IF ( new_id IS NULL ) THEN
SET new_id = 1;
END IF;
INSERT INTO log_utilizador(id, utilizador, operacao, data_operacao, nome_atual, email_atual, password_atual, tipo_atual) 
VALUES (new_id, CURRENT_USER, "I", NOW(), NEW.nome, NEW.email, NEW.password, NEW.tipo);
END
$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER `trig_update_user` BEFORE UPDATE ON `utilizador`
    FOR EACH ROW BEGIN
DECLARE new_id INT;
SELECT MAX(ID) + 1 INTO new_id FROM log_utilizador;
IF ( new_id IS NULL ) THEN
SET new_id = 1;
END IF;
INSERT INTO log_utilizador(id, utilizador, operacao, data_operacao, nome_atual, email_atual, password_atual, tipo_atual) 
VALUES (new_id, CURRENT_USER, "U", NOW(), NEW.nome, NEW.email, NEW.password, NEW.tipo);

IF(OLD.nome <> NEW.nome) THEN
UPDATE log_utilizador SET nome_ant = OLD.nome;
END IF;

IF(OLD.email <> NEW.email) THEN
UPDATE log_utilizador SET email_ant = OLD.email;
END IF;

IF(OLD.password <> NEW.password) THEN
UPDATE log_utilizador SET password_ant = OLD.password;
END IF;

IF(OLD.tipo <> NEW.tipo) THEN
UPDATE log_utilizador SET tipo_ant = OLD.tipo;
END IF;

END
$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER `trig_delete_user` BEFORE DELETE ON `utilizador`
    FOR EACH ROW BEGIN
DECLARE new_id INT;
SELECT MAX(ID) + 1 INTO new_id FROM log_utilizador;
IF ( new_id IS NULL ) THEN
SET new_id = 1;
END IF;
INSERT INTO log_utilizador(id, utilizador, operacao, data_operacao, nome_atual, email_atual, password_atual, tipo_atual) 
VALUES (new_id, CURRENT_USER, "D", NOW(), OLD.nome, OLD.email, OLD.password, OLD.tipo);
END
$$
DELIMITER ;




/*Ronda*/
DELIMITER $$
CREATE TRIGGER `trig_insert_ronda` BEFORE INSERT ON `ronda`
    FOR EACH ROW BEGIN
DECLARE new_id INT;
SELECT MAX(ID) + 1 INTO new_id FROM log_ronda;
IF ( new_id IS NULL ) THEN
SET new_id = 1;
END IF;
INSERT INTO log_ronda(id, utilizador, operacao, data_operacao, idUtilizador_atual, dia_semana_atual, hora_ronda_atual) 
VALUES (new_id, CURRENT_USER, "I", NOW(), NEW.idUtilizador, NEW.diaSemana, NEW.horaRonda);
END
$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER `trig_update_ronda` BEFORE UPDATE ON `ronda`
    FOR EACH ROW BEGIN
DECLARE new_id INT;
SELECT MAX(ID) + 1 INTO new_id FROM log_ronda;
IF ( new_id IS NULL ) THEN
SET new_id = 1;
END IF;
INSERT INTO log_ronda(id, utilizador, operacao, data_operacao, idUtilizador_atual, dia_semana_atual, hora_ronda_atual) 
VALUES (new_id, CURRENT_USER, "U", NOW(), NEW.idUtilizador, NEW.diaSemana, NEW.horaRonda);

IF(OLD.idUtilizador <> NEW.idUtilizador) THEN
UPDATE log_ronda SET idUtilizador_ant = OLD.idUtilizador;
END IF;

IF(OLD.diaSemana <> NEW.diaSemana) THEN
UPDATE log_ronda SET dia_semana_ant = OLD.diaSemana;
END IF;

IF(OLD.horaRonda <> NEW.horaRonda) THEN
UPDATE log_ronda SET hora_ronda_ant = OLD.horaRonda;
END IF;

END
$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER `trig_delete_ronda` BEFORE DELETE ON `ronda`
    FOR EACH ROW BEGIN
DECLARE new_id INT;
SELECT MAX(ID) + 1 INTO new_id FROM log_ronda;
IF ( new_id IS NULL ) THEN
SET new_id = 1;
END IF;
INSERT INTO log_ronda(id, utilizador, operacao, data_operacao, idUtilizador_atual, dia_semana_atual, hora_ronda_atual) 
VALUES (new_id, CURRENT_USER, "D", NOW(), OLD.idUtilizador, OLD.diaSemana, OLD.horaRonda);
END
$$
DELIMITER ;




/*Ronda Extra*/
DELIMITER $$
CREATE TRIGGER `trig_insert_ronda_extra` BEFORE INSERT ON `rondaextra`
    FOR EACH ROW BEGIN
DECLARE new_id INT;
SELECT MAX(ID) + 1 INTO new_id FROM log_ronda_extra;
IF ( new_id IS NULL ) THEN
SET new_id = 1;
END IF;
INSERT INTO log_ronda_extra(id, utilizador, operacao, data_operacao, idUtilizador_atual, dia_semana_atual, hora_ronda_atual) 
VALUES (new_id, CURRENT_USER, "I", NOW(), NEW.idUtilizador, NEW.diaSemana, NEW.hora);
END
$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER `trig_update_ronda_extra` BEFORE UPDATE ON `rondaextra`
    FOR EACH ROW BEGIN
DECLARE new_id INT;
SELECT MAX(ID) + 1 INTO new_id FROM log_ronda_extra;
IF ( new_id IS NULL ) THEN
SET new_id = 1;
END IF;
INSERT INTO log_ronda_extra(id, utilizador, operacao, data_operacao, idUtilizador_atual, dia_semana_atual, hora_ronda_atual) 
VALUES (new_id, CURRENT_USER, "U", NOW(), NEW.idUtilizador, NEW.diaSemana, NEW.hora);

IF(OLD.idUtilizador <> NEW.idUtilizador) THEN
UPDATE log_ronda_extra SET idUtilizador_ant = OLD.idUtilizador;
END IF;

IF(OLD.diaSemana <> NEW.diaSemana) THEN
UPDATE log_ronda_extra SET dia_semana_ant = OLD.diaSemana;
END IF;

IF(OLD.hora <> NEW.hora) THEN
UPDATE log_ronda_extra SET hora_ronda_ant = OLD.hora;
END IF;

END
$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER `trig_delete_ronda_extra` BEFORE DELETE ON `rondaextra`
    FOR EACH ROW BEGIN
DECLARE new_id INT;
SELECT MAX(ID) + 1 INTO new_id FROM log_ronda_extra;
IF ( new_id IS NULL ) THEN
SET new_id = 1;
END IF;
INSERT INTO log_ronda_extra(id, utilizador, operacao, data_operacao, idUtilizador_atual, dia_semana_atual, hora_ronda_atual) 
VALUES (new_id, CURRENT_USER, "D", NOW(), OLD.idUtilizador, OLD.diaSemana, OLD.hora);
END
$$
DELIMITER ;




/*Sistema*/
DELIMITER $$
CREATE TRIGGER `trig_insert_sistema` BEFORE INSERT ON `sistema`
    FOR EACH ROW BEGIN
DECLARE new_id INT;
SELECT MAX(ID) + 1 INTO new_id FROM log_sistema;
IF ( new_id IS NULL ) THEN
SET new_id = 1;
END IF;
INSERT INTO log_sistema(id, utilizador, operacao, data_operacao, lim_humi_atual, lim_temp_atual, lim_lumi_atual, lim_mov_atual) 
VALUES (new_id, CURRENT_USER, "I", NOW(), NEW.limHumidade, NEW.limTemperatura, NEW.limLuminosidade, NEW.limMovimentacao);
END
$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER `trig_update_sistema` BEFORE UPDATE ON `sistema`
    FOR EACH ROW BEGIN
DECLARE new_id INT;
SELECT MAX(ID) + 1 INTO new_id FROM log_sistema;
IF ( new_id IS NULL ) THEN
SET new_id = 1;
END IF;
INSERT INTO log_sistema(id, utilizador, operacao, data_operacao, lim_humi_atual, lim_temp_atual, lim_lumi_atual, lim_mov_atual) 
VALUES (new_id, CURRENT_USER, "U", NOW(), NEW.limHumidade, NEW.limTemperatura, NEW.limLuminosidade, NEW.limMovimentacao);

IF(OLD.limHumidade <> NEW.limHumidade) THEN
UPDATE log_sistema SET lim_humi_ant = OLD.limHumidade;
END IF;

IF(OLD.limTemperatura <> NEW.limTemperatura) THEN
UPDATE log_sistema SET lim_temp_ant = OLD.limTemperatura;
END IF;

IF(OLD.limLuminosidade <> NEW.limLuminosidade) THEN
UPDATE log_sistema SET lim_lumi_ant = OLD.limLuminosidade;
END IF;

IF(OLD.limMovimentacao <> NEW.limMovimentacao) THEN
UPDATE log_sistema SET lim_movi_ant = OLD.limMovimentacao;
END IF;

END
$$
DELIMITER ;


/*Alerta e Medicao*/
DELIMITER $$
CREATE TRIGGER `trig_insert_alerta` BEFORE INSERT ON `alerta`
    FOR EACH ROW BEGIN
DECLARE new_id INT;
SELECT MAX(ID) + 1 INTO new_id FROM log_alerta;
IF ( new_id IS NULL ) THEN
SET new_id = 1;
END IF;
INSERT INTO log_alerta(id, HorarioMedicao, TipoSensor, ValorMedicao, Limite, Descricao, Extra, Controlo) 
VALUES (new_id, NEW.HorarioMedicao, NEW.TipoSensor, NEW.ValorMedicao, NEW.Limite, NEW.Descricao, NEW.Extra, NEW.Controlo);
END
$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER `trig_insert_medicao_temperatura` BEFORE INSERT ON `medicaotemperatura`
    FOR EACH ROW BEGIN
DECLARE new_id INT;
SELECT MAX(ID) + 1 INTO new_id FROM log_medicao_temperatura;
IF ( new_id IS NULL ) THEN
SET new_id = 1;
END IF;
INSERT INTO log_medicao_temperatura(id,HorarioMedicao, ValorTemperatura, Migrate) 
VALUES (new_id, NEW.HorarioMedicao, NEW.ValorTemperatura, NEW.Migrate);
END
$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER `trig_insert_medicao_luminosidade` BEFORE INSERT ON `medicaoluminosidade`
    FOR EACH ROW BEGIN
DECLARE new_id INT;
SELECT MAX(ID) + 1 INTO new_id FROM log_medicao_luminosidade;
IF ( new_id IS NULL ) THEN
SET new_id = 1;
END IF;
INSERT INTO log_medicao_luminosidade(id,HorarioMedicao,ValorLuminosidade,Migrate) 
VALUES (new_id,  NEW.HorarioMedicao, NEW.ValorLuminosidade, NEW.Migrate);
END
$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER `trig_insert_medicao_movimento` BEFORE INSERT ON `medicaomovimento`
    FOR EACH ROW BEGIN
DECLARE new_id INT;
SELECT MAX(ID) + 1 INTO new_id FROM log_medicao_movimento;
IF ( new_id IS NULL ) THEN
SET new_id = 1;
END IF;
INSERT INTO log_medicao_movimento(id,HorarioMedicao,ValorMovimento,Migrate) 
VALUES (new_id, NEW.HorarioMedicao, NEW.ValorMovimento, NEW.Migrate);
END
$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER `trig_insert_medicao_humidade` BEFORE INSERT ON `medicaohumidade`
    FOR EACH ROW BEGIN
DECLARE new_id INT;
SELECT MAX(ID) + 1 INTO new_id FROM log_medicao_humidade;
IF ( new_id IS NULL ) THEN
SET new_id = 1;
END IF;
INSERT INTO log_medicao_humidade(id,HorarioMedicao,ValorHumidade,Migrate) 
VALUES (new_id, NEW.HorarioMedicao, NEW.ValorHumidade, NEW.Migrate);
END
$$
DELIMITER ;