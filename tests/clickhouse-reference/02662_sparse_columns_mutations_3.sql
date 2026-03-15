SET mutations_sync = 2;
CREATE TABLE t_sparse_mutations_3 (key UInt8, id UInt64, s String)
ENGINE = MergeTree ORDER BY id PARTITION BY key
SETTINGS ratio_of_defaults_for_sparse_serialization = 0.9, serialization_info_version = 'basic';
SELECT type, serialization_kind FROM system.parts_columns
WHERE database = currentDatabase() AND table = 't_sparse_mutations_3' AND column = 's' AND active
ORDER BY name;
SELECT
    type,
    serialization_kind,
    subcolumns.names,
    subcolumns.types,
    subcolumns.serializations
FROM system.parts_columns
WHERE database = currentDatabase() AND table = 't_sparse_mutations_3' AND column = 's' AND active
ORDER BY name;
SELECT sum(s.1), sum(s.2), groupUniqArray(s.3), groupUniqArray(s.4), groupUniqArray(s.5) FROM t_sparse_mutations_3;
SELECT sum(s.1), sum(s.2), sum(s.3), sum(s.4), groupUniqArray(s.5) FROM t_sparse_mutations_3;
SET mutations_sync=2;
