SELECT
    count(),
    *
FROM dist_01247
GROUP BY number
ORDER BY number ASC
LIMIT 1
SETTINGS prefer_localhost_replica = 1;

-- Now, sharding key optimization is not supported for distributed over distributed with serialized plan.
SELECT
    count(),
    *
FROM dist_01247
GROUP BY number
ORDER BY number ASC
LIMIT 1
SETTINGS
    prefer_localhost_replica = 0,
    serialize_query_plan = 1,
    enable_analyzer = 1;

SELECT
    count(),
    *
FROM dist_01247
GROUP BY number
ORDER BY number ASC
LIMIT 1;