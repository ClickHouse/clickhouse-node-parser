SELECT * FROM (SELECT * FROM numbers(1e19)) AS t1, (SELECT * FROM numbers(1e19)) AS t2 WHERE t1.number IN (123, 456) AND t2.number = t1.number ORDER BY ALL;
