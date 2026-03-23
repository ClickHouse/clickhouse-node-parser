DROP TABLE IF EXISTS t_materialize_column;
CREATE TABLE t_materialize_column (i Int32)
ENGINE = MergeTree ORDER BY i PARTITION BY i
SETTINGS min_bytes_for_wide_part = 0;
INSERT INTO t_materialize_column VALUES (1);
SELECT name, column, type FROM system.parts_columns
WHERE table = 't_materialize_column' AND database = currentDatabase() AND active
ORDER BY name, column;
INSERT INTO t_materialize_column (i) VALUES (2);
SELECT * FROM t_materialize_column ORDER BY i;
DROP TABLE t_materialize_column;
