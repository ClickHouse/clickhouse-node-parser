SELECT
    name,
    column,
    serialization_kind
FROM `system`.parts_columns
WHERE table = 't_sparse_distinct'
    AND database = currentDatabase()
    AND column = 'v'
ORDER BY name ASC;

SELECT splitByString(' ', trimLeft(`explain`))[1]
FROM (
        EXPLAIN PIPELINE
        SELECT DISTINCT
            id,
            v
        FROM t_sparse_distinct
    )
WHERE ilike(`explain`, '%DistinctSortedStreamTransform%');

SELECT DISTINCT
    id,
    v
FROM t_sparse_distinct
FORMAT Null;