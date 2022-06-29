/* average total revenue for novies watched by customer*/
use sakila
--select * from revenue_vw;

select c.customer_id, avg(r_v.revenue) avg_revenue, COUNT(r.rental_id) no_rentals

from 

customer c
join rental r on c.customer_id = r.customer_id
join inventory i on r.inventory_id = i.inventory_id
join revenue_vw r_v on i.film_id = r_v.film_id

group by c.customer_id order by no_rentals asc

