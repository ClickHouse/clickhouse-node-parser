SELECT _table
FROM d1;

SELECT count(_table)
FROM d1
WHERE _table = 'd1'
GROUP BY _table;

SELECT
    _table,
    key,
    value
FROM d1
WHERE value = 10;

SELECT _table
FROM d2;

SELECT count(_table)
FROM d2
WHERE _table = 'd2'
GROUP BY _table;

SELECT
    _table,
    key,
    value
FROM d2
WHERE value = 40;

SELECT
    _table,
    value
FROM d3
WHERE _table = 6;

SELECT _table
FROM d4;

SELECT count(_table)
FROM d4
WHERE _table = 'd8'
GROUP BY _table;

SELECT
    _table,
    key,
    value
FROM d4
WHERE value = 60;

SELECT _table
FROM m1
ORDER BY _table ASC;

SELECT count(_table)
FROM m1
WHERE _table = 'd1'
GROUP BY _table;

SELECT
    _table,
    key,
    value
FROM m1
WHERE _table = 'd2'
    AND value <= 30;

SELECT _table
FROM m2
ORDER BY _table ASC;

SELECT count(_table)
FROM m2
WHERE _table = 'd1'
GROUP BY _table;

SELECT
    _table,
    key,
    value
FROM m2
WHERE _table = 'd8'
    AND value >= 60;

SELECT
    _table,
    key,
    value
FROM (
        SELECT
            _table,
            key,
            value
        FROM d1
        UNION ALL
        SELECT
            _table,
            key,
            value
        FROM d2
    )
ORDER BY key ASC;

SELECT
    _table,
    key
FROM view1
ORDER BY key ASC;

SELECT
    _table,
    key
FROM view2
ORDER BY key ASC;

SELECT
    _table,
    key,
    value
FROM buffer1
ORDER BY key ASC;

SELECT
    _table,
    key,
    value
FROM mv1
ORDER BY key ASC;

SELECT
    _table,
    key,
    value
FROM mv2
ORDER BY key ASC;

SELECT
    _table,
    *
FROM dist5
ORDER BY key ASC;

SELECT
    _table,
    *
FROM dist6
ORDER BY key ASC;

SELECT
    _table,
    *
FROM m3
ORDER BY key ASC;

SELECT
    _table,
    *
FROM m4
WHERE _table = 'd8'
ORDER BY key ASC;

SELECT
    _table,
    *
FROM m5
WHERE _table = 'd8'
ORDER BY key ASC;

SELECT
    _table,
    *
FROM temp1
ORDER BY key ASC;

SELECT
    _table,
    *
FROM temp2
ORDER BY key ASC;

SELECT
    *,
    _table
FROM (
        SELECT
            *,
            _table
        FROM temp1
        UNION ALL
        SELECT
            *,
            _table
        FROM temp2
    )
ORDER BY key ASC;

SELECT *
FROM d1
PREWHERE _table = 'd1';