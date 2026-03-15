SELECT '----- START -----';

SELECT mortonEncode((1,2,3,1), 1, 2, 3, 4);

SELECT mortonDecode((1, 2, 3, 1), 4205569);

SELECT mortonEncode((1,1), 65534, 65533);

SELECT mortonDecode((1,1), 4294967286);

SELECT mortonEncode(tuple(1), 4294967286);

SELECT mortonDecode(tuple(1), 4294967286);

SELECT mortonEncode(tuple(4), 128);

SELECT mortonDecode(tuple(4), 2147483648);

SELECT mortonEncode((4,4,4,4), 128, 128, 128, 128);

CREATE TABLE morton_numbers_mask_02457
(
    n1 UInt8,
    n2 UInt8,
    n3 UInt8,
    n4 UInt8
)
ENGINE = MergeTree()
ORDER BY n1
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

CREATE TABLE morton_numbers_mask_1_02457
(
    n1 UInt64,
    n2 UInt64,
    n3 UInt64,
    n4 UInt64
)
ENGINE = MergeTree()
ORDER BY n1
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

CREATE TABLE morton_numbers_mask_02457
(
    n1 UInt32,
    n2 UInt8
)
ENGINE = MergeTree()
ORDER BY n1
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

CREATE TABLE morton_numbers_mask_2_02457
(
    n1 UInt64,
    n2 UInt64
)
ENGINE = MergeTree()
ORDER BY n1
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

CREATE TABLE morton_numbers_mask_02457
(
    n1 UInt16,
    n2 UInt16,
    n3 UInt8
)
ENGINE = MergeTree()
ORDER BY n1
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

CREATE TABLE morton_numbers_mask_3_02457
(
    n1 UInt64,
    n2 UInt64,
    n3 UInt64
)
ENGINE = MergeTree()
ORDER BY n1
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';