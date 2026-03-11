SELECT *
FROM `02668_logical_optimizer`
WHERE a = 1
    OR 3 = a
    OR 1 = a;

SELECT *
FROM `02668_logical_optimizer`
WHERE a = 1
    OR 1 = a;

SELECT *
FROM `02668_logical_optimizer`
WHERE a = 1
    AND 2 = a;

SELECT *
FROM `02668_logical_optimizer`
WHERE 3 = a
    AND b = 'another'
    AND a = 3;

SELECT *
FROM `02668_logical_optimizer`
WHERE a = 2
    AND 2 = a;

SELECT *
FROM `02668_logical_optimizer`
WHERE a <> 1
    AND 3 <> a
    AND 1 <> a;

SELECT *
FROM `02668_logical_optimizer`
WHERE a <> 1
    AND 1 <> a;

SELECT a
FROM `02668_logical_optimizer`
WHERE (b = 'test')
    AND ('test' = b);

SELECT (k = 3)
    OR (((k = 1)
    OR (k = 2)
    OR (((NULL
    OR 1)) = k)))
FROM (
        SELECT materialize(1) AS k
    );