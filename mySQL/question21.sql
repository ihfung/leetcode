select round(avg(order_date = customer_pref_delivery_date) * 100, 2) as immediate_percentage  -- round to 2 decimal places and the avg of order date which is customer prefer delivery date
from 
(select customer_id, 
min(order_date) as order_date, 
min(customer_pref_delivery_date) as customer_pref_delivery_date 
from Delivery 
group by customer_id )  --this select statement is used to get the customer_id, order_date and customer_pref_delivery_date from the Delivery table and group by customer_id
as first_orders; --alias name for the select statement is first_orders


