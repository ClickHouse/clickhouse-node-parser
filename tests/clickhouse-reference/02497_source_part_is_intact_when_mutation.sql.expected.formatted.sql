-- Tags: no-replicated-database, no-ordinary-database, no-encrypted-storage
SET mutations_sync = 1;

SET check_query_single_value_result = 0;

CREATE TABLE t_source_part_is_intact
(
    id UInt64,
    u UInt64
)
ENGINE = MergeTree
ORDER BY id
SETTINGS min_bytes_for_wide_part = 1, ratio_of_defaults_for_sparse_serialization = 0.5;

INSERT INTO t_source_part_is_intact SELECT
    number,
    if(number % 11 = 0, number, 0)
FROM numbers(2000);

SELECT
    1,
    count()
FROM t_source_part_is_intact;