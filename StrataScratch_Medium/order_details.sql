-- Find order details made by Jill and Eva.
-- Consider the Jill and Eva as first names of customers.
-- Output the order date, details and cost along with the first name.
-- Order records based on the customer id in ascending order.

-- Notes
-- - join the custoemr id column from both tables. 
-- - select columns of rows where first name is Jill or Eva. 

SELECT first_name, order_date, order_details, order_cost FROM customers AS c
LEFT JOIN orders AS o 
ON c.id = o.cust_id
WHERE first_name IN ('Jill', 'Eva')
ORDER BY c.id;
