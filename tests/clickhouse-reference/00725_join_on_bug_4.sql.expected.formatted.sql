SYSTEM drop  table if exists t_00725_4;

SYSTEM drop  table if exists s_00725_4;

CREATE TABLE t_00725_4
(
    a Int64,
    b Int64,
    c String
)
ENGINE = TinyLog;

INSERT INTO t_00725_4;

CREATE TABLE s_00725_4
(
    a Int64,
    b Int64,
    c String
)
ENGINE = TinyLog;

INSERT INTO s_00725_4;

SELECT t_00725_4.*
FROM
    t_00725_4
LEFT JOIN s_00725_4
    ON (s_00725_4.a = t_00725_4.a
    AND s_00725_4.b = t_00725_4.b)
WHERE s_00725_4.a = 0
    AND s_00725_4.b = 0;