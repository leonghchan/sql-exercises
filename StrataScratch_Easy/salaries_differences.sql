-- Write a query that calculates the difference between the highest salaries found in the 
-- marketing and engineering departments. Output just the difference in salaries.


WITH max_df AS (
SELECT department, MAX(salary) AS max_salary FROM db_employee AS e
INNER JOIN db_dept AS d
ON e.department_id = d.id
GROUP BY department
)

SELECT
(SELECT max_salary FROM max_df
WHERE department = 'marketing') -
(SELECT max_salary FROM max_df
WHERE department = 'engineering') AS salary_difference;