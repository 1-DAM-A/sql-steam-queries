--31. Toda la información del juego con menor nota, siempre que sea mayor a cero
SELECT *
FROM juegos
WHERE Metacritic = (SELECT MIN(Metacritic) FROM juegos WHERE Metacritic > 0);

--32. Juegos con mayor nota que la media
SELECT *
FROM juegos
WHERE Metacritic > (SELECT AVG(Metacritic) FROM juegos);

--33. Juego con mayor nota del año 2008
SELECT *
FROM juegos
WHERE ReleaseDate = '2008'
  AND Metacritic = (SELECT MAX(Metacritic) FROM juegos WHERE ReleaseDate = '2008');

--34. Toda la información de los juegos que valgan más que la media
SELECT *
FROM juegos
WHERE PriceFinal > (SELECT AVG(PriceFinal) FROM juegos);

--35. Toda la información de los juegos de Linux que tengan el mayor número de logros (achievements)
SELECT *
FROM juegos
WHERE PlatformLinux = 'True'
  AND AchievementCount = (SELECT MAX(AchievementCount)
                          FROM juegos
                          WHERE PlatformLinux = 'True');