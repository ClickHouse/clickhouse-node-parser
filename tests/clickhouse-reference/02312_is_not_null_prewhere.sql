SELECT * FROM bug_36995
WHERE (time IS NOT NULL) AND (product IN (SELECT '1'))
SETTINGS optimize_move_to_prewhere = 1;
SELECT * FROM bug_36995
WHERE (time IS NOT NULL) AND (product IN (SELECT '1'))
SETTINGS optimize_move_to_prewhere = 0;
SELECT * FROM bug_36995
PREWHERE (time IS NOT NULL) WHERE (product IN (SELECT '1'));
