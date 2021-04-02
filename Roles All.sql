/*Drops and Double Drops*/
DROP ROLE IF EXISTS 'Administrador';
DROP ROLE IF EXISTS 'Seguranca';
DROP ROLE IF EXISTS 'ChefeSeguranca';
DROP ROLE IF EXISTS 'Sensor';
DROP ROLE IF EXISTS 'Diretor';
DROP ROLE IF EXISTS 'Auditor';
DROP ROLE IF EXISTS 'Sistema';

DROP USER IF EXISTS 'Sensor1'@'localhost';
DROP USER IF EXISTS 'Admin1'@'localhost';
DROP USER IF EXISTS 'Seguranca1'@'localhost';
DROP USER IF EXISTS 'ChefeSeguranca1'@'localhost';
DROP USER IF EXISTS 'Diretor1'@'localhost';
DROP USER IF EXISTS 'Auditor1'@'localhost';
DROP USER IF EXISTS 'Sistema1'@'localhost';


/*Grants especificas do Android*/
DROP ROLE IF EXISTS 'Administrador';
CREATE ROLE 'Administrador';
GRANT SELECT, INSERT, UPDATE, DELETE ON g1_origem.alerta TO Administrador;
GRANT SELECT, INSERT, UPDATE, DELETE ON g1_origem.medicaotemperatura TO Administrador;
GRANT SELECT, INSERT, UPDATE, DELETE ON g1_origem.medicaohumidade TO Administrador;

DROP ROLE IF EXISTS 'Seguranca';
CREATE ROLE 'Seguranca';
GRANT SELECT, INSERT, UPDATE, DELETE ON g1_origem.alerta TO Seguranca;
GRANT SELECT, INSERT, UPDATE, DELETE ON g1_origem.medicaotemperatura TO Seguranca;
GRANT SELECT, INSERT, UPDATE, DELETE ON g1_origem.medicaohumidade TO Seguranca;

DROP ROLE IF EXISTS 'ChefeSeguranca';
CREATE ROLE 'ChefeSeguranca';
GRANT SELECT, INSERT, UPDATE, DELETE ON g1_origem.alerta TO ChefeSeguranca;
GRANT SELECT, INSERT, UPDATE, DELETE ON g1_origem.medicaotemperatura TO ChefeSeguranca;
GRANT SELECT, INSERT, UPDATE, DELETE ON g1_origem.medicaohumidade TO ChefeSeguranca;

DROP ROLE IF EXISTS 'Sensor';
CREATE ROLE 'Sensor';
GRANT SELECT, INSERT ON g1_origem.alerta TO Sensor;
GRANT SELECT, INSERT ON g1_origem.medicaotemperatura TO Sensor;
GRANT SELECT, INSERT ON g1_origem.medicaohumidade TO Sensor;
GRANT SELECT, INSERT ON g1_origem.medicaoluminosidade TO Sensor;
GRANT SELECT, INSERT ON g1_origem.medicaomovimento TO Sensor;
GRANT SELECT ON g1_origem.ronda TO Sensor;
GRANT SELECT ON g1_origem.rondaextra TO Sensor;
GRANT SELECT ON g1_origem.sistema TO Sensor;

/*Grants relativas a outros elementos da bd*/
DROP ROLE IF EXISTS 'Diretor';
CREATE ROLE 'Diretor';

DROP ROLE IF EXISTS 'Auditor';
CREATE ROLE 'Auditor';

DROP ROLE IF EXISTS 'Sistema';
CREATE ROLE 'Sistema';


/*Base de Dados Origem*/
GRANT SELECT ON g1_origem.ronda to Seguranca;
GRANT SELECT, INSERT ON g1_origem.ronda to ChefeSeguranca;
GRANT SELECT ON g1_origem.ronda to Administrador;
GRANT SELECT ON g1_origem.ronda to Diretor;
GRANT SELECT ON g1_origem.ronda to Auditor;
GRANT SELECT ON g1_origem.ronda to Sistema;


GRANT SELECT ON g1_origem.rondaextra to Seguranca;
GRANT SELECT, INSERT ON g1_origem.rondaextra to ChefeSeguranca;
GRANT SELECT ON g1_origem.rondaextra to Administrador;
GRANT SELECT ON g1_origem.rondaextra to Diretor;
GRANT SELECT ON g1_origem.rondaextra to Auditor;
GRANT SELECT ON g1_origem.rondaextra to Sistema;


