SET allow_experimental_alias_table_engine = 1;

-- Create source table
CREATE TABLE source_table
(
    id UInt32,
    value String
)
ENGINE = MergeTree
ORDER BY id;

CREATE TABLE alias_1
ENGINE = Alias('source_table');

SELECT *
FROM alias_1
ORDER BY id ASC;

CREATE TABLE alias_2
ENGINE = Alias(currentDatabase(), 'source_table');

SELECT *
FROM alias_2
ORDER BY id ASC;

SELECT *
FROM source_table
ORDER BY id ASC;

SELECT
    id,
    value,
    status
FROM source_table
ORDER BY id ASC;

SELECT count()
FROM source_table;

SELECT *
FROM alias_3
ORDER BY id ASC;

CREATE TABLE alias_4
ENGINE = Alias('source_table');

SELECT *
FROM alias_4
ORDER BY id ASC;

SELECT count() AS parts_after
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'source_table'
    AND active;

SELECT count()
FROM alias_4;

SELECT
    id,
    value,
    status
FROM source_table
WHERE id = 1;

SELECT count()
FROM source_table
WHERE id = 2;

CREATE TABLE source_partitioned
(
    date Date,
    id UInt32,
    value String
)
ENGINE = MergeTree
ORDER BY id
PARTITION BY toYYYYMM(date);

CREATE TABLE alias_part
ENGINE = Alias('source_partitioned');

SELECT count()
FROM alias_part;

SELECT count()
FROM source_table
WHERE id > 100;

CREATE TABLE table_a_exchange
(
    value String
)
ENGINE = MergeTree()
ORDER BY value;

CREATE TABLE table_b_exchange
(
    value String
)
ENGINE = MergeTree()
ORDER BY value;

CREATE TABLE alias_a_exchange
ENGINE = Alias(table_a_exchange);

CREATE TABLE alias_b_exchange
ENGINE = Alias(table_b_exchange);

SELECT *
FROM alias_a_exchange
ORDER BY value ASC;

SELECT *
FROM alias_b_exchange
ORDER BY value ASC;

CREATE TABLE source_attach
(
    id UInt32,
    data String
)
ENGINE = MergeTree
ORDER BY id;

CREATE TABLE alias_attach
ENGINE = Alias('source_attach');

SELECT *
FROM alias_attach
ORDER BY id ASC;

SELECT *
FROM source_attach
ORDER BY id ASC;

CREATE TABLE self_ref_test
ENGINE = Alias('self_ref_test'); -- { serverError BAD_ARGUMENTS }

CREATE TABLE metadata_target
(
    id UInt32,
    value String
)
ENGINE = MergeTree
ORDER BY id;

CREATE TABLE metadata_alias
ENGINE = Alias('metadata_target');

SELECT *
FROM metadata_alias
ORDER BY id ASC;

SELECT name
FROM `system`.`columns`
WHERE database = currentDatabase()
    AND table = 'metadata_alias'
ORDER BY name ASC;

SELECT
    id,
    value,
    extra,
    num
FROM metadata_alias
WHERE id = 4;

SELECT
    id,
    value,
    extra
FROM metadata_alias
WHERE id = 5;

CREATE TABLE temp_target
(
    id UInt32,
    value String
)
ENGINE = MergeTree
ORDER BY id;

CREATE TABLE alias_with_missing_target
ENGINE = Alias('temp_target');

SELECT *
FROM alias_with_missing_target
ORDER BY id ASC;

SELECT
    name,
    engine
FROM `system`.tables
WHERE database = currentDatabase()
    AND name = 'alias_with_missing_target';

SELECT arraySort(groupUniqArray(name))
FROM `system`.tables
WHERE database = currentDatabase();

SELECT arraySort(groupUniqArray(name))
FROM `system`.`columns`
WHERE database = currentDatabase()
    AND table = 'alias_with_missing_target';

SELECT
    database,
    table,
    name
FROM `system`.`columns`
WHERE database = currentDatabase()
    AND table = 'alias_with_missing_target'
ORDER BY name ASC;

SELECT
    name,
    engine,
    total_rows,
    total_bytes,
    data_paths
FROM `system`.tables
WHERE database = currentDatabase()
    AND name = 'alias_with_missing_target';

-- Create source table and alias
CREATE TABLE mv_test_source
(
    id UInt32,
    value String
)
ENGINE = MergeTree
ORDER BY id;

CREATE TABLE mv_test_alias
ENGINE = Alias('mv_test_source');

-- Create destination tables for MVs
CREATE TABLE mv_test_alias_dest
(
    id UInt32,
    value String
)
ENGINE = MergeTree
ORDER BY id;

CREATE TABLE mv_test_target_dest
(
    id UInt32,
    value String
)
ENGINE = MergeTree
ORDER BY id;

-- Create MV on Alias table
CREATE MATERIALIZED VIEW mv_test_from_alias
TO mv_test_alias_dest
AS
SELECT
    id,
    value
FROM mv_test_alias;

-- Create MV on target table (mv_test_source)
CREATE MATERIALIZED VIEW mv_test_from_target
TO mv_test_target_dest
AS
SELECT
    id,
    value
FROM mv_test_source;

SELECT *
FROM mv_test_alias_dest
ORDER BY id ASC;

SELECT *
FROM mv_test_target_dest
ORDER BY id ASC;