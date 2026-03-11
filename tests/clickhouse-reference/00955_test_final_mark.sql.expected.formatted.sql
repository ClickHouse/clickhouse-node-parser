SELECT COUNT(*)
FROM mt_with_pk
WHERE x > toDateTime('2018-10-01 23:57:57');

SELECT sum(marks)
FROM `system`.parts
WHERE table = 'mt_with_pk'
    AND database = currentDatabase()
    AND active = 1
    AND database = currentDatabase();

SELECT sum(w)
FROM mt_with_pk;

SELECT DISTINCT (y)
FROM mt_with_pk;

SELECT COUNT(*)
FROM mt_with_pk
WHERE z + w > 5000;

SELECT *
FROM alter_attach
ORDER BY x ASC;

SELECT e
FROM alter_update_00806
ORDER BY d ASC;

SELECT COUNT(*)
FROM mt_without_pk
WHERE x > toDateTime('2018-10-01 23:57:57');

SELECT sum(marks)
FROM `system`.parts
WHERE table = 'mt_without_pk'
    AND active = 1
    AND database = currentDatabase();

SELECT COUNT(*)
FROM mt_with_small_granularity
WHERE x > toDateTime('2018-10-01 23:57:57');

SELECT sum(marks)
FROM `system`.parts
WHERE table = 'mt_with_small_granularity'
    AND active = 1
    AND database = currentDatabase();