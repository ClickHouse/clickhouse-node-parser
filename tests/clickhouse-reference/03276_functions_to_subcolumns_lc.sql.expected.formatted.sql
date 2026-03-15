CREATE TABLE t_map_lc
(
    kv Map(LowCardinality(String), LowCardinality(String)),
    k Array(LowCardinality(String)) ALIAS mapKeys(kv),
    v Array(LowCardinality(String)) ALIAS mapValues(kv)
)
ENGINE = Memory;

SELECT
    k,
    v
FROM t_map_lc
SETTINGS optimize_functions_to_subcolumns = 1;