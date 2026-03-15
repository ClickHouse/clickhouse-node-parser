CREATE TEMPORARY TABLE test
(
    id String,
    products Nested(`产品` Array(String), `销量` Array(Int32))
);

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