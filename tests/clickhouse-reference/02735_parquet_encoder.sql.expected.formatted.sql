SELECT (
        SELECT sum(cityHash64(*))
        FROM basic_types_02735
    ) - (
        SELECT sum(cityHash64(*))
        FROM file(basic_types_02735.parquet)
    );

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

SELECT (
        SELECT sum(cityHash64(*))
        FROM nullables_02735
    ) - (
        SELECT sum(cityHash64(*))
        FROM file(nullables_02735.parquet)
    );

SELECT (
        SELECT sum(cityHash64(*))
        FROM arrays_02735
    ) - (
        SELECT sum(cityHash64(*))
        FROM arrays_out_02735
    );

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