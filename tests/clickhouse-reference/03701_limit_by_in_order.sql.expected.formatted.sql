-- DISTINCT for explain outputs are required due to parallel replicas tests, as there
-- are created multiple LimitByTransforms (pushed down to replicas and the global one)
SELECT DISTINCT concat('Unsorted ORDER BY key LIMIT BY key: ', trimBoth(`explain`, ' '))
FROM (
        EXPLAIN PIPELINE
        SELECT key
        FROM `03701_unsorted`
        ORDER BY key ASC
        LIMIT 1 BY key
        LIMIT 10
    )
WHERE like(`explain`, '%LimitByTransform%');

SELECT DISTINCT concat('Unsorted ORDER BY key DESC LIMIT BY key: ', trimBoth(`explain`, ' '))
FROM (
        EXPLAIN PIPELINE
        SELECT key
        FROM `03701_unsorted`
        ORDER BY key DESC
        LIMIT 1 BY key
        LIMIT 10
    )
WHERE like(`explain`, '%LimitByTransform%');

SELECT DISTINCT concat('Unsorted ORDER BY key, val LIMIT BY key: ', trimBoth(`explain`, ' '))
FROM (
        EXPLAIN PIPELINE
        SELECT key
        FROM `03701_unsorted`
        ORDER BY
            key ASC,
            val ASC
        LIMIT 1 BY key
        LIMIT 10
    )
WHERE like(`explain`, '%LimitByTransform%');

SELECT DISTINCT concat('Unsorted ORDER BY val LIMIT BY key: ', trimBoth(`explain`, ' '))
FROM (
        EXPLAIN PIPELINE
        SELECT key
        FROM `03701_unsorted`
        ORDER BY val ASC
        LIMIT 1 BY key
        LIMIT 10
    )
WHERE like(`explain`, '%LimitByTransform%');

SELECT DISTINCT concat('Unsorted ORDER BY val, key LIMIT BY key: ', trimBoth(`explain`, ' '))
FROM (
        EXPLAIN PIPELINE
        SELECT key
        FROM `03701_unsorted`
        ORDER BY
            val ASC,
            key ASC
        LIMIT 1 BY key
        LIMIT 10
    )
WHERE like(`explain`, '%LimitByTransform%');

SELECT DISTINCT concat('Unsorted ORDER BY key LIMIT BY key, val: ', trimBoth(`explain`, ' '))
FROM (
        EXPLAIN PIPELINE
        SELECT key
        FROM `03701_unsorted`
        ORDER BY key ASC
        LIMIT 1 BY key, val
        LIMIT 10
    )
WHERE like(`explain`, '%LimitByTransform%');

SELECT DISTINCT concat('Unsorted ORDER BY key, dt LIMIT BY key, val: ', trimBoth(`explain`, ' '))
FROM (
        EXPLAIN PIPELINE
        SELECT key
        FROM `03701_unsorted`
        ORDER BY
            key ASC,
            dt ASC
        LIMIT 1 BY key, val
        LIMIT 10
    )
WHERE like(`explain`, '%LimitByTransform%');

SELECT DISTINCT concat('Unsorted w/o ORDER BY: ', trimBoth(`explain`, ' '))
FROM (
        EXPLAIN PIPELINE
        SELECT key
        FROM `03701_unsorted`
        LIMIT 1 BY key
        LIMIT 10
    )
WHERE like(`explain`, '%LimitByTransform%');

SELECT '-- Unsorted with LIMIT 1 BY';

SELECT key
FROM `03701_unsorted`
ORDER BY key ASC
LIMIT 1 BY key
LIMIT 10;

SELECT key
FROM `03701_unsorted`
ORDER BY key ASC
LIMIT 2 BY key
LIMIT 16;

SELECT DISTINCT concat('Sorted ORDER BY key LIMIT BY key: ', trimBoth(`explain`, ' '))
FROM (
        EXPLAIN PIPELINE
        SELECT key
        FROM `03701_sorted`
        ORDER BY key ASC
        LIMIT 1 BY key
        LIMIT 10
    )
WHERE like(`explain`, '%LimitByTransform%');

SELECT DISTINCT concat('Sorted ORDER BY key DESC LIMIT BY key: ', trimBoth(`explain`, ' '))
FROM (
        EXPLAIN PIPELINE
        SELECT key
        FROM `03701_sorted`
        ORDER BY key DESC
        LIMIT 1 BY key
        LIMIT 10
    )
WHERE like(`explain`, '%LimitByTransform%');

SELECT DISTINCT concat('Sorted ORDER BY key, val LIMIT BY key: ', trimBoth(`explain`, ' '))
FROM (
        EXPLAIN PIPELINE
        SELECT key
        FROM `03701_sorted`
        ORDER BY
            key ASC,
            val ASC
        LIMIT 1 BY key
        LIMIT 10
    )
WHERE like(`explain`, '%LimitByTransform%');

SELECT DISTINCT concat('Sorted ORDER BY val LIMIT BY key: ', trimBoth(`explain`, ' '))
FROM (
        EXPLAIN PIPELINE
        SELECT key
        FROM `03701_sorted`
        ORDER BY val ASC
        LIMIT 1 BY key
        LIMIT 10
    )
WHERE like(`explain`, '%LimitByTransform%');

SELECT DISTINCT concat('Sorted ORDER BY val, key LIMIT BY key: ', trimBoth(`explain`, ' '))
FROM (
        EXPLAIN PIPELINE
        SELECT key
        FROM `03701_sorted`
        ORDER BY
            val ASC,
            key ASC
        LIMIT 1 BY key
        LIMIT 10
    )
WHERE like(`explain`, '%LimitByTransform%');

SELECT DISTINCT concat('Sorted ORDER BY key LIMIT BY key, val: ', trimBoth(`explain`, ' '))
FROM (
        EXPLAIN PIPELINE
        SELECT key
        FROM `03701_sorted`
        ORDER BY key ASC
        LIMIT 1 BY key, val
        LIMIT 10
    )
WHERE like(`explain`, '%LimitByTransform%');

SELECT DISTINCT concat('Sorted ORDER BY key, dt LIMIT BY key, val: ', trimBoth(`explain`, ' '))
FROM (
        EXPLAIN PIPELINE
        SELECT key
        FROM `03701_sorted`
        ORDER BY
            key ASC,
            dt ASC
        LIMIT 1 BY key, val
        LIMIT 10
    )
WHERE like(`explain`, '%LimitByTransform%');

SELECT DISTINCT concat('Sorted w/o ORDER BY: ', trimBoth(`explain`, ' '))
FROM (
        EXPLAIN PIPELINE
        SELECT key
        FROM `03701_sorted`
        LIMIT 1 BY key
        LIMIT 10
    )
WHERE like(`explain`, '%LimitByTransform%');

SELECT key
FROM `03701_sorted`
ORDER BY key ASC
LIMIT 1 BY key
LIMIT 10;

SELECT key
FROM `03701_sorted`
ORDER BY key ASC
LIMIT 2 BY key
LIMIT 16;