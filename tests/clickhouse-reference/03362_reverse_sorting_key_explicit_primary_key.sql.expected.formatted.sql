SELECT *
FROM x1
WHERE i = 3;

SELECT count()
FROM x1
WHERE and(greaterOrEquals(i, 3), lessOrEquals(i, 10));