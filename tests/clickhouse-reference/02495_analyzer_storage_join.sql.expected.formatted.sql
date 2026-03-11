SELECT '--- no name clashes ---';

SELECT *
FROM
    t1
RIGHT JOIN tj
    ON t1.id1 == tj.key1
    AND t1.id2 == tj.key2
ORDER BY key1 ASC
FORMAT TSVWithNames;

SELECT
    id1,
    val,
    key1,
    b,
    x
FROM
    t1
RIGHT JOIN tj
    ON t1.id1 == tj.key1
    AND t1.id2 == tj.key2
ORDER BY key1 ASC
FORMAT TSVWithNames;

SELECT
    t1.id1,
    t1.val,
    tj.key1,
    tj.b,
    tj.x
FROM
    t1
RIGHT JOIN tj
    ON t1.id1 == tj.key1
    AND t1.id2 == tj.key2
ORDER BY key1 ASC
FORMAT TSVWithNames;

SELECT
    val,
    b,
    x
FROM
    t1
RIGHT JOIN tj
    ON t1.id1 == tj.key1
    AND t1.id2 == tj.key2
ORDER BY key1 ASC
FORMAT TSVWithNames;

SELECT val
FROM
    t1
RIGHT JOIN tj
    ON t1.id1 == tj.key1
    AND t1.id2 == tj.key2
ORDER BY key1 ASC
FORMAT TSVWithNames;

SELECT x
FROM
    t1
RIGHT JOIN tj
    ON t1.id1 == tj.key1
    AND t1.id2 == tj.key2
ORDER BY key1 ASC
FORMAT TSVWithNames;

SELECT *
FROM
    t
RIGHT JOIN tj
    USING (key1, key2)
ORDER BY key1 ASC
FORMAT TSVWithNames;

SELECT key1
FROM
    t
RIGHT JOIN tj
    USING (key1, key2)
ORDER BY key1 ASC
FORMAT TSVWithNames;

SELECT
    t.key1,
    tj.key1
FROM
    t
RIGHT JOIN tj
    USING (key1, key2)
ORDER BY key1 ASC
FORMAT TSVWithNames;

SELECT
    t.key2,
    tj.key2
FROM
    t
RIGHT JOIN tj
    USING (key1, key2)
ORDER BY key1 ASC
FORMAT TSVWithNames;

SELECT
    t.b,
    tj.b
FROM
    t
RIGHT JOIN tj
    USING (key1, key2)
ORDER BY key1 ASC
FORMAT TSVWithNames;

SELECT
    t.x,
    tj.b
FROM
    t
RIGHT JOIN tj
    USING (key1, key2)
ORDER BY key1 ASC
FORMAT TSVWithNames;

SELECT tj.a
FROM
    t
RIGHT JOIN tj
    USING (key1, key2)
ORDER BY key1 ASC
FORMAT TSVWithNames;

SELECT tj.b
FROM
    t
RIGHT JOIN tj
    USING (key1, key2)
ORDER BY key1 ASC
FORMAT TSVWithNames;

SELECT tj.x
FROM
    t
RIGHT JOIN tj
    USING (key1, key2)
ORDER BY key1 ASC
FORMAT TSVWithNames;

SELECT tj.y
FROM
    t
RIGHT JOIN tj
    USING (key1, key2)
ORDER BY key1 ASC
FORMAT TSVWithNames;

SELECT a
FROM
    t
RIGHT JOIN tj
    USING (key1, key2)
ORDER BY key1 ASC
FORMAT TSVWithNames;

SELECT b
FROM
    t
RIGHT JOIN tj
    USING (key1, key2)
ORDER BY key1 ASC
FORMAT TSVWithNames;

SELECT x
FROM
    t
RIGHT JOIN tj
    USING (key1, key2)
ORDER BY key1 ASC
FORMAT TSVWithNames;

SELECT y
FROM
    t
