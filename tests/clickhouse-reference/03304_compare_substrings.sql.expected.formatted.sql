SELECT compareSubstrings();

SELECT compareSubstrings('abc');

SELECT compareSubstrings('abc', 'abc');

SELECT compareSubstrings('abc', 'abc', 0);

SELECT compareSubstrings('abc', 'abc', 0, 0);

SELECT compareSubstrings('abc', 'abc', 0, 0, 0, 0);

SELECT compareSubstrings(0, 'abc', 0, 0, 0);

SELECT compareSubstrings('abc', 0, 0, 0, 0);

SELECT compareSubstrings('abc', 'abc', 'abc', 0, 0);

SELECT compareSubstrings('abc', 'abc', 0, 'abc', 0);

SELECT compareSubstrings('abc', 'abc', 0, 0, 'abc');

SELECT compareSubstrings('abc', 'abc', -1, 0, 0);

SELECT compareSubstrings('abc', 'abc', 0, -1, 0);

SELECT compareSubstrings('abc', 'abc', 0, 0, -1);

SELECT compareSubstrings('abc', 'abc', 0, 0, 3);

SELECT compareSubstrings('abd', 'abc', 0, 0, 3);

SELECT compareSubstrings('abb', 'abc', 0, 0, 3);

SELECT compareSubstrings('abc', 'abd', 1, 1, 3);

SELECT compareSubstrings('abc', 'abc', 4, 0, 3);

SELECT compareSubstrings('abc', 'abc', 3, 4, 3);

SELECT compareSubstrings('ab1', 'abc', 0, 0, 0);

SELECT
    s,
    compareSubstrings(s, 'ab3', 0, 0, 3)
FROM (
        SELECT CAST(s AS FixedString(6)) AS s
        FROM (
                SELECT concat('ab', number % 6, 'cde') AS s
                FROM numbers(8)
            )
    );

SELECT
    s,
    compareSubstrings(s, 'ab3', 6, 0, 3)
FROM (
        SELECT CAST(s AS FixedString(6)) AS s
        FROM (
                SELECT concat('ab', number % 6, 'cde') AS s
                FROM numbers(8)
            )
    );

SELECT
    s,
    compareSubstrings(s, 'ab3', 0, 3, 3)
FROM (
        SELECT CAST(s AS FixedString(6)) AS s
        FROM (
                SELECT concat('ab', number % 6, 'cde') AS s
                FROM numbers(8)
            )
    );

SELECT
    s,
    compareSubstrings(s, 'ab3', 6, 3, 3)
FROM (
        SELECT CAST(s AS FixedString(6)) AS s
        FROM (
                SELECT concat('ab', number % 6, 'cde') AS s
                FROM numbers(8)
            )
    );

SELECT
    s,
    compareSubstrings('ab3', s, 0, 0, 3)
FROM (
        SELECT CAST(s AS FixedString(6)) AS s
        FROM (
                SELECT concat('ab', number % 6, 'cde') AS s
                FROM numbers(8)
            )
    );

SELECT
    s,
    compareSubstrings('ab3', s, 3, 0, 3)
FROM (
        SELECT CAST(s AS FixedString(6)) AS s
        FROM (
                SELECT concat('ab', number % 6, 'cde') AS s
                FROM numbers(8)
            )
    );

SELECT
    s,
    compareSubstrings('ab3', s, 0, 6, 3)
FROM (
        SELECT CAST(s AS FixedString(6)) AS s
        FROM (
                SELECT concat('ab', number % 6, 'cde') AS s
                FROM numbers(8)
            )
    );

SELECT
    s,
    compareSubstrings('ab3', s, 3, 6, 3)
FROM (
        SELECT CAST(s AS FixedString(6)) AS s
        FROM (
                SELECT concat('ab', number % 6, 'cde') AS s
                FROM numbers(8)
            )
    );

SELECT
    s,
    compareSubstrings(s, 'ab3', 0, 0, 3)
FROM (
        SELECT concat('ab', number % 6, 'cde') AS s
        FROM numbers(8)
    );

SELECT
    s,
    compareSubstrings(s, 'ab3', 6, 0, 3)
FROM (
        SELECT concat('ab', number % 6, 'cde') AS s
        FROM numbers(8)
    );

SELECT
    s,
    compareSubstrings(s, 'ab3', 0, 3, 3)
FROM (
        SELECT concat('ab', number % 6, 'cde') AS s
        FROM numbers(8)
    );

SELECT
    s,
    compareSubstrings(s, 'ab3', 6, 3, 3)
FROM (
        SELECT concat('ab', number % 6, 'cde') AS s
        FROM numbers(8)
    );

SELECT
    s,
    compareSubstrings('ab3', s, 0, 0, 3)
FROM (
        SELECT concat('ab', number % 6, 'cde') AS s
        FROM numbers(8)
    );

SELECT
    s,
    compareSubstrings('ab3', s, 3, 0, 3)
FROM (
        SELECT concat('ab', number % 6, 'cde') AS s
        FROM numbers(8)
    );

SELECT
    s,
    compareSubstrings('ab3', s, 0, 6, 3)
FROM (
        SELECT concat('ab', number % 6, 'cde') AS s
        FROM numbers(8)
    );

SELECT
    s,
    compareSubstrings('ab3', s, 3, 6, 3)
FROM (
        SELECT concat('ab', number % 6, 'cde') AS s
        FROM numbers(8)
    );

SELECT
    s1,
    s2,
    compareSubstrings(s1, s2, 0, 0, 4)
FROM (
        SELECT
            concat('ab', number % 3) AS s1,
            concat('ab', number % 4) AS s2
        FROM numbers(6)
    );

SELECT
    s1,
    s2,
    compareSubstrings(s1, s2, 3, 0, 4)
FROM (
        SELECT
            concat('ab', number % 3) AS s1,
            concat('ab', number % 4) AS s2
        FROM numbers(6)
    );

SELECT
    s1,
    s2,
    compareSubstrings(s1, s2, 0, 3, 4)
FROM (
        SELECT
            concat('ab', number % 3) AS s1,
            concat('ab', number % 4) AS s2
        FROM numbers(6)
    );

SELECT
    s1,
    s2,
    compareSubstrings(s1, s2, 4, 4, 4)
FROM (
        SELECT
            concat('ab', number % 3) AS s1,
            concat('ab', number % 4) AS s2
        FROM numbers(6)
    );

SELECT
    s1,
    s2,
    compareSubstrings(s1, s2, 0, 0, 4)
FROM (
        SELECT
            CAST(s1 AS FixedString(3)) AS s1,
            s2
        FROM (
                SELECT
                    concat('ab', number % 3) AS s1,
                    concat('ab', number % 4) AS s2
                FROM numbers(6)
            )
    );

SELECT
    s1,
    s2,
    compareSubstrings(s1, s2, 3, 0, 4)
FROM (
        SELECT
            CAST(s1 AS FixedString(3)) AS s1,
            s2
        FROM (
                SELECT
                    concat('ab', number % 3) AS s1,
                    concat('ab', number % 4) AS s2
                FROM numbers(6)
            )
    );

SELECT
    s1,
    s2,
    compareSubstrings(s1, s2, 0, 3, 4)
FROM (
        SELECT
            CAST(s1 AS FixedString(3)) AS s1,
            s2
        FROM (
                SELECT
                    concat('ab', number % 3) AS s1,
                    concat('ab', number % 4) AS s2
                FROM numbers(6)
            )
    );

SELECT
    s1,
    s2,
    compareSubstrings(s1, s2, 4, 4, 4)
FROM (
        SELECT
            CAST(s1 AS FixedString(3)) AS s1,
            s2
        FROM (
                SELECT
                    concat('ab', number % 3) AS s1,
                    concat('ab', number % 4) AS s2
                FROM numbers(6)
            )
    );

SELECT
    s1,
    s2,
    compareSubstrings(s1, s2, 0, 0, 4)
FROM (
        SELECT
            CAST(s2 AS FixedString(3)) AS s2,
            s1
        FROM (
                SELECT
                    concat('ab', number % 3) AS s1,
                    concat('ab', number % 4) AS s2
                FROM numbers(6)
            )
    );

SELECT
    s1,
    s2,
    compareSubstrings(s1, s2, 3, 0, 4)
FROM (
        SELECT
            CAST(s2 AS FixedString(3)) AS s2,
            s1
        FROM (
                SELECT
                    concat('ab', number % 3) AS s1,
                    concat('ab', number % 4) AS s2
                FROM numbers(6)
            )
    );

SELECT
    s1,
    s2,
    compareSubstrings(s1, s2, 0, 3, 4)
FROM (
        SELECT
            CAST(s2 AS FixedString(3)) AS s2,
            s1
        FROM (
                SELECT
                    concat('ab', number % 3) AS s1,
                    concat('ab', number % 4) AS s2
                FROM numbers(6)
            )
    );

SELECT
    s1,
    s2,
    compareSubstrings(s1, s2, 4, 4, 4)
FROM (
        SELECT
            CAST(s2 AS FixedString(3)) AS s2,
            s1
        FROM (
                SELECT
                    concat('ab', number % 3) AS s1,
                    concat('ab', number % 4) AS s2
                FROM numbers(6)
            )
    );

SELECT
    s1,
    s2,
    compareSubstrings(s1, s2, 0, 0, 4)
FROM (
        SELECT
            CAST(s2 AS FixedString(3)) AS s2,
            CAST(s1 AS FixedString(3)) AS s1
        FROM (
                SELECT
                    concat('ab', number % 3) AS s1,
                    concat('ab', number % 4) AS s2
                FROM numbers(6)
            )
    );

SELECT
    s1,
    s2,
    compareSubstrings(s1, s2, 3, 0, 4)
FROM (
        SELECT
            CAST(s2 AS FixedString(3)) AS s2,
            CAST(s1 AS FixedString(3)) AS s1
        FROM (
                SELECT
                    concat('ab', number % 3) AS s1,
                    concat('ab', number % 4) AS s2
                FROM numbers(6)
            )
    );

SELECT
    s1,
    s2,
    compareSubstrings(s1, s2, 0, 3, 4)
FROM (
        SELECT
            CAST(s2 AS FixedString(3)) AS s2,
            CAST(s1 AS FixedString(3)) AS s1
        FROM (
                SELECT
                    concat('ab', number % 3) AS s1,
                    concat('ab', number % 4) AS s2
                FROM numbers(6)
            )
    );

SELECT
    s1,
    s2,
    compareSubstrings(s1, s2, 4, 4, 4)
FROM (
        SELECT
            CAST(s2 AS FixedString(3)) AS s2,
            CAST(s1 AS FixedString(3)) AS s1
        FROM (
                SELECT
                    concat('ab', number % 3) AS s1,
                    concat('ab', number % 4) AS s2
                FROM numbers(6)
            )
    );