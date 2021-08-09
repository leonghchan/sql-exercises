-- You're given a dataset of health inspections. Count the number of inspections that resulted in 
-- a violation for 'Roxanne Cafe' for each year. If an inspection resulted in a violation, there 
-- will be a value in the 'violation_id' column. Output the number of inspections by year in 
-- ascending order.

-- Notes
-- - use EXTRACT() to obtain the year from the inspection date. 
-- - select rows according to conditions (violation id is not null and business name is Roxanne cafe).

SELECT EXTRACT(YEAR FROM inspection_date) AS year, 
COUNT(*) AS n_inspections FROM sf_restaurant_health_violations
WHERE business_name = 'Roxanne Cafe'
AND violation_id IS NOT NULL 
GROUP BY year
ORDER BY year DESC;