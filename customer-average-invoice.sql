/* List customers and their corresponding money spent on purchases,
who have purchased amounts 25% or less than the average amount of total invoices.
Display the amounts purchased in 6 decimal places. */

select c.customer_name, cast(i.total_price as decimal(12,6))
from customer c
join invoice i on i.customer_id = c.id
where i.total_price <= (select (avg(total_price)*0.25) from invoice)
order by i.total_price desc;