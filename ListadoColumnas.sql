--Listar todas las columnas de la tabla
USE [steam];
GO

SELECT 
    COLUMN_NAME AS Columna,
    DATA_TYPE AS TipoDato,
    CHARACTER_MAXIMUM_LENGTH AS LongitudMaxima,
    IS_NULLABLE AS PermiteNulos
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_SCHEMA = 'dbo'
    AND TABLE_NAME = 'juegos'
ORDER BY 
    ORDINAL_POSITION;
