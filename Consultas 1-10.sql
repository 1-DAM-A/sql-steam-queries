-- 1.Listar todas las columnas de la tabla
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

-- 2. Listar los géneros distintos, sin duplicados

SELECT DISTINCT LTRIM(RTRIM(Genre)) AS Genero
FROM dbo.juegos
WHERE Genre IS NOT NULL AND LTRIM(RTRIM(Genre)) <> '';

-- 3. Juegos que solo se pueden jugar en Linux

SELECT Nombre, PlatformWindows, PlatformLinux, PlatformMac
FROM dbo.juegos
WHERE PlatformLinux = 'True'
  AND PlatformWindows = 'False'
  AND PlatformMac = 'False';

  -- 4.Juegos de rol, ordenados por nota

SELECT Nombre, Genre, Metacritic
FROM dbo.juegos
WHERE Genre LIKE '%RPG%'
ORDER BY Metacritic DESC;

-- 5. Juegos en español pero no en francés

SELECT Nombre, SupportedLanguages
FROM dbo.juegos
WHERE SupportedLanguages LIKE '%Spanish%'
  AND SupportedLanguages NOT LIKE '%French%';

  -- 6.Nombre, precio inicial, precio final y la diferencia en una nueva columna

SELECT 
    Nombre,
    PriceInitial AS PrecioInicial,
    PriceFinal AS PrecioFinal,
    ROUND(PriceInitial - PriceFinal, 2) AS Diferencia
FROM dbo.juegos;

--7. Cuántos juegos hay del siglo pasado

SELECT COUNT(*) AS TotalJuegosSigloPasado
FROM dbo.juegos
WHERE TRY_CAST(ReleaseDate AS INT) <= 2000;

-- 8.Juegos que terminen en N o en O

SELECT Nombre
FROM dbo.juegos
WHERE RTRIM(Nombre) LIKE '%[NO]';

--9.Juegos que empiecen por A y se puedan jugar con mando
SELECT Nombre, ControllerSupport
FROM dbo.juegos
WHERE Nombre LIKE 'A%'
  AND ControllerSupport = 'True';

--10.Juegos entre 2000 y 2010
SELECT Nombre, ReleaseDate
FROM dbo.juegos
WHERE TRY_CAST(ReleaseDate AS INT) BETWEEN 2000 AND 2010
ORDER BY TRY_CAST(ReleaseDate AS INT) ASC;