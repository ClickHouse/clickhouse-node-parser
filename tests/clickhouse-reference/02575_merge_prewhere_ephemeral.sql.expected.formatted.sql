SELECT *
FROM m
PREWHERE a = 'OK'
ORDER BY a ASC;

SELECT *
FROM m
PREWHERE f = 1
ORDER BY a ASC;

SELECT *
FROM m
WHERE a = 'OK'
SETTINGS optimize_move_to_prewhere = 0;

SELECT *
FROM m
WHERE a = 'OK'
SETTINGS optimize_move_to_prewhere = 1;