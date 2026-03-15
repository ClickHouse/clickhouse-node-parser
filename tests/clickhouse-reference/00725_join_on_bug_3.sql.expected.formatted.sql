CREATE TABLE t_00725_3
(
    a Int64,
    b Int64
)
ENGINE = TinyLog;

CREATE TABLE z_00725_3
(
    c Int64,
    d Int64,
    e Int64
)
ENGINE = TinyLog;

SELECT *
FROM
    t_00725_3
LEFT JOIN z_00725_3
    ON (z_00725_3.c = t_00725_3.a
    AND z_00725_3.d = t_00725_3.b)
ORDER BY t_00725_3.a ASC;