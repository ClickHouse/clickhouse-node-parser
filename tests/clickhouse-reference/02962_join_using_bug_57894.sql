SELECT x FROM t FULL JOIN r USING (x) ORDER BY ALL
;
SELECT x FROM t FULL JOIN r USING (x) ORDER BY ALL
SETTINGS join_algorithm = 'partial_merge';
SELECT x FROM t FULL JOIN r USING (x) ORDER BY ALL
SETTINGS join_algorithm = 'full_sorting_merge';
SELECT '--- analyzer ---';
