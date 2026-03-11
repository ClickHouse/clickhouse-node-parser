SELECT
    `partition`,
    part_type
FROM `system`.parts
WHERE table = 't_move_to_prewhere'
    AND database = currentDatabase()
ORDER BY `partition` ASC;

SELECT count()
FROM t_move_to_prewhere
WHERE a
    AND b
    AND c
    AND NOT ignore(fat_string);

SELECT replaceRegexpAll(`explain`, '__table1\\.', '')
FROM (
        EXPLAIN actions = 1
        SELECT count()
        FROM t_move_to_prewhere
        WHERE a
            AND b
            AND c
            AND NOT ignore(fat_string)
    )
WHERE like(`explain`, '%Prewhere%')
    OR like(`explain`, '%Filter%');