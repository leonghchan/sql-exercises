-- Find the customer who has placed the highest number of orders. Output the id of the customer 
-- along with the corresponding number of orders.

-- Notes
-- - create cte with customer id and order count for each customer. 
-- - create subquery to find the maximum count of orders out of all customers. 
-- - select rows of customers whose total order is equal to result returned from subqeuery above. 

WITH cte AS (
    SELECT cust_id AS customer_id, COUNT(*) AS total_orders FROM orders
    GROUP BY cust_id
)

SELECT * FROM cte 
WHERE total_orders =
(SELECT MAX(total_orders) FROM cte);