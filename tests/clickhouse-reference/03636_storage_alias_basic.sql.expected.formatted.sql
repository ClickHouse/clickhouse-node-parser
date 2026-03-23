-- { echo }
-- Tags: long
SYSTEM DROP  TABLE IF EXISTS source_table;

SYSTEM DROP  TABLE IF EXISTS alias_1;

SYSTEM DROP  TABLE IF EXISTS alias_2;

SYSTEM DROP  TABLE IF EXISTS alias_3;

SYSTEM DROP  TABLE IF EXISTS alias_4;

SET allow_experimental_alias_table_engine = 1;

-- Create source table
CREATE TABLE source_table
(
    id UInt32,
    value String
)
ENGINE = MergeTree
ORDER BY id;

INSERT INTO source_table;

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

INSERT INTO alias_1;

SELECT *
FROM source_table
ORDER BY id ASC;

INSERT INTO alias_2;

SELECT
    id,
    value,
    status
FROM source_table
ORDER BY id ASC;

INSERT INTO alias_1;

SELECT count()
FROM source_table;

-- Re-insert data
INSERT INTO source_table;

SELECT *
FROM alias_3
ORDER BY id ASC;

SYSTEM DROP  TABLE alias_2;

SYSTEM DROP  TABLE alias_3;

CREATE TABLE alias_4
ENGINE = Alias('source_table');

SELECT *
FROM alias_4
ORDER BY id ASC;

INSERT INTO alias_4;

INSERT INTO alias_4;

INSERT INTO alias_4;

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

SYSTEM DROP  TABLE IF EXISTS source_partitioned;

SYSTEM DROP  TABLE IF EXISTS alias_part;

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

INSERT INTO alias_part;

SELECT count()
FROM alias_part;

INSERT INTO alias_4 SELECT
    id + 100,
    value,
    status
FROM source_table
WHERE id <= 10;

SELECT count()
FROM source_table
WHERE id > 100;

-- Test: EXCHANGE TABLES
SYSTEM DROP  TABLE IF EXISTS table_a_exchange;

SYSTEM DROP  TABLE IF EXISTS table_b_exchange;

SYSTEM DROP  TABLE IF EXISTS alias_a_exchange;

SYSTEM DROP  TABLE IF EXISTS alias_b_exchange;

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

INSERT INTO table_a_exchange;

INSERT INTO table_b_exchange;

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

SYSTEM DROP  TABLE alias_a_exchange;

SYSTEM DROP  TABLE alias_b_exchange;

SYSTEM DROP  TABLE table_a_exchange;

SYSTEM DROP  TABLE table_b_exchange;

SYSTEM DROP  TABLE IF EXISTS source_attach;

SYSTEM DROP  TABLE IF EXISTS alias_attach;

CREATE TABLE source_attach
(
    id UInt32,
    data String
)
ENGINE = MergeTree
ORDER BY id;

INSERT INTO source_attach;

CREATE TABLE alias_attach
ENGINE = Alias('source_attach');

SELECT *
FROM alias_attach
ORDER BY id ASC;

SELECT *
FROM source_attach
ORDER BY id ASC;

-- Insert through alias after ATTACH
INSERT INTO alias_attach;

SYSTEM DROP  TABLE alias_attach;

SYSTEM DROP  TABLE source_attach;

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

INSERT INTO metadata_target;

SELECT *
FROM metadata_alias
ORDER BY id ASC;

SELECT name
FROM `system`.`columns`
WHERE database = currentDatabase()
    AND table = 'metadata_alias'
ORDER BY name ASC;

-- INSERT through alias with new column should work
INSERT INTO metadata_alias;

-- Insert with all columns
INSERT INTO metadata_alias;

SELECT
    id,
    value,
    extra,
    num
FROM metadata_alias
WHERE id = 4;

-- INSERT after DROP should work (without dropped column)
INSERT INTO metadata_alias;

SELECT
    id,
    value,
    extra
FROM metadata_alias
WHERE id = 5;

SYSTEM DROP  TABLE metadata_alias;

SYSTEM DROP  TABLE metadata_target;

SYSTEM DROP  TABLE IF EXISTS alias_with_missing_target;

SYSTEM DROP  TABLE IF EXISTS temp_target;

CREATE TABLE temp_target
(
    id UInt32,
    value String
)
ENGINE = MergeTree
ORDER BY id;

INSERT INTO temp_target;

CREATE TABLE alias_with_missing_target
ENGINE = Alias('temp_target');

SELECT *
FROM alias_with_missing_target
ORDER BY id ASC;

SYSTEM DROP  TABLE temp_target;

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

SYSTEM DROP  TABLE alias_with_missing_target;

-- Test: Materialized views on both Alias and target table
SYSTEM DROP  TABLE IF EXISTS mv_test_from_alias;

SYSTEM DROP  TABLE IF EXISTS mv_test_from_target;

SYSTEM DROP  TABLE IF EXISTS mv_test_alias_dest;

SYSTEM DROP  TABLE IF EXISTS mv_test_target_dest;

SYSTEM DROP  TABLE IF EXISTS mv_test_alias;

SYSTEM DROP  TABLE IF EXISTS mv_test_source;

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

-- Test: Insert into mv_test_alias should trigger BOTH MVs
INSERT INTO mv_test_alias;

SELECT *
FROM mv_test_alias_dest
ORDER BY id ASC;

SELECT *
FROM mv_test_target_dest
ORDER BY id ASC;

-- Test: Insert into mv_test_source should trigger only target MV
INSERT INTO mv_test_source;

SYSTEM DROP  TABLE mv_test_from_alias;

SYSTEM DROP  TABLE mv_test_from_target;

SYSTEM DROP  TABLE mv_test_alias_dest;

SYSTEM DROP  TABLE mv_test_target_dest;

SYSTEM DROP  TABLE mv_test_alias;

SYSTEM DROP  TABLE mv_test_source;