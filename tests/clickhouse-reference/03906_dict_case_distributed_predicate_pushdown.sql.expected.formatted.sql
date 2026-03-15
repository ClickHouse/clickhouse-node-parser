-- Regression test for https://github.com/ClickHouse/ClickHouse/issues/87403
-- Dictionary + CASE + distributed table: predicate pushdown should not filter out rows incorrectly.
SET enable_analyzer = 1;

CREATE TABLE t_dict_dist_local
(
    id Int64,
    c String
)
ENGINE = MergeTree()
ORDER BY id;

CREATE DICTIONARY d_dict_dist
(
    id Int64,
    d String
)
PRIMARY KEY id
SOURCE(clickhouse(QUERY '
    SELECT * FROM (
        SELECT toInt64(1) AS id, ''alpha'' AS d
        UNION ALL
        SELECT toInt64(2) AS id, ''beta'' AS d
    )
'))
LIFETIME(0)
LAYOUT(FLAT());

CREATE TABLE t_dict_dist AS t_dict_dist_local
ENGINE = Distributed(test_shard_localhost, currentDatabase(), t_dict_dist_local);

SELECT
    id,
    c,
    dictGet(concat(currentDatabase(), '.d_dict_dist'), 'd', id) AS d,
    multiIf(c = 'same'
    AND d = 'gamma', 'SHOULD NOT HAPPEN', c = 'same', 'SHOULD ALWAYS HAPPEN', NULL) AS filter_value
FROM (
        SELECT *
        FROM t_dict_dist
    )
WHERE filter_value = 'SHOULD ALWAYS HAPPEN'
ORDER BY id ASC;