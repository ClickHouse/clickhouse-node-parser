-- Tags: no-fasttest
CREATE TEMPORARY TABLE t
ENGINE = Memory AS
SELECT *
FROM generateRandom('
    a Array(Int8),
    b UInt32,
    c Nullable(String),
    d Decimal32(4),
    e Nullable(Enum16(''h'' = 1, ''w'' = 5 , ''o'' = -200)),
    f Float64,
    g Tuple(Date, DateTime(''Asia/Istanbul''), DateTime64(3, ''Asia/Istanbul''), UUID),
    h FixedString(2),
    i Array(Nullable(UUID))
', 10, 5, 3)
LIMIT 2;

SELECT * APPLY(toJSONString)
FROM t;

SELECT toJSONString(map('1234', '5678'));