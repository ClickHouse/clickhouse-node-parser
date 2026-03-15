CREATE TABLE t0
(
    vkey UInt32,
    c0 Float32,
    PRIMARY KEY(c0)
)
ENGINE = AggregatingMergeTree;

SELECT
    NULL AS c_2_0,
    ref_2.c0 AS c_2_1,
    ref_2.vkey AS c_2_2
FROM t0 AS ref_2
ORDER BY
    c_2_0 ASC,
    c_2_1 ASC,
    c_2_2 ASC;

SELECT
    NULL AS c_2_0,
    ref_2.c0 AS c_2_1,
    ref_2.vkey AS c_2_2
FROM t0 AS ref_2
ORDER BY
    c_2_0 ASC,
    c_2_1 ASC;