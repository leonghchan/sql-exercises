-- Find the top 5 states with the most 5 star businesses. Output the state name along with the 
-- number of 5-star businesses and order records by the number of 5-star businesses in descending 
-- order. In case there are two states with the same result, sort them in alphabetical order.

SELECT state, COUNT(*) FROM yelp_business
WHERE stars = 5
GROUP BY state
ORDER BY COUNT(*) DESC, state ASC
LIMIT 5;