RIGHT JOIN tj
    USING (key1, key2)
ORDER BY key1 ASC
FORMAT TSVWithNames;

SELECT t.val
FROM
    t
RIGHT JOIN tj
    USING (key1, key2)
ORDER BY key1 ASC
FORMAT TSVWithNames;

SELECT val
FROM
    t
RIGHT JOIN tj
    USING (key1, key2)
ORDER BY key1 ASC
FORMAT TSVWithNames;

SELECT *
FROM
    t
RIGHT JOIN tj
    ON t.key1 == tj.key1
    AND t.key2 == tj.key2
ORDER BY t.key1 ASC
FORMAT TSVWithNames;

SELECT key1
FROM
    t
RIGHT JOIN tj
    ON t.key1 == tj.key1
    AND t.key2 == tj.key2
ORDER BY t.key1 ASC
FORMAT TSVWithNames;

SELECT
    t.key1,
    tj.key1
FROM
    t
RIGHT JOIN tj
    ON t.key1 == tj.key1
    AND t.key2 == tj.key2
ORDER BY t.key1 ASC
FORMAT TSVWithNames;

SELECT
    t.key2,
    tj.key2
FROM
    t
RIGHT JOIN tj
    ON t.key1 == tj.key1
    AND t.key2 == tj.key2
ORDER BY t.key1 ASC
FORMAT TSVWithNames;

SELECT
    t.b,
    tj.b
FROM
    t
RIGHT JOIN tj
    ON t.key1 == tj.key1
    AND t.key2 == tj.key2
ORDER BY t.key1 ASC
FORMAT TSVWithNames;

SELECT
    t.x,
    tj.b
FROM
    t
RIGHT JOIN tj
    ON t.key1 == tj.key1
    AND t.key2 == tj.key2
ORDER BY t.key1 ASC
FORMAT TSVWithNames;

SELECT tj.a
FROM
    t
RIGHT JOIN tj
    ON t.key1 == tj.key1
    AND t.key2 == tj.key2
ORDER BY t.key1 ASC
FORMAT TSVWithNames;

SELECT tj.b
FROM
    t
RIGHT JOIN tj
    ON t.key1 == tj.key1
    AND t.key2 == tj.key2
ORDER BY t.key1 ASC
FORMAT TSVWithNames;

SELECT tj.x
FROM
    t
RIGHT JOIN tj
    ON t.key1 == tj.key1
    AND t.key2 == tj.key2
ORDER BY t.key1 ASC
FORMAT TSVWithNames;

SELECT tj.y
FROM
    t
RIGHT JOIN tj
    ON t.key1 == tj.key1
    AND t.key2 == tj.key2
ORDER BY t.key1 ASC
FORMAT TSVWithNames;

SELECT a
FROM
    t
RIGHT JOIN tj
    ON t.key1 == tj.key1
    AND t.key2 == tj.key2
ORDER BY t.key1 ASC
FORMAT TSVWithNames;

SELECT b
FROM
    t
RIGHT JOIN tj
    ON t.key1 == tj.key1
    AND t.key2 == tj.key2
ORDER BY t.key1 ASC
FORMAT TSVWithNames;

SELECT x
FROM
    t
RIGHT JOIN tj
    ON t.key1 == tj.key1
    AND t.key2 == tj.key2
ORDER BY t.key1 ASC
FORMAT TSVWithNames;

SELECT y
FROM
    t
RIGHT JOIN tj
    ON t.key1 == tj.key1
    AND t.key2 == tj.key2
ORDER BY t.key1 ASC
FORMAT TSVWithNames;

SELECT t.val
FROM
    t
RIGHT JOIN tj
    ON t.key1 == tj.key1
    AND t.key2 == tj.key2
ORDER BY t.key1 ASC
FORMAT TSVWithNames;

SELECT val
FROM
    t
RIGHT JOIN tj
    ON t.key1 == tj.key1
    AND t.key2 == tj.key2
