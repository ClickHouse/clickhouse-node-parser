CREATE TABLE han_1
(
    k Int32,
    date_dt LowCardinality(Nullable(String))
)
ENGINE = MergeTree()
ORDER BY k
PARTITION BY k;

SELECT
    k,
    uniq(date_dt)
FROM remote('127.0.0.{1,2}', currentDatabase(), han_1)
GROUP BY k;