create database olympics_data;
use olympics_data;

CREATE TABLE  OLYMPICS
(
id  INT,
name    text,
sex      text,
    age       int,
    height     int,
    weight      int,
    team       text,
    noc         text,
    games       text,
    year        text,
    season      text,
    city        text,
    sport       text,
    event      text,
    medal      text
);

CREATE TABLE REGIONS
(
    noc        text,
    region  text
   );


SELECT * FROM olympics LIMIT 10;

SELECT * FROM regions LIMIT 10;

-- update schema id to player_id because it represent particular player not row --
ALTER TABLE olympics
CHANGE id player_id INT;

-- update schema to add id column as primary key --
ALTER TABLE olympics
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY;

