-- Tags: long, no-fasttest, no-parallel, no-tsan, no-msan, no-asan

set output_format_parquet_use_custom_encoder = 1;
set output_format_parquet_row_group_size = 1000;
set output_format_parquet_data_page_size = 800;
set output_format_parquet_batch_size = 100;
set output_format_parquet_row_group_size_bytes = 1000000000;
set engine_file_truncate_on_insert = 1;
set allow_suspicious_low_cardinality_types = 1;
set output_format_parquet_enum_as_byte_array=0;
create temporary table basic_types_02735 as select * from generateRandom('
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
    ipv6 IPv6') limit 1011;
select (select sum(cityHash64(*)) from basic_types_02735) - (select sum(cityHash64(*)) from file(basic_types_02735.parquet));
create temporary table datetime_02735 as select * from generateRandom('datetime DateTime') limit 1011;
select (select sum(cityHash64(toDateTime64(datetime, 3))) from datetime_02735) - (select sum(cityHash64(*)) from file(datetime_02735.parquet));
select (select sum(cityHash64(*)) from datetime_02735) - (select sum(cityHash64(*)) from file(datetime_02735.parquet, Parquet, 'datetime DateTime'));
create temporary table nullables_02735 as select * from generateRandom('
    u16 Nullable(UInt16),
    i64 Nullable(Int64),
    datetime64 Nullable(DateTime64),
    enum8 Nullable(Enum8(''x'' = 1, ''y'' = 2, ''z'' = 3)),
    float64 Nullable(Float64),
    str Nullable(String),
    fstr Nullable(FixedString(12)),
    i256 Nullable(Int256),
    decimal256 Nullable(Decimal256(40)),
    ipv6 Nullable(IPv6)') limit 1000;
select (select sum(cityHash64(*)) from nullables_02735) - (select sum(cityHash64(*)) from file(nullables_02735.parquet));
create table arrays_02735 engine = Memory as select * from generateRandom('
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
    tup Tuple(FixedString(3), Array(String), Map(Int8, Date))') limit 1000;
create temporary table arrays_out_02735 as arrays_02735;
select (select sum(cityHash64(*)) from arrays_02735) - (select sum(cityHash64(*)) from arrays_out_02735);
create temporary table madness_02735 as select * from generateRandom('
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
    ') limit 1000;
select (select sum(cityHash64(*)) from file(a.csv, LineAsString)) - (select sum(cityHash64(*)) from file(b.csv, LineAsString));
select num_columns, num_rows, num_row_groups from file(squash_02735.parquet, ParquetMetadata);
select num_columns, num_rows, num_row_groups from file(row_group_bytes_02735.parquet, ParquetMetadata);
select num_columns, num_rows, num_row_groups from file(tiny_row_groups_02735.parquet, ParquetMetadata);
select num_columns, num_rows, num_row_groups from file(big_column_chunk_02735.parquet, ParquetMetadata);
select sum(cityHash64(number)) from file(big_column_chunk_02735.parquet);
select num_columns, num_rows, num_row_groups from file(statistics_02735.parquet, ParquetMetadata);
select tupleElement(c, 'statistics') from file(statistics_02735.parquet, ParquetMetadata) array join tupleElement(row_groups[1], 'columns') as c;
select tupleElement(tupleElement(row_groups[1], 'columns'), 'statistics') from file(long_string_02735.parquet, ParquetMetadata);
select total_compressed_size < 10000, total_uncompressed_size > 15000 from file(compressed_02735.parquet, ParquetMetadata);
select sum(cityHash64(*)) from file(compressed_02735.parquet);
create temporary table other_encoders_02735 as select number, number*2 from numbers(10000);
select sum(cityHash64(*)) from file(single_thread_02735.parquet);
select sum(cityHash64(*)) from file(arrow_02735.parquet);
select columns.5, columns.6 from file(strings1_02735.parquet, ParquetMetadata) array join columns;
select columns.5, columns.6 from file(strings2_02735.parquet, ParquetMetadata) array join columns;
select columns.5, columns.6 from file(strings3_02735.parquet, ParquetMetadata) array join columns;
select * from file(strings1_02735.parquet);
select * from file(strings2_02735.parquet);
select * from file(strings3_02735.parquet);
select sum(cityHash64(*)) from file(datetime64_02735.parquet);
select * from file(date_as_uint16.parquet);
