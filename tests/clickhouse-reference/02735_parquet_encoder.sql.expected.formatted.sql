-- Tags: long, no-fasttest, no-parallel, no-tsan, no-msan, no-asan
SET output_format_parquet_use_custom_encoder = 1;

SET output_format_parquet_row_group_size = 1000;

SET output_format_parquet_data_page_size = 800;

SET output_format_parquet_batch_size = 100;

SET output_format_parquet_row_group_size_bytes = 1000000000;

SET engine_file_truncate_on_insert = 1;

SET allow_suspicious_low_cardinality_types = 1;

SET output_format_parquet_enum_as_byte_array = 0;

CREATE TEMPORARY TABLE basic_types_02735 AS
SELECT *
FROM generateRandom('
    u8 UInt8,
    u16 UInt16,
    u32 UInt32,
    u64 UInt64,
    i8 Int8,
    i16 Int16,
    i32 Int32,
    i64 Int64,
    date Date,
    date32 Date32,
    datetime DateTime,
    datetime64 DateTime64,
    enum8 Enum8(''x'' = 1, ''y'' = 2, ''z'' = 3),
    enum16 Enum16(''xx'' = 1000, ''yy'' = 2000, ''zz'' = 3000),
    float32 Float32,
    float64 Float64,
    str String,
    fstr FixedString(12),
    u128 UInt128,
    u256 UInt256,
    i128 Int128,
    i256 Int256,
    decimal32 Decimal32(3),
    decimal64 Decimal64(10),
    decimal128 Decimal128(20),
    decimal256 Decimal256(40),
    ipv4 IPv4,
    ipv6 IPv6')
LIMIT 1011;

INSERT INTO FUNCTION file(basic_types_02735.parquet) SELECT *
FROM basic_types_02735
SETTINGS output_format_parquet_datetime_as_uint32 = 1;

SELECT (
        SELECT sum(cityHash64(*))
        FROM basic_types_02735
    ) - (
        SELECT sum(cityHash64(*))
        FROM file(basic_types_02735.parquet)
    );

CREATE TEMPORARY TABLE datetime_02735 AS
SELECT *
FROM generateRandom('datetime DateTime')
LIMIT 1011;

INSERT INTO FUNCTION file(datetime_02735.parquet) SELECT *
FROM datetime_02735;

SELECT (
        SELECT sum(cityHash64(toDateTime64(datetime, 3)))
        FROM datetime_02735
    ) - (
        SELECT sum(cityHash64(*))
        FROM file(datetime_02735.parquet)
    );

SELECT (
        SELECT sum(cityHash64(*))
        FROM datetime_02735
    ) - (
        SELECT sum(cityHash64(*))
        FROM file(datetime_02735.parquet, Parquet, 'datetime DateTime')
    );

CREATE TEMPORARY TABLE nullables_02735 AS
SELECT *
FROM generateRandom('
    u16 Nullable(UInt16),
    i64 Nullable(Int64),
    datetime64 Nullable(DateTime64),
    enum8 Nullable(Enum8(''x'' = 1, ''y'' = 2, ''z'' = 3)),
    float64 Nullable(Float64),
    str Nullable(String),
    fstr Nullable(FixedString(12)),
    i256 Nullable(Int256),
    decimal256 Nullable(Decimal256(40)),
    ipv6 Nullable(IPv6)')
LIMIT 1000;

INSERT INTO FUNCTION file(nullables_02735.parquet) SELECT *
FROM nullables_02735;

SELECT (
        SELECT sum(cityHash64(*))
        FROM nullables_02735
    ) - (
        SELECT sum(cityHash64(*))
        FROM file(nullables_02735.parquet)
    );

CREATE TABLE arrays_02735
ENGINE = Memory AS
SELECT *
FROM generateRandom('
    u32 Array(UInt32),
    i8 Array(Int8),
    datetime Array(DateTime),
    enum16 Array(Enum16(''xx'' = 1000, ''yy'' = 2000, ''zz'' = 3000)),
    float32 Array(Float32),
    str Array(String),
    fstr Array(FixedString(12)),
    u128 Array(UInt128),
    decimal64 Array(Decimal64(10)),
    ipv4 Array(IPv4),
    msi Map(String, Int16),
    tup Tuple(FixedString(3), Array(String), Map(Int8, Date))')
LIMIT 1000;

INSERT INTO FUNCTION file(arrays_02735.parquet) SELECT *
FROM arrays_02735;

CREATE TEMPORARY TABLE arrays_out_02735 AS arrays_02735;

INSERT INTO arrays_out_02735 SELECT *
FROM file(arrays_02735.parquet);

SELECT (
        SELECT sum(cityHash64(*))
        FROM arrays_02735
    ) - (
        SELECT sum(cityHash64(*))
        FROM arrays_out_02735
    );

CREATE TEMPORARY TABLE madness_02735 AS
SELECT *
FROM generateRandom('
    aa Array(Array(UInt32)),
    aaa Array(Array(Array(UInt32))),
    an Array(Nullable(String)),
    aan Array(Array(Nullable(FixedString(10)))),
    l LowCardinality(String),
    ln LowCardinality(Nullable(FixedString(11))),
    al Array(LowCardinality(UInt128)),
    aaln Array(Array(LowCardinality(Nullable(String)))),
    mln Map(LowCardinality(String), Nullable(Int8)),
    t Tuple(Map(FixedString(5), Tuple(Array(UInt16), Nullable(UInt16), Array(Tuple(Int8, Decimal64(10))))), Tuple(kitchen UInt64, sink String)),
    n Nested(hello UInt64, world Tuple(first String, second FixedString(1)))
    ')
LIMIT 1000;

INSERT INTO FUNCTION file(madness_02735.parquet) SELECT *
FROM madness_02735;

INSERT INTO FUNCTION file(a.csv) SELECT *
FROM madness_02735
ORDER BY tuple(*) ASC;

INSERT INTO FUNCTION file(b.csv) SELECT
    aa,
    aaa,
    an,
    aan,
    l,
    ln,
    arrayMap(x -> reinterpret(x, 'UInt128'), al) AS al_,
    aaln,
    mln,
    t,
    n.hello,
    n.world
FROM file(madness_02735.parquet)
ORDER BY tuple(aa, aaa, an, aan, l, ln, al_, aaln, mln, t, n.hello, n.world) ASC;

SELECT (
        SELECT sum(cityHash64(*))
        FROM file(a.csv, LineAsString)
    ) - (
        SELECT sum(cityHash64(*))
        FROM file(b.csv, LineAsString)
    );

-- Merging input blocks into bigger row groups.
INSERT INTO FUNCTION file(squash_02735.parquet) SELECT '012345'
UNION ALL
SELECT '543210'
SETTINGS max_block_size = 1;

SELECT
    num_columns,
    num_rows,
    num_row_groups
FROM file(squash_02735.parquet, ParquetMetadata);

-- Row group size limit in bytes.
INSERT INTO FUNCTION file(row_group_bytes_02735.parquet) SELECT '012345'
UNION ALL
SELECT '543210'
SETTINGS
    max_block_size = 1,
    output_format_parquet_row_group_size_bytes = 5;

SELECT
    num_columns,
    num_rows,
    num_row_groups
FROM file(row_group_bytes_02735.parquet, ParquetMetadata);

-- Row group size limit in rows.
INSERT INTO FUNCTION file(tiny_row_groups_02735.parquet) SELECT *
FROM numbers(3)
SETTINGS output_format_parquet_row_group_size = 1;

SELECT
    num_columns,
    num_rows,
    num_row_groups
FROM file(tiny_row_groups_02735.parquet, ParquetMetadata);

-- 1M unique 8-byte values should exceed dictionary_size_limit (1 MB).
INSERT INTO FUNCTION file(big_column_chunk_02735.parquet) SELECT number
FROM numbers(1000000)
SETTINGS output_format_parquet_row_group_size = 1000000;

SELECT
    num_columns,
    num_rows,
    num_row_groups
FROM file(big_column_chunk_02735.parquet, ParquetMetadata);

SELECT sum(cityHash64(number))
FROM file(big_column_chunk_02735.parquet);

-- Check statistics: signed vs unsigned, null count. Use enough rows to produce multiple pages.
INSERT INTO FUNCTION file(statistics_02735.parquet) SELECT
    100 + number % 200 AS a,
    toUInt32(number * 3000) AS u,
    toInt32(number * 3000) AS i,
    if(number % 10 == 9, toString(number), NULL) AS s
FROM numbers(1000000)
SETTINGS output_format_parquet_row_group_size = 1000000;

SELECT
    num_columns,
    num_rows,
    num_row_groups
FROM file(statistics_02735.parquet, ParquetMetadata);

SELECT tupleElement(c, 'statistics')
FROM
    file(statistics_02735.parquet, ParquetMetadata)
ARRAY JOIN tupleElement(row_groups[1], 'columns') AS c;

-- Statistics string length limit (max_statistics_size).
INSERT INTO FUNCTION file(long_string_02735.parquet) SELECT toString(range(number * 2000))
FROM numbers(2);

SELECT tupleElement(tupleElement(row_groups[1], 'columns'), 'statistics')
FROM file(long_string_02735.parquet, ParquetMetadata);

-- Compression setting.
INSERT INTO FUNCTION file(compressed_02735.parquet) SELECT concat('aaaaaaaaaaaaaaaa', toString(number)) AS s
FROM numbers(1000)
SETTINGS
    output_format_parquet_row_group_size = 10000,
    output_format_parquet_compression_method = 'zstd';

SELECT
    total_compressed_size < 10000,
    total_uncompressed_size > 15000
FROM file(compressed_02735.parquet, ParquetMetadata);

INSERT INTO FUNCTION file(compressed_02735.parquet) SELECT concat('aaaaaaaaaaaaaaaa', toString(number)) AS s
FROM numbers(1000)
SETTINGS
    output_format_parquet_row_group_size = 10000,
    output_format_parquet_compression_method = 'none';

INSERT INTO FUNCTION file(compressed_02735.parquet) SELECT if(number % 3 == 1, NULL, 42) AS x
FROM numbers(70)
SETTINGS output_format_parquet_compression_method = 'zstd';

SELECT sum(cityHash64(*))
FROM file(compressed_02735.parquet);

CREATE TEMPORARY TABLE other_encoders_02735 AS
SELECT
    number,
    number * 2
FROM numbers(10000);

INSERT INTO FUNCTION file(single_thread_02735.parquet) SELECT *
FROM other_encoders_02735
SETTINGS max_threads = 1;

SELECT sum(cityHash64(*))
FROM file(single_thread_02735.parquet);

INSERT INTO FUNCTION file(arrow_02735.parquet) SELECT *
FROM other_encoders_02735
SETTINGS output_format_parquet_use_custom_encoder = 0;

SELECT sum(cityHash64(*))
FROM file(arrow_02735.parquet);

-- String -> binary vs string; FixedString -> fixed-length-binary vs binary vs string.
INSERT INTO FUNCTION file(strings1_02735.parquet) SELECT
    'never',
    toFixedString('gonna', 5)
SETTINGS
    output_format_parquet_string_as_string = 1,
    output_format_parquet_fixed_string_as_fixed_byte_array = 1;

SELECT
    `columns`.5,
    `columns`.6
FROM
    file(strings1_02735.parquet, ParquetMetadata)
ARRAY JOIN `columns`;

INSERT INTO FUNCTION file(strings2_02735.parquet) SELECT
    'give',
    toFixedString('you', 3)
SETTINGS
    output_format_parquet_string_as_string = 0,
    output_format_parquet_fixed_string_as_fixed_byte_array = 0;

SELECT
    `columns`.5,
    `columns`.6
FROM
    file(strings2_02735.parquet, ParquetMetadata)
ARRAY JOIN `columns`;

INSERT INTO FUNCTION file(strings3_02735.parquet) SELECT toFixedString('up', 2)
SETTINGS
    output_format_parquet_string_as_string = 1,
    output_format_parquet_fixed_string_as_fixed_byte_array = 0;

SELECT
    `columns`.5,
    `columns`.6
FROM
    file(strings3_02735.parquet, ParquetMetadata)
ARRAY JOIN `columns`;

SELECT *
FROM file(strings1_02735.parquet);

SELECT *
FROM file(strings2_02735.parquet);

SELECT *
FROM file(strings3_02735.parquet);

-- DateTime64 with different units.
INSERT INTO FUNCTION file(datetime64_02735.parquet) SELECT
    toDateTime64(number / 1e3, 3) AS ms,
    toDateTime64(number / 1e6, 6) AS us,
    toDateTime64(number / 1e9, 9) AS ns,
    toDateTime64(number / 1e2, 2) AS cs,
    toDateTime64(number, 0) AS s,
    toDateTime64(number / 1e7, 7) AS dus
FROM numbers(2000);

SELECT sum(cityHash64(*))
FROM file(datetime64_02735.parquet);

INSERT INTO FUNCTION file(date_as_uint16.parquet) SELECT toDate('2025-08-12') AS d
SETTINGS output_format_parquet_date_as_uint16 = 1;

SELECT *
FROM file(date_as_uint16.parquet);