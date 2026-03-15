CREATE TABLE u32
(
    x UInt32,
    y UInt32 DEFAULT x
)
ENGINE = Memory;

CREATE TABLE u64
(
    x UInt64,
    y UInt64 DEFAULT x
)
ENGINE = Memory;

CREATE TABLE merge_32_64
(
    x UInt64
)
ENGINE = Merge(currentDatabase(), '^u32|u64$');

SELECT x
FROM merge_32_64
WHERE x = 1;

SELECT x
FROM merge_32_64
WHERE x IN (1);

SELECT x
FROM merge_32_64
WHERE x IN (4294967290);

SELECT x
FROM merge_32_64
WHERE x IN (4294967299);

CREATE TABLE s64
(
    x Int64
)
ENGINE = Memory;

CREATE TABLE u64
(
    x UInt64
)
ENGINE = Memory;

CREATE TABLE merge_s64_u64
(
    x UInt64
)
ENGINE = Merge(currentDatabase(), '^s64|u64$');

SELECT x
FROM merge_s64_u64
WHERE x IN (1);

SELECT x
FROM merge_s64_u64
WHERE x IN (-1);

CREATE TABLE one_00458
(
    x Int32
)
ENGINE = Memory;

CREATE TABLE two_00458
(
    x UInt64
)
ENGINE = Memory;

CREATE TABLE merge_one_two
(
    x UInt64
)
ENGINE = Merge(currentDatabase(), '^one_00458$|^two_00458$');

SELECT *
FROM merge_one_two
WHERE x IN (1);

SELECT x
FROM merge_one_two
WHERE x IN (2147483650);

SELECT x
FROM merge_one_two
WHERE x IN (-1);

CREATE TABLE one_00458
(
    x String
)
ENGINE = Memory;

CREATE TABLE two_00458
(
    x FixedString(16)
)
ENGINE = Memory;

CREATE TABLE merge_one_two
(
    x String
)
ENGINE = Merge(currentDatabase(), '^one_00458$|^two_00458$');

SELECT *
FROM merge_one_two
WHERE x IN ('1');

CREATE TABLE one_00458
(
    x DateTime
)
ENGINE = Memory;

CREATE TABLE one_00458
(
    x Array(UInt32),
    z String DEFAULT '',
    y Array(UInt32)
)
ENGINE = Memory;

CREATE TABLE two_00458
(
    x Array(UInt64),
    z String DEFAULT '',
    y Array(UInt64)
)
ENGINE = Memory;

CREATE TABLE merge_one_two
(
    x Array(UInt64),
    z String,
    y Array(UInt64)
)
ENGINE = Merge(currentDatabase(), '^one_00458$|^two_00458$');

SELECT
    x,
    y
FROM merge_one_two
WHERE arrayExists(_ -> _ IN (1), x);

SELECT
    x,
    y
FROM merge_one_two
WHERE arrayExists(_ -> _ IN (4294967290), x);

SELECT
    x,
    y
FROM merge_one_two
WHERE arrayExists(_ -> _ IN (4294967299), x);