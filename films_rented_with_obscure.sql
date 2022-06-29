/* customer rentals for customers who have rented obscure films */
use sakila

select c.first_name, c.last_name, f.title

from 

customer c
join rental r on c.customer_id = r.customer_id
join inventory i on r.inventory_id = i.inventory_id
join film f on i.film_id = f.film_id

where exists
(select 1 from rental r
join inventory i on r.inventory_id = i.inventory_id
join revenue_vw r_v on  i.film_id = r_v.film_id 
where r.customer_id = c.customer_id
and r_v.rentals <5)

order by c.customer_id asc

