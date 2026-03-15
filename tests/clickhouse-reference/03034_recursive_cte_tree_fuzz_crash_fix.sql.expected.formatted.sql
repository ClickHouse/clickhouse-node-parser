SET enable_analyzer = 1;

SET enable_global_with_statement = 1;

SET session_timezone = 'Etc/UTC';

CREATE TABLE department__fuzz_1
(
    id DateTime,
    parent_department UInt128,
    name String
)
ENGINE = TinyLog;

CREATE TABLE department__fuzz_3
(
    id Date,
    parent_department UInt128,
    name LowCardinality(String)
)
ENGINE = TinyLog;

SELECT *
FROM (
        WITH q AS (
            SELECT *
            FROM department__fuzz_3
            UNION ALL
(            WITH x AS (
                SELECT *
                FROM department__fuzz_1
                UNION ALL
(                SELECT *
                FROM q
                UNION ALL
                SELECT *
                FROM x)
            )

            SELECT *
            FROM x)
        )

        SELECT *
        FROM q
        LIMIT 32
    )
ORDER BY
    id ASC,
    parent_department DESC,
    name ASC;