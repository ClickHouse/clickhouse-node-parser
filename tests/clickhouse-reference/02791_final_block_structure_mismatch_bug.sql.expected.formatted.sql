SET do_not_merge_across_partitions_select_final = 1;

CREATE TABLE test_block_mismatch
(
    a UInt32,
    b DateTime
)
ENGINE = ReplacingMergeTree
ORDER BY (toDate(b), a)
PARTITION BY toYYYYMM(b);

SELECT count(*)
FROM test_block_mismatch FINAL;

-- variations of the test above with slightly modified table definitions
CREATE TABLE test_block_mismatch_sk1
(
    a UInt32,
    b DateTime
)
ENGINE = ReplacingMergeTree
PRIMARY KEY toDate(b)
ORDER BY (toDate(b), a)
PARTITION BY toYYYYMM(b);

SELECT count(*)
FROM test_block_mismatch_sk1 FINAL;

CREATE TABLE test_block_mismatch_sk2
(
    a UInt32,
    b DateTime
)
ENGINE = ReplacingMergeTree
PRIMARY KEY a
ORDER BY (a, toDate(b))
PARTITION BY toYYYYMM(b);

SELECT count(*)
FROM test_block_mismatch_sk2 FINAL;