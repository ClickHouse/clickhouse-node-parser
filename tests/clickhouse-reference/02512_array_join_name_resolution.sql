SELECT
    key,
    any(toString(n))
FROM
(
    SELECT
        arr.key AS key,
        n
    FROM x
    ARRAY JOIN arr
)
GROUP BY key
ORDER BY key;
