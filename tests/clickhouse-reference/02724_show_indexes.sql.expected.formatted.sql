-- Tags: no-parallel
-- no-parallel: creates a custom database schema and expects to use it exclusively
-- add_minmax_index_for_numeric_columns=0: Adds more output to SHOW INDEX
-- Create a test table and verify that the output of SHOW INDEXES is sane.
-- The matching of actual/expected results relies on the fact that the output of SHOW INDEX is sorted.
SYSTEM DROP  TABLE IF EXISTS tbl;

CREATE TABLE tbl
(
    a UInt64,
    b UInt64,
    c UInt64,
    d UInt64,
    e UInt64,
    INDEX mm1_idx tuple(a, c, d) TYPE minmax,
    INDEX mm2_idx tuple(c, d, e) TYPE minmax,
    INDEX set_idx e TYPE set(100),
    INDEX blf_idx tuple(d, b) TYPE bloom_filter(0.8)
)
ENGINE = MergeTree
PRIMARY KEY (c, a)
SETTINGS add_minmax_index_for_numeric_columns = 0;

SELECT '--- Aliases of SHOW INDEX';

SYSTEM DROP  TABLE IF EXISTS `$4@^7`;

CREATE TABLE `$4@^7`
(
    c String
)
ENGINE = MergeTree
ORDER BY c
SETTINGS add_minmax_index_for_numeric_columns = 0;

SYSTEM DROP  TABLE `$4@^7`;

SYSTEM DROP  TABLE IF EXISTS NULL;

CREATE TABLE `NULL`
(
    c String
)
ENGINE = MergeTree
ORDER BY c
SETTINGS add_minmax_index_for_numeric_columns = 0;

SYSTEM DROP  TABLE NULL;

SYSTEM DROP  TABLE IF EXISTS `tab.with.dots`;

CREATE TABLE `tab.with.dots`
(
    a UInt64,
    b UInt64,
    c UInt64,
    d UInt64,
    e UInt64,
    INDEX mm1_idx tuple(a, c, d) TYPE minmax,
    INDEX mm2_idx tuple(c, d, e) TYPE minmax,
    INDEX set_idx e TYPE set(100),
    INDEX blf_idx tuple(d, b) TYPE bloom_filter(0.8)
)
ENGINE = MergeTree
PRIMARY KEY (c, a)
SETTINGS add_minmax_index_for_numeric_columns = 0;

SYSTEM DROP  TABLE `tab.with.dots`;

SYSTEM DROP  DATABASE IF EXISTS `'`;

CREATE DATABASE `'`;

CREATE TABLE `'`.`'`
(
    c String
)
ENGINE = MergeTree
ORDER BY c
SETTINGS add_minmax_index_for_numeric_columns = 0;

SYSTEM DROP  TABLE `'`.`'`;

SYSTEM DROP  DATABASE `'`;

-- Create a table in a different database. Intentionally using the same table/column names as above so
-- we notice if something is buggy in the implementation of SHOW INDEX.
SYSTEM DROP  DATABASE IF EXISTS database_123456789abcde;

CREATE DATABASE database_123456789abcde; -- pseudo-random database name

SYSTEM DROP  TABLE IF EXISTS database_123456789abcde.tbl;

CREATE TABLE database_123456789abcde.tbl
(
    a UInt64,
    b UInt64,
    INDEX mmi_idx b TYPE minmax
)
ENGINE = MergeTree
PRIMARY KEY a
SETTINGS add_minmax_index_for_numeric_columns = 0;

SYSTEM DROP  DATABASE database_123456789abcde;

SYSTEM DROP  TABLE tbl;