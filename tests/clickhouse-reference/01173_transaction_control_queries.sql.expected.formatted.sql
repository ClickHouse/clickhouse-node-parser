SELECT
    'commit',
    arraySort(groupArray(n))
FROM (
        SELECT n
        FROM mt1
        UNION ALL
        SELECT *
        FROM mt2
    );

SELECT
    'rollback',
    arraySort(groupArray(n))
FROM (
        SELECT n
        FROM mt1
        UNION ALL
        SELECT *
        FROM mt2
    );

SELECT
    'no nested',
    arraySort(groupArray(n))
FROM (
        SELECT n
        FROM mt1
        UNION ALL
        SELECT *
        FROM mt2
    );

SELECT
    'on exception before start',
    arraySort(groupArray(n))
FROM (
        SELECT n
        FROM mt1
        UNION ALL
        SELECT *
        FROM mt2
    );

SELECT functionThatDoesNotExist();

SELECT
    'on exception while processing',
    arraySort(groupArray(n))
FROM (
        SELECT n
        FROM mt1
        UNION ALL
        SELECT *
        FROM mt2
    );

SELECT throwIf(100 < number)
FROM numbers(1000);

SELECT 1;

SELECT
    'on session close',
    arraySort(groupArray(n))
FROM (
        SELECT n
        FROM mt1
        UNION ALL
        SELECT *
        FROM mt2
    );

SELECT
    'readonly',
    arraySort(groupArray(n))
FROM (
        SELECT n
        FROM mt1
        UNION ALL
        SELECT *
        FROM mt2
    );

SELECT
    'snapshot',
    count(),
    sum(n)
FROM mt1;

SELECT
    'snapshot1',
    count(),
    sum(n)
FROM mt1;

SELECT
    'snapshot3',
    count() = (
        SELECT count()
        FROM `system`.parts
        WHERE database = currentDatabase()
            AND table = 'mt1'
            AND _state IN ('Active', 'Outdated')
    )
FROM mt1;

SELECT
    'snapshot100500',
    count(),
    sum(n)
FROM mt1;

SELECT *
FROM m;