/* List countries and it corresponding average invoice amount,
which have the amount greater than the average amount of total invoices. */

select co.country_name, count(inv.invoice_number), round(avg(inv.total_price),6)
from country co
join city ci on co.id = ci.country_id
join customer cu on cu.city_id = ci.id
join invoice inv on inv.customer_id = cu.id
group by co.country_name
having avg(inv.total_price) > (select avg(total_price) from invoice);