USE Sakila; 

-- Select all the actors with the first name ‘Scarlett’.
SELECT * FROM actor WHERE first_name = 'Scarlett'; 


-- How many physical copies of movies are available for rent in the store's inventory? 
SELECT distinct title, inventory_id as "inventory count" from film
inner join inventory on film.film_id = inventory.film_id
inner join store on inventory.store_id = store.store_id;

-- How many unique movie titles are available?
SELECT count(distinct title) from film;

-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT max(length) as "max_duration", min(length) as "min_duration" from film;

-- What's the average movie duration? expressed in format (hours, minutes)?
SELECT 
    avg(length) as "avg_duration",
    floor(avg(length)/60) as "hours",
    round(avg(length)%60) as "minutes"
from film;

-- How many distinct (different) actors' last names are there?
SELECT count(distinct last_name) from actor;

-- How many days was the company operating? Assume the last rental date was their closing date. (check DATEDIFF() function)
SELECT DATEDIFF(max(rental_date), min(rental_date)) as "days" from rental;

-- Show rental info with additional columns month and weekday. Get 20 results.
SELECT 
    rental_date,
    month(rental_date) as "month",
    dayname(rental_date) as "weekday"  
from rental
limit 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT 
    rental_date,
    dayname(rental_date) as "weekday",
    case 
        when dayname(rental_date) in ('Saturday', 'Sunday') then 'weekend'
        else 'workday'
    end as "day_type"
from rental

-- Get release years.
SELECT distinct title, release_year from film;

-- BONUS Get all films with ARMAGEDDON in the title.
SELECT title from film where title like '%ARMAGEDDON%';

-- BONUS Get all films which title ends with APOLLO.
SELECT title from film where title like '%APOLLO';

-- Get 10 the longest films.
SELECT title, length from film order by length desc limit 10;

-- How many films include Behind the Scenes content?
SELECT count(*) from film where special_features like '%Behind the Scenes%';

