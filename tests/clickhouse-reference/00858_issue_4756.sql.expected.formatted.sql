SELECT DISTINCT (distr1.id)
FROM distr1
WHERE distr1.id IN (
        SELECT distr1.id
        FROM
            distr1
        INNER JOIN distr2
            ON distr1.id = distr2.id
        WHERE distr1.id > 0
    );

SELECT DISTINCT (d0.id)
FROM distr1 AS d0
WHERE d0.id IN (
        SELECT d1.id
        FROM
            distr1 AS d1
        INNER JOIN distr2 AS d2
            ON d1.id = d2.id
        WHERE d1.id > 0
    );

SELECT DISTINCT (distr1.id)
FROM distr1
WHERE distr1.id IN (
        SELECT distr1.id
        FROM
            distr1 AS d1
        INNER JOIN distr2 AS d2
            ON distr1.id = distr2.id
        WHERE distr1.id > 0
    );