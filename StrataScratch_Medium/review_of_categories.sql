-- Find the top business categories based on the total number of reviews. Output the category 
-- along with the total number of reviews. Order by total reviews in descending order.

-- Notes
-- - separate the categories at ';', converting into an array. 
-- - unnest array so each element in the array becomes independent row. 
-- - group by category. 
-- - select the category and the total of the review count. 

SELECT UNNEST(STRING_TO_ARRAY(categories, ';')) AS category, 
SUM(review_count) AS total_reviews FROM yelp_business
GROUP BY category
ORDER BY total_reviews DESC;