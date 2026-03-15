SET enable_json_type = 1;

CREATE TABLE t0
(
    c0 JSON(max_dynamic_types=0)
)
ENGINE = Memory;

SELECT *
FROM t0;