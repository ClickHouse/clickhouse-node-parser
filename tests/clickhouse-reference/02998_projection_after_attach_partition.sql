SELECT trimLeft(*) FROM (EXPLAIN SELECT * FROM visits_order_dst WHERE user_name='another_user2') where explain like '%ReadFromPreparedSource%' or explain like '%ReadFromMergeTree%';
