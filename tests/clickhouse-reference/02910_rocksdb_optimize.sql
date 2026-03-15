-- Tags: use-rocksdb

CREATE TABLE dict (key UInt64, value String) ENGINE = EmbeddedRocksDB PRIMARY KEY key;
