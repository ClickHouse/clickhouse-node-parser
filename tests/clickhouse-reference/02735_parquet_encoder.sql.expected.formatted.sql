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

CREATE TEMPORARY TABLE arrays_out_02735 AS arrays_02735;

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

SELECT (
        SELECT sum(cityHash64(*))
        FROM file(a.csv, LineAsString)
    ) - (
        SELECT sum(cityHash64(*))
        FROM file(b.csv, LineAsString)
    );

SELECT
    num_columns,
    num_rows,
    num_row_groups
FROM file(squash_02735.parquet, ParquetMetadata);

SELECT
    num_columns,
    num_rows,
    num_row_groups
FROM file(row_group_bytes_02735.parquet, ParquetMetadata);

SELECT
    num_columns,
    num_rows,
    num_row_groups
FROM file(tiny_row_groups_02735.parquet, ParquetMetadata);

SELECT
    num_columns,
    num_rows,
    num_row_groups
FROM file(big_column_chunk_02735.parquet, ParquetMetadata);

SELECT sum(cityHash64(number))
FROM file(big_column_chunk_02735.parquet);

SELECT
    num_columns,
    num_rows,
    num_row_groups
FROM file(statistics_02735.parquet, ParquetMetadata);

SELECT tupleElement(c, 'statistics')
FROM
    file(statistics_02735.parquet, ParquetMetadata)
ARRAY JOIN tupleElement(row_groups[1], 'columns') AS c;

SELECT tupleElement(tupleElement(row_groups[1], 'columns'), 'statistics')
FROM file(long_string_02735.parquet, ParquetMetadata);

SELECT
    total_compressed_size < 10000,
    total_uncompressed_size > 15000
FROM file(compressed_02735.parquet, ParquetMetadata);

SELECT sum(cityHash64(*))
FROM file(compressed_02735.parquet);

CREATE TEMPORARY TABLE other_encoders_02735 AS
SELECT
    number,
    number * 2
FROM numbers(10000);

SELECT sum(cityHash64(*))
FROM file(single_thread_02735.parquet);

SELECT sum(cityHash64(*))
FROM file(arrow_02735.parquet);

SELECT
    `columns`.5,
    `columns`.6
FROM
    file(strings1_02735.parquet, ParquetMetadata)
ARRAY JOIN `columns`;

SELECT
    `columns`.5,
    `columns`.6
FROM
    file(strings2_02735.parquet, ParquetMetadata)
ARRAY JOIN `columns`;

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

SELECT sum(cityHash64(*))
FROM file(datetime64_02735.parquet);

SELECT *
FROM file(date_as_uint16.parquet);