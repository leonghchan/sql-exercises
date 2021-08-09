-- Calculate the total revenue from each customer in March 2019. Revenue for each order is 
-- calculated by multiplying the order_quantity with the order_cost.
-- Output the revenue along with the customer id and sort the results based on the revenue in 
-- descending order.

Notes
- select customer id and the sum of the revenue (order cost * order quanity). 
- only select rows within the march 2019 period. 
- group by customer id and order by revenue. 

SELECT cust_id AS customer_id, SUM(order_quantity*order_cost) AS total_revenue FROM orders 
WHERE order_date >= '2019-03-01' AND order_date < '2019-04-01'
GROUP BY cust_id 
ORDER BY total_revenue DESC;