use world;

-- 1
select * from city where countrycode = 'USA'
limit 10;

-- 2
select c.id, c.district, co.name as country, c.population from city c
join country co 
on co.code = c.countrycode
order by population desc;

-- 3
select c.countrycode, c.name, cl.language, cl.isofficial, cl.percentage
from city c
join countrylanguage cl
	on c.countrycode = cl.countrycode
where cl.language = 'english' and cl.isofficial ='T'
group by c.countrycode
order by percentage desc
limit 10;

-- 4
select * from city;
select * from country;
select * from countrylanguage;

select c.name, co.population, (co.gnp /co.population) as GNPpercapita,
c.id as IbuKota, c.population as PendudukIbuKota from city c
join country co 
	on c.countrycode = co.code
where co.continent = 'Asia'
group by c.countrycode
order by GNPpercapita desc
limit 10;

-- 5
select Name, Continent, LifeExpectancy, GNP from country
where continent = 'Asia' and LifeExpectancy > (select avg(LifeExpectancy) from country where continent = 'Europe')
order by LifeExpectancy desc
limit 10;

-- 1.2
-- 1
select name as country_name, region, indepyear as indepyear from country
where continent = 'Asia' and indepyear between -3000 and 2020
order by indepyear asc
limit 3;
-- kalo gapake kondisi between yang keluar palestine dll
-- dan data tersebut mengandung null dalam tabel kemerdekaannya

-- 2
select name as country_name, ((co.gnp - co.gnpold)/co.gnpold) as GNP_growth
from country co
where continent = 'Europe'
order by GNP_growth desc
limit 3;

-- 3
select * from country;
select co.name as country_name, co.surfacearea, cl.language, cl.isofficial
from country co
join countrylanguage cl
	on co.code = cl.countrycode
where cl.language = 'English' and cl.isofficial = 'T' and co.surfacearea > (select avg(surfacearea) from country where continent = 'Europe')
limit 4;

select * from city

