-- Find employees who are earning more than their managers. Output the employee name along with 
-- the corresponding salary.

-- Notes
-- - join the employee table with itself on the manager id column with id. 
-- - select first name and salary of the rows where the salary of the employee is greater 
--     than the salary of the manager. 

SELECT first_name AS employee_name, salary AS employee_salary FROM employee AS e
LEFT JOIN employee AS m
ON e.manager_id = m.id
WHERE e.salary > m.salary; 