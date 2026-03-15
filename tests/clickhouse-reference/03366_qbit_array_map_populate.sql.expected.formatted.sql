CREATE TABLE qbits
(
    id UInt32,
    vec QBit(Float64, 9)
)
ENGINE = Memory;

SELECT *
FROM qbits
ORDER BY id ASC;

CREATE TABLE qbits
(
    id UInt32,
    vec QBit(Float32, 9)
)
ENGINE = Memory;

CREATE TABLE qbits
(
    id UInt32,
    vec QBit(BFloat16, 9)
)
ENGINE = Memory;