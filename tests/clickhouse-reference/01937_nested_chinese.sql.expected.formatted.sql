CREATE TEMPORARY TABLE test
(
    id String,
    products Nested(`产品` Array(String), `销量` Array(Int32))
);

DESCRIBE TABLE test;

DESCRIBE TABLE (SELECT *
FROM test);

DESCRIBE TABLE (SELECT *
FROM
    test
ARRAY JOIN products);

DESCRIBE TABLE (SELECT
    p.`产品`,
    p.`销量`
FROM
    test
ARRAY JOIN products AS p);

SELECT *
FROM
    test
ARRAY JOIN products;

SELECT count()
FROM (
        SELECT *
        FROM
            test
        ARRAY JOIN products
    );