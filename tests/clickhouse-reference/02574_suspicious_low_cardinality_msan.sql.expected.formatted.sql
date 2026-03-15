SET allow_suspicious_low_cardinality_types = 1;

CREATE TABLE table1__fuzz_19
(
    id LowCardinality(UInt16),
    v DateTime64(3, 'UTC')
)
ENGINE = ReplacingMergeTree(v)
ORDER BY id
PARTITION BY id % 200;

SELECT
    1023,
    ((((id % -9223372036854775807) = NULL)
    OR ((id % NULL) = 100)
    OR ((id % NULL) = 65537))) = (((id % inf) = 9223372036854775806)),
    (id % NULL) = NULL,
    (id % 3.4028234663852886e38) = 1023,
    2147483646
FROM table1__fuzz_19
ORDER BY
    ((((id % 1048577) = 1024)) % id) = 1023 DESC,
    id % 2147483646 ASC,
    ((id % 1) = 9223372036854775807)
    OR ((id % NULL) = 257) DESC;