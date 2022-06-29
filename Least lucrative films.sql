use sakila

select top 20 f.title, sum(p.amount) revenue, count(p.amount) rentals from rental r 
join payment p on r.rental_id = p.rental_id 
join inventory i on r.inventory_id = i.inventory_id
join film f on f.film_id = i.film_id
group by f.title order by revenue asc;