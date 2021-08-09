-- Find the business and the review_text that received the highest number of  'cool' votes.
-- Output the business name along with the review text.

-- Notes
-- - subquery to return the maximum number of cool votes. 
-- - return the rows where the number of cool votes is the same as the number returned in subquery.

SELECT business_name, review_text FROM yelp_reviews
WHERE cool IN 
(SELECT MAX(cool) FROM yelp_reviews);