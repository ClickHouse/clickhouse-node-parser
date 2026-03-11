SELECT '---Q1---';

SELECT *
FROM test_23634
WHERE id != '';

SELECT *
FROM test_23634
WHERE id != ''
    AND s != '';

SELECT *
FROM test_23634
WHERE id != ''
    AND s != ''
    AND s1 != '';

SELECT *
FROM test_23634
WHERE (id, s, s1) != ('', '', '')
ORDER BY
    id ASC,
    s1 ASC,
    s1 ASC;

SELECT *
FROM test_23634
WHERE (id, s, s1) = ('', '', '')
ORDER BY
    id ASC,
    s1 ASC,
    s1 ASC;

SELECT *
FROM test_23634
WHERE (id, s, s1) = ('', '', 's2')
ORDER BY
    id ASC,
    s1 ASC,
    s1 ASC;

SELECT *
FROM test_23634
WHERE (id, s, s1) = ('', 's1', 's1')
ORDER BY
    id ASC,
    s1 ASC,
    s1 ASC;

SELECT *
FROM test_23634
WHERE (id, s, s1) = ('s', 's', 's')
ORDER BY
    id ASC,
    s1 ASC,
    s1 ASC;

SELECT *
FROM test_23634
WHERE (id, s, s1) = (null::Nullable(String), null::Nullable(String), null::Nullable(String))
ORDER BY
    id ASC,
    s1 ASC,
    s1 ASC;