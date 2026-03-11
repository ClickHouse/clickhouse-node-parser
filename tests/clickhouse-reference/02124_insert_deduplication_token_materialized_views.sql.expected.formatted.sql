SELECT
    (
        SELECT count()
        FROM test
        WHERE test = 'case1'
    ),
    (
        SELECT sum(c)
        FROM test_mv_a
        WHERE test = 'case1'
    ),
    (
        SELECT sum(c)
        FROM test_mv_b
        WHERE test = 'case1'
    ),
    (
        SELECT sum(c)
        FROM test_mv_c
        WHERE test = 'case1'
    );

SELECT
    (
        SELECT count()
        FROM test
        WHERE test = 'case2'
    ),
    (
        SELECT sum(c)
        FROM test_mv_a
        WHERE test = 'case2'
    ),
    (
        SELECT sum(c)
        FROM test_mv_b
        WHERE test = 'case2'
    ),
    (
        SELECT sum(c)
        FROM test_mv_c
        WHERE test = 'case2'
    );

SELECT
    (
        SELECT count()
        FROM test
        WHERE test = 'case3'
    ),
    (
        SELECT sum(c)
        FROM test_mv_a
        WHERE test = 'case3'
    ),
    (
        SELECT sum(c)
        FROM test_mv_b
        WHERE test = 'case3'
    ),
    (
        SELECT sum(c)
        FROM test_mv_c
        WHERE test = 'case3'
    );

SELECT
    (
        SELECT count()
        FROM test
        WHERE test = 'case4'
    ),
    (
        SELECT sum(c)
        FROM test_mv_a
        WHERE test = 'case4'
    ),
    (
        SELECT sum(c)
        FROM test_mv_b
        WHERE test = 'case4'
    ),
    (
        SELECT sum(c)
        FROM test_mv_c
        WHERE test = 'case4'
    );