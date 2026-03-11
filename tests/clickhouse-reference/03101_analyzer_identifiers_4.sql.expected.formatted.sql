SELECT tuple(1, 'a').1;

SELECT
    CAST(('hello', 1) AS Tuple(hello String, count UInt32)) AS t,
    t.hello;

SELECT tuple(1, 'a').*;

SELECT CAST(('hello', 1) AS Tuple(name String, count UInt32)).*;

SELECT untuple(CAST(('hello', 1) AS Tuple(name String, count UInt32)));

SELECT * EXCEPT('hello|world');

SELECT * EXCEPT (hello) REPLACE (x + 1 AS x);

SELECT COLUMNS('^c')
FROM t;

SELECT t.COLUMNS('^c')
FROM
    t
CROSS JOIN u;

SELECT t.COLUMNS('^c') EXCEPT (test_hello, test_world)
FROM
    t
CROSS JOIN u;

SELECT *
FROM (
        SELECT
            x,
            x
        FROM (
                SELECT 1 AS x
            )
    );

SELECT x
FROM (
        SELECT
            x,
            x
        FROM (
                SELECT 1 AS x
            )
    );

SELECT 1
FROM (
        SELECT
            x,
            x
        FROM (
                SELECT 1 AS x
            )
    );

SELECT `plus(1, 2)`
FROM (
        SELECT 1 + 2
    );

SELECT x
FROM numbers(5 AS x);

SELECT y
FROM aliased;

SELECT
    x,
    y,
    z
FROM aliased2;

SELECT
    x,
    y,
    z
FROM aliased3;