CREATE TABLE table1
(
    number UInt64
)
ENGINE = MergeTree
ORDER BY tuple();

CREATE TABLE table2
(
    number UInt64
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT *
FROM (
(        SELECT *
        FROM table1
        ORDER BY number ASC)
        UNION ALL
(        SELECT *
        FROM table2
        ORDER BY number ASC)
    )
ORDER BY number ASC;

SELECT *
FROM (
(        SELECT *
        FROM table1
        ORDER BY number ASC)
        UNION ALL
(        SELECT *
        FROM table2
        ORDER BY number ASC)
    )
ORDER BY number DESC;

SELECT *
FROM (
(        SELECT *
        FROM table1
        ORDER BY number DESC)
        UNION ALL
(        SELECT *
        FROM table2
        ORDER BY number DESC)
    )
ORDER BY number DESC;