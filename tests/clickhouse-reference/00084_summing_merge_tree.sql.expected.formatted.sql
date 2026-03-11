SELECT *
FROM summing_merge_tree
ORDER BY
    d ASC,
    a ASC,
    x ASC,
    y ASC,
    z ASC;

SELECT
    k,
    s
FROM summing
ORDER BY k ASC;