CREATE TABLE tbl
(
    `id1` LowCardinality(String),
    `id2` LowCardinality(String),
    `v` Int64
)
ENGINE = MergeTree
ORDER BY (id1, id2, v);
CREATE TABLE join_engine
(
    `id1` LowCardinality(String),
    `id2` LowCardinality(String),
    `v` Int64
)
ENGINE = Join(ANY, LEFT, id1, id2);
--
-- The same as before, but without relying on enable_global_with_statement
--
SELECT uniq(id2) AS count
FROM
(
    WITH cte AS
        (
            SELECT id2
            FROM tbl
            WHERE joinGet(currentDatabase() || '.join_engine', 'v', id1, id2) = tbl.v
        )
    SELECT *
    FROM tbl AS e
    WHERE joinGet(currentDatabase() || '.join_engine', 'v', id1, id2) = e.v
)
WHERE id2 IN (
    SELECT id2
    FROM
    (
        SELECT id2
        FROM tbl
        WHERE joinGet(currentDatabase() || '.join_engine', 'v', id1, id2) = tbl.v
    )
)
UNION ALL
SELECT uniq(id2) AS count
FROM
(
    SELECT id2
    FROM tbl
    WHERE joinGet(currentDatabase() || '.join_engine', 'v', id1, id2) = tbl.v
);
