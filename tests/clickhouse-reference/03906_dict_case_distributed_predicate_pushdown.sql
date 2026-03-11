SELECT
    id,
    c,
    dictGet(concat(currentDatabase(), '.d_dict_dist'), 'd', id) AS d,
    CASE
        WHEN c = 'same' AND d = 'gamma' THEN 'SHOULD NOT HAPPEN'
        WHEN c = 'same' THEN 'SHOULD ALWAYS HAPPEN'
    END AS filter_value
FROM (
    SELECT * FROM t_dict_dist
)
WHERE filter_value = 'SHOULD ALWAYS HAPPEN'
ORDER BY id;
