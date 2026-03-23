CREATE TABLE order_by_all
(
    a String,
    b Nullable(Int32)
)
ENGINE = Memory;
INSERT INTO order_by_all VALUES ('B', 3), ('C', NULL), ('D', 1), ('A', 2);
SELECT '-- no modifiers';
SET enable_analyzer = 0;
SELECT a, b FROM order_by_all ORDER BY ALL;
SELECT b, a FROM order_by_all ORDER BY ALL;
SET enable_analyzer = 1;
SELECT a, b FROM order_by_all ORDER BY ALL ASC;
SELECT a, b FROM order_by_all ORDER BY ALL DESC;
SELECT b, a FROM order_by_all ORDER BY ALL NULLS FIRST;
SELECT b, a FROM order_by_all ORDER BY ALL NULLS LAST;
SELECT * FROM order_by_all ORDER BY all;
CREATE TABLE order_by_all
(
    a String,
    b Nullable(Int32),
    all UInt64
)
ENGINE = Memory;
INSERT INTO order_by_all VALUES ('B', 3, 10), ('C', NULL, 40), ('D', 1, 20), ('A', 2, 30);
SELECT a, b, all FROM order_by_all ORDER BY all;  -- { serverError UNEXPECTED_EXPRESSION }
SELECT a, b, all FROM order_by_all ORDER BY all SETTINGS enable_order_by_all = false;
SELECT a FROM order_by_all ORDER BY all;  -- { serverError UNEXPECTED_EXPRESSION }
SELECT a FROM order_by_all ORDER BY all SETTINGS enable_order_by_all = false;
SELECT * FROM order_by_all ORDER BY all SETTINGS enable_order_by_all = false;
SELECT a, b AS all FROM order_by_all ORDER BY all;  -- { serverError UNEXPECTED_EXPRESSION }
SELECT a, b AS all FROM order_by_all ORDER BY all SETTINGS enable_order_by_all = false;
SELECT format('{} {}', a, b) AS all FROM order_by_all ORDER BY all;  -- { serverError UNEXPECTED_EXPRESSION }
SELECT format('{} {}', a, b) AS all FROM order_by_all ORDER BY all SETTINGS enable_order_by_all = false;
SELECT a, b, all FROM order_by_all ORDER BY all, a;
