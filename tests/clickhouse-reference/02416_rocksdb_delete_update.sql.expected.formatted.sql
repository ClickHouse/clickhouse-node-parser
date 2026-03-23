-- Tags: no-ordinary-database, no-fasttest, use-rocksdb
DROP TABLE IF EXISTS `02416_rocksdb`;

CREATE TABLE `02416_rocksdb`
(
    key UInt64,
    value String,
    value2 UInt64
)
ENGINE = EmbeddedRocksDB
PRIMARY KEY key;

INSERT INTO `02416_rocksdb`;

SELECT *
FROM `02416_rocksdb`
ORDER BY key ASC;

SELECT '-----------';

SELECT count()
FROM `02416_rocksdb`;

INSERT INTO `02416_rocksdb`;