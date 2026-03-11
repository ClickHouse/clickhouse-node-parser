SELECT
    status,
    count() AS all
FROM test ARRAY JOIN nested as nestedJoined
WHERE (status IN (
    SELECT status
    FROM test ARRAY JOIN nested as nestedJoined
    GROUP BY status 
    ORDER BY count() DESC 
    LIMIT 10)) AND (id IN ('1', '2'))
GROUP BY CUBE(status)
LIMIT 100;
