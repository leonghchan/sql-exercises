-- Find the employee with the highest salary per department.
-- Output the department name, employee's first name along with the corresponding salary.

-- Notes
-- - create cte with additional column ranking (by salary) for each department using partition over.
-- - select rows where the salary is equal to ranking 1 (highest ranked salary for that departmet).

WITH cte AS (
    SELECT department, first_name, salary, dense_rank() OVER (PARTITION BY department 
    ORDER BY salary DESC) AS ranking FROM employee
)

SELECT department, first_name, salary FROM cte 
WHERE ranking = 1;