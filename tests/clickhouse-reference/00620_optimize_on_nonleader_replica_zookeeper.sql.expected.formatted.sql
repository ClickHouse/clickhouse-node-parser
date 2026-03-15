CREATE TABLE rename1
(
    p Int64,
    i Int64,
    v UInt64
)
ENGINE = ReplicatedReplacingMergeTree('/clickhouse/tables/{database}/rename', '1', v)
ORDER BY i
PARTITION BY p;

CREATE TABLE rename2
(
    p Int64,
    i Int64,
    v UInt64
)
ENGINE = ReplicatedReplacingMergeTree('/clickhouse/tables/{database}/rename', '2', v)
ORDER BY i
PARTITION BY p;

SELECT *
FROM rename1;