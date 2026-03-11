SELECT s
FROM t
PREWHERE a != 1
WHERE rowNumberInBlock() % 2 = 0
LIMIT 1;