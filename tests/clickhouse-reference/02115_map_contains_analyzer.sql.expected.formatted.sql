DROP TABLE IF EXISTS t_map_contains;

CREATE TABLE t_map_contains
(
    m Map(String, UInt32)
)
ENGINE = Memory;

INSERT INTO t_map_contains;

SET optimize_functions_to_subcolumns = 1;

SET enable_analyzer = 1;

SELECT mapContains(m, 'a')
FROM t_map_contains;

DROP TABLE t_map_contains;