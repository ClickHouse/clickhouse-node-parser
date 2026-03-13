SELECT '-- no modifiers';

SELECT
    a,
    b
FROM order_by_all
ORDER BY `ALL` ASC;

SELECT
    b,
    a
FROM order_by_all
ORDER BY `ALL` ASC;

SELECT
    a,
    b
FROM order_by_all
ORDER BY `ALL` ASC;

SELECT
    a,
    b
FROM order_by_all
ORDER BY `ALL` DESC;

SELECT
    b,
    a
FROM order_by_all
ORDER BY `ALL` ASC;

SELECT
    b,
    a
FROM order_by_all
ORDER BY `ALL` ASC;

SELECT *
FROM order_by_all
ORDER BY `all` ASC;

SELECT
    a,
    b,
    `all`
FROM order_by_all
ORDER BY `all` ASC; -- { serverError UNEXPECTED_EXPRESSION }

SELECT
    a,
    b,
    `all`
FROM order_by_all
ORDER BY `all` ASC
SETTINGS enable_order_by_all = false;

SELECT a
FROM order_by_all
ORDER BY `all` ASC; -- { serverError UNEXPECTED_EXPRESSION }

SELECT a
FROM order_by_all
ORDER BY `all` ASC
SETTINGS enable_order_by_all = false;

SELECT *
FROM order_by_all
ORDER BY `all` ASC
SETTINGS enable_order_by_all = false;

SELECT
    a,
    b AS `all`
FROM order_by_all
ORDER BY `all` ASC; -- { serverError UNEXPECTED_EXPRESSION }

SELECT
    a,
    b AS `all`
FROM order_by_all
ORDER BY `all` ASC
SETTINGS enable_order_by_all = false;

SELECT format('{} {}', a, b) AS `all`
FROM order_by_all
ORDER BY `all` ASC; -- { serverError UNEXPECTED_EXPRESSION }

SELECT format('{} {}', a, b) AS `all`
FROM order_by_all
ORDER BY `all` ASC
SETTINGS enable_order_by_all = false;

SELECT
    a,
    b,
    `all`
FROM order_by_all
ORDER BY
    `all` ASC,
    a ASC;