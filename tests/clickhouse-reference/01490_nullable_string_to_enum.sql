CREATE TABLE t_enum(x Enum8('hello' = 1, 'world' = 2)) ENGINE = TinyLog;
CREATE TABLE t_source(x Nullable(String)) ENGINE = TinyLog;
SELECT * FROM t_enum;
