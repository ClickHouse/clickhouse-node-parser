CREATE TABLE tbl
(
    a UInt64,
    b UInt64,
    c UInt64,
    d UInt64,
    e UInt64,
    INDEX mm1_idx (a, c, d) TYPE minmax,
    INDEX mm2_idx (c, d, e) TYPE minmax,
    INDEX set_idx (e) TYPE set(100),
    INDEX blf_idx (d, b) TYPE bloom_filter(0.8)
)
ENGINE = MergeTree
PRIMARY KEY (c, a)
SETTINGS add_minmax_index_for_numeric_columns = 0;

SELECT '--- Aliases of SHOW INDEX';

CREATE TABLE `$4@^7`
(
    c String
)
ENGINE = MergeTree
ORDER BY c
SETTINGS add_minmax_index_for_numeric_columns = 0;

CREATE TABLE `NULL`
(
    c String
)
ENGINE = MergeTree
ORDER BY c
SETTINGS add_minmax_index_for_numeric_columns = 0;

CREATE TABLE `tab.with.dots`
(
    a UInt64,
    b UInt64,
    c UInt64,
    d UInt64,
    e UInt64,
    INDEX mm1_idx (a, c, d) TYPE minmax,
    INDEX mm2_idx (c, d, e) TYPE minmax,
    INDEX set_idx (e) TYPE set(100),
    INDEX blf_idx (d, b) TYPE bloom_filter(0.8)
)
ENGINE = MergeTree
PRIMARY KEY (c, a)
SETTINGS add_minmax_index_for_numeric_columns = 0;

CREATE TABLE `'`.`'`
(
    c String
)
ENGINE = MergeTree
ORDER BY c
SETTINGS add_minmax_index_for_numeric_columns = 0;