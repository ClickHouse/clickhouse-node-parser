SELECT COUNT()
FROM single_column_bloom_filter
WHERE i32 = 1
SETTINGS max_rows_to_read = 6;

SELECT COUNT()
FROM single_column_bloom_filter
WHERE (i32, i32) = (1, 2)
SETTINGS max_rows_to_read = 6;

SELECT COUNT()
FROM single_column_bloom_filter
WHERE (i32, i64) = (1, 1)
SETTINGS max_rows_to_read = 6;

SELECT COUNT()
FROM single_column_bloom_filter
WHERE (i64, (i64, i32)) = (1, (1, 1))
SETTINGS max_rows_to_read = 6;

SELECT COUNT()
FROM single_column_bloom_filter
WHERE i32 IN (1, 2)
SETTINGS max_rows_to_read = 6;

SELECT COUNT()
FROM single_column_bloom_filter
WHERE (i32, i32) IN ((1, 2), (2, 3))
SETTINGS max_rows_to_read = 6;

SELECT COUNT()
FROM single_column_bloom_filter
WHERE (i32, i64) IN ((1, 1), (2, 2))
SETTINGS max_rows_to_read = 6;

SELECT COUNT()
FROM single_column_bloom_filter
WHERE (i64, (i64, i32)) IN ((1, (1, 1)), (2, (2, 2)))
SETTINGS max_rows_to_read = 6;

SELECT COUNT()
FROM single_column_bloom_filter
WHERE i32 IN (
        SELECT arrayJoin([toInt32(1), toInt32(2)])
    )
SETTINGS max_rows_to_read = 7;

SELECT COUNT()
FROM single_column_bloom_filter
WHERE (i32, i32) IN (
        SELECT arrayJoin([(toInt32(1), toInt32(2)), (toInt32(2), toInt32(3))])
    )
SETTINGS max_rows_to_read = 7;

SELECT COUNT()
FROM single_column_bloom_filter
WHERE (i32, i64) IN (
        SELECT arrayJoin([(toInt32(1), toUInt64(1)), (toInt32(2), toUInt64(2))])
    )
SETTINGS max_rows_to_read = 7;

SELECT COUNT()
FROM single_column_bloom_filter
WHERE (i64, (i64, i32)) IN (
        SELECT arrayJoin([(toUInt64(1), (toUInt64(1), toInt32(1))), (toUInt64(2), (toUInt64(2), toInt32(2)))])
    )
SETTINGS max_rows_to_read = 7;

SELECT SUM(ignore(*) + 1)
FROM single_column_bloom_filter
WHERE indexHint(i32 IN (3, 15, 50));

SELECT COUNT()
FROM single_column_bloom_filter
WHERE (i32 = 200) = ((i32 = 200));

SELECT SUM(ignore(*) + 1)
FROM single_column_bloom_filter
WHERE indexHint((i32 = 200) != ((i32 = 200)));

SELECT COUNT()
FROM single_column_bloom_filter
WHERE indexOf([10, 20, 30], i32) != 0;

SELECT COUNT()
FROM single_column_bloom_filter
WHERE has([100, 200, 300], 200);

SELECT COUNT()
FROM bloom_filter_types_test
WHERE i8 = 1
SETTINGS max_rows_to_read = 6;

SELECT COUNT()
FROM bloom_filter_types_test
WHERE i16 = 1
SETTINGS max_rows_to_read = 6;

SELECT COUNT()
FROM bloom_filter_types_test
WHERE i32 = 1
SETTINGS max_rows_to_read = 6;

SELECT COUNT()
FROM bloom_filter_types_test
WHERE i64 = 1
SETTINGS max_rows_to_read = 6;

SELECT COUNT()
FROM bloom_filter_types_test
WHERE u8 = 1
SETTINGS max_rows_to_read = 6;

SELECT COUNT()
FROM bloom_filter_types_test
WHERE u16 = 1
SETTINGS max_rows_to_read = 6;

SELECT COUNT()
FROM bloom_filter_types_test
WHERE u32 = 1
SETTINGS max_rows_to_read = 6;

SELECT COUNT()
FROM bloom_filter_types_test
WHERE u64 = 1
SETTINGS max_rows_to_read = 6;

SELECT COUNT()
FROM bloom_filter_types_test
WHERE f32 = 1
SETTINGS max_rows_to_read = 6;

SELECT COUNT()
FROM bloom_filter_types_test
WHERE f64 = 1
SETTINGS max_rows_to_read = 6;

