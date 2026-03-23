-- Tags: no-fasttest
SYSTEM DROP  TABLE IF EXISTS tab SYNC;

SET allow_experimental_statistics = 1;

SET use_statistics = 1;

SET allow_suspicious_low_cardinality_types = 1;

SET mutations_sync = 2;

CREATE TABLE tab
(
    a LowCardinality(Int64) STATISTICS(countmin, minmax, tdigest, uniq),
    b LowCardinality(Nullable(String)) STATISTICS(countmin, uniq),
    c LowCardinality(Nullable(Int64)) STATISTICS(countmin, minmax, tdigest, uniq),
    d DateTime STATISTICS(countmin, minmax, tdigest, uniq),
    pk String
)
ENGINE = MergeTree()
ORDER BY pk;

INSERT INTO tab SELECT
    number,
    number,
    number,
    toDateTime(number),
    generateUUIDv4()
FROM `system`.numbers
LIMIT 10000;