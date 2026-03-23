SELECT CAST(1 AS Enum8('hello' = 1, 'world' = 2));

SELECT CAST(1, 'Enum8(''hello'' = 1, ''world'' = 2)');

SELECT CAST(1 AS Enum8(
    'hello' = 1,
    'world' = 2));

SELECT CAST(1, 'Enum8(''hello'' = 1,\n\t''world'' = 2)');

SELECT toTimeZone(CAST(1 AS TIMESTAMP), 'UTC');

SYSTEM DROP  TABLE IF EXISTS cast;

CREATE TABLE cast
(
    x UInt8,
    e Enum8('hello' = 1, 'world' = 2) DEFAULT CAST(x AS Enum8(
            'hello' = 1,
            'world' = 2
        ))
)
ENGINE = MergeTree
ORDER BY e;

INSERT INTO cast (x);

SELECT *
FROM cast;

SYSTEM DROP  TABLE cast;