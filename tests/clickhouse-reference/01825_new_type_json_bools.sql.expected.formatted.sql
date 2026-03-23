SET enable_json_type = 1;

CREATE TABLE t_json_bools
(
    data JSON
)
ENGINE = Memory;

INSERT INTO t_json_bools;

SELECT
    data,
    JSONAllPathsWithTypes(data)
FROM t_json_bools;