-- Tags: no-parallel
SYSTEM DROP  TABLE IF EXISTS recompression_table;

CREATE TABLE recompression_table
(
    dt DateTime,
    key UInt64,
    value String
)
ENGINE = MergeTree()
ORDER BY tuple()
PARTITION BY key
TTL dt + toIntervalMonth(1),
    dt + toIntervalYear(1)
SETTINGS min_rows_for_wide_part = 0, min_bytes_for_wide_part = 0, min_bytes_for_full_part_storage = 0;

INSERT INTO recompression_table SELECT
    now(),
    1,
    toString(number)
FROM numbers(1000);

INSERT INTO recompression_table SELECT
    now() - toIntervalMonth(2),
    2,
    toString(number)
FROM numbers(1000, 1000);

INSERT INTO recompression_table SELECT
    now() - toIntervalYear(2),
    3,
    toString(number)
FROM numbers(2000, 1000);

SELECT COUNT()
FROM recompression_table;

SELECT
    substring(name, 1, length(name) - 2),
    default_compression_codec
FROM `system`.parts
WHERE table = 'recompression_table'
    AND active = 1
    AND database = currentDatabase()
ORDER BY name ASC;

SELECT
    substring(name, 1, length(name) - 4),
    default_compression_codec
FROM `system`.parts
WHERE table = 'recompression_table'
    AND active = 1
    AND database = currentDatabase()
ORDER BY name ASC;

SELECT
    substring(name, 1, length(name) - 4),
    recompression_ttl_info.expression
FROM `system`.parts
WHERE table = 'recompression_table'
    AND active = 1
    AND database = currentDatabase()
ORDER BY name ASC;

CREATE TABLE recompression_table_compact
(
    dt DateTime,
    key UInt64,
    value String
)
ENGINE = MergeTree()
ORDER BY tuple()
PARTITION BY key
TTL dt + toIntervalMonth(1),
    dt + toIntervalYear(1)
SETTINGS min_rows_for_wide_part = 10000, min_bytes_for_full_part_storage = 0;

INSERT INTO recompression_table_compact SELECT
    now(),
    1,
    toString(number)
FROM numbers(1000);

INSERT INTO recompression_table_compact SELECT
    now() - toIntervalMonth(2),
    2,
    toString(number)
FROM numbers(1000, 1000);

INSERT INTO recompression_table_compact SELECT
    now() - toIntervalYear(2),
    3,
    toString(number)
FROM numbers(2000, 1000);

SELECT
    substring(name, 1, length(name) - 2),
    default_compression_codec
FROM `system`.parts
WHERE table = 'recompression_table_compact'
    AND active = 1
    AND database = currentDatabase()
ORDER BY name ASC;

-- merge level and mutation in part name is not important
SELECT
    substring(name, 1, length(name) - 4),
    default_compression_codec
FROM `system`.parts
WHERE table = 'recompression_table_compact'
    AND active = 1
    AND database = currentDatabase()
ORDER BY name ASC;

SYSTEM DROP  TABLE recompression_table_compact;