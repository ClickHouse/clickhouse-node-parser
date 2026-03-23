SET enable_json_type = 1;

SET output_format_json_named_tuples_as_objects = 1;

SET mutations_sync = 2;

CREATE TABLE t_json_mutations
(
    id UInt32,
    s String,
    obj JSON
)
ENGINE = MergeTree
ORDER BY id;

INSERT INTO t_json_mutations;

INSERT INTO t_json_mutations;

INSERT INTO t_json_mutations;

SELECT *
FROM t_json_mutations
ORDER BY id ASC;