DROP TABLE IF EXISTS `03409_users`;

CREATE TABLE `03409_users`
(
    uid Int16,
    name String,
    age Nullable(Int16),
    age2 Nullable(Int16),
    version Nullable(UInt8)
)
ENGINE = CoalescingMergeTree()
ORDER BY (uid, name);

INSERT INTO `03409_users`;

INSERT INTO `03409_users`;

INSERT INTO `03409_users`;

INSERT INTO `03409_users`;

INSERT INTO `03409_users`;

SELECT *
FROM `03409_users` FINAL
ORDER BY `ALL` ASC;

SELECT *
FROM `03409_users`
ORDER BY `ALL` ASC;

CREATE TABLE `03409_users`
(
    uid Int16,
    name String,
    age Nullable(Int16),
    age2 Nullable(Int16),
    version Nullable(UInt8)
)
ENGINE = CoalescingMergeTree(version)
ORDER BY (uid, name);

INSERT INTO `03409_users`;

INSERT INTO `03409_users`;