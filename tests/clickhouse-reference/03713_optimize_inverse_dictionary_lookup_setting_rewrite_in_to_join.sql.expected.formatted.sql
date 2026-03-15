-- Tags: no-replicated-database, no-parallel-replicas
-- no-parallel, no-parallel-replicas: Dictionary is not created in parallel replicas.
SET enable_analyzer = 1;

SET optimize_inverse_dictionary_lookup = 1;

SET optimize_or_like_chain = 0;

-- Expect no rewrite of dictGet(...) = 'constant'
SET rewrite_in_to_join = 1;

CREATE TABLE ref_colors
(
    id UInt64,
    name String,
    n UInt64
)
ENGINE = MergeTree
ORDER BY id;

CREATE DICTIONARY colors
(
    id UInt64,
    name String,
    n UInt64
)
PRIMARY KEY id
SOURCE(clickhouse(TABLE 'ref_colors'))
LIFETIME(0)
LAYOUT(HASHED());

CREATE TABLE t
(
    color_id UInt64,
    payload String
)
ENGINE = MergeTree
ORDER BY color_id;

SELECT
    color_id,
    payload
FROM t
WHERE dictGetString('colors', 'name', color_id) = 'red'
ORDER BY
    color_id ASC,
    payload ASC;