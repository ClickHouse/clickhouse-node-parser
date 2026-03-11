SELECT *
FROM t1
ORDER BY `ALL` ASC;

SELECT *
FROM t2
ORDER BY `ALL` ASC;

SELECT *
FROM (
        SELECT
            rowNumberInAllBlocks() + 1 AS id,
            t1.id,
            t2.id
        FROM
            t1
        LEFT JOIN t2
            ON t1.id = t2.id
    )
ORDER BY `ALL` ASC;

SELECT *
FROM (
        SELECT
            rowNumberInAllBlocks() + 1 AS id,
            t1.id,
            t2.id,
            t1.name,
            t2.name
        FROM
            t1
        LEFT JOIN t2
            ON t1.id = t2.id
    )
ORDER BY `ALL` ASC;

SELECT *
FROM t3
ORDER BY `ALL` ASC;