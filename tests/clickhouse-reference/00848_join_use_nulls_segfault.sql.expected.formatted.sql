SELECT
    *,
    toTypeName(t1.id),
    toTypeName(t3.id)
FROM
    t1_00848 AS t1
LEFT JOIN t3_00848 AS t3
    ON t1.id = t3.id
ORDER BY
    t1.id ASC,
    t3.id ASC;

SELECT
    *,
    toTypeName(t1.id),
    toTypeName(t3.id)
FROM
    t1_00848 AS t1
FULL JOIN t3_00848 AS t3
    ON t1.id = t3.id
ORDER BY
    t1.id ASC,
    t3.id ASC;

SELECT
    *,
    toTypeName(t2.id),
    toTypeName(t3.id)
FROM
    t2_00848 AS t2
FULL JOIN t3_00848 AS t3
    ON t2.id = t3.id
ORDER BY
    t2.id ASC,
    t3.id ASC;

SELECT
    *,
    toTypeName(t1.id),
    toTypeName(t3.id)
FROM
    t1_00848 AS t1
LEFT JOIN t3_00848 AS t3
    ON t1.id = t3.id
ORDER BY
    t1.id ASC,
    t3.id ASC;

SELECT
    *,
    toTypeName(t1.id),
    toTypeName(t3.id)
FROM
    t1_00848 AS t1
FULL JOIN t3_00848 AS t3
    ON t1.id = t3.id
ORDER BY
    t1.id ASC,
    t3.id ASC;

SELECT
    *,
    toTypeName(t2.id),
    toTypeName(t3.id)
FROM
    t2_00848 AS t2
FULL JOIN t3_00848 AS t3
    ON t2.id = t3.id
ORDER BY
    t2.id ASC,
    t3.id ASC;

SELECT
    t3.id = 'l',
    t3.not_id = 'l'
FROM
    t1_00848 AS t1
LEFT JOIN t3_00848 AS t3
    ON t1.id = t3.id
ORDER BY
    t1.id ASC,
    t3.id ASC;

SELECT
    t3.id = 'l',
    t3.not_id = 'l'
FROM
    t1_00848 AS t1
LEFT JOIN t3_00848 AS t3
    ON t1.id = t3.id
ORDER BY
    t1.id ASC,
    t3.id ASC;

SELECT
    *,
    toTypeName(t1.id),
    toTypeName(t3.id)
FROM
    t1_00848 AS t1
LEFT JOIN t3_00848 AS t3
    USING (id)
ORDER BY
    t1.id ASC,
    t3.id ASC;

SELECT
    *,
    toTypeName(t1.id),
    toTypeName(t3.id)
FROM
    t1_00848 AS t1
FULL JOIN t3_00848 AS t3
    USING (id)
ORDER BY
    t1.id ASC,
    t3.id ASC;

SELECT
    *,
    toTypeName(t2.id),
    toTypeName(t3.id)
FROM
    t2_00848 AS t2
FULL JOIN t3_00848 AS t3
    USING (id)
ORDER BY
    t2.id ASC,
    t3.id ASC;

SELECT
    *,
    toTypeName(t1.id),
    toTypeName(t3.id)
FROM
    t1_00848 AS t1
LEFT JOIN t3_00848 AS t3
    USING (id)
ORDER BY
    t1.id ASC,
    t3.id ASC;

SELECT
    *,
    toTypeName(t1.id),
    toTypeName(t3.id)
FROM
    t1_00848 AS t1
FULL JOIN t3_00848 AS t3
    USING (id)
ORDER BY
    t1.id ASC,
    t3.id ASC;

SELECT
    *,
    toTypeName(t2.id),
    toTypeName(t3.id)
FROM
    t2_00848 AS t2
FULL JOIN t3_00848 AS t3
    USING (id)
ORDER BY
    t2.id ASC,
    t3.id ASC;

SELECT
    t3.id = 'l',
    t3.not_id = 'l'
FROM
    t1_00848 AS t1
LEFT JOIN t3_00848 AS t3
    USING (id)
ORDER BY
    t1.id ASC,
    t3.id ASC;

SELECT
    t3.id = 'l',
    t3.not_id = 'l'
FROM
    t1_00848 AS t1
LEFT JOIN t3_00848 AS t3
    USING (id)
ORDER BY
    t1.id ASC,
    t3.id ASC;

SELECT
    *,
    toTypeName(t1.id),
    toTypeName(t3.id)
FROM
    t1_00848 AS t1
LEFT JOIN t3_00848 AS t3
    USING (id)
ORDER BY id ASC;

SELECT
    *,
    toTypeName(t1.id),
    toTypeName(t3.id)
FROM
    t1_00848 AS t1
FULL JOIN t3_00848 AS t3
    USING (id)
ORDER BY id ASC;

SELECT
    *,
    toTypeName(t2.id),
    toTypeName(t3.id)
FROM
    t2_00848 AS t2
FULL JOIN t3_00848 AS t3
    USING (id)
ORDER BY id ASC;

SELECT
    *,
    toTypeName(t1.id),
    toTypeName(t3.id)
FROM
    t1_00848 AS t1
LEFT JOIN t3_00848 AS t3
    USING (id)
ORDER BY id ASC;

SELECT
    *,
    toTypeName(t1.id),
    toTypeName(t3.id)
FROM
    t1_00848 AS t1
FULL JOIN t3_00848 AS t3
    USING (id)
ORDER BY id ASC;

SELECT
    *,
    toTypeName(t2.id),
    toTypeName(t3.id)
FROM
    t2_00848 AS t2
FULL JOIN t3_00848 AS t3
    USING (id)
ORDER BY id ASC;

SELECT
    t3.id = 'l',
    t3.not_id = 'l'
FROM
    t1_00848 AS t1
LEFT JOIN t3_00848 AS t3
    USING (id)
ORDER BY id ASC;

SELECT
    t3.id = 'l',
    t3.not_id = 'l'
FROM
    t1_00848 AS t1
LEFT JOIN t3_00848 AS t3
    USING (id)
ORDER BY id ASC;