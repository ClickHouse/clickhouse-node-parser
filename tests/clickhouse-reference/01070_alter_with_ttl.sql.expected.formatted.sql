DROP TABLE IF EXISTS alter_ttl;

SET allow_suspicious_ttl_expressions = 1;

CREATE TABLE alter_ttl
(
    i Int
)
ENGINE = MergeTree
ORDER BY i
TTL toDate('2020-05-05');

DROP TABLE alter_ttl;

CREATE TABLE alter_ttl
(
    d Date,
    s String
)
ENGINE = MergeTree
ORDER BY d
TTL d + toIntervalMonth(1);