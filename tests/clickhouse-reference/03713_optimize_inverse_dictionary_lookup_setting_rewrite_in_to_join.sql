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
INSERT INTO ref_colors VALUES
    (1, 'red',   5),
    (2, 'blue',  7),
    (3, 'red',  12),
    (4, 'green', 0),
    (5, 'Rose',  9);
CREATE DICTIONARY colors
(
  id   UInt64,
  name String,
  n    UInt64
)
PRIMARY KEY id
SOURCE(CLICKHOUSE(TABLE 'ref_colors'))
LAYOUT(HASHED())
LIFETIME(0);
CREATE TABLE t
(
    color_id UInt64,
    payload String
)
ENGINE = MergeTree
ORDER BY color_id;
INSERT INTO t VALUES
    (1, 'a'),
    (2, 'b'),
    (3, 'c'),
    (4, 'd'),
    (5, 'R');
SELECT color_id, payload
FROM t
WHERE dictGetString('colors', 'name', color_id) = 'red'
ORDER BY color_id, payload;
