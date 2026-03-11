SELECT *
FROM merge('t_02156_ololo')
WHERE k != 0
    AND notEmpty(v)
ORDER BY k ASC
SETTINGS optimize_move_to_prewhere = 0;

SELECT *
FROM merge('t_02156_ololo')
WHERE k != 0
    AND notEmpty(v)
ORDER BY k ASC
SETTINGS optimize_move_to_prewhere = 1;

SELECT *
FROM merge('t_02156_ololo_dist')
WHERE k != 0
    AND notEmpty(v)
ORDER BY k ASC
SETTINGS optimize_move_to_prewhere = 0;

SELECT *
FROM merge('t_02156_ololo_dist')
WHERE k != 0
    AND notEmpty(v)
ORDER BY k ASC
SETTINGS optimize_move_to_prewhere = 1;