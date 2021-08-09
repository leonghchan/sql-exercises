-- Calculate each user's average session time. A session is defined as the time difference between a 
-- page_load and page_exit. For simplicity, assume an user has only 1 session per day and if there 
-- are multiple of the same events in that day, consider only the latest page_load and earliest 
-- page_exit. Output the user_id and their average session time.

-- Notes
-- - create cte 
--     - using max, min and case when functions to get columns with the latest page 
--       load and earliest exit time. 
--     - use group by user id and timestamp
-- - select statement
--     - return the user id and the average time difference between earliest page exit and latest 
--       page load 
--     - only return rows where the average time is not null (one user didn't have exit time)

WITH cte AS (
    SELECT user_id, timestamp::date,
    MAX(CASE WHEN action = 'page_load' THEN timestamp 
    ELSE END) AS latest_page_load, 
    MIN(CASE WHEN action = 'page_exit' THEN timestamp
    ELSE END) AS earliest_page_exit
    FROM facebook_web_log
    GROUP BY 1, 2
)

SELECT * FROM 
(SELECT user_id, AVG(earliest_page_exit - latest_page_load) AS average_time FROM cte) AS df
WHERE average_time IS NOT NULL;