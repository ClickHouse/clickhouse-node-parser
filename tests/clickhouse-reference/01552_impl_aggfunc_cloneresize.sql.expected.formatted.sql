SYSTEM drop  table if EXISTS test_bm;

SYSTEM drop  table if EXISTS test_bm_join;

CREATE TABLE test_bm
(
    dim UInt64,
    id UInt64
)
ENGINE = MergeTree()
ORDER BY (dim, id)
SETTINGS index_granularity = 8192;

CREATE TABLE test_bm_join
(
    dim UInt64,
    id UInt64
)
ENGINE = MergeTree()
ORDER BY (dim, id)
SETTINGS index_granularity = 8192;

INSERT INTO test_bm;

SELECT
    dim,
    sum(idnum)
FROM
    test_bm_join
RIGHT JOIN (
        SELECT
            dim,
            bitmapOrCardinality(ids, ids2) AS idnum
        FROM
            (
                SELECT
                    dim,
                    groupBitmapState(toUInt64(id)) AS ids
                FROM test_bm
                WHERE dim > 2
                GROUP BY dim
            ) AS A
        RIGHT JOIN (
                SELECT
                    dim,
                    groupBitmapState(toUInt64(id)) AS ids2
                FROM test_bm
                WHERE dim < 2
                GROUP BY dim
            ) AS B
            USING (dim)
    ) AS C
    USING (dim)
GROUP BY dim;

SYSTEM drop  table test_bm;

SYSTEM drop  table test_bm_join;