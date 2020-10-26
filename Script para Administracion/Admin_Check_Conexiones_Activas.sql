-- ==================================================
-- Version: 	1.0.0.0
-- Archivo:		Admin_Check_Conexiones_Activas.sql
-- ==================================================
-- Autor: 	JAlberto-Coder
-- Fecha:	23-10-2020
-- Descripcion: Sentencias SQL para detectar conexiones a la instancia de MySQL
-- ==================================================
-- MOSTRAR TODOS LOS PROCESOS CON COMANDO
-- ==================================================
SHOW PROCESSLIST;

-- ==================================================
-- ENCONTRAR SESIONES ACTIVAS
-- ==================================================
SELECT * 
FROM information_schema.PROCESSLIST
WHERE COMMAND <> 'Sleep';

-- ==================================================
-- EN CASO REQUERIDO MATAR CONEXIONES ACTIVAS
-- ==================================================
KILL CONNECTION 0; -- processid
