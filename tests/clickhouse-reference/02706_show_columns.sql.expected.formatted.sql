CREATE TABLE tab
(
    uint64 UInt64,
    int32 Nullable(Int32) COMMENT 'example comment',
    str String,
    INDEX idx str TYPE set(1000)
)
ENGINE = MergeTree
ORDER BY (uint64, str)
PRIMARY KEY uint64;

SELECT '--- Aliases of SHOW COLUMNS';

CREATE TABLE `$4@^7`
(
    c String
)
ENGINE = MergeTree
ORDER BY c;

CREATE TABLE `NULL`
(
    c String
)
ENGINE = MergeTree
ORDER BY c;

CREATE TABLE `tab.with.dots`
(
    c String
)
ENGINE = MergeTree
ORDER BY c;

CREATE TABLE `'`.`'`
(
    c String
)
ENGINE = MergeTree
ORDER BY c;