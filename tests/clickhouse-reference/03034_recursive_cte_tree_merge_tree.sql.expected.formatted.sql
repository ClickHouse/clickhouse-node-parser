-- { echoOn }
SET enable_analyzer = 1;

CREATE TABLE tree
(
    id UInt64,
    link Nullable(UInt64),
    data String
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT '--';

CREATE TABLE department
(
    id UInt64,
    parent_department UInt64,
    name String
)
ENGINE = MergeTree
ORDER BY tuple();

-- corner case in which sub-WITH gets initialized first
SELECT *
FROM (
        WITH q AS (
            SELECT *
            FROM department
            UNION ALL
(            WITH x AS (
                SELECT *
                FROM q
            )

            SELECT *
            FROM x)
        )

        SELECT *
        FROM q
        LIMIT 24
    )
ORDER BY
    id ASC,
    parent_department ASC,
    name ASC;

SELECT *
FROM (
        WITH q AS (
            SELECT *
            FROM department
            UNION ALL
(            WITH x AS (
                SELECT *
                FROM department
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
    parent_department ASC,
    name ASC;