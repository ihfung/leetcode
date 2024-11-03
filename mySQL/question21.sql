select round(100.0 * sum(case when first.order_date = first.customer_pref_delivery_date
then 1 else 0 end) / count(*), 2) as immediate_percentage
from (
select customer_id, delivery_id, order_date, customer_pref_delivery_date, 
row_number() over (partition by customer_id 
order by order_date) as rn
from delivery
) as first
where rn = 1;


