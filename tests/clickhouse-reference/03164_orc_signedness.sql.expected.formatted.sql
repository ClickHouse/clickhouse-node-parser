-- Tags: no-fasttest
SET input_format_orc_filter_push_down = 1;

SET engine_file_truncate_on_insert = 1;

-- { echoOn }
SELECT x
FROM file(concat(currentDatabase(), 'i8.orc'))
WHERE indexHint(x = -128);

SELECT x
FROM file(concat(currentDatabase(), 'i8.orc'))
WHERE indexHint(x = 128);

SELECT x
FROM file(concat(currentDatabase(), 'u8.orc'))
WHERE indexHint(x = -128);

SELECT x
FROM file(concat(currentDatabase(), 'u8.orc'))
WHERE indexHint(x = 128);

SELECT x
FROM file(concat(currentDatabase(), 'i16.orc'))
WHERE indexHint(x = -32768);

SELECT x
FROM file(concat(currentDatabase(), 'i16.orc'))
WHERE indexHint(x = 32768);

SELECT x
FROM file(concat(currentDatabase(), 'u16.orc'))
WHERE indexHint(x = -32768);

SELECT x
FROM file(concat(currentDatabase(), 'u16.orc'))
WHERE indexHint(x = 32768);

SELECT x
FROM file(concat(currentDatabase(), 'i32.orc'))
WHERE indexHint(x = -2147483648);

SELECT x
FROM file(concat(currentDatabase(), 'i32.orc'))
WHERE indexHint(x = 2147483648);

SELECT x
FROM file(concat(currentDatabase(), 'u32.orc'))
WHERE indexHint(x = -2147483648);

SELECT x
FROM file(concat(currentDatabase(), 'u32.orc'))
WHERE indexHint(x = 2147483648);

SELECT x
FROM file(concat(currentDatabase(), 'i64.orc'))
WHERE indexHint(x = -9223372036854775808);

SELECT x
FROM file(concat(currentDatabase(), 'i64.orc'))
WHERE indexHint(x = 9223372036854775808);

SELECT x
FROM file(concat(currentDatabase(), 'u64.orc'))
WHERE indexHint(x = -9223372036854775808);

SELECT x
FROM file(concat(currentDatabase(), 'u64.orc'))
WHERE indexHint(x = 9223372036854775808);

SELECT x
FROM file(concat(currentDatabase(), 'u8.orc'), ORC, 'x UInt8')
WHERE indexHint(x > 10);

SELECT x
FROM file(concat(currentDatabase(), 'u8.orc'), ORC, 'x UInt64')
WHERE indexHint(x > 10);

SELECT x
FROM file(concat(currentDatabase(), 'u16.orc'), ORC, 'x UInt16')
WHERE indexHint(x > 10);

SELECT x
FROM file(concat(currentDatabase(), 'u16.orc'), ORC, 'x UInt64')
WHERE indexHint(x > 10);

SELECT x
FROM file(concat(currentDatabase(), 'u32.orc'), ORC, 'x UInt32')
WHERE indexHint(x > 10);

SELECT x
FROM file(concat(currentDatabase(), 'u32.orc'), ORC, 'x UInt64')
WHERE indexHint(x > 10);

SELECT x
FROM file(concat(currentDatabase(), 'u64.orc'), ORC, 'x UInt64')
WHERE indexHint(x > 10);