SELECT 1
FROM
    (
        SELECT 1 AS c0
        LIMIT 0 BY COLUMNS('1')
    ) AS t0
ARRAY JOIN c0;