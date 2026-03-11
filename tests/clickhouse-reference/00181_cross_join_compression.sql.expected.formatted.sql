SELECT
    CounterID,
    StartURL
FROM
    unit
CROSS JOIN test.visits
ORDER BY (CounterID, StartURL) DESC
LIMIT 1000;