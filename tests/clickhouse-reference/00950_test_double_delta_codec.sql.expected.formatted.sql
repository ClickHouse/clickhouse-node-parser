SELECT
    key,
    ref_valueU64,
    valueU64,
    ref_valueU64 - valueU64 AS dU64
FROM codecTest
WHERE dU64 != 0
LIMIT 10;

SELECT
    key,
    ref_valueU32,
    valueU32,
    ref_valueU32 - valueU32 AS dU32
FROM codecTest
WHERE dU32 != 0
LIMIT 10;

SELECT
    key,
    ref_valueU16,
    valueU16,
    ref_valueU16 - valueU16 AS dU16
FROM codecTest
WHERE dU16 != 0
LIMIT 10;

SELECT
    key,
    ref_valueU8,
    valueU8,
    ref_valueU8 - valueU8 AS dU8
FROM codecTest
WHERE dU8 != 0
LIMIT 10;

SELECT
    key,
    ref_valueI64,
    valueI64,
    ref_valueI64 - valueI64 AS dI64
FROM codecTest
WHERE dI64 != 0
LIMIT 10;

SELECT
    key,
    ref_valueI32,
    valueI32,
    ref_valueI32 - valueI32 AS dI32
FROM codecTest
WHERE dI32 != 0
LIMIT 10;

SELECT
    key,
    ref_valueI16,
    valueI16,
    ref_valueI16 - valueI16 AS dI16
FROM codecTest
WHERE dI16 != 0
LIMIT 10;

SELECT
    key,
    ref_valueI8,
    valueI8,
    ref_valueI8 - valueI8 AS dI8
FROM codecTest
WHERE dI8 != 0
LIMIT 10;

SELECT
    key,
    ref_valueDT,
    valueDT,
    ref_valueDT - valueDT AS dDT
FROM codecTest
WHERE dDT != 0
LIMIT 10;

SELECT
    key,
    ref_valueD,
    valueD,
    ref_valueD - valueD AS dD
FROM codecTest
WHERE dD != 0
LIMIT 10;

SELECT
    table,
    name,
    type,
    compression_codec,
    data_uncompressed_bytes AS u,
    data_compressed_bytes AS c,
    round(u / c, 3) AS ratio
FROM `system`.`columns`
WHERE table = 'codecTest'
    AND database = currentDatabase()
    AND compression_codec != ''
    AND ratio <= 1
ORDER BY
    table ASC,
    name ASC,
    type ASC;