SELECT COUNT()
FROM bloom_filter_types_test
WHERE date = '1970-01-02'
SETTINGS max_rows_to_read = 6;

SELECT COUNT()
FROM bloom_filter_types_test
WHERE date_time = toDateTime('1970-01-01 02:00:01', 'Asia/Istanbul')
SETTINGS max_rows_to_read = 6;

SELECT COUNT()
FROM bloom_filter_types_test
WHERE str = '1'
SETTINGS max_rows_to_read = 12;

SELECT COUNT()
FROM bloom_filter_types_test
WHERE fixed_string = toFixedString('1', 5)
SETTINGS max_rows_to_read = 12;

SELECT COUNT()
FROM bloom_filter_types_test
WHERE dt64 = toDateTime64('1970-01-01 02:00:01', 3, 'Asia/Istanbul')
SETTINGS max_rows_to_read = 12;

SELECT COUNT()
FROM bloom_filter_types_test
WHERE str IN (
        SELECT str
        FROM bloom_filter_types_test
    );

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(i8, 1);

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(i16, 1);

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(i32, 1);

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(i64, 1);

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(u8, 1);

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(u16, 1);

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(u32, 1);

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(u64, 1);

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(f32, 1);

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(f64, 1);

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(date, toDate('1970-01-02'));

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(date_time, toDateTime('1970-01-01 02:00:01', 'Asia/Istanbul'));

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(str, '1');

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(fixed_string, toFixedString('1', 5));

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(dt64, toDateTime64('1970-01-01 02:00:01', 3, 'Asia/Istanbul'));

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(i8, 5);

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(i16, 5);

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(i32, 5);

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(i64, 5);

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(u8, 5);

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(u16, 5);

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(u32, 5);

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(u64, 5);

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(f32, 5);

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(f64, 5);

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(date, toDate('1970-01-06'));

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(date_time, toDateTime('1970-01-01 02:00:05', 'Asia/Istanbul'));

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(str, '5');

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(fixed_string, toFixedString('5', 5));

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(dt64, toDateTime64('1970-01-01 02:00:05', 3, 'Asia/Istanbul'));

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(i8, 10);

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(i16, 10);

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(i32, 10);

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(i64, 10);

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(u8, 10);

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(u16, 10);

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(u32, 10);

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(u64, 10);

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(f32, 10);

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(f64, 10);

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(date, toDate('1970-01-11'));

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(date_time, toDateTime('1970-01-01 02:00:10', 'Asia/Istanbul'));

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(str, '10');

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(fixed_string, toFixedString('10', 5));

SELECT COUNT()
FROM bloom_filter_array_types_test
WHERE has(dt64, toDateTime64('1970-01-01 02:00:10', 3, 'Asia/Istanbul'));

SELECT COUNT()
FROM bloom_filter_null_types_test
WHERE i8 = 1
SETTINGS max_rows_to_read = 6;

SELECT COUNT()
FROM bloom_filter_null_types_test
WHERE i16 = 1
SETTINGS max_rows_to_read = 6;

SELECT COUNT()
FROM bloom_filter_null_types_test
WHERE i32 = 1
SETTINGS max_rows_to_read = 6;

SELECT COUNT()
FROM bloom_filter_null_types_test
WHERE i64 = 1
SETTINGS max_rows_to_read = 6;

SELECT COUNT()
FROM bloom_filter_null_types_test
WHERE u8 = 1
SETTINGS max_rows_to_read = 6;

SELECT COUNT()
FROM bloom_filter_null_types_test
WHERE u16 = 1
SETTINGS max_rows_to_read = 6;

SELECT COUNT()
FROM bloom_filter_null_types_test
WHERE u32 = 1
SETTINGS max_rows_to_read = 6;

SELECT COUNT()
FROM bloom_filter_null_types_test
WHERE u64 = 1
SETTINGS max_rows_to_read = 6;

SELECT COUNT()
FROM bloom_filter_null_types_test
WHERE f32 = 1
SETTINGS max_rows_to_read = 6;

SELECT COUNT()
FROM bloom_filter_null_types_test
WHERE f64 = 1
SETTINGS max_rows_to_read = 6;

SELECT COUNT()
FROM bloom_filter_null_types_test
WHERE date = '1970-01-02'
SETTINGS max_rows_to_read = 6;

