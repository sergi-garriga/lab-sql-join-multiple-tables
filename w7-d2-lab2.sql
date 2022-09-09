use sakila;


-- Write a query to display for each store its store ID, city, and country.
select * from store; -- s table A
select * from address; -- a table B
select * from city; -- c table C
select * from country; -- co table D

select s.store_id, c.city, co.country
from store s
left join address a using(address_id)
left join city c using(city_id)
left join country co using(country_id);



-- Write a query to display how much business, in dollars, each store brought in.
select * from staff; -- s table A
select * from rental; -- r table B
select * from payment; -- p table C

select s.store_id, sum(amount)
from staff s
left join rental r using(staff_id)
left join payment p using(rental_id)
group by store_id;



-- What is the average running time of films by category?
select * from film; -- f 
select * from film_category; -- fc
select * from category; -- c

select c.name, round(avg(f.length), 2) as 'average length'
from film f
left join film_category fc using(film_id)
left join category c using(category_id)
group by name;



-- Which film categories are longest?
select c.name, round(avg(f.length), 2) as 'average length'
from film f
left join film_category fc using(film_id)
left join category c using(category_id)
group by name
order by avg(f.length) desc;



-- Display the most frequently rented movies in descending order.
select * from rental; -- r
select * from inventory; -- i 
select * from film; -- f

select f.title, count(rental_id)
from rental r
left join inventory i using(inventory_id)
left join film f using(film_id)
group by title
order by count(rental_id) desc;



-- List the top five genres in gross revenue in descending order.
select * from payment; -- p
select * from rental; -- r
select * from inventory; -- i
select * from film_category; -- fc
select * from category; -- c

select c.name, sum(p.amount) as 'total gross revenue'
from payment p
left join rental r using(rental_id)
left join inventory i using(inventory_id)
left join film_category fc using(film_id)
left join category c using(category_id)
group by name
order by sum(p.amount) desc
limit 5;



-- Is "Academy Dinosaur" available for rent from Store 1?


-- not sure about how to do that...
-- the answer is yes




