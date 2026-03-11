SELECT '-- no modifiers';
SELECT a, b FROM order_by_all ORDER BY ALL;
SELECT b, a FROM order_by_all ORDER BY ALL;
SELECT a, b FROM order_by_all ORDER BY ALL ASC;
SELECT a, b FROM order_by_all ORDER BY ALL DESC;
SELECT b, a FROM order_by_all ORDER BY ALL NULLS FIRST;
SELECT b, a FROM order_by_all ORDER BY ALL NULLS LAST;
SELECT * FROM order_by_all ORDER BY all;
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
