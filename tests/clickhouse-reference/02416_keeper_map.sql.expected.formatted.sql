CREATE TABLE `02416_test`
(
    key String,
    value UInt32
)
ENGINE = KeeperMap(concat('/', currentDatabase(), '/test2416')); -- { serverError BAD_ARGUMENTS }

CREATE TABLE `02416_test`
(
    key String,
    value UInt32
)
ENGINE = KeeperMap(concat('/', currentDatabase(), '/test2416'))
PRIMARY KEY key2; -- { serverError UNKNOWN_IDENTIFIER }

CREATE TABLE `02416_test`
(
    key String,
    value UInt32
)
ENGINE = KeeperMap(concat('/', currentDatabase(), '/test2416'))
PRIMARY KEY (key, value); -- { serverError BAD_ARGUMENTS }

CREATE TABLE `02416_test`
(
    key String,
    value UInt32
)
ENGINE = KeeperMap(concat('/', currentDatabase(), '/test2416'))
PRIMARY KEY concat(key, value); -- { serverError BAD_ARGUMENTS }

CREATE TABLE `02416_test`
(
    key Tuple(String, UInt32),
    value UInt64
)
ENGINE = KeeperMap(concat('/', currentDatabase(), '/test2416'))
PRIMARY KEY key;

CREATE TABLE `02416_test`
(
    key String,
    value UInt32
)
ENGINE = KeeperMap(concat('/', currentDatabase(), '/test2416'))
PRIMARY KEY key;

SELECT COUNT(1) == 1
FROM `02416_test`;

SELECT COUNT(1) == 1000
FROM `02416_test`;

SELECT uniqExact(key) == 32
FROM (
        SELECT *
        FROM `02416_test`
        LIMIT 32
        SETTINGS max_block_size = 1
    );

SELECT SUM(value) == 1 + 99 + 900
FROM `02416_test`
WHERE key IN ('1_1', '99_1', '900_1');

CREATE TABLE `02416_test`
(
    k UInt32,
    value UInt64,
    dummy Tuple(UInt32, Float64),
    bm AggregateFunction(groupBitmap, UInt64)
)
ENGINE = KeeperMap(concat('/', currentDatabase(), '/test2416'))
PRIMARY KEY k;

CREATE TABLE `02416_test_memory` AS `02416_test`
ENGINE = Memory;

SELECT
    A.a = B.a,
    A.b = B.b,
    A.c = B.c,
    A.d = B.d,
    A.e = B.e
FROM
    (
        SELECT
            0 AS a,
            groupBitmapMerge(bm) AS b,
            SUM(k) AS c,
            SUM(value) AS d,
            SUM(dummy.1) AS e
        FROM `02416_test`
    ) AS A
LEFT JOIN (
        SELECT
            0 AS a,
            groupBitmapMerge(bm) AS b,
            SUM(k) AS c,
            SUM(value) AS d,
            SUM(dummy.1) AS e
        FROM `02416_test_memory`
    ) AS B
    USING (a)
ORDER BY a ASC;

SELECT 0 == COUNT(1)
FROM `02416_test`;