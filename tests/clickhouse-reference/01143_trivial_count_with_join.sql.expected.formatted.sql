SELECT count(*)
FROM
    t
CROSS JOIN numbers(2) AS r;

SELECT count(*)
FROM
    t
CROSS JOIN numbers(2) AS r;

SELECT count()
FROM
    t
CROSS JOIN numbers(2) AS r;

SELECT count(t.number)
FROM
    t
CROSS JOIN numbers(2) AS r;

SELECT count(r.number)
FROM
    t
CROSS JOIN numbers(2) AS r;