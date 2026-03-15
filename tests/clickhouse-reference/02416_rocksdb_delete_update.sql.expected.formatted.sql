CREATE TABLE `02416_rocksdb`
(
    key UInt64,
    value String,
    value2 UInt64
)
ENGINE = EmbeddedRocksDB
PRIMARY KEY key;

SELECT *
FROM `02416_rocksdb`
ORDER BY key ASC;

SELECT '-----------';

SELECT count()
FROM `02416_rocksdb`;