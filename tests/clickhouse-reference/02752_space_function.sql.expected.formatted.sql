SELECT
    space(3::UInt8),
    length(space(3::UInt8));

SELECT
    space(3::UInt16),
    length(space(3::UInt16));

SELECT
    space(3::UInt32),
    length(space(3::UInt32));

SELECT
    space(3::UInt64),
    length(space(3::UInt64));

SELECT
    space(3::Int8),
    length(space(3::Int8));

SELECT
    space(3::Int16),
    length(space(3::Int16));

SELECT
    space(3::Int32),
    length(space(3::Int32));

SELECT
    space(3::Int64),
    length(space(3::Int64));

SELECT
    space(-3::Int8),
    length(space(-3::Int8));

SELECT
    space(-3::Int16),
    length(space(-3::Int16));

SELECT
    space(-3::Int32),
    length(space(-3::Int32));

SELECT
    space(-3::Int64),
    length(space(-3::Int64));

SELECT space('abc'); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT space(['abc']); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT space(('abc')); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT space(30303030303030303030303030303030::UInt64); -- { serverError TOO_LARGE_STRING_SIZE }

SELECT space(NULL);

DROP TABLE IF EXISTS defaults;

CREATE TABLE defaults
(
    u8 UInt8,
    u16 UInt16,
    u32 UInt32,
    u64 UInt64,
    i8 Int8,
    i16 Int16,
    i32 Int32,
    i64 Int64
)
ENGINE = Memory();

INSERT INTO defaults;

SELECT space(30::UInt8)
FROM defaults;

SELECT space(30::UInt16)
FROM defaults;

SELECT space(30::UInt32)
FROM defaults;

SELECT space(30::UInt64)
FROM defaults;

SELECT space(30::Int8)
FROM defaults;

SELECT space(30::Int16)
FROM defaults;

SELECT space(30::Int32)
FROM defaults;

SELECT space(30::Int64)
FROM defaults;

SELECT
    space(u8),
    length(space(u8))
FROM defaults;

SELECT
    space(u16),
    length(space(u16))
FROM defaults;

SELECT
    space(u32),
    length(space(u32))
FROM defaults;

SELECT
    space(u64),
    length(space(u64))
FROM defaults;

SELECT
    space(i8),
    length(space(i8))
FROM defaults;

SELECT
    space(i16),
    length(space(i16))
FROM defaults;

SELECT
    space(i32),
    length(space(i32))
FROM defaults;

SELECT
    space(i64),
    length(space(i64))
FROM defaults;

DROP TABLE defaults;