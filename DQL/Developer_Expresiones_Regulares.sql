-- =============================================
-- Version: 1.0.0.0
-- Archivo: Developer_Expresiones_Regulares.sql
-- =============================================
-- Autor: JAlberto-Coder
-- Fecha: 04-05-2019
-- Descripcion: Consultas aplicando REGEXP, esto nos srive para poder encontrar campos que puedes ser validos o no en base a una expresion regular, funcion especial para realizar una depuracion de datos
-- =============================================
-- NOTAS:
-- La expresiones a aplicar puedes ser tanto REGEXP o NOT REGEXP, dependiendo de lo que se desee buscar
-- Seleccionar todos los paises que no contienen números solo letras del abecedario y en minisculas
-- =============================================
SELECT *
FROM cat_paises
WHERE pais REGEXP '[a-z]';

-- Seleccionar todos los paises que comienzas con M
SELECT *
FROM cat_paises
WHERE pais REGEXP '^M';

-- Seleccionar todos los paises que terminan con co
SELECT * 
FROM cat_paises
WHERE pais REGEXP 'co$';