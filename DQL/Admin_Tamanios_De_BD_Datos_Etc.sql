-- ==================================================
-- Version: 	1.0.0
-- Archivo:		Admin_Tamanios_De_BD_Datos_Etc.sql
-- ==================================================
-- Autor:	JAlberto-Coder
-- Fecha: 	20-10-2020
-- Descripcion: Scripts para consultar valores importantes en las bases de datos
-- ==================================================
SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

-- ==================================================
-- CONSULTA EL TAMANIO DE CADA BASE DE DATOS EN MB
-- ==================================================
SELECT table_schema AS Base_De_Datos
	, ROUND(SUM(data_length + index_length) / 1024 / 1024, 1) AS Tamanio_MB
FROM information_schema.TABLES
GROUP BY table_schema
ORDER BY Tamanio_MB DESC;

-- ==================================================
-- CONSULTA A DETALLE DE CADA BASE DE DATOS
-- ==================================================
SELECT table_schema AS Base_De_Datos
	, COUNT(1) AS Total_Tablas
	, CONCAT(ROUND(SUM(table_rows)/1000000, 2), 'M') AS Total_Filas
	, CONCAT(ROUND(SUM(data_length)/(1024*1024*1024), 2), 'G') AS Total_Tamanio_GB
	, CONCAT(ROUND(SUM(index_length)/(1024*1024*1024), 2), 'G') AS Total_Tamanio_Index_GB
	, CONCAT(ROUND(SUM(data_length+index_length)/(1024*1024 * 1024), 2), 'G') Total_Tamanio
FROM information_schema.TABLES
GROUP BY table_schema
ORDER BY SUM(data_length+index_length)
DESC LIMIT 10;

-- ==================================================
-- CONSULTA DE ESPACIO OCUPADO Y ESPACIO LIBRE DE CADA BASE DE DATOS
-- ==================================================
SELECT table_schema AS Base_De_Datos
	,ROUND(SUM(data_length+index_length)/1024/1024,1) AS Espacio_Ocupado_MB
    ,ROUND(SUM(data_free )/1024/1024, 1) AS Espacio_Libre_MB
FROM information_schema.TABLES
GROUP BY table_schema
ORDER BY Espacio_Ocupado_MB DESC;

-- ==================================================
-- CONSULTA A BUFFER DEL SERVIDOR
-- ==================================================
SELECT CEILING(Total_InnoDB_Bytes*1.6/POWER(1024,3)) AS RIBPS 
FROM
(
	SELECT SUM(data_length+index_length) Total_InnoDB_Bytes
	FROM information_schema.TABLES
	WHERE engine = 'InnoDB'
) AS T;
