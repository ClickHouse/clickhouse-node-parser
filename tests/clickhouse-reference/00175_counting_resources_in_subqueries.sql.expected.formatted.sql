SELECT 1 = (
        SELECT count()
        FROM test.hits
        WHERE NOT ignore(AdvEngineID)
    );

SELECT 1 IN (
        SELECT count()
        FROM test.hits
        WHERE NOT ignore(AdvEngineID)
    );

SELECT count() IN (
        SELECT count()
        FROM test.hits
        WHERE NOT ignore(AdvEngineID)
    )
FROM test.hits
WHERE NOT ignore(AdvEngineID);

SELECT count()
FROM test.hits
WHERE CounterID > (
        SELECT count()
        FROM test.hits
        WHERE NOT ignore(AdvEngineID)
    );

SELECT count()
FROM test.hits
WHERE CounterID < (
        SELECT count()
        FROM test.hits
        WHERE NOT ignore(AdvEngineID)
    );