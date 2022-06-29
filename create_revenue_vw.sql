use sakila;
GO
IF OBJECT_ID('revenue_vw', 'V') IS NOT NULL
   DROP VIEW revenue_vw;
GO
create view revenue_vw(film_id,revenue,rentals)
as
select i.film_id, sum(p.amount) revenue, count(p.amount) rentals from rental r 
join payment p on r.rental_id = p.rental_id 
join inventory i on r.inventory_id = i.inventory_id
group by i.film_id;
go