GRANT SELECT, INSERT ON g1_origem.sistema to Administrador;
GRANT SELECT ON g1_origem.sistema to Diretor;
GRANT SELECT ON g1_origem.sistema to Auditor;
GRANT SELECT ON g1_origem.sistema to Sistema;


GRANT SELECT, INSERT, UPDATE, DELETE ON g1_origem.utilizador to ChefeSeguranca;
GRANT SELECT, INSERT, UPDATE, DELETE ON g1_origem.utilizador to Administrador;
GRANT SELECT, INSERT, UPDATE, DELETE ON g1_origem.utilizador to Diretor;
GRANT SELECT ON g1_origem.utilizador to Auditor;
GRANT SELECT ON g1_origem.utilizador to Sistema;


GRANT SELECT ON g1_origem.log_ronda to Sistema;
GRANT SELECT ON g1_origem.log_ronda_extra to Sistema;
GRANT SELECT ON g1_origem.log_sistema to Sistema;
GRANT SELECT ON g1_origem.log_utilizador to Sistema;


/*Base de Dados de Destino*/
GRANT SELECT ON g1_destino.log_ronda to Auditor;
GRANT SELECT ON g1_destino.log_ronda_extra to Auditor;
GRANT SELECT ON g1_destino.log_sistema to Auditor;
GRANT SELECT ON g1_destino.log_utilizador to Auditor;

GRANT SELECT ON g1_destino.log_medicao_temperatura to Auditor;
GRANT SELECT ON g1_destino.log_medicao_humidade to Auditor;
GRANT SELECT ON g1_destino.log_medicao_luminosidade to Auditor;
GRANT SELECT ON g1_destino.log_medicao_movimento to Auditor;



GRANT SELECT ON g1_destino.log_ronda to Diretor;
GRANT SELECT ON g1_destino.log_ronda_extra to Diretor;
GRANT SELECT ON g1_destino.log_sistema to Diretor;
GRANT SELECT ON g1_destino.log_utilizador to Diretor;


GRANT SELECT, INSERT ON g1_destino.log_ronda to Sistema;
GRANT SELECT, INSERT ON g1_destino.log_ronda_extra to Sistema;
GRANT SELECT, INSERT ON g1_destino.log_sistema to Sistema;
GRANT SELECT, INSERT ON g1_destino.log_utilizador to Sistema;

/*Create Users*/
CREATE USER 'Sensor1'@'localhost' IDENTIFIED BY 'sensor1pass';
GRANT 'Sensor' TO 'Sensor1'@'localhost';
SET DEFAULT ROLE 'Sensor' FOR 'Sensor1'@'localhost';

CREATE USER 'Admin1'@'localhost' IDENTIFIED BY 'pass';
GRANT 'Administrador' TO 'Admin1'@'localhost';
SET DEFAULT ROLE 'Administrador' FOR 'Admin1'@'localhost';

CREATE USER 'Seguranca1'@'localhost' IDENTIFIED BY 'pass';
GRANT 'Seguranca' TO 'Seguranca1'@'localhost';
SET DEFAULT ROLE 'Seguranca' FOR 'Seguranca1'@'localhost';

CREATE USER 'ChefeSeguranca1'@'localhost' IDENTIFIED BY 'pass';
GRANT 'ChefeSeguranca' TO 'ChefeSeguranca1'@'localhost';
SET DEFAULT ROLE 'ChefeSeguranca' FOR 'ChefeSeguranca1'@'localhost';

CREATE USER 'Diretor1'@'localhost' IDENTIFIED BY 'pass';
GRANT 'Diretor' TO 'Diretor1'@'localhost';
SET DEFAULT ROLE 'Diretor' FOR 'Diretor1'@'localhost';

CREATE USER 'Auditor1'@'localhost' IDENTIFIED BY 'pass';
GRANT 'Auditor' TO 'Auditor1'@'localhost';
SET DEFAULT ROLE 'Auditor' FOR 'Auditor1'@'localhost';

CREATE USER 'Sistema1'@'localhost' IDENTIFIED BY 'pass';
GRANT 'Sistema' TO 'Sistema1'@'localhost';
SET DEFAULT ROLE 'Sistema' FOR 'Sistema1'@'localhost';

