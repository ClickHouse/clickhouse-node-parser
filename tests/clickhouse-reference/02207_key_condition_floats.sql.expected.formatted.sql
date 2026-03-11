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

SELECT count()
FROM t_key_condition_float
WHERE a > 1.5;