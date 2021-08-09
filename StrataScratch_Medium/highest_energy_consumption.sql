-- Find the date with the highest total energy consumption from the Facebook data centers. 
-- Output the date along with the total energy consumption across all data centers.

-- SOLUTION 1
-- Notes
-- - create cte: 
--     - union all tables to create a list without creating new columns
--     - group by date
--     - select the date and the sum of the consumption
-- - select statement
--     - create subquery returning the max of the total consumption
--     - select date and total consumption where the total consumption is equal to the value 
--       returned in the subquery. 

WITH cte AS (
    SELECT date, SUM(consumption) AS total_consumption FROM (
        SELECT * FROM fb_eu_energy
        UNION
        SELECT * FROM fb_asia_energy
        UNION
        SELECT * FROM fb_na_energy) AS fb_all_energy
    GROUP BY date
)

SELECT date, total_consumption FROM cte
WHERE total_consumption = 
(SELECT MAX(total_consumption) FROM cte);

-- SOLUTION 2
-- Notes
-- - create cte
--     - union all tables, and group by date
--     - select the date, sum of conusmption and use the window function dense_rank to return the 
--       rank according to the total consumption. 
-- - select statement
--     - select the date and total consumption where the ranking is equal to 1. 

WITH cte AS (
    SELECT date, SUM(consumption) AS total_consumption, 
    dense_rank() OVER (ORDER BY SUM(consumption)) AS ranking FROM (
        SELECT * FROM fb_eu_energy
        UNION 
        SELECT * FROM fb_asia_energy
        UNION
        SELECT * FROM fb_na_energy) AS fb_total_energy
        GROUP BY date
)

SELECT date, total_consumption FROM cte 
WHERE ranking = 1; 