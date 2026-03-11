SELECT '-- First query run to populate query condition cache';

SELECT
    shardNum(),
    min(key),
    max(key),
    count()
FROM remote('127.0.0.{1,2}', currentDatabase(), tab)
WHERE (key >= (shardNum() * 10000))
    AND (key < ((shardNum() * 10000) + 10000))
GROUP BY 1
ORDER BY 1 ASC;