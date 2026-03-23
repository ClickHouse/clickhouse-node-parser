-- Tags: no-parallel, no-object-storage
-- With s3 policy TTL TO DISK 'default' doesn't work (because we have no default, only 's3')
SYSTEM drop  table if exists ttl;

SET mutations_sync = 2;

-- check that ttl info was updated after mutation.
CREATE TABLE ttl
(
    i Int,
    a Int,
    s String
)
ENGINE = MergeTree
ORDER BY i;

INSERT INTO ttl;

SELECT *
FROM ttl
ORDER BY i ASC;

SYSTEM drop  table ttl;

-- check that skip index is updated after column was modified by ttl.
CREATE TABLE ttl
(
    i Int,
    a Int,
    s String DEFAULT 'b' TTL if(a % 2 = 0, today() - 10, toDate('2100-01-01')),
    INDEX ind_s s TYPE set(1) GRANULARITY 1
)
ENGINE = MergeTree
ORDER BY i;

INSERT INTO ttl;

SELECT count()
FROM ttl
WHERE s = 'a';

SELECT count()
FROM ttl
WHERE s = 'b';

-- check only that it doesn't throw exceptions.
SET allow_suspicious_ttl_expressions = 1;

CREATE TABLE ttl
(
    i Int,
    s String
)
ENGINE = MergeTree
ORDER BY i
TTL toDate('2000-01-01');

CREATE TABLE ttl
(
    a Int,
    b Int,
    c Int DEFAULT 42 TTL d,
    d Date,
    INDEX ind b * c TYPE minmax GRANULARITY 1
)
ENGINE = MergeTree
ORDER BY a;

INSERT INTO ttl;

SELECT *
FROM ttl;