SELECT *
FROM bug_36995
WHERE (isNotNull(time))
    AND (product IN (
        SELECT '1'
    ))
SETTINGS optimize_move_to_prewhere = 1;

SELECT *
FROM bug_36995
WHERE (isNotNull(time))
    AND (product IN (
        SELECT '1'
    ))
SETTINGS optimize_move_to_prewhere = 0;

SELECT *
FROM bug_36995
PREWHERE (isNotNull(time))
WHERE (product IN (
        SELECT '1'
    ));