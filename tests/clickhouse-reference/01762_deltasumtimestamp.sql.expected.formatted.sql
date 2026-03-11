SELECT deltaSumTimestampMerge(state)
FROM (
        SELECT deltaSumTimestampState(value, timestamp) AS state
        FROM (
                SELECT
                    toDate(number) AS timestamp,
                    [4, 5, 5, 5][number - 4] AS value
                FROM numbers(5, 4)
            )
        UNION ALL
        SELECT deltaSumTimestampState(value, timestamp) AS state
        FROM (
                SELECT
                    toDate(number) AS timestamp,
                    [0, 4, 8, 3][number] AS value
                FROM numbers(1, 4)
            )
    );

SELECT deltaSumTimestampMerge(state)
FROM (
        SELECT deltaSumTimestampState(value, timestamp) AS state
        FROM (
                SELECT
                    number AS timestamp,
                    [0, 4, 8, 3][number] AS value
                FROM numbers(1, 4)
            )
        UNION ALL
        SELECT deltaSumTimestampState(value, timestamp) AS state
        FROM (
                SELECT
                    number AS timestamp,
                    [4, 5, 5, 5][number - 4] AS value
                FROM numbers(5, 4)
            )
    );

SELECT deltaSumTimestamp(value, timestamp)
FROM (
        SELECT
            toDateTime(number) AS timestamp,
            [0, 4, 8, 3][number] AS value
        FROM numbers(1, 4)
    );

SELECT deltaSumTimestamp(value, timestamp)
FROM (
        SELECT
            toDateTime(number) AS timestamp,
            [0, 4.5, 8, 3][number] AS value
        FROM numbers(1, 4)
    );

SELECT deltaSumTimestamp(value, timestamp)
FROM (
        SELECT
            number AS timestamp,
            [0, 4, 8, 3, 0, 0, 0, 1, 3, 5][number] AS value
        FROM numbers(1, 10)
    );