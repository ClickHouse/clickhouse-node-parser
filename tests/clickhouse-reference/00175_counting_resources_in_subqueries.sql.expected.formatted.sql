SELECT 1 = (
        SELECT count()
        FROM test.hits
        WHERE NOT ignore(AdvEngineID)
    ); -- { serverError TOO_MANY_ROWS }

SELECT 1 IN (
        SELECT count()
        FROM test.hits
        WHERE NOT ignore(AdvEngineID)
    ); -- { serverError TOO_MANY_ROWS }

SELECT count() IN (
        SELECT count()
        FROM test.hits
        WHERE NOT ignore(AdvEngineID)
    )
FROM test.hits
WHERE NOT ignore(AdvEngineID); -- { serverError TOO_MANY_ROWS }

SELECT count()
FROM test.hits
WHERE CounterID > (
        SELECT count()
        FROM test.hits
        WHERE NOT ignore(AdvEngineID)
    ); -- { serverError TOO_MANY_ROWS }

SELECT count()
FROM test.hits
WHERE CounterID < (
        SELECT count()
        FROM test.hits
        WHERE NOT ignore(AdvEngineID)
    ); -- { serverError TOO_MANY_ROWS }