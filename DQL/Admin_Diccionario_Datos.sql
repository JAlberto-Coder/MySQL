-- ==================================================
-- Version:		1.0.0.0
-- Archivo:		Admin_Diccionario_Datos.sql
-- ==================================================
-- Autor:		JAlberto-Coder
-- Fecha:		29-09-2020
-- Descripcion: Script que contiene una sentencia para generar un diccionario de datos simple, por una base de datos
-- ==================================================
SET @base_datos := 'developer';

SELECT T.TABLE_SCHEMA AS Base_De_Datos
	, T.TABLE_NAME AS Tabla_Nombre
    , T.TABLE_COMMENT AS Tabla_Descripcion
	, C.COLUMN_NAME AS Columna_Nombre
    , C.DATA_TYPE AS Columna_Tipo_Dato
    , IFNULL(C.NUMERIC_PRECISION, C.CHARACTER_MAXIMUM_LENGTH) AS Columna_Longitud
	, C.COLUMN_DEFAULT AS Columna_Valor_Defecto
    , C.IS_NULLABLE AS Columna_Es_Nulo
    , C.COLUMN_KEY AS Columna_Llave
    , C.COLUMN_COMMENT AS Columna_Descripcion
FROM information_schema.TABLES T 
INNER JOIN information_schema.COLUMNS C ON T.TABLE_NAME = C.TABLE_NAME 
WHERE T.TABLE_SCHEMA = @base_datos
ORDER BY T.TABLE_NAME, C.ORDINAL_POSITION;