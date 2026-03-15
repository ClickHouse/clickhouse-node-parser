CREATE TABLE qbits
(
    id UInt32,
    vec QBit(BFloat16, 16)
)
ENGINE = SummingMergeTree
ORDER BY id;

SELECT *
FROM qbits
ORDER BY id ASC;

CREATE TABLE qbits
(
    id UInt32,
    vec QBit(BFloat16, 16)
)
ENGINE = AggregatingMergeTree
ORDER BY id;

CREATE TABLE qbits
(
    id UInt8,
    sign Int8,
    vec QBit(BFloat16, 16),
    `order` UInt8
)
ENGINE = CollapsingMergeTree(sign)
ORDER BY id;

SELECT *
FROM qbits
ORDER BY `order` ASC;

CREATE TABLE qbits
(
    id Int8,
    sign Int8,
    ver Int8,
    vec QBit(BFloat16, 16)
)
ENGINE = VersionedCollapsingMergeTree(sign, ver)
ORDER BY ver;