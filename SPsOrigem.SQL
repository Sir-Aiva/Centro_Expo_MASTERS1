DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_system`()
SELECT * FROM sistema$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_ronda`(IN `id_utilizador` INT, INOUT `delete_data` DATE, INOUT `delete_hora` TIME)
DELETE FROM ronda WHERE 
ronda.idUtilizador =  id_utilizador AND
ronda.diaSemana = delete_data AND
ronda.horaRonda = delete_hora$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_old_data`(IN `nome_tabela` VARCHAR(100))
TRUNCATE TABLE nome_tabela$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_user`(IN `id_utilizador` INT)
DELETE from utilizador
WHERE utilizador.idUtilizador = id_utilizador$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_log_tables`()
SELECT * FROM log_ronda,log_ronda_extra,log_sensor,log_sistema,
log_utilizador$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_ronda_extra`(IN `id_utilizador` INT, IN `delete_data` DATE, IN `delete_hora` TIME)
DELETE FROM rondaextra WHERE 
rondaextra.idUtilizador =  id_utilizador AND
rondaextra.diaSemana = delete_data AND
rondaextra.horaRonda = delete_hora$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_ronda`(IN `id_utilizador` INT, IN `data` DATE, IN `hora` TIME)
INSERT INTO ronda (idUtilizador,diaSemana,horaRonda)
VALUES (id_utilizador,data,hora)$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_ronda_extra`(INOUT `id_utilizador` INT, INOUT `insert_data` DATE, INOUT `insert_hora` TIME)
INSERT INTO rondaextra (idUtilizador,diaSemana,hora)
VALUES (id_utilizador,insert_data,insert_hora)$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_user`(IN `user_nome` VARCHAR(100), IN `user_email` VARCHAR(255), IN `user_password` VARCHAR(32), IN `user_tipo` VARCHAR(3))
INSERT INTO utilizador (nome,email,password,tipo) VALUES(user_nome,user_email,user_password,user_tipo)$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_ronda`(IN `id_utilizador` INT)
SELECT utilizador.nome, ronda.idUtilizador, ronda.diaSemana, ronda.horaRonda FROM utilizador, ronda
WHERE ronda.idUtilizador = id_utilizador AND ronda.idUtilizador = utilizador.idUtilizador$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_ronda_extra`(IN `id_utilizador` INT)
SELECT utilizador.nome, rondaextra.idUtilizador, rondaextra.diaSemana, rondaextra.hora FROM utilizador, rondaextra
WHERE rondaextra.idUtilizador = id_utilizador AND rondaextra.idUtilizador = utilizador.idUtilizador$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_user`(IN `id_utilizador` INT)
SELECT * FROM utilizador WHERE idUtilizador = id_utilizador$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_password`(IN `id_utilizador` INT, INOUT `update_password` VARCHAR(32))
UPDATE utilizador SET
password = update_password
WHERE utilizador.idUtilizador = id_utilizador$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_ronda`(INOUT `id_utilizador` INT, INOUT `update_data` DATE, IN `update_hora` TIME)
UPDATE ronda SET
diaSemana = update_data,
horaRonda = update_hora
WHERE ronda.idUtilizador = id_utilizador$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_ronda_extra`(IN `id_utilizador` INT, IN `update_data` DATE, IN `update_hora` TIME)
UPDATE rondaextra SET
diaSemana = update_data,
hora = update_hora
WHERE rondaextra.idUtilizador = id_utilizador$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_user`(IN `user_id` INT, INOUT `user_nome` VARCHAR(100), INOUT `user_email` VARCHAR(255))
UPDATE utilizador SET
utilizador.nome=user_nome,
utilizador.email=user_email
WHERE utilizador.idUtilizador=user_id$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_user_all`(IN `user_id` INT, INOUT `update_nome` VARCHAR(100), INOUT `update_email` VARCHAR(255), INOUT `update_password` VARCHAR(32))
UPDATE utilizador SET
nome=update_nome,
email=update_email,
password=update_password
WHERE utilizador.idUtilizador = user_id$$
DELIMITER ;
