CREATE TABLE mt1
(
    n Int64
)
ENGINE = MergeTree
ORDER BY n;

CREATE TABLE mt2
(
    n Int64
)
ENGINE = MergeTree
ORDER BY n;

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

-- rollback on exception before start
SELECT functionThatDoesNotExist(); -- { serverError UNKNOWN_FUNCTION }

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

-- rollback on exception while processing
SELECT throwIf(100 < number)
FROM numbers(1000); -- { serverError FUNCTION_THROW_IF_VALUE_IS_NON_ZERO }

SELECT 1; -- { serverError INVALID_TRANSACTION }

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

SET TRANSACTION snapshot 1;

SELECT
    'snapshot1',
    count(),
    sum(n)
FROM mt1;

SET TRANSACTION snapshot 3;

SET throw_on_unsupported_query_inside_transaction = 0;

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

SET throw_on_unsupported_query_inside_transaction = 1;

SET TRANSACTION snapshot 1000000000000000;

SELECT
    'snapshot100500',
    count(),
    sum(n)
FROM mt1;

SET TRANSACTION snapshot 5; -- { serverError INVALID_TRANSACTION }

CREATE TABLE m
(
    n int
)
ENGINE = Memory; -- { serverError NOT_IMPLEMENTED }

SELECT *
FROM m; -- { serverError INVALID_TRANSACTION }