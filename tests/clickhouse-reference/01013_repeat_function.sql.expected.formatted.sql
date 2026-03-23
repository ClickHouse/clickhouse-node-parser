SELECT repeat('abc', 10);

SYSTEM DROP  TABLE IF EXISTS defaults;

CREATE TABLE defaults
(
    strings String,
    i8 Int8,
    u16 UInt16,
    u32 UInt32,
    u64 UInt64
)
ENGINE = Memory();

INSERT INTO defaults;

SELECT repeat(strings, i8)
FROM defaults;

SELECT repeat(strings, u16)
FROM defaults;

SELECT repeat(strings, u32)
FROM defaults;

SELECT repeat(strings, u64)
FROM defaults;

SELECT repeat(strings, 10)
FROM defaults;

SELECT repeat('abc', i8)
FROM defaults;

SELECT repeat('abc', u16)
FROM defaults;

SELECT repeat('abc', u32)
FROM defaults;

SELECT repeat('abc', u64)
FROM defaults;

SELECT repeat('Hello, world! ', 3);

SYSTEM DROP  TABLE defaults;