USE olympics_data;

-- Preview of Olympics data from 1896 to 2016 --
SELECT * FROM olympics LIMIT 10;

-- 01. How many olympics games have been held? --
SELECT COUNT(DISTINCT(games)) AS Total_games
FROM olympics;

-- 02. List all olympics games held so far --
SELECT DISTINCT(games) AS olympics_games
FROM olympics
ORDER BY games;

-- OR --

SELECT DISTINCT(year),(season)
FROM olympics
ORDER BY year;

-- 03. no of different nations participated in olympics so far -- 
SELECT COUNT(DISTINCT(noc)) AS total_nations
FROM olympics;

SELECT o.games,COUNT(DISTINCT(o.noc)) AS total_countries_per_olympic
FROM olympics o, regions r
WHERE o.noc=r.noc
GROUP BY games
ORDER BY games;

-- 04. Total no of peoples which holds olympic medal so far --
SELECT COUNT(DISTINCT(player_id)) AS total_medal_holders
FROM olympics;

-- 05. Different sports played so far  --
SELECT DISTINCT(sport) AS diff_sports
FROM olympics
ORDER BY sport;

SELECT COUNT(DISTINCT(sport)) AS no_diff_sports
FROM olympics;

 -- 06. Which Sports were just played only once in the olympics --
SELECT sport, COUNT(games) AS no_diff_games
FROM olympics
GROUP BY sport
HAVING no_diff_games =1;

-- 07. Fetch the total no of sports played in each olympic games. --
SELECT games, COUNT(DISTINCT(sport)) AS no_sports_per_oly
FROM olympics
GROUP BY games
ORDER BY no_sports_per_oly DESC;
 
-- 08. Fetch oldest athletes to win a gold medal --
SELECT *
FROM(
	SELECT *,
    RANK() OVER (ORDER BY age DESC) AS rnk
    FROM olympics 
    WHERE medal = "Gold"
) AS x
WHERE rnk = 1;


-- 09. List down total gold, silver and bronze medals won by each country --
SELECT region as country,
	COUNT(CASE WHEN medal= "gold" THEN "gold" END )AS Gold_medal,
    COUNT(CASE WHEN medal= "silver" THEN "silver" END )AS silver_medal,
    COUNT(CASE WHEN medal= "bronze" THEN "bronze" END )AS bronze_medal
FROM olympics AS o, regions AS r 
WHERE o.noc= r.noc 
GROUP BY region
ORDER BY 2 DESC;

-- 10. List down total gold, silver and bronze medals won by India --
SELECT team as country,
	COUNT(CASE WHEN medal= "gold" THEN "gold" END )AS Gold_medal,
    COUNT(CASE WHEN medal= "silver" THEN "silver" END )AS silver_medal,
    COUNT(CASE WHEN medal= "bronze" THEN "bronze" END )AS bronze_medal
FROM olympics
WHERE team = "India"
GROUP BY team;
 
-- 11. In which Sport/event, India has won highest medals --
SELECT COUNT(medal) as india_medal, team, sport
FROM olympics 
GROUP BY sport, team
HAVING team = "India"
ORDER BY india_medal DESC;

-- 12. Total no of Indian athletes played in olympics so far --
SELECT COUNT(DISTINCT(player_id)) AS Indian_athlete, team
FROM olympics
GROUP BY team
HAVING team = "India";