ORDER BY t.key1 ASC
FORMAT TSVWithNames;

SELECT *
FROM
    t
RIGHT JOIN tj
    ON t.key1 == tj.key1
    AND t.key2 == tj.key2 + 1
FORMAT TSVWithNames;

SELECT *
FROM
    t
RIGHT JOIN tj
    ON t.key1 + 1 == tj.key1
    AND toUInt64(t.key2 - 1) == tj.key2
ORDER BY
    t.key1 ASC,
    tj.key2 ASC
FORMAT TSVWithNames;

SELECT *
FROM
    t
RIGHT JOIN tj
    ON t.key1 == tj.key1
    AND t.key2 == tj.key2
    AND 1 == 1
ORDER BY `ALL` ASC
SETTINGS query_plan_use_new_logical_join_step = 0
FORMAT TSVWithNames;

SELECT *
FROM
    t
RIGHT JOIN tj
    ON t.key1 == tj.key1
    AND t.key2 == tj.key2
    AND 1 == 1
ORDER BY `ALL` ASC
SETTINGS
    query_plan_use_new_logical_join_step = 1,
    enable_parallel_replicas = 0
FORMAT TSVWithNames;

SELECT *
FROM
    t
RIGHT JOIN tj
    ON t.key1 == tj.key1
    AND t.key2 == tj.key2
    AND 1 == 2
FORMAT TSVWithNames;

SELECT *
FROM
    t
RIGHT JOIN tj
    ON t.key1 == tj.key1
    AND t.key2 == tj.key2
    AND tj.a == 20
FORMAT TSVWithNames;

SELECT *
FROM
    t
RIGHT JOIN tj
    ON t.key1 == tj.key1
    AND t.key2 == tj.key2
    AND t.b == 22
ORDER BY
    t.key1 ASC,
    tj.key2 ASC
FORMAT TSVWithNames;

SELECT *
FROM
    t
RIGHT JOIN tj
    ON t.key1 == tj.key1
    AND t.key2 == tj.key2
    AND 1 != 1
FORMAT TSVWithNames;

SELECT *
FROM
    t
RIGHT JOIN tj
    ON t.key1 == tj.key1
    AND t.key2 == tj.key2
    AND NULL
ORDER BY `ALL` ASC
SETTINGS query_plan_use_new_logical_join_step = 0
FORMAT TSVWithNames;

SELECT *
FROM
    t
RIGHT JOIN tj
    ON t.key1 == tj.key1
    AND t.key2 == tj.key2
    AND NULL
ORDER BY `ALL` ASC
SETTINGS
    query_plan_use_new_logical_join_step = 1,
    enable_parallel_replicas = 0
FORMAT TSVWithNames;

SELECT *
FROM
    t
RIGHT JOIN tj
    ON t.key1 == tj.key1
    AND t.key2 == tj.key2
    AND 'aaa'
FORMAT TSVWithNames;

SELECT *
FROM
    t
RIGHT JOIN tj
    ON 'aaa'
FORMAT TSVWithNames;

SELECT *
FROM
    t
RIGHT JOIN tj
    ON t.key1 == tj.key1
    AND t.key2 == tj.key2
    AND 1
ORDER BY `ALL` ASC
SETTINGS query_plan_use_new_logical_join_step = 0
FORMAT TSVWithNames;

SELECT *
FROM
    t
RIGHT JOIN tj
    ON t.key1 == tj.key1
    AND t.key2 == tj.key2
    AND 1
ORDER BY `ALL` ASC
SETTINGS
    query_plan_use_new_logical_join_step = 1,
    enable_parallel_replicas = 0
FORMAT TSVWithNames;

SELECT *
FROM
    t
RIGHT JOIN tj
    ON 0
FORMAT TSVWithNames;

SELECT *
FROM
    t
RIGHT JOIN tj
    ON 1
FORMAT TSVWithNames;