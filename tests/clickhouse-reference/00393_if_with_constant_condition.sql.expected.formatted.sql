SELECT if(1, 1, 0);

SELECT if(0, not_existing_column, 1)
FROM `system`.numbers
LIMIT 1;

SELECT if(1, (if(0, not_existing_column, 2)), 0)
FROM `system`.numbers
LIMIT 1;

/* scalar subquery optimization */
SELECT if((
        SELECT toUInt8(number + 1)
        FROM `system`.numbers
        LIMIT 1
    ), 1, 2)
FROM `system`.numbers
LIMIT 1;

/* alias test */
SELECT
    if((1 AS a), (2 AS b), (3 AS c)) AS d,
    a,
    b,
    c,
    d
FORMAT TSKV;

SELECT
    if((0 AS a), (2 AS b), (3 AS c)) AS d,
    a,
    b,
    c,
    d
FORMAT TSKV;

SELECT
    if((1 AS a), (number + 2 AS b), (number + 3 AS c)) AS d,
    a,
    b,
    c,
    d
FROM `system`.numbers
LIMIT 1
FORMAT TSKV;

/* intergration test */
SELECT if((
        SELECT hasColumnInTable('system', 'numbers', 'not_existing')
    ), not_existing, 42) AS not_existing
FROM `system`.numbers
LIMIT 1
FORMAT TSKV;