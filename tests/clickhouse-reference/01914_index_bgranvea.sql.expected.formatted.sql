CREATE TABLE test
(
    id UInt64,
    insid UInt64,
    insidvalue Nullable(UInt64),
    INDEX insid_idx insid TYPE bloom_filter() GRANULARITY 1,
    INDEX insidvalue_idx insidvalue TYPE bloom_filter() GRANULARITY 1
)
ENGINE = MergeTree()
ORDER BY (insid, id);

SELECT *
FROM test
WHERE insid IN (1)
    OR insidvalue IN (1);

SELECT *
FROM test
WHERE insid IN (1)
    AND insidvalue IN (1);