-- Find the highest target achieved by the employee or employees who works under the manager id 13. 
-- Output the first name of the employee and target achieved. The solution should show the highest 
-- target achieved under manager_id=13 and which employee(s) achieved it.

-- SOLUTION 1
-- Notes
-- - create cte with only rows with manager_id = 13. 
-- - create subquery returning the maximum target.
-- - select rows where target is equal to value returned from subquery.

WITH cte AS (
    SELECT * FROM salesforce_employees
    WHERE manager_id = 13
)

SELECT first_name, target FROM cte
WHERE target = 
(SELECT MAX(target) FROM cte);

-- SOLUTION 2
-- - create subquery returning maximum target for employees with manager_id = 13. 
-- - select rows where manager_id = 13 and target equal to value returned in subquery. 

SELECT first_name, target FROM salesforce_employees
WHERE manager_id = 13 AND target = 
(SELECT MAX(target) FROM salesforce_employees
WHERE manager_id = 13 AND );

