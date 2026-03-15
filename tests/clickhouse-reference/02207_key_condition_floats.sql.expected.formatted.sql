CREATE TABLE t_key_condition_float
(
    a Float32
)
ENGINE = MergeTree
ORDER BY a;

SELECT count()
FROM t_key_condition_float
WHERE a > 0;

SELECT count()
FROM t_key_condition_float
WHERE a > 0.0;

SELECT count()
FROM t_key_condition_float
WHERE a > 0::Float32;

SELECT count()
FROM t_key_condition_float
WHERE a > 0::Float64;

CREATE TABLE t_key_condition_float
(
    a Float64
)
ENGINE = MergeTree
ORDER BY a;

CREATE TABLE t_key_condition_float
(
    a UInt64
)
ENGINE = MergeTree
ORDER BY a;

SELECT count()
FROM t_key_condition_float
WHERE a > 1.5;