SELECT * REPLACE(a AS b) FROM test_replace_main WHERE b > 150 ORDER BY id;
SELECT * REPLACE(a + 10 AS b) FROM test_arith WHERE b = 11;
SELECT * REPLACE(a + 10 AS b) FROM test_arith WHERE b = 12;
SELECT * REPLACE(a * 10 + a AS b) FROM test_arith WHERE b = 11;
SELECT * REPLACE(s || '_suffix' AS s) FROM test_replace_str WHERE s = 'hello_suffix';
SELECT * REPLACE(a AS b) FROM test_replace_main ORDER BY b;
SELECT * REPLACE(a AS b) FROM test_replace_main ORDER BY b DESC, id;
SELECT * REPLACE(a AS b) FROM test_replace_merge PREWHERE b > 150 ORDER BY id;
SELECT * REPLACE(a AS b) FROM test_limit_by ORDER BY id LIMIT 1 BY b < 200;
SELECT * REPLACE(a AS b), ROW_NUMBER() OVER (ORDER BY b) as rn
FROM test_replace_main
ORDER BY id;
SELECT * REPLACE(a * 2 + 10 AS b) FROM test_replace_main WHERE b > 250 ORDER BY id;
SELECT * REPLACE(a AS b, 'replaced_' || c AS c)
FROM test_replace_main
WHERE b > 150
ORDER BY id;
SELECT * FROM (
    SELECT * REPLACE(a AS b) FROM test_replace_main WHERE b > 150
) ORDER BY id;
SELECT * REPLACE(c || '_suffix' AS c)
FROM test_replace_main
WHERE c = 'beta_suffix'
ORDER BY id;
SELECT * REPLACE(a AS b) FROM test_replace_main
WHERE b > 150
ORDER BY b
LIMIT 2;
SELECT * REPLACE(a + 100 AS b) FROM test_replace_main WHERE b + 50 > 200 ORDER BY b;
SELECT category, sum(value) as total
FROM (SELECT * REPLACE(value * 10 AS value) FROM test_group_by)
GROUP BY category
ORDER BY category;
SELECT category, total
FROM (
    SELECT category || '_modified' AS category, sum(value) as total
    FROM test_group_by_sub
    GROUP BY category
)
ORDER BY category;
SELECT category || '_modified' AS category, sum(value) as total
FROM test_group_by_direct
GROUP BY category
ORDER BY category;
SELECT category, sum(amount) as total
FROM (SELECT * REPLACE(amount + 100 AS amount) FROM test_having)
GROUP BY category
HAVING total > 200
ORDER BY category;
SELECT category, total
FROM (
    SELECT category, sum(amount + 100) as total
    FROM test_having_sub
    GROUP BY category
    HAVING total > 200
)
ORDER BY category;
SELECT category, sum(amount + 100) as total
FROM test_having_direct
GROUP BY category
HAVING total > 200
ORDER BY category;
