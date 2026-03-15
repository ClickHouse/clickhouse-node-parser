CREATE TABLE t_nested_modify (id UInt64, `n.a` Array(UInt32), `n.b` Array(String))
ENGINE = MergeTree ORDER BY id
SETTINGS min_bytes_for_wide_part = 0;
SELECT id, `n.a`, `n.b`, toTypeName(`n.b`) FROM t_nested_modify ORDER BY id;
