DROP TABLE IF EXISTS data_02230_ttl;

DROP TABLE IF EXISTS null_02230_ttl;

CREATE TABLE data_02230_ttl
(
    date Date,
    key Int
)
ENGINE = MergeTree()
ORDER BY key
TTL date + 14;

SHOW CREATE TABLE data_02230_ttl FORMAT TSVRaw;

CREATE TABLE null_02230_ttl AS data_02230_ttl
ENGINE = Null();

SHOW CREATE TABLE null_02230_ttl FORMAT TSVRaw;

DROP TABLE data_02230_ttl;

DROP TABLE null_02230_ttl;

DROP TABLE IF EXISTS data_02230_column_ttl;

DROP TABLE IF EXISTS null_02230_column_ttl;

CREATE TABLE data_02230_column_ttl
(
    date Date,
    value Int TTL date + 7,
    key Int
)
ENGINE = MergeTree()
ORDER BY key
TTL date + 14;

SHOW CREATE TABLE data_02230_column_ttl FORMAT TSVRaw;

CREATE TABLE null_02230_column_ttl AS data_02230_column_ttl
ENGINE = Null();

-- check that order of columns is the same
SHOW CREATE TABLE null_02230_column_ttl FORMAT TSVRaw;

DROP TABLE data_02230_column_ttl;

DROP TABLE null_02230_column_ttl;