/*Debug*/
CREATE USER 'Alex'@'localhost' IDENTIFIED BY 'senha';
GRANT 'Administrador' TO 'Alex'@'localhost';
SET DEFAULT ROLE 'Administrador' FOR 'Alex'@'localhost';



/*Roles SP's*/
GRANT EXECUTE ON PROCEDURE g1_origem.insert_user TO ChefeSeguranca;
GRANT EXECUTE ON PROCEDURE g1_origem.insert_user TO Administrador;
GRANT EXECUTE ON PROCEDURE g1_origem.insert_user TO Diretor;
GRANT EXECUTE ON PROCEDURE g1_origem.insert_user TO Auditor;


GRANT EXECUTE ON PROCEDURE g1_origem.select_user TO ChefeSeguranca;
GRANT EXECUTE ON PROCEDURE g1_origem.select_user TO Administrador;
GRANT EXECUTE ON PROCEDURE g1_origem.select_user TO Diretor;
GRANT EXECUTE ON PROCEDURE g1_origem.select_user TO Auditor;


GRANT EXECUTE ON PROCEDURE g1_origem.update_user TO ChefeSeguranca;
GRANT EXECUTE ON PROCEDURE g1_origem.update_user TO Administrador;
GRANT EXECUTE ON PROCEDURE g1_origem.update_user TO Diretor;
GRANT EXECUTE ON PROCEDURE g1_origem.update_user TO Auditor;


GRANT EXECUTE ON PROCEDURE g1_origem.delete_user TO ChefeSeguranca;
GRANT EXECUTE ON PROCEDURE g1_origem.delete_user TO Administrador;
GRANT EXECUTE ON PROCEDURE g1_origem.delete_user TO Diretor;
GRANT EXECUTE ON PROCEDURE g1_origem.delete_user TO Auditor;


GRANT EXECUTE ON PROCEDURE g1_origem.update_user_all TO Administrador;
GRANT EXECUTE ON PROCEDURE g1_origem.update_user_all TO Diretor;
GRANT EXECUTE ON PROCEDURE g1_origem.update_user_all TO Auditor;


GRANT EXECUTE ON PROCEDURE g1_origem.update_password TO Seguranca;
GRANT EXECUTE ON PROCEDURE g1_origem.update_password TO ChefeSeguranca;
GRANT EXECUTE ON PROCEDURE g1_origem.update_password TO Administrador;
GRANT EXECUTE ON PROCEDURE g1_origem.update_password TO Diretor;
GRANT EXECUTE ON PROCEDURE g1_origem.update_password TO Auditor;


GRANT EXECUTE ON PROCEDURE g1_origem.insert_ronda TO ChefeSeguranca;


GRANT EXECUTE ON PROCEDURE g1_origem.select_ronda TO Seguranca;
GRANT EXECUTE ON PROCEDURE g1_origem.select_ronda TO ChefeSeguranca;


GRANT EXECUTE ON PROCEDURE g1_origem.update_ronda TO ChefeSeguranca;


GRANT EXECUTE ON PROCEDURE g1_origem.delete_ronda TO ChefeSeguranca;


GRANT EXECUTE ON PROCEDURE g1_origem.insert_ronda_extra TO ChefeSeguranca;


GRANT EXECUTE ON PROCEDURE g1_origem.select_ronda_extra TO Seguranca;
GRANT EXECUTE ON PROCEDURE g1_origem.select_ronda_extra TO ChefeSeguranca;


GRANT EXECUTE ON PROCEDURE g1_origem.update_ronda_extra TO ChefeSeguranca;


GRANT EXECUTE ON PROCEDURE g1_origem.delete_ronda_extra TO ChefeSeguranca;


GRANT EXECUTE ON PROCEDURE g1_origem.get_log_tables TO Administrador;
GRANT EXECUTE ON PROCEDURE g1_origem.get_log_tables TO Sistema;


GRANT EXECUTE ON PROCEDURE g1_origem.check_system TO Administrador;
GRANT EXECUTE ON PROCEDURE g1_origem.check_system TO Sistema;


GRANT EXECUTE ON PROCEDURE g1_origem.delete_old_data TO Administrador;
GRANT EXECUTE ON PROCEDURE g1_origem.delete_old_data TO Sistema;