CREATE TABLE qbits_16
(
    id UInt32,
    vec QBit(BFloat16, 16)
)
ENGINE = Memory;

SELECT *
FROM qbits_16
ORDER BY id ASC;

CREATE TABLE qbits_32
(
    id UInt32,
    vec QBit(Float32, 16)
)
ENGINE = Memory;

SELECT *
FROM qbits_32
ORDER BY id ASC;

CREATE TABLE qbits_64
(
    id UInt32,
    vec QBit(Float64, 16)
)
ENGINE = Memory;

SELECT *
FROM qbits_64
ORDER BY id ASC;

CREATE TABLE qbits_16
(
    id UInt32,
    vec QBit(BFloat16, 9)
)
ENGINE = Memory;

CREATE TABLE qbits_32
(
    id UInt32,
    vec QBit(Float32, 9)
)
ENGINE = Memory;

CREATE TABLE qbits_64
(
    id UInt32,
    vec QBit(Float64, 9)
)
ENGINE = Memory;

CREATE TABLE qbits
(
    id UInt32,
    vec QBit(BFloat16, 1)
)
ENGINE = Memory;

SELECT *
FROM qbits;

CREATE TABLE qbits
(
    id UInt32,
    vec QBit(Float64, 1)
)
ENGINE = Memory;

CREATE TABLE array_64
(
    id UInt32,
    vec Array(Float64)
)
ENGINE = Memory;

CREATE TABLE array_32
(
    id UInt32,
    vec Array(Float32)
)
ENGINE = Memory;

CREATE TABLE array_16
(
    id UInt32,
    vec Array(BFloat16)
)
ENGINE = Memory;

CREATE TABLE qbit_64
(
    id UInt32,
    vec QBit(Float64, 28)
)
ENGINE = Memory;

CREATE TABLE qbit_32
(
    id UInt32,
    vec QBit(Float32, 28)
)
ENGINE = Memory;

CREATE TABLE qbit_16
(
    id UInt32,
    vec QBit(BFloat16, 28)
)
ENGINE = Memory;

SELECT *
FROM qbit_64
ORDER BY id ASC;

SELECT *
FROM qbit_32
ORDER BY id ASC;

SELECT *
FROM qbit_16
ORDER BY id ASC;