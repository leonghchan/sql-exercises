-- You’re given a table of rental property searches by users. The table consists of search 
-- results and outputs host information for searchers. Find the minimum, average, maximum rental 
-- prices for each host’s popularity rating. The host’s popularity rating is defined as below:
--     0 reviews: New
--     1 to 5 reviews: Rising
--     6 to 15 reviews: Trending Up
--     16 to 40 reviews: Popular
--     more than 40 reviews: Hot

-- Notes
-- -craete cte
--     - craete host_id column based on criteria
--     - additional host_pop_rating column 
--     - row number column where duplicate rows are numbered, this allows us to select distinct rows
-- - select statement
--     - select rows where row number is 1 (removes duplicate rows)
--     - select the min, avg and max

WITH cte AS (
SELECT CONCAT(price, room_type, host_since, zipcode, number_of_reviews) AS host_id, 
    *,
    CASE 
        WHEN number_of_reviews = 0 THEN 'New'
        WHEN number_of_reviews BETWEEN 1 AND 5 THEN 'Rising'
        WHEN number_of_reviews BETWEEN 6 AND 15 THEN 'Trending Up'
        WHEN number_of_reviews BETWEEN 16 AND 40 THEN 'Popular'
        WHEN number_of_reviews > 40 THEN 'Hot'
        ELSE 'Other'
    END AS host_pop_rating,
    row_number() OVER (PARTITION BY CONCAT(price, room_type, host_since, zipcode, 
    number_of_reviews)) AS row_number 
FROM airbnb_host_searches),
cte_1 AS (
SELECT * FROM cte
WHERE row_number = 1
)

SELECT host_pop_rating, MIN(price) AS min_price, AVG(price) AS avg_price, MAX(price) AS max_price 
FROM cte_1
GROUP BY host_pop_rating