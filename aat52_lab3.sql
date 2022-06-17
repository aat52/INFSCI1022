USE world;
/*query for city, country, district, and population*/
SELECT ci.Name AS CityName, co.Name AS CountryName, 
	ci.District, ci.Population AS CityPopulation, co.Population AS CountryPopulation
FROM world.city AS ci JOIN world.country AS co
ON ci.CountryCode = co.Code
ORDER BY co.Population DESC
LIMIT 3;

/*query for country in the Middle East region that has the lowest life expectancy*/
SELECT Name AS CountryName, MIN(LifeExpectancy) AS MinLifeExpectancy
FROM world.country
WHERE Region = 'Middle East'
GROUP BY Name
ORDER BY MinLifeExpectancy LIMIT 1;

/*query for combined GNP of all countries in the Caribbean*/
SELECT SUM(GNP) AS CaribbGNP
FROM world.country
WHERE Region = 'Caribbean';

/*query for list of every country in Western Europe where the primary language is French*/
SELECT co.Name
FROM world.country AS co JOIN world.countrylanguage AS lang
ON co.Code = lang.CountryCode
WHERE Region = 'Western Europe' AND Language = 'French'  AND isOfficial = 'T';

/*query to produce a list of every city in Madagascar whose name begins with letter ‘A’*/
SELECT co.Name AS CountryName, ci.Name AS CityName
FROM world.city AS ci JOIN world.country AS co
ON ci.CountryCode = co.Code
WHERE co.Name = 'Madagascar' AND ci.Name LIKE 'A%';

