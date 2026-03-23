CREATE TABLE `03164_users`
(
    uid Nullable(Int16),
    name String,
    age Int16
)
ENGINE = MergeTree
ORDER BY (uid)
SETTINGS allow_nullable_key = 1;

INSERT INTO `03164_users`;

INSERT INTO `03164_users`;

INSERT INTO `03164_users`;

SELECT '-- Reproducer result:';

SELECT *
FROM `03164_users`
ORDER BY uid ASC
LIMIT 10
SETTINGS optimize_read_in_order = 1;

CREATE TABLE `03164_multi_key`
(
    c1 Nullable(UInt32),
    c2 Nullable(UInt32)
)
ENGINE = MergeTree
ORDER BY (c1, c2)
SETTINGS allow_nullable_key = 1;

INSERT INTO `03164_multi_key`;

SELECT
    c1,
    c2
FROM `03164_multi_key`
ORDER BY
    c1 ASC,
    c2 ASC
SETTINGS optimize_read_in_order = 1;

SELECT
    c1,
    c2
FROM `03164_multi_key`
ORDER BY
    c1 ASC,
    c2 ASC
SETTINGS optimize_read_in_order = 1;

SELECT
    c1,
    c2
FROM `03164_multi_key`
ORDER BY
    c1 ASC,
    c2 ASC
SETTINGS optimize_read_in_order = 1;

SELECT
    c1,
    c2
FROM `03164_multi_key`
ORDER BY
    c1 DESC,
    c2 DESC
SETTINGS optimize_read_in_order = 1;