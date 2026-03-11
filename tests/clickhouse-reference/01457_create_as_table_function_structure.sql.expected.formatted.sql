SELECT *
FROM tmp;

SELECT
    tuple(*).1 AS c,
    toTypeName(c)
FROM tmp;

SELECT
    tuple(*).1 AS c,
    toTypeName(c)
FROM test_01457.tf_remote;

SELECT
    tuple(*).1 AS c,
    toTypeName(c)
FROM test_01457.tf_remote_explicit_structure;

SELECT
    tuple(*).1 AS c,
    toTypeName(c)
FROM test_01457.tf_numbers;

SELECT
    tuple(*).1 AS c,
    toTypeName(c)
FROM test_01457.tf_merge;