SELECT COUNT()
FROM bloom_filter_null_types_test
WHERE date_time = toDateTime('1970-01-01 02:00:01', 'Asia/Istanbul')
SETTINGS max_rows_to_read = 6;

SELECT COUNT()
FROM bloom_filter_null_types_test
WHERE str = '1'
SETTINGS max_rows_to_read = 12;

SELECT COUNT()
FROM bloom_filter_null_types_test
WHERE fixed_string = toFixedString('1', 5)
SETTINGS max_rows_to_read = 12;

SELECT COUNT()
FROM bloom_filter_null_types_test
WHERE dt64 = toDateTime64('1970-01-01 02:00:01', 3, 'Asia/Istanbul')
SETTINGS max_rows_to_read = 12;

SELECT COUNT()
FROM bloom_filter_null_types_test
WHERE isNull(i8);

SELECT COUNT()
FROM bloom_filter_null_types_test
WHERE isNull(i16);

SELECT COUNT()
FROM bloom_filter_null_types_test
WHERE isNull(i32);

SELECT COUNT()
FROM bloom_filter_null_types_test
WHERE isNull(i64);

SELECT COUNT()
FROM bloom_filter_null_types_test
WHERE isNull(u8);

SELECT COUNT()
FROM bloom_filter_null_types_test
WHERE isNull(u16);

SELECT COUNT()
FROM bloom_filter_null_types_test
WHERE isNull(u32);

SELECT COUNT()
FROM bloom_filter_null_types_test
WHERE isNull(u64);

SELECT COUNT()
FROM bloom_filter_null_types_test
WHERE isNull(f32);

SELECT COUNT()
FROM bloom_filter_null_types_test
WHERE isNull(f64);

SELECT COUNT()
FROM bloom_filter_null_types_test
WHERE isNull(date);

SELECT COUNT()
FROM bloom_filter_null_types_test
WHERE isNull(date_time);

SELECT COUNT()
FROM bloom_filter_null_types_test
WHERE isNull(str);

SELECT COUNT()
FROM bloom_filter_null_types_test
WHERE isNull(fixed_string);

SELECT COUNT()
FROM bloom_filter_null_types_test
WHERE isNull(dt64);

SELECT COUNT()
FROM bloom_filter_null_types_test
WHERE str IN (
        SELECT str
        FROM bloom_filter_null_types_test
    );

SELECT COUNT()
FROM bloom_filter_lc_null_types_test
WHERE str = '1'
SETTINGS max_rows_to_read = 12;

SELECT COUNT()
FROM bloom_filter_lc_null_types_test
WHERE fixed_string = toFixedString('1', 5)
SETTINGS max_rows_to_read = 12;

SELECT COUNT()
FROM bloom_filter_lc_null_types_test
WHERE isNull(str);

SELECT COUNT()
FROM bloom_filter_lc_null_types_test
WHERE isNull(fixed_string);

SELECT COUNT()
FROM bloom_filter_lc_null_types_test
WHERE str IN (
        SELECT str
        FROM bloom_filter_lc_null_types_test
    );

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(i8, 1);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(i16, 1);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(i32, 1);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(i64, 1);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(u8, 1);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(u16, 1);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(u32, 1);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(u64, 1);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(f32, 1);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(f64, 1);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(date, toDate('1970-01-02'));

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(date_time, toDateTime('1970-01-01 02:00:01', 'Asia/Istanbul'));

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(str, '1');

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(fixed_string, toFixedString('1', 5));

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(i8, 5);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(i16, 5);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(i32, 5);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(i64, 5);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(u8, 5);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(u16, 5);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(u32, 5);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(u64, 5);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(f32, 5);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(f64, 5);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(date, toDate('1970-01-06'));

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(date_time, toDateTime('1970-01-01 02:00:05', 'Asia/Istanbul'));

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(str, '5');

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(fixed_string, toFixedString('5', 5));

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(i8, 10);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(i16, 10);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(i32, 10);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(i64, 10);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(u8, 10);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(u16, 10);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(u32, 10);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(u64, 10);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(f32, 10);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(f64, 10);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(date, toDate('1970-01-11'));

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(date_time, toDateTime('1970-01-01 02:00:10', 'Asia/Istanbul'));

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(str, '10');

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(fixed_string, toFixedString('10', 5));

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(i8, NULL);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(i16, NULL);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(i32, NULL);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(i64, NULL);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(u8, NULL);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(u16, NULL);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(u32, NULL);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(u64, NULL);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(f32, NULL);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(f64, NULL);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(date, NULL);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(date_time, NULL);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(str, NULL);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(fixed_string, NULL);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(i8, 100);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(i16, 100);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(i32, 100);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(i64, 100);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(u8, 100);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(u16, 100);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(u32, 100);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(u64, 100);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(f32, 100);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(f64, 100);

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(date, toDate('1970-04-11'));

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(date_time, toDateTime('1970-01-01 02:01:40', 'Asia/Istanbul'));

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(str, '100');

