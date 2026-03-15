CREATE TABLE ttl_with_default
(
    d DateTime,
    a Int DEFAULT 777 TTL d + toIntervalSecond(5)
)
ENGINE = MergeTree
ORDER BY d;

SELECT sleep(0.7)
FORMAT Null; -- wait if very fast merge happen

SELECT a
FROM ttl_with_default
ORDER BY a ASC;