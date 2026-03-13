SELECT
    key,
    toTypeName(u8),
    byteSize(u8),
    toTypeName(u16),
    byteSize(u16),
    toTypeName(u32),
    byteSize(u32),
    toTypeName(u64),
    byteSize(u64),
    toTypeName(u256),
    byteSize(u256)
FROM test_byte_size_number0
ORDER BY key ASC;

SELECT
    key,
    toTypeName(i8),
    byteSize(i8),
    toTypeName(i16),
    byteSize(i16),
    toTypeName(i32),
    byteSize(i32),
    toTypeName(i64),
    byteSize(i64),
    toTypeName(i128),
    byteSize(i128),
    toTypeName(u256),
    byteSize(u256)
FROM test_byte_size_number0
ORDER BY key ASC;

SELECT
    key,
    toTypeName(f32),
    byteSize(f32),
    toTypeName(f64),
    byteSize(f64)
FROM test_byte_size_number0
ORDER BY key ASC;

SELECT
    key,
    byteSize(*),
    toTypeName(date),
    byteSize(date),
    toTypeName(dt),
    byteSize(dt),
    toTypeName(dt64),
    byteSize(dt64),
    toTypeName(uuid),
    byteSize(uuid)
FROM test_byte_size_number1
ORDER BY key ASC;

SELECT
    0x1,
    byteSize(0x1),
    0x100,
    byteSize(0x100),
    0x10000,
    byteSize(0x10000),
    0x100000000,
    byteSize(0x100000000),
    0.5,
    byteSize(0.5),
    1e-10,
    byteSize(1e-10);

SELECT
    toDate('2020-01-01'),
    byteSize(toDate('2020-01-01')),
    toDateTime('2020-01-01 01:02:03'),
    byteSize(toDateTime('2020-01-01 01:02:03')),
    toDateTime64('2020-01-01 01:02:03', 3),
    byteSize(toDateTime64('2020-01-01 01:02:03', 3));

SELECT
    toTypeName(generateUUIDv4()),
    byteSize(generateUUIDv4());

SELECT
    key,
    byteSize(*),
    str1,
    byteSize(str1),
    str2,
    byteSize(str2),
    fstr1,
    byteSize(fstr1),
    fstr2,
    byteSize(fstr2)
FROM test_byte_size_string
ORDER BY key ASC;

SELECT
    'constants: ',
    '',
    byteSize(''),
    'a',
    byteSize('a'),
    'abcde',
    byteSize('abcde');

SELECT
    key,
    byteSize(*),
    uints8,
    byteSize(uints8),
    ints8,
    byteSize(ints8),
    ints32,
    byteSize(ints32),
    floats32,
    byteSize(floats32),
    decs32,
    byteSize(decs32),
    dates,
    byteSize(dates),
    uuids,
    byteSize(uuids)
FROM test_byte_size_array
ORDER BY key ASC;

SELECT
    'constants:',
    [],
    byteSize([]),
    [1,1],
    byteSize([1,1]),
    [-1,-1],
    byteSize([-1,-1]),
    toTypeName([256,256]),
    byteSize([256,256]),
    toTypeName([1.1,1.1]),
    byteSize([1.1,1.1]);

SELECT
    'constants:',
    [toDecimal32(1.1,4),toDecimal32(1.1,4)],
    byteSize([toDecimal32(1.1,4),toDecimal32(1.1,4)]),
    [toDate('2020-01-01'),toDate('2020-01-01')],
    byteSize([toDate('2020-01-01'),toDate('2020-01-01')]);

SELECT
    'constants:',
    [toUUID('61f0c404-5cb3-11e7-907b-a6006ad3dba0'),toUUID('61f0c404-5cb3-11e7-907b-a6006ad3dba0')],
    byteSize([toUUID('61f0c404-5cb3-11e7-907b-a6006ad3dba0'),toUUID('61f0c404-5cb3-11e7-907b-a6006ad3dba0')]);

SELECT
    key,
    byteSize(*),
    ints,
    byteSize(ints),
    int_ints,
    byteSize(int_ints)
FROM test_byte_size_complex_array
ORDER BY key ASC;

SELECT
    'constants:',
    [[], [1,2], [0,0x10000]],
    toTypeName([[], [1,2], [0,0x10000]]),
    byteSize([[], [1,2], [0,0x10000]]);

-- select key, byteSize(*), strs, byteSize(strs), str_strs, byteSize(str_strs) from test_byte_size_complex_array order by key;
SELECT
    key,
    byteSize(*),
    strs,
    byteSize(strs),
    str_strs,
    byteSize(str_strs)
FROM test_byte_size_complex_array
ORDER BY key ASC;

SELECT
    'constants:',
    [[], [''], ['','a']],
    byteSize([[], [''], ['','a']]);

SELECT
    key,
    byteSize(*),
    opt_int32,
    byteSize(opt_int32),
    opt_str,
    byteSize(opt_str),
    tuple,
    byteSize(tuple),
    strings,
    byteSize(strings)
FROM test_byte_size_other
ORDER BY key ASC;

SELECT
    'constants:',
    NULL,
    byteSize(NULL),
    tuple(0x10000, NULL),
    byteSize(tuple(0x10000, NULL)),
    tuple(0x10000, toNullable('a')),
    byteSize(tuple(0x10000, toNullable('a')));

SELECT
    'constants:',
    toLowCardinality('abced'),
    toTypeName(toLowCardinality('abced')),
    byteSize(toLowCardinality('abced'));

SELECT
    key,
    byteSize(*),
    complex1,
    byteSize(complex1)
FROM test_byte_size_more_complex
ORDER BY key ASC;

SELECT
    'constants:',
    tuple(NULL, []),
    byteSize(tuple(NULL, [])),
    tuple(toNullable(toFixedString('a', 4)), []),
    byteSize(tuple(toNullable(toFixedString('a', 4)), [])),
    tuple(toNullable(toFixedString('a', 4)), [tuple(NULL, 'a')]),
    byteSize(tuple(toNullable(toFixedString('a', 4)), [tuple(NULL, 'a')])),
    tuple(toFixedString('a', 4), [tuple(NULL, 'a'), tuple(NULL, 'a')]),
    byteSize(tuple(toNullable(toFixedString('a', 4)), [tuple(NULL, 'a'), tuple(NULL, 'a')]));

SELECT
    'constants:',
    [tuple(NULL, []), tuple(toNullable(toFixedString('a',4)), []), tuple(toNullable(toFixedString('a',4)), [tuple(NULL, 'a')]), tuple(toNullable(toFixedString('a',4)), [tuple(NULL, 'a'), tuple(NULL, 'a')])];

SELECT
    'constants:',
    toTypeName([tuple(NULL, []), tuple(toNullable(toFixedString('a',4)), []), tuple(toNullable(toFixedString('a',4)), [tuple(NULL, 'a')]), tuple(toNullable(toFixedString('a',4)), [tuple(NULL, 'a'), tuple(NULL, 'a')])]);

SELECT
    'constants:',
    byteSize([tuple(NULL, []), tuple(toNullable(toFixedString('a',4)), []), tuple(toNullable(toFixedString('a',4)), [tuple(NULL, 'a')]), tuple(toNullable(toFixedString('a',4)), [tuple(NULL, 'a'), tuple(NULL, 'a')])]);