SELECT
    min(i),
    max(i),
    count()
FROM d;

SELECT
    min(i),
    max(i),
    count()
FROM d
GROUP BY _partition_id
ORDER BY _partition_id ASC;

SELECT
    min(i),
    max(i),
    count()
FROM d
WHERE _partition_value.1 = 0
GROUP BY _partition_id
ORDER BY _partition_id ASC;

SELECT
    min(i),
    max(i),
    count()
FROM d
WHERE moduloLegacy(i, 2) = 0
GROUP BY _partition_id
ORDER BY _partition_id ASC;

SELECT
    min(i),
    max(i),
    count()
FROM d
WHERE _partition_value.1 = 10
GROUP BY _partition_id
ORDER BY _partition_id ASC;

SELECT min(i)
FROM d
WHERE 1 = _partition_value.1;

SELECT
    min(i),
    max(i),
    count()
FROM d
WHERE (_partition_value.1) = 0
GROUP BY
    ignore(bitTest(ignore(NULL), 0), NULL, (_partition_value.1) = 7, '10.25', bitTest(NULL, 0), NULL, ignore(ignore(-2147483647, NULL)), 1024),
    _partition_id
ORDER BY _partition_id ASC;

SELECT min(j)
FROM has_final_mark;

SELECT min(j)
FROM mixed_final_mark;

SELECT
    min(j),
    max(j)
FROM has_final_mark;

SELECT
    min(j),
    max(j)
FROM mixed_final_mark;

SELECT count()
FROM t;

SELECT
    min(dt),
    max(dt),
    count()
FROM d
WHERE toDate(dt) >= '2021-10-25';

SELECT
    min(dt),
    max(dt),
    count(toDate(dt) >= '2021-10-25')
FROM d
WHERE toDate(dt) >= '2021-10-25';

SELECT count()
FROM d
GROUP BY toDate(dt);

SELECT
    min(dt),
    count(ignore(ignore(ignore(tupleElement(_partition_value, 'xxxx', NULL) = NULL), NULL, NULL, NULL), 0, '10485.76', NULL)),
    max(dt),
    count(toDate(dt) >= '2021-10-25')
FROM d
WHERE toDate(dt) >= '2021-10-25';

SELECT
    pointInEllipses(min(j), NULL),
    max(dt),
    count('0.0000000007')
FROM d
WHERE toDate(dt) >= '2021-10-25';

SELECT min(j)
FROM d
PREWHERE ceil(j) <= 0;

SELECT min(dt)
FROM d
PREWHERE ((((0.9998999834060669
    AND 1023))
    AND 255)) <= ceil(j);

SELECT count('')
    AND NULL
FROM d
PREWHERE ceil(j) <= NULL;

SELECT count(if(d = 4, d, 1))
FROM test
SETTINGS force_optimize_projection = 1;

SELECT count(d / 3)
FROM test
SETTINGS force_optimize_projection = 1;

SELECT count(if(d = 4, NULL, 1))
FROM test
SETTINGS force_optimize_projection = 1;