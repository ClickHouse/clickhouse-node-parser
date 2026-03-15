CREATE TABLE t_01906
(
    id UInt64,
    update_ts DateTime,
    value UInt32
)
ENGINE = ReplacingMergeTree(update_ts)
ORDER BY (update_ts, id)
PARTITION BY 0 * id;

SELECT count()
FROM t_01906
WHERE id >= 42;

SELECT count()
FROM t_01906 FINAL
WHERE id >= 42
    AND update_ts <= '2021-01-01 00:00:00';