SELECT COUNT()
FROM bloom_filter_array_lc_null_types_test
WHERE has(fixed_string, toFixedString('100', 5));

SELECT count()
FROM bloom_filter_array_offsets_lc_str
WHERE has(str, 'value');

SELECT count()
FROM bloom_filter_array_offsets_str
WHERE has(str, 'value');

SELECT count()
FROM bloom_filter_array_offsets_i
WHERE has(i, 99999);

SELECT id
FROM test_bf_indexOf
WHERE indexOf(ary, 'value1') = 0
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE indexOf(ary, 'value1') = 1
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE indexOf(ary, 'value2') = 0
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE indexOf(ary, 'value2') = 2
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE indexOf(ary, 'value3') = 0
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE indexOf(ary, 'value3') = 1
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE indexOf(ary, 'value1') != 0
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE indexOf(ary, 'value1') != 1
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE indexOf(ary, 'value2') != 0
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE indexOf(ary, 'value2') != 2
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE indexOf(ary, 'value3') != 0
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE indexOf(ary, 'value3') != 1
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE indexOf(ary, 'value1') = 2
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE indexOf(ary, 'value3') = 2
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE indexOf(ary, 'value1') = 1
    OR indexOf(ary, 'value3') = 1
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE NOT indexOf(ary, 'value1')
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE NOT indexOf(ary, 'value1') == 0
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE NOT indexOf(ary, 'value1') == 1
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE NOT indexOf(ary, 'value1') == 2
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE indexOf(ary, 'value1') IN (0)
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE indexOf(ary, 'value1') IN (1)
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE indexOf(ary, 'value1') IN (2)
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE indexOf(ary, 'value1') NOT IN (0)
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE indexOf(ary, 'value1') NOT IN (1)
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE indexOf(ary, 'value1') NOT IN (2)
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE indexOf(ary, 'value1') > 0
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE 0 < indexOf(ary, 'value1')
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE indexOf(ary, 'value1') >= 0
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE 0 <= indexOf(ary, 'value1')
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE indexOf(ary, 'value1') > 1
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE 1 < indexOf(ary, 'value1')
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE indexOf(ary, 'value1') >= 1
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE 1 <= indexOf(ary, 'value1')
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE indexOf(ary, 'value1') >= 2
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE 2 <= indexOf(ary, 'value1')
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE indexOf(ary, 'value1') = toDecimal32(0, 2)
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE toDecimal128(0, 2) = indexOf(ary, 'value1')
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE indexOf(ary, 'value1') = '0'
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE '0' = indexOf(ary, 'value1')
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE indexOf(ary, 'value1') > toDecimal32(0, 2)
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE indexOf(ary, 'value1') < toDecimal128(1, 2)
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE indexOf(ary, 'value1') > '0'
ORDER BY id ASC
FORMAT TSV;

SELECT id
FROM test_bf_indexOf
WHERE indexOf(ary, 'value1') < '1'
ORDER BY id ASC
FORMAT TSV;

SELECT
    id,
    ary[indexOf(ary, 'value1')]
FROM test_bf_indexOf
WHERE ary[indexOf(ary, 'value1')] = 'value1'
ORDER BY id ASC
FORMAT TSV;

SELECT
    id,
    ary[indexOf(ary, 'value2')]
FROM test_bf_indexOf
WHERE ary[indexOf(ary, 'value2')] = 'value2'
ORDER BY id ASC
FORMAT TSV;

SELECT
    id,
    ary[indexOf(ary, 'value3')]
FROM test_bf_indexOf
WHERE ary[indexOf(ary, 'value3')] = 'value3'
ORDER BY id ASC
FORMAT TSV;

SELECT count()
FROM test_bf_cast
WHERE CAST(c = 1
    OR c = 9999 AS Bool)
SETTINGS use_skip_indexes = 0;

SELECT count()
FROM test_bf_cast
WHERE CAST(c = 1
    OR c = 9999 AS Bool)
SETTINGS use_skip_indexes = 1;