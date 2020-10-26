-- ==================================================
-- Version: 	1.0.0.0
-- Archivo: 	Admin_Check_General_Log.sql
-- ==================================================
-- Autor:	JAlberto-Coder
-- Fecha:	26-10-2020
-- Descripcion: Sentencias para habilidar la configuración para registro de log en MySQL
-- ==================================================
-- ACTIVAR CONFIGURACION GLOBAL PARA LOG
-- ==================================================
SET GLOBAL log_output = 'TABLE';
SET GLOBAL general_log = 'ON';

-- ==================================================
-- CONSULTAR EL LOG CON LA INFORMACION REGISTRADA
-- ==================================================
SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

SELECT event_time, user_host, thread_id, server_id, command_type, argument
FROM mysql.general_log
WHERE command_type = 'Query'
ORDER BY event_time DESC;

SELECT event_time, user_host, thread_id, server_id, command_type, argument
FROM mysql.general_log
WHERE command_type ='Query'
	AND argument LIKE '%DELETE%'
ORDER BY event_time DESC;