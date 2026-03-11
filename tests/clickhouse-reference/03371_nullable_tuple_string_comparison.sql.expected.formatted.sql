SELECT id
FROM t1
WHERE (s1, s2) = ('a', 'b');

SELECT id
FROM t1
WHERE (s1, s2) = '(''a'',''b'')';

SELECT id
FROM t1
WHERE (s1, s2) = CAST((
        SELECT
            s1,
            s2
        FROM t1
        WHERE s1 = 'a'
    ) AS text);

SELECT id
FROM t1
WHERE (s1, null) = ('a', null);

SELECT id
FROM t1
WHERE (s1, null) = '(''a'',null)';

SELECT id
FROM t1
WHERE (s1, null) = CAST((
        SELECT
            s1,
            s2
        FROM t1
        WHERE s1 = 'e'
            AND isNull(s2)
    ) AS text);

SELECT id
FROM t2
WHERE (s1, null) = ('z', null);

SELECT id
FROM t2
WHERE (s1, null) = '(''z'',null)';