SELECT proportionsZTest(10, 11, 100, 101, 0.95, 'unpooled');

CREATE TABLE proportions_ztest
(
    sx UInt64,
    sy UInt64,
    tx UInt64,
    ty UInt64
)
ENGINE = Memory();

INSERT INTO proportions_ztest;

SELECT proportionsZTest(sx, sy, tx, ty, 0.95, 'unpooled')
FROM proportions_ztest;

SELECT
    NULL,
    proportionsZTest(257, 1048575, 1048575, 257, -inf, NULL),
    proportionsZTest(1024, 1025, 2, 2, 'unpooled'); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }