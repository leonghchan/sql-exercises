-- Find the titles of workers that earn the highest salaries. Output the highest-paid titles.

-- SOLUTION 1
-- - subquery to find the maximum salary.
-- - select worker titles with salary in the result returned from subquery. 

SELECT worker_title FROM worker AS w 
LEFT JOIN title AS t 
on w.worker_id = t.worker_ref_id
WHERE salary IN 
(SELECT MAX(salary) FROM title);

-- SOLUTION 2
-- - create cte with the rank of the ordered salary.
-- - select worker_title where rank is 1 from the cte. 

WITH cte AS (
    SELECT *, dense_rank() OVER (ORDER BY salary DESC) AS rank FROM worker
)

SELECT worker_title FROM cte
WHERE rank = 1;