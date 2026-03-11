SELECT 1
FROM rewrite
INNER JOIN rewrite AS y ON (
    SELECT 1
)
INNER JOIN rewrite AS z ON 1
SETTINGS optimize_rewrite_array_exists_to_has=1;
