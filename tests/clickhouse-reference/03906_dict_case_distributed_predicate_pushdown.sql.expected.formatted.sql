SELECT
    id,
    c,
    dictGet(concat(currentDatabase(), '.d_dict_dist'), 'd', id) AS d,
    multiIf(c = 'same'
    AND d = 'gamma', 'SHOULD NOT HAPPEN', c = 'same', 'SHOULD ALWAYS HAPPEN', NULL) AS filter_value
FROM (
        SELECT *
        FROM t_dict_dist
    )
WHERE filter_value = 'SHOULD ALWAYS HAPPEN'
ORDER BY id ASC;