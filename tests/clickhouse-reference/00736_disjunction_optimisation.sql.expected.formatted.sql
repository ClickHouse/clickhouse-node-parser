SELECT *
FROM bug;

SELECT *
FROM bug
WHERE ((k = 1
    OR k = 2
    OR k = 3))
    AND ((s = 21
    OR s = 22
    OR s = 23));

SELECT *
FROM bug
WHERE ((k = 1
    OR k = 2
    OR k = 3))
    AND ((s = 21
    OR s = 22
    OR s = 23))
SETTINGS enable_analyzer = 1;

SELECT *
FROM (
        SELECT *
        FROM bug
        WHERE k = 1
            OR k = 2
            OR k = 3
    )
WHERE (s = 21
    OR s = 22
    OR s = 23);

SELECT *
FROM (
        SELECT *
        FROM bug
        WHERE k = 1
            OR k = 2
            OR k = 3
    )
WHERE (s = 21
    OR s = 22
    OR s = 23)
SETTINGS enable_analyzer = 1;

SELECT
    k,
    (k = 1
    OR k = 2
    OR k = 3),
    s,
    (s = 21),
    (s = 21
    OR s = 22),
    (s = 21
    OR s = 22
    OR s = 23)
FROM bug;

SELECT
    k,
    (k = 1
    OR k = 2
    OR k = 3),
    s,
    (s = 21),
    (s = 21
    OR s = 22),
    (s = 21
    OR s = 22
    OR s = 23)
FROM bug
SETTINGS enable_analyzer = 1;

SELECT
    s,
    (s = 21
    OR s = 22
    OR s = 23)
FROM bug;

SELECT
    s,
    (s = 21
    OR s = 22
    OR s = 23)
FROM bug
SETTINGS enable_analyzer = 1;

SELECT
    s,
    (s = 21
    OR 22 = s
    OR 23 = s)
FROM bug;

SELECT
    s,
    (s = 21
    OR 22 = s
    OR 23 = s)
FROM bug
SETTINGS enable_analyzer = 1;