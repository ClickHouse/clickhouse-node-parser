SELECT
    id,
    t.*,
    toTypeName(t)
FROM qualified_match_nullable_tuple_direct
ORDER BY id;
SELECT
    coalesce(qualified_match_join_left.x, qualified_match_join_right.x) AS x,
    t.*,
    toTypeName(t)
FROM qualified_match_join_left
FULL JOIN qualified_match_join_right USING (t)
ORDER BY x;
SELECT
    arr.*,
    toTypeName(arr)
FROM
(
    SELECT
        [tuple(1, 'a'), NULL, tuple(3, 'c')]::Array(Nullable(Tuple(a Int32, s String))) AS arr
) AS src;
SELECT
    m.*,
    toTypeName(m)
FROM
(
    SELECT
        map(
            'k1', tuple(1, 'a'),
            'k2', NULL,
            'k3', tuple(3, 'c')
        )::Map(String, Nullable(Tuple(a Int32, s String))) AS m
) AS src;
