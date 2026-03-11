SELECT
    key,
    ref_valueU64, valueU64, ref_valueU64 - valueU64 as dU64
FROM codecTest
WHERE
    dU64 != 0
LIMIT 10;
SELECT
    key,
    ref_valueU32, valueU32, ref_valueU32 - valueU32 as dU32
FROM codecTest
WHERE
    dU32 != 0
LIMIT 10;
SELECT
    key,
    ref_valueU16, valueU16, ref_valueU16 - valueU16 as dU16
FROM codecTest
WHERE
    dU16 != 0
LIMIT 10;
SELECT
    key,
    ref_valueU8, valueU8, ref_valueU8 - valueU8 as dU8
FROM codecTest
WHERE
    dU8 != 0
LIMIT 10;
SELECT
    key,
    ref_valueI64, valueI64, ref_valueI64 - valueI64 as dI64
FROM codecTest
WHERE
    dI64 != 0
LIMIT 10;
SELECT
    key,
    ref_valueI32, valueI32, ref_valueI32 - valueI32 as dI32
FROM codecTest
WHERE
    dI32 != 0
LIMIT 10;
SELECT
    key,
    ref_valueI16, valueI16, ref_valueI16 - valueI16 as dI16
FROM codecTest
WHERE
    dI16 != 0
LIMIT 10;
SELECT
    key,
    ref_valueI8, valueI8, ref_valueI8 - valueI8 as dI8
FROM codecTest
WHERE
    dI8 != 0
LIMIT 10;
SELECT
    key,
    ref_valueDT, valueDT, ref_valueDT - valueDT as dDT
FROM codecTest
WHERE
    dDT != 0
LIMIT 10;
SELECT
    key,
    ref_valueD, valueD, ref_valueD - valueD as dD
FROM codecTest
WHERE
    dD != 0
LIMIT 10;
SELECT
    table, name, type,
    compression_codec,
    data_uncompressed_bytes u,
    data_compressed_bytes c,
    round(u/c,3) ratio
FROM system.columns
WHERE
    table = 'codecTest'
    AND database = currentDatabase()
AND
    compression_codec != ''
AND
    ratio <= 1
ORDER BY
    table, name, type;
