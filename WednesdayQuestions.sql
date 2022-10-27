-- 1.
select first_name, last_name, city_id
from address
inner join customer
on address.address_id = customer.address_id 
where postal_code like '75___';

--2. 
select first_name,last_name, payment_id
from payment
inner join customer
on payment.customer_id = customer.customer_id 
where amount > 6.99

3.
--select customer_id
--from payment 
--group by customer_id 
--having sum(amount)>175
--order by sum(amount) desc;

select store_id, first_name, last_name
from customer
where customer_id in (
	select customer_id 
	from payment 
	group by customer_id 
	having sum(amount) >175)
group by store_id , first_name, last_name ;

--4.
select first_name, last_name, city
from customer 
join address
on customer.address_id = address.address_id 
inner join city 
on address.city_id = city.city_id 
where country_id = 66

--5.
select email, count(rental_id) as value_occurrence
from staff 
inner join rental
on staff.staff_id = rental.staff_id 
group by email

-- 6. 
select rating, count(distinct title)
from film
inner join film_category 
on film.film_id = film_category.film_id 
group by rating

--7. 
select first_name, last_name, payment_id, amount
from payment
inner join customer
on payment.customer_id = customer.customer_id 
where amount in (
	select amount 
	from payment 
	group by amount 
	having amount >6.99)
group by first_name, last_name, payment_id, amount


--8. 
select count(amount) as value_occurrence from payment 
where amount = 0.00


