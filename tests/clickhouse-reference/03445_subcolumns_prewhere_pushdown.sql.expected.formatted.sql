SELECT *
FROM test
WHERE n.`null`
SETTINGS optimize_move_to_prewhere = 1;

SELECT *
FROM test
WHERE n.`null`
SETTINGS optimize_move_to_prewhere = 0;

SELECT *
FROM test
WHERE t.a < 4
SETTINGS optimize_move_to_prewhere = 1;

SELECT *
FROM test
WHERE t.a < 4
SETTINGS optimize_move_to_prewhere = 0;

SELECT *
FROM test
WHERE json.a::Int64 < 4
SETTINGS optimize_move_to_prewhere = 1;

SELECT *
FROM test
WHERE json.a::Int64 < 4
SETTINGS optimize_move_to_prewhere = 0;