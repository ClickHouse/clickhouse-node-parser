CREATE TABLE t64
(
    i8 Int8,
    t_i8 Int8 CODEC(T64, LZ4),
    i16 Int16,
    t_i16 Int16 CODEC(T64, LZ4),
    i32 Int32,
    t_i32 Int32 CODEC(T64, LZ4),
    i64 Int64,
    t_i64 Int64 CODEC(T64, LZ4)
)
ENGINE = MergeTree()
ORDER BY tuple();

SELECT *
FROM t64
ORDER BY i64 ASC;

SELECT
    i8,
    t_i8
FROM t64
WHERE i8 != t_i8;

SELECT *
FROM t64
WHERE i8 != t_i8;

SELECT *
FROM t64
WHERE i16 != t_i16;

SELECT *
FROM t64
WHERE i32 != t_i32;

SELECT *
FROM t64
WHERE i64 != t_i64;