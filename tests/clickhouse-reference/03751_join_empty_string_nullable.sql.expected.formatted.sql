SELECT
    c0,
    isNull(c0) AS is_null
FROM t_join_nullable_string;

SELECT
    c0,
    isNull(c0) AS is_null
FROM t_join_nullable_string
ORDER BY c0 ASC;

SELECT
    c0,
    val
FROM t_join_nullable_string;

SELECT
    c0,
    val
FROM t_join_nullable_string
ORDER BY val ASC;