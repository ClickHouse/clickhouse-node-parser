CREATE TABLE t_array_index
(
    n Nested(key String, value String)
)
ENGINE = MergeTree
ORDER BY n.key;

SELECT *
FROM
    t_array_index
ARRAY JOIN n
WHERE n.key = 'a';