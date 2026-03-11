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
SETTINGS force_primary_key = 1;

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
SETTINGS force_primary_key = 1;