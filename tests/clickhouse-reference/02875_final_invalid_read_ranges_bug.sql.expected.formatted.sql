SELECT
    tid,
    processed_at,
    created_at,
    amount
FROM t FINAL
ORDER BY tid ASC;

SELECT sum(amount)
FROM t FINAL
WHERE (processed_at >= '2023-09-19 00:00:00')
    AND (processed_at <= '2023-09-20 01:00:00');