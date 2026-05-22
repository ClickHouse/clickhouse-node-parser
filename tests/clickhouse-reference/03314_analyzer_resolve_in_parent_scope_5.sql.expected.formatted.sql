WITH query_1 AS (
    WITH shared_data AS (
        SELECT 1 AS value
    ),

    shared_data_2 AS (
        SELECT *
        FROM shared_data
    )

    SELECT *
    FROM shared_data_2
),

shared_data AS (
    SELECT *
    FROM query_1
)

SELECT *
FROM shared_data AS s;