/* rental details for films with */
use sakila;
select f.title, c.first_name, c.last_name, datediff(d,r.rental_date,r.return_date) days, r.rental_date, r.return_date 

from 
rental r
join inventory i on r.inventory_id = i.inventory_id
join film f on i.film_id = f.film_id
join revenue_vw r_v on i.film_id = r_v.film_id
join customer c on r.customer_id = c.customer_id
where r_v.rentals < 6

order by title, rental_date