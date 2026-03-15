-- create source table
CREATE TABLE fx_1m (
    `symbol` LowCardinality(String) CODEC(ZSTD),
    `dt_close` DateTime64(3, 'UTC') CODEC(DoubleDelta, ZSTD),
    `open` Float32 CODEC(Delta, ZSTD),
    `high` Float32 CODEC(Delta, ZSTD),
    `low` Float32 CODEC(Delta, ZSTD),
    `close` Float32 CODEC(Delta, ZSTD),
    `volume` Float32 CODEC(Delta, ZSTD)
)
ENGINE = MergeTree()
PARTITION BY toYear(dt_close)
ORDER BY (symbol, dt_close) SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
-- create view using projection
CREATE VIEW fx_5m AS
SELECT
    symbol,
    toStartOfInterval(dt_close, INTERVAL 300 SECOND) AS dt_close,
    argMin(open, dt_close) open,
    max(high) high,
    min(low) low,
    argMax(close, dt_close) close,
    sum(volume) volume
FROM fx_1m
GROUP BY symbol, dt_close;
-- segmentation fault (filter on dt_close column)
SELECT
    dt_close,
    close
FROM fx_5m
where symbol = 'EURUSD' and dt_close between '2022-12-11' and '2022-12-13'
order by dt_close
format Null;
