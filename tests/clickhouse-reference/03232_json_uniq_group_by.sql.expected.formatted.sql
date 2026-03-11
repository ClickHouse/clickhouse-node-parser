SELECT uniqExact(json)
FROM test;

SELECT
    count(),
    json
FROM test
GROUP BY json
ORDER BY toString(json) ASC;