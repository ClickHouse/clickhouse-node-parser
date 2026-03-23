CREATE TABLE t_map_null
(
    a Map(String, String),
    b String
)
ENGINE = MergeTree()
ORDER BY a;

INSERT INTO t_map_null;

SELECT count()
FROM t_map_null
WHERE a = map('name', NULL, '', NULL);