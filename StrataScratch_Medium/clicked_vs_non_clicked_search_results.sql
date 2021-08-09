-- The 'position' column represents the position of the search results, and 'has_clicked' column represents whether the user 
-- has clicked on this result. Calculate the percentage of clicked search results, compared to 
-- those not clicked, that were in the top 3 positions (with respect to total number of records)

-- SOLUTION 1
-- Notes
-- - subquery returning table with two additional columns, indicating whether each search result
--   is clicked or not. 
-- - use select count(clicked)/count(*)*100 to find the percentage.

SELECT (COUNT(clicked_yes)/COUNT(*)::FLOAT)*100 AS top_3_clicked,
(COUNT(clicked_no)/COUNT(*)::FLOAT)*100 AS top_3_not_clicked
FROM 
(SELECT *, 
(CASE WHEN has_clicked = 'yes' AND position <= 3 THEN 1 ELSE NULL END) AS clicked_yes,
(CASE WHEN has_clicked = 'no' AND position <= 3 THEN 1 ELSE NULL END) AS clicked_no
FROM fb_search_events
) AS clicked_count;

-- SOLUTION 2
-- Notes
-- - create top_3_clicked and top_3_not_clicked columns. 
-- - use case when to create above columns. this returns 1 and 0 according to conditions. 
-- - find AVG of the CASE WHEN and multiply by 100 to find the percentage. 

SELECT 
AVG(CASE WHEN has_clicked = 'yes' AND position <= 3 THEN 1 ELSE 0 END) AS top_3_clicked,
AVG(CASE WHEN has_clicked = 'no' AND position <=3 THEN 1 ELSE 0 END) AS top_3_not_clicked
FROM fb_search_events;