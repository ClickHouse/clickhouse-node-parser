SELECT x
FROM parallel_replicas_plain
LIMIT 1
FORMAT Null;

SELECT max(length(x))
FROM parallel_replicas_plain
FORMAT Null;