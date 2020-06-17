select cust_id, order_num
from orders
where year(order_date) = 2005 and month(order_date) = 9;