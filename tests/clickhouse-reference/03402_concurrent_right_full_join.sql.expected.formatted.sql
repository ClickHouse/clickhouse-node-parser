SELECT
    l.id,
    l.value,
    r.description
FROM
    t_l_small AS l
RIGHT JOIN t_r_small AS r
    ON l.id = r.id
ORDER BY
    r.id ASC,
    l.id ASC;

SELECT
    l.id,
    l.value,
    r.description
FROM
    t_l_small AS l
FULL JOIN t_r_small AS r
    ON l.id = r.id
ORDER BY
    coalesce(l.id, r.id) ASC,
    r.id ASC;

SELECT
    count(),
    countIf(isNull(l.value))
FROM
    t_l_any AS l
RIGHT JOIN t_r_any AS r
    ON l.id = r.id;

SELECT
    l.id,
    l.value,
    r.description
FROM
    t_l_filter AS l
RIGHT JOIN t_r_filter AS r
    ON l.id = r.id
    AND like(r.description, 'F%')
ORDER BY r.id ASC;

SELECT
    l.id,
    l.v,
    r.d
FROM
    t_l_null AS l
RIGHT JOIN t_r_null AS r
    ON l.id = r.id
ORDER BY r.d ASC;

SELECT
    l.id,
    l.grp,
    l.val,
    r.descr
FROM
    t_l_cmp AS l
RIGHT JOIN t_r_cmp AS r
    ON (l.id = r.id)
    AND (l.grp = r.grp)
ORDER BY
    r.id ASC,
    r.grp ASC;

SELECT
    count(),
    countIf(isNull(l.id)),
    sum(coalesce(l.id, 0)),
    sum(r.id)
FROM
    (
        SELECT number AS id
        FROM numbers(15000)
    ) AS l
RIGHT JOIN (
        SELECT number AS id
        FROM numbers(20000)
    ) AS r
    ON l.id = r.id;

SELECT
    count(),
    countIf(isNull(l.id)),
    countIf(isNull(r.id))
FROM
    (
        SELECT number AS id
        FROM numbers(15000)
    ) AS l
FULL JOIN (
        SELECT number AS id
        FROM numbers(15500)
    ) AS r
    ON l.id = r.id;

SELECT
    'hash' AS alg,
    count() AS cnt
FROM
    l
RIGHT JOIN r
    ON l.k = r.k
    AND l.v > r.v;

SELECT
    'parallel_hash' AS alg,
    count() AS cnt
FROM
    l
RIGHT JOIN r
    ON l.k = r.k
    AND l.v > r.v;

SELECT
    'hash right-only',
    countIf(isNull(l.k))
FROM
    l
RIGHT JOIN r
    ON l.k = r.k
    AND l.v > r.v;

SELECT
    'parallel right-only',
    countIf(isNull(l.k))
FROM
    l
RIGHT JOIN r
    ON l.k = r.k
    AND l.v > r.v;

SELECT
    'hash',
    count()
FROM
    l
FULL JOIN r
    ON l.k = r.k
    AND l.v > r.v;

SELECT
    'parallel_hash',
    count()
FROM
    l
FULL JOIN r
    ON l.k = r.k
    AND l.v > r.v;