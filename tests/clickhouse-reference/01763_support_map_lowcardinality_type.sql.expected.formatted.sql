CREATE TABLE map_lc
(
    kv Map(LowCardinality(String), LowCardinality(String))
)
ENGINE = Memory;

SELECT kv['a']
FROM map_lc;

SELECT
    map(toFixedString('1', 1), 1) AS m,
    m[toFixedString('1', 1)],
    m[toFixedString('1', 2)];