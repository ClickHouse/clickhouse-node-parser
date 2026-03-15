CREATE TABLE t64
(
    u8 UInt8,
    t_u8 UInt8 CODEC(T64('bit'), LZ4),
    u16 UInt16,
    t_u16 UInt16 CODEC(T64('bit'), LZ4),
    u32 UInt32,
    t_u32 UInt32 CODEC(T64('bit'), LZ4),
    u64 UInt64,
    t_u64 UInt64 CODEC(T64('bit'), LZ4)
)
ENGINE = MergeTree()
ORDER BY tuple();

SELECT *
FROM t64
ORDER BY u64 ASC;

SELECT *
FROM t64
WHERE u8 != t_u8;

SELECT *
FROM t64
WHERE u16 != t_u16;

SELECT *
FROM t64
WHERE u32 != t_u32;

SELECT *
FROM t64
WHERE u64 != t_u64;