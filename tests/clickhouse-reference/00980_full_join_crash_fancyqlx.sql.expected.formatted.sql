CREATE TABLE test_join
(
    date Date,
    id Int32,
    name Nullable(String)
)
ENGINE = MergeTree
ORDER BY id
PARTITION BY date;

SELECT
    id,
    date,
    name
FROM
    (
        SELECT
            id,
            date,
            name
        FROM test_join
        GROUP BY
            id,
            name,
            date
    ) AS js1
FULL JOIN (
        SELECT
            id,
            date,
            name
        FROM test_join
        GROUP BY
            id,
            name,
            date
    ) AS js2
    USING (id, name, date)
ORDER BY
    id ASC,
    name ASC;