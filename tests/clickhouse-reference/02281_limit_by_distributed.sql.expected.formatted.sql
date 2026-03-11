SELECT k
FROM (
        SELECT
            k,
            abs(v) AS _v
        FROM remote('127.{1,2}', view((
                SELECT
                    materialize('foo') AS k,
                    -1 AS v
            )))
        ORDER BY _v ASC
        LIMIT 1 BY k
    )
GROUP BY k;

SELECT dummy
FROM remote('127.{1,2}', `system`.one)
WHERE dummy IN (
        SELECT 0
    )
LIMIT 1 BY dummy;