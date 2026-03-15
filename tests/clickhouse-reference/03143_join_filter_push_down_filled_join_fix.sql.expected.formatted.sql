CREATE TABLE t1
(
    id UInt64,
    external_id UInt64
)
ENGINE = MergeTree
ORDER BY id;

CREATE TABLE t2
(
    id UInt64,
    name String
)
ENGINE = MergeTree
ORDER BY id;

CREATE DICTIONARY d2
(
    id UInt64,
    name String
)
PRIMARY KEY id
SOURCE(clickhouse(table t2))
LIFETIME(MIN 600 MAX 900)
LAYOUT(HASHED());

SELECT *
FROM
    t1
LEFT JOIN d2
    ON d2.id = t1.external_id
WHERE t1.id = 1
LIMIT 1;