SELECT nonexistentsomething;

SELECT sum(n)
FROM rich_syntax
SETTINGS enable_parallel_replicas = 0;

SELECT sum(n)
FROM rich_syntax
SETTINGS serialize_query_plan = 0;