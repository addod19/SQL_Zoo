-- 1. Observe the result of running this SQL command to show the name, continent and population of all countries.

SELECT name, continent, population FROM world

-- 2. Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros

SELECT name FROM world
WHERE population >= 200000000

-- 3. Give the name and the per capita GDP for those countries with a population of at least 200 million

SELECT name, gdp/population FROM world
WHERE population >= 200000000

-- 4. Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.

SELECT name, population/1000000 FROM world
WHERE continent = 'South America'

-- 5. Show the name and population for France, Germany, Italy

SELECT name, population FROM  world
WHERE name = 'France' or name = 'Germany' or name = 'Italy'

-- 6. Show the countries which have a name that includes the word 'United'

SELECT name FROM world
WHERE name LIKE 'United%'

-- 7. Show the countries that are big by area or big by population. Show name, population and area.

SELECT name, population, area FROM world
WHERE area > 3000000 OR population > 250000000

-- 8. Exclusive OR (XOR). Show the countries that are big by area or big by population but not both. Show name, population and area.

SELECT name, population, area FROM world
WHERE area > 3000000 XOR population > 250000000

-- 9. Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.

SELECT name, ROUND(population/1000000,2), ROUND(gdp/1000000000, 2)
FROM world
WHERE continent = 'South America';

-- 10. Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.

SELECT name, ROUND(gdp/population,-3)
FROM world
WHERE gdp >= 1000000000000;

-- 11. Show the name and capital where the name and the capital have the same number of characters.

SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH(capital);

-- 12. Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.

SELECT name, capital
FROM world
WHERE LEFT(name,1) = LEFT(capital,1)
AND name <> capital;

/*13. Find the country that has all the vowels and no spaces in its name.

> You can use the phrase name NOT LIKE '%a%' to exclude characters from your results.
> The query shown misses countries like Bahamas and Belarus because they contain at least one 'a'
*/

SELECT name 
FROM world 
WHERE name LIKE '%a%' AND name LIKE '%e%' 
AND name LIKE '%i%' AND name LIKE '%o%' 
AND name LIKE '%u%' AND name NOT LIKE '% %';