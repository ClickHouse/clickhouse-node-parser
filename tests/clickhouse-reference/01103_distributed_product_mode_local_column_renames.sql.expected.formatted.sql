SELECT d0.id
FROM t1_distr AS d0
WHERE d0.id IN (
        SELECT d1.id
        FROM
            t1_distr AS d1
        INNER JOIN t2_distr AS d2
            ON d1.id = d2.id
        WHERE d1.id > 0
        ORDER BY d1.id ASC
    );

SELECT t1_distr.id
FROM t1_distr
WHERE t1_distr.id IN (
        SELECT t1_distr.id
        FROM
            t1_distr AS d1
        INNER JOIN t2_distr AS d2
            ON t1_distr.id = t2_distr.id
        WHERE t1_distr.id > 0
        ORDER BY t1_distr.id ASC
    );

SELECT test_01103.t1_distr.id
FROM test_01103.t1_distr
WHERE test_01103.t1_distr.id IN (
        SELECT test_01103.t1_distr.id
        FROM
            test_01103.t1_distr AS d1
        INNER JOIN test_01103.t2_distr AS d2
            ON test_01103.t1_distr.id = test_01103.t2_distr.id
        WHERE test_01103.t1_distr.id > 0
        ORDER BY test_01103.t1_distr.id ASC
    );

SELECT d0.id
FROM
    t1_distr AS d0
INNER JOIN (
        SELECT d1.id
        FROM
            t1_distr AS d1
        INNER JOIN t2_distr AS d2
            ON d1.id = d2.id
        WHERE d1.id > 0
        ORDER BY d1.id ASC
    ) AS s0
    USING (id);

SELECT t1_distr.id
FROM
    t1_distr
INNER JOIN (
        SELECT t1_distr.id
        FROM
            t1_distr AS d1
        INNER JOIN t2_distr AS d2
            ON t1_distr.id = t2_distr.id
        WHERE t1_distr.id > 0
        ORDER BY t1_distr.id ASC
    ) AS s0
    USING (id);

SELECT test_01103.t1_distr.id
FROM
    test_01103.t1_distr
INNER JOIN (
        SELECT test_01103.t1_distr.id
        FROM
            test_01103.t1_distr AS d1
        INNER JOIN test_01103.t2_distr AS d2
            ON test_01103.t1_distr.id = test_01103.t2_distr.id
        WHERE test_01103.t1_distr.id > 0
        ORDER BY test_01103.t1_distr.id ASC
    ) AS s0
    USING (id);