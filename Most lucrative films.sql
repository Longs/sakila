use sakila

select  r.inventory_id, sum(p.amount) total from rental r 
join payment p on r.rental_id = p.rental_id 
group by inventory_id order by total desc;