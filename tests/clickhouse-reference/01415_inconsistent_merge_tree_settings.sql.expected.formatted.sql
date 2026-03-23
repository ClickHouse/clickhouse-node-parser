SET mutations_sync = 1;

CREATE TABLE t
(
    x UInt8,
    s String
)
ENGINE = MergeTree
ORDER BY x
SETTINGS number_of_free_entries_in_pool_to_execute_mutation = 15;

INSERT INTO t;

SELECT *
FROM t;