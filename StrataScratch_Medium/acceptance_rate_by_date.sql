-- What is the overall friend acceptance rate by date? Your output should have the rate of 
-- acceptances by the date the request was sent. Order by the earliest date to latest.

-- Assume that each friend request starts by a user sending (i.e., user_id_sender) a friend 
-- request to another user (i.e., user_id_receiver) that's logged in the table with action = 'sent'. 
-- If the request is accepted, the table logs action = 'accepted'. If the request is not accepted, 
-- no record of action = 'accepted' is logged.

-- Notes
-- - subquery to create table consisting of sent and another table consisting of accepted. 
-- - left join on user id. 
-- - select date, count(accepted)/count(sent).

SELECT ffr_sent.date, COUNT(ffr_accepted.*)/COUNT(ffr_sent.*)::FLOAT AS acceptance_rate FROM
(SELECT * FROM fb_friend_requests WHERE action = 'sent') AS ffr_sent
LEFT JOIN 
(SELECT * FROM fb_friend_requests WHERE action = 'accepted') AS ffr_accepted
ON ffr_sent.user_id_sender = ffr_accepted.user_id_sender AND 
ffr_sent.user_id_receiver = ffr_accepted.user_id_receiver
GROUP BY ffr_sent.date;