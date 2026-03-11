SELECT '--- Data ---';

SELECT *
FROM users
ORDER BY uid ASC;

SELECT
    {a1: Int32},
    {a2: Int32},
    {a3: Int32},
    {a4: Int32};

SELECT *
FROM V_DELTA(a1 = 10, a2 = 50, a3 = 10, a4 = 40);

SELECT DISTINCT uid
FROM (
        SELECT
            uid,
            name,
            age
        FROM users
        WHERE age >= {a1: Int32}
            AND age <= {a2: Int32}
EXCEPT
        SELECT
            uid,
            name,
            age
        FROM users
        WHERE age >= {a3: Int32}
            AND age <= {a4: Int32}
    )
ORDER BY uid ASC;