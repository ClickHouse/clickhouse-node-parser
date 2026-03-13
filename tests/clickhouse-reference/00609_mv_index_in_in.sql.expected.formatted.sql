SELECT *
FROM test_mv_00609; -- OK

SELECT *
FROM test_mv_00609
WHERE a IN (
        SELECT a
        FROM test_mv_00609
    ); -- EMPTY (bug)

SELECT *
FROM `.inner_id.00000609-1000-4000-8000-000000000001`
WHERE a IN (
        SELECT a
        FROM test_mv_00609
    ); -- OK