CREATE TABLE t_functions_to_subcolumns_alias
(
    id UInt64,
    t Tuple(UInt64, String),
    m Map(String, UInt64)
)
ENGINE = Memory;

SELECT count(id) AS cnt
FROM t_functions_to_subcolumns_alias
FORMAT TSVWithNames;

SELECT
    t.1 AS t0,
    t0
FROM t_functions_to_subcolumns_alias
FORMAT TSVWithNames;

SELECT mapContains(m, 'foo') AS hit
FROM t_functions_to_subcolumns_alias
FORMAT TSVWithNames;