SET parallel_replicas_local_plan = 1;

SYSTEM drop  table if exists foo;

CREATE TABLE foo
(
    id UInt8,
    path String
)
ENGINE = MergeTree
ORDER BY (path)
SETTINGS index_granularity = 1;

INSERT INTO foo;

-- check if also escaped sequence are properly extracted
SELECT trimLeft(`explain`)
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT id
        FROM foo
        WHERE match(path, '^xxx\\(zzz')
    )
WHERE like(`explain`, '%Condition%');

SELECT count()
FROM foo
WHERE match(path, '^xxx\\(zzz')
SETTINGS force_primary_key = 1;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT id
        FROM foo
        WHERE match(path, '^xxx\\)zzz')
    )
WHERE like(`explain`, '%Condition%');

SELECT count()
FROM foo
WHERE match(path, '^xxx\\)zzz')
SETTINGS force_primary_key = 1;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT id
        FROM foo
        WHERE match(path, '^xxx\\^zzz')
    )
WHERE like(`explain`, '%Condition%');

SELECT count()
FROM foo
WHERE match(path, '^xxx\\^zzz')
SETTINGS force_primary_key = 1;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT id
        FROM foo
        WHERE match(path, '^xxx\\$zzz')
    )
WHERE like(`explain`, '%Condition%');

SELECT count()
FROM foo
WHERE match(path, '^xxx\\$zzz')
SETTINGS force_primary_key = 1;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT id
        FROM foo
        WHERE match(path, '^xxx\\.zzz')
    )
WHERE like(`explain`, '%Condition%');

SELECT count()
FROM foo
WHERE match(path, '^xxx\\.zzz')
SETTINGS force_primary_key = 1;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT id
        FROM foo
        WHERE match(path, '^xxx\\[zzz')
    )
WHERE like(`explain`, '%Condition%');

SELECT count()
FROM foo
WHERE match(path, '^xxx\\[zzz')
SETTINGS force_primary_key = 1;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT id
        FROM foo
        WHERE match(path, '^xxx\\]zzz')
    )
WHERE like(`explain`, '%Condition%');

SELECT count()
FROM foo
WHERE match(path, '^xxx\\]zzz')
SETTINGS force_primary_key = 1;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT id
        FROM foo
        WHERE match(path, '^xxx\\?zzz')
    )
WHERE like(`explain`, '%Condition%');

SELECT count()
FROM foo
WHERE match(path, '^xxx\\?zzz')
SETTINGS force_primary_key = 1;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT id
        FROM foo
        WHERE match(path, '^xxx\\*zzz')
    )
WHERE like(`explain`, '%Condition%');

SELECT count()
FROM foo
WHERE match(path, '^xxx\\*zzz')
SETTINGS force_primary_key = 1;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT id
        FROM foo
        WHERE match(path, '^xxx\\+zzz')
    )
WHERE like(`explain`, '%Condition%');

SELECT count()
FROM foo
WHERE match(path, '^xxx\\+zzz')
SETTINGS force_primary_key = 1;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT id
        FROM foo
        WHERE match(path, '^xxx\\\\zzz')
    )
WHERE like(`explain`, '%Condition%');

SELECT count()
FROM foo
WHERE match(path, '^xxx\\\\zzz')
SETTINGS force_primary_key = 1;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT id
        FROM foo
        WHERE match(path, '^xxx\\{zzz')
    )
WHERE like(`explain`, '%Condition%');

SELECT count()
FROM foo
WHERE match(path, '^xxx\\{zzz')
SETTINGS force_primary_key = 1;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT id
        FROM foo
        WHERE match(path, '^xxx\\}zzz')
    )
WHERE like(`explain`, '%Condition%');

SELECT count()
FROM foo
WHERE match(path, '^xxx\\}zzz')
SETTINGS force_primary_key = 1;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT id
        FROM foo
        WHERE match(path, '^xxx\\-zzz')
    )
WHERE like(`explain`, '%Condition%');

SELECT count()
FROM foo
WHERE match(path, '^xxx\\-zzz')
SETTINGS force_primary_key = 1;

-- those regex chars prevent the index use (only 3 first chars used during index scan)
SELECT trimLeft(`explain`)
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT id
        FROM foo
        WHERE match(path, '^xxx\0bla')
    )
WHERE like(`explain`, '%Condition%');

SELECT count()
FROM foo
WHERE match(path, '^xxx\0bla')
SETTINGS force_primary_key = 1;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT id
        FROM foo
        WHERE match(path, '^xxx(bla)')
    )
WHERE like(`explain`, '%Condition%');

SELECT count()
FROM foo
WHERE match(path, '^xxx(bla)')
SETTINGS force_primary_key = 1;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT id
        FROM foo
        WHERE match(path, '^xxx[bla]')
    )
WHERE like(`explain`, '%Condition%');

SELECT count()
FROM foo
WHERE match(path, '^xxx[bla]')
SETTINGS force_primary_key = 1;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT id
        FROM foo
        WHERE match(path, '^xxx^bla')
    )
WHERE like(`explain`, '%Condition%');

SELECT count()
FROM foo
WHERE match(path, '^xxx^bla')
SETTINGS force_primary_key = 1;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT id
        FROM foo
        WHERE match(path, '^xxx.bla')
    )
WHERE like(`explain`, '%Condition%');

SELECT count()
FROM foo
WHERE match(path, '^xxx.bla')
SETTINGS force_primary_key = 1;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT id
        FROM foo
        WHERE match(path, '^xxx+bla')
    )
WHERE like(`explain`, '%Condition%');

SELECT count()
FROM foo
WHERE match(path, '^xxx+bla')
SETTINGS force_primary_key = 1;

-- here the forth char is not used during index, because it has 0+ quantifier
SELECT trimLeft(`explain`)
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT id
        FROM foo
        WHERE match(path, '^xxxx{0,1}')
    )
WHERE like(`explain`, '%Condition%');

SELECT count()
FROM foo
WHERE match(path, '^xxxx{0,1}')
SETTINGS force_primary_key = 1;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT id
        FROM foo
        WHERE match(path, '^xxxx?')
    )
WHERE like(`explain`, '%Condition%');

SELECT count()
FROM foo
WHERE match(path, '^xxxx?')
SETTINGS force_primary_key = 1;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT id
        FROM foo
        WHERE match(path, '^xxxx*')
    )
WHERE like(`explain`, '%Condition%');

SELECT count()
FROM foo
WHERE match(path, '^xxxx*')
SETTINGS force_primary_key = 1;

-- some unsupported regex chars - only 3 first chars used during index scan
SELECT trimLeft(`explain`)
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT id
        FROM foo
        WHERE match(path, '^xxx\\d+')
    )
WHERE like(`explain`, '%Condition%');

SELECT count()
FROM foo
WHERE match(path, '^xxx\\d+')
SETTINGS force_primary_key = 1;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT id
        FROM foo
        WHERE match(path, '^xxx\\w+')
    )
WHERE like(`explain`, '%Condition%');

SELECT count()
FROM foo
WHERE match(path, '^xxx\\w+')
SETTINGS force_primary_key = 1;

-- fully disabled for pipes - see https://github.com/ClickHouse/ClickHouse/pull/54696
SELECT trimLeft(`explain`)
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT id
        FROM foo
        WHERE match(path, '^xxx\\|zzz')
    )
WHERE like(`explain`, '%Condition%');

SELECT count()
FROM foo
WHERE match(path, '^xxx\\|zzz')
SETTINGS force_primary_key = 1; -- { serverError INDEX_NOT_USED }

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT id
        FROM foo
        WHERE match(path, '^xxxx|foo')
    )
WHERE like(`explain`, '%Condition%');

SELECT count()
FROM foo
WHERE match(path, '^xxxx|foo')
SETTINGS force_primary_key = 1; -- { serverError INDEX_NOT_USED }