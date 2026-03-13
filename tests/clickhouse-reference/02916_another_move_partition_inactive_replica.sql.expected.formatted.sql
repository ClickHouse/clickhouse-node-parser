SELECT
    name,
    active
FROM `system`.parts
WHERE database = 'shard_0'
    AND table = 'to'
    AND active
ORDER BY name ASC;

-- Doesn't lead to test flakyness, because we don't check content in table
-- which doesn't depend on any background operation
SELECT sleep(3);

SELECT
    count(),
    sum(x)
FROM shard_1.to;