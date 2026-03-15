SELECT *
FROM (
        SELECT *
        FROM test
        SETTINGS enable_analyzer = 1
    ); -- { serverError INCORRECT_QUERY }

SELECT *
FROM (
        SELECT *
        FROM test
        SETTINGS enable_analyzer = 0
    ); -- { serverError INCORRECT